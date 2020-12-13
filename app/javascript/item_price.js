window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    console.log("イベント発火");
  })
  const salesCommission = document.getElementById("add-tax-price")
  const salesProfit = document.getElementById("profit")
})