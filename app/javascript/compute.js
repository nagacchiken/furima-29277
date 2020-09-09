function compute() {
  let inputPrice = document.getElementById("item-price");
  let sales_commission = document.getElementById("add-tax-price");
  let sales_profit = document.getElementById("profit");
  inputPrice.addEventListener("input",function(){
    let fee = inputPrice.value * 0.1
    let profit = inputPrice.value * 0.9
    sales_commission.innerHTML = Math.round(fee);
    sales_profit.innerHTML = Math.round(profit);
  })
  
}
window.addEventListener("click", compute);