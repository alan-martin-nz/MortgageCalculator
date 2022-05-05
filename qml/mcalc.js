

var vprincipal = 1.0;
var vinterestRate = 1.0;
var vloanTermYears = 1.0;


//Update HTML - Google Charts
function newValuesChart() {

var cprincipal = loanAmountslider.mySlider.value;
var cinterestRate = myRateSlider.mySlider.value;
var cloanTermYears = loanTermSlider.mySlider.value;

const firstString = fileUtils.readFile(Qt.resolvedUrl("chart1.html"));
const reg = /uprincipal\s*=\s*(.*)/g;
const funcAsString = firstString.replace(reg, "principal = "+cprincipal);

const secondString = funcAsString;
const reg1 = /uinterestRate\s*=\s*(.*)/g;
const funcAsString1 = secondString.replace(reg1, "interestRate = "+cinterestRate);

const thirdString = funcAsString1;
const reg2 = /uloanTermYears\s*=\s*(.*)/g;
const funcAsString2 = thirdString.replace(reg2, "loanTermYears = "+cloanTermYears);

  //  console.log(funcAsString2);
    return funcAsString2;

}

//Update HTML - Google Table
function newValuesTable() {

var cprincipal = loanAmountslider.mySlider.value;
var cinterestRate = myRateSlider.mySlider.value;
var cloanTermYears = loanTermSlider.mySlider.value;

const firstString = fileUtils.readFile(Qt.resolvedUrl("table1.html"));
const reg = /uprincipal\s*=\s*(.*)/g;
const funcAsString = firstString.replace(reg, "principal = "+cprincipal);

const secondString = funcAsString;
const reg1 = /uinterestRate\s*=\s*(.*)/g;
const funcAsString1 = secondString.replace(reg1, "interestRate = "+cinterestRate);

const thirdString = funcAsString1;
const reg2 = /uloanTermYears\s*=\s*(.*)/g;
const funcAsString2 = thirdString.replace(reg2, "loanTermYears = "+cloanTermYears);

//console.log(funcAsString2);
    return funcAsString2;

}

 //Calculate weekly, fortnightly and monthly repayments
function weekPayment() {

    var calcWeeklyInterestRate = vinterestRate/(5200);
    var wpaymentPeriods = vloanTermYears*52;

    var calcWeeklyPayment = (calcWeeklyInterestRate /(1-(Math.pow((1+calcWeeklyInterestRate),-(wpaymentPeriods)))))*vprincipal;
     return calcWeeklyPayment
}

function fortPayment() {

    var calcFortnightlyInterestRate = vinterestRate/(2600);
    var fpaymentPeriods = vloanTermYears*26;

    var calcFortnightlyPayment = (calcFortnightlyInterestRate /(1-(Math.pow((1+calcFortnightlyInterestRate),-(fpaymentPeriods)))))*vprincipal;
     return calcFortnightlyPayment
}

function monthPayment() {

    var calcMonthlyInterestRate = vinterestRate/(1200);
    var mpaymentPeriods = vloanTermYears*12;

 var calcMonthlyPayment = (calcMonthlyInterestRate /(1-(Math.pow((1+calcMonthlyInterestRate),-(mpaymentPeriods)))))*vprincipal;
  return calcMonthlyPayment
}

//Calculate total cost of loan for both weekly, fortnightly and monthly repayment periods
function weekTotalCost() {

    var calcWeeklyInterestRate = vinterestRate/(5200);
     var wpaymentPeriods = vloanTermYears*52;
    var calcWeeklyPayment = (calcWeeklyInterestRate /(1-(Math.pow((1+calcWeeklyInterestRate),-(wpaymentPeriods)))))*vprincipal;
     var calcWeeklyTotalCost = (calcWeeklyPayment * wpaymentPeriods);
     return calcWeeklyTotalCost
}

function fortTotalCost() {
    var calcFortnightlyInterestRate = vinterestRate/(2600);
    var fpaymentPeriods = vloanTermYears*26;

    var calcFortnightlyPayment = (calcFortnightlyInterestRate /(1-(Math.pow((1+calcFortnightlyInterestRate),-(fpaymentPeriods)))))*vprincipal;
    var calcFortnightlyTotalCost = (calcFortnightlyPayment * fpaymentPeriods);
     return calcFortnightlyTotalCost
}

function monthTotalCost() {
    var calcMonthlyInterestRate = vinterestRate/(1200);
    var mpaymentPeriods = vloanTermYears*12;

    var calcMonthlyPayment = (calcMonthlyInterestRate /(1-(Math.pow((1+calcMonthlyInterestRate),-(mpaymentPeriods)))))*vprincipal;
    var calcMonthlyTotalCost = (calcMonthlyPayment * mpaymentPeriods);
  return calcMonthlyTotalCost
}

