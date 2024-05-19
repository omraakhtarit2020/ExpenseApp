package com.download;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ExpenseDAO;
import com.DAO.IncomeDAO;
import com.db.DBConnection;
import com.entity.User;
import com.entity.User_expense;
import com.entity.User_income;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.color.DeviceRgb;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.LineSeparator;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.property.TextAlignment;

@WebServlet("/download")
public class DownloadPdf extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userobj");
		String nameOfFile = user.getFname() + "_" + user.getLname() + "_" + "Transaction_Report";
		String path = "C:\\Users\\Dell\\Downloads\\download_expenses_" + nameOfFile + ".pdf";

		PdfWriter writer = new PdfWriter(path);
		PdfDocument pdfDoc = new PdfDocument(writer);
		pdfDoc.setDefaultPageSize(PageSize.A4);

		Document document = new Document(pdfDoc);
		document.setMargins(50, 30, 50, 30);

		Paragraph heading = new Paragraph("Transaction Report").setTextAlignment(TextAlignment.CENTER).setFontSize(28)
				.setBold();
		document.add(heading);

		Paragraph subheading = new Paragraph("Daily oversight and spending tracker (D.O.S.T)")
				.setTextAlignment(TextAlignment.CENTER).setFontSize(15).setBold();
		document.add(subheading);

		document.add(new Paragraph("\n"));

		ExpenseDAO expenseDAO = new ExpenseDAO(DBConnection.getConn());
		List<User_expense> expenses = expenseDAO.getAllExpenseById(user.getId());

		IncomeDAO incomeDAO = new IncomeDAO(DBConnection.getConn());
		List<User_income> incomes = incomeDAO.getAllIncomeById(user.getId());

		double totalExpense = expenses.stream().mapToDouble(User_expense::getExpense).sum();
		double totalIncome = incomes.stream().mapToDouble(User_income::getIncome).sum();
		double balance = totalIncome - totalExpense;

		Paragraph summary = new Paragraph().add(new Text("Summary:\n").setFontSize(20).setBold())
				.add(new Paragraph("\n")).add("Total Income: " + totalIncome + "\n")
				.add("Total Expense: " + totalExpense + "\n").add("Balance: " + balance + "\n").setFontSize(16);
		document.add(summary);
		document.add(new Paragraph("\n"));

		LineSeparator ls = new LineSeparator(new com.itextpdf.kernel.pdf.canvas.draw.SolidLine());
		document.add(ls);

		document.add(new Paragraph("\n"));

		Paragraph historyHeading = new Paragraph("Activity History:").setTextAlignment(TextAlignment.LEFT)
				.setFontSize(20).setBold();
		document.add(historyHeading);

		float[] columnWidths = { 150, 150, 150 };
		Table table = new Table(columnWidths);
		table.setWidthPercent(100);

		table.addHeaderCell(new Cell().add(new Paragraph("Type").setFontSize(14).setBold()));
		table.addHeaderCell(new Cell().add(new Paragraph("Amount").setFontSize(14).setBold()));
		table.addHeaderCell(new Cell().add(new Paragraph("Date").setFontSize(14).setBold()));

		Color red = new DeviceRgb(255, 0, 0);
		for (User_expense expense : expenses) {
			table.addCell(
					new Cell().add(new Paragraph("Expense: " + expense.getType()).setFontSize(12).setFontColor(red)));
			table.addCell(new Cell()
					.add(new Paragraph(String.valueOf(expense.getExpense())).setFontSize(12).setFontColor(red)));
			table.addCell(new Cell().add(
					new Paragraph(String.valueOf(expense.getDate().toLocalDate())).setFontSize(12).setFontColor(red)));
		}

		Color green = new DeviceRgb(0, 128, 0);
		for (User_income income : incomes) {
			table.addCell(
					new Cell().add(new Paragraph("Income: " + income.getType()).setFontSize(12).setFontColor(green)));
			table.addCell(new Cell()
					.add(new Paragraph(String.valueOf(income.getIncome())).setFontSize(12).setFontColor(green)));
			table.addCell(new Cell().add(
					new Paragraph(String.valueOf(income.getDate().toLocalDate())).setFontSize(12).setFontColor(green)));
		}

		document.add(table);

		int numberOfPages = pdfDoc.getNumberOfPages();

		for (int i = 1; i <= numberOfPages; i++) {
			PdfPage page = pdfDoc.getPage(i);
			PdfCanvas pdfCanvas = new PdfCanvas(page);

			pdfCanvas.setStrokeColor(Color.BLACK);
			pdfCanvas.setLineWidth(1f);
			pdfCanvas.rectangle(20, 20, page.getPageSize().getWidth() - 40, page.getPageSize().getHeight() - 40);
			pdfCanvas.stroke();

			pdfCanvas.beginText();
			pdfCanvas.setFontAndSize(document.getPdfDocument().getDefaultFont(), 12);
			pdfCanvas.moveText(page.getPageSize().getWidth() / 2 - 200, 30);
			pdfCanvas.showText("For any query or updates, contact us at: tracking.expense2024@gmail.com");
			pdfCanvas.endText();
		}
		document.close();

		// Redirect or perform any other actions
		session.setAttribute("msg", "Download successful");
		response.sendRedirect("home.jsp");
	}
}
