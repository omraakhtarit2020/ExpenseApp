/**
 * 
 */
 /**
 * 
 */
//Goal 

const initialAmount = document.querySelector(".initialAmount");
const interestRate = document.querySelector(".interestGRate");
const inflationRate = document.querySelector(".inflationRate");
const year = document.querySelector(".year");

const finalAmount = document.querySelector(".finalAmount .value");
const monthlyInvestment = document.querySelector(".monthlyInvestment .value");

const calculateGBtn = document.querySelector(".calculateGBtn");
const refreshGBtn = document.getElementById("refreshGBtn");

const calculatefv = () => {
    const PV = parseFloat(initialAmount.value);
    const R = parseFloat(interestRate.value) / 100;
    const I = parseFloat(inflationRate.value) / 100;
    const N = parseFloat(year.value);
    
    const FV = PV * Math.pow((1 + R) / (1 + I), N);
    
    return FV;
};

const updateGData = (inflatedFV) => {
    if (!isNaN(inflatedFV) && isFinite(inflatedFV)) {
        finalAmount.textContent = Math.round(inflatedFV);
        const monthlyInvestmentPayable = Math.round(inflatedFV / (parseFloat(year.value) * 12));
        monthlyInvestment.textContent = isNaN(monthlyInvestmentPayable) ? "" : monthlyInvestmentPayable;
    } else {
        finalAmount.textContent = "";
        monthlyInvestment.textContent = "";
    }
};

const initg = () => {
    const inflatedFV = calculatefv();
    updateGData(inflatedFV);
};

initg();

let popup = document.getElementById("popup");

        function openPopup() {
            popup.classList.add("open-popup");
        }

        function closePopup() {
            popup.classList.remove("open-popup");
        }

calculateGBtn.addEventListener("click", () => {
    initg();
    setTimeout(() => {
        openPopup();
    }, 1000);
});

const refreshGInput = () => {
    initialAmount.value = "";
    interestRate.value = "";
    inflationRate.value = "";
    year.value = "";
    updateGData();
};

refreshGBtn.addEventListener("click", refreshGInput);



//let fv = value * Math.pow(1 + interestRate, tenure);
//let inflatedFV = fv / Math.pow(1 + inflationRate, tenure);

/*function calculateEMI() {
	const principal = parseFloat(document.getElementById('principal').value);
	const interestRate = parseFloat(document.getElementById('interest').value);
	const years = parseFloat(document.getElementById('year').value);

	const monthlyInterestRate = interestRate / 12 / 100;
	const months = years * 12;

	const emi = principal * monthlyInterestRate * Math.pow(1 + monthlyInterestRate, months) / (Math.pow(1 + monthlyInterestRate, months) - 1);

	document.getElementById('emi').value = emi.toFixed(2);
  }*/
//Loan
const amount = document.querySelector(".loanAmount");
const interest = document.querySelector(".interestRate");
const tenure = document.querySelector(".loanTenure");

const loanEmi = document.querySelector(".loanEmi .value");
const totalInterest = document.querySelector(".totalInterest .value");
const totalAmount = document.querySelector(".totalAmount .value");

const calculateBtn = document.querySelector(".calculateBtn");
const refreshBtn = document.getElementById("refreshBtn");

let lAmount = parseFloat(amount.value);
let lInterestRate = parseFloat(interest.value);
let lTenure = parseFloat(tenure.value);

let loanInterest = lInterestRate / 12 / 100;

const calculateEMI = () => {
	let emi = lAmount * loanInterest * (Math.pow(1 + loanInterest, lTenure) / (Math.pow(1 + loanInterest, lTenure) - 1));
	return emi;
};

const updateData = (emi) => {
	loanEmi.textContent = isNaN(emi) ? "" : Math.round(emi);

	let totalAmountValue = isNaN(emi) ? "" : Math.round(lTenure * emi);
	totalAmount.textContent = totalAmountValue;

	let totalInterestPayable = isNaN(emi) ? "" : Math.round(totalAmountValue - lAmount);
	totalInterest.textContent = totalInterestPayable;
};

const refreshInput = () => {
	lAmount = parseFloat(amount.value) || 0;
	lInterestRate = parseFloat(interest.value) || 0;
	lTenure = parseFloat(tenure.value) || 0;
	loanInterest = lInterestRate / 12 / 100;
};

const init = () => {
	refreshInput();
	let emi = calculateEMI();
	updateData(emi);
};

init();

calculateBtn.addEventListener("click", init);

const clearInputs = () => {
	amount.value = "";
	interest.value = "";
	tenure.value = "";
	refreshInput();
	updateData(); // Clear the result values
};

refreshBtn.addEventListener("click", clearInputs);

//emi

// EMI Calculator

const emiPrincipalInput = document.querySelector(".pAmount");
const emiInterestInput = document.querySelector(".rate");
const emiTenureInput = document.querySelector(".months");

const emiValueDisplay = document.querySelector(".emiMon .value");
const emiTotalInterestDisplay = document.querySelector(".totalInterestEmi .value");
const emiTotalAmountDisplay = document.querySelector(".totalPayable .value");

const emiCalculateButton = document.querySelector(".calculateEBtn");
const emiRefreshButton = document.getElementById("refreshEBtn");

let emiPrincipalAmount = parseFloat(emiPrincipalInput.value) || 0;
let emiInterestRate = parseFloat(emiInterestInput.value) || 0;
let emiTenureMonths = parseFloat(emiTenureInput.value) || 0;

let emiInterestRateMonthly = emiInterestRate / 12 / 100;

const calculateemi = () => {
    let emi = emiPrincipalAmount * emiInterestRateMonthly * (Math.pow(1 + emiInterestRateMonthly, emiTenureMonths) / (Math.pow(1 + emiInterestRateMonthly, emiTenureMonths) - 1));
    return emi;
};

const updateEMIData = (emi) => {
    emiValueDisplay.textContent = isNaN(emi) ? "" : Math.round(emi);

    let emiTotalAmountValue = isNaN(emi) ? "" : Math.round(emiTenureMonths * emi);
    emiTotalAmountDisplay.textContent = emiTotalAmountValue;

    let emiTotalInterestPayable = isNaN(emi) ? "" : Math.round(emiTotalAmountValue - emiPrincipalAmount);
    emiTotalInterestDisplay.textContent = emiTotalInterestPayable;
};

const refreshEMIInput = () => {
    emiPrincipalAmount = parseFloat(emiPrincipalInput.value) || 0;
    emiInterestRate = parseFloat(emiInterestInput.value) || 0;
    emiTenureMonths = parseFloat(emiTenureInput.value) || 0;
    emiInterestRateMonthly = emiInterestRate / 12 / 100;
};

const initEMI = () => {
    refreshEMIInput();
    let emi = calculateemi();
    updateEMIData(emi);
};

initEMI();

emiCalculateButton.addEventListener("click", initEMI);

const clearEMIInputs = () => {
    emiPrincipalInput.value = "";
    emiInterestInput.value = "";
    emiTenureInput.value = "";
    refreshEMIInput();
    updateEMIData(); // Clear the result values
};

emiRefreshButton.addEventListener("click", clearEMIInputs);
