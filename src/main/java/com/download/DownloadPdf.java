package com.download;

import java.io.IOException;
import java.util.ArrayList;
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
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

@WebServlet("/download")
public class DownloadPdf extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userobj");
		String nameOfFile = user.getFname() + "_" + user.getLname() + "_" + "Transaction list";
		String path = "C:\\Users\\Dell\\Downloads\\download_expenses" + nameOfFile + ".pdf";
		PdfWriter writer = new PdfWriter(path);
		PdfDocument docu = new PdfDocument(writer);
		docu.setDefaultPageSize(PageSize.A4);
		Document document = new Document(docu);

		ExpenseDAO d = new ExpenseDAO(DBConnection.getConn());
		List<User_expense> list1 = d.getAllExpenseById(user.getId());

		IncomeDAO d1 = new IncomeDAO(DBConnection.getConn());
		List<User_income> list = d1.getAllIncomeById(user.getId());

		List<Object> combinedList = new ArrayList<>();
		combinedList.addAll(list1);
		combinedList.addAll(list);
		document.add(new Paragraph("Transcation history"));
		for (Object obj : combinedList) {
			if (obj instanceof User_expense) {
				User_expense expense = (User_expense) obj;
				document.add(new Paragraph("Expense:- " + expense.getType() + " " + expense.getExpense() + " " + "on"
						+ " " + expense.getDate().toLocalDate()));
			} else if (obj instanceof User_income) {
				User_income income = (User_income) obj;
				document.add(new Paragraph("Income:- " + income.getType() + " " + income.getIncome() + " " + "on" + " "
						+ income.getDate().toLocalDate()));
			}
		}

		document.close();
		session.setAttribute("msg", "Download susccessful");
		response.sendRedirect("home.jsp");
	}
}
