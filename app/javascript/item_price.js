window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price")
  const addTax = document.getElementById("add-tax-price")
  const priceProfit = document.getElementById('profit')

  priceInput.addEventListener('input', function() {
    input_price = priceInput.value
    addTax.innerHTML = input_price * 0.1
    priceProfit.innerHTML = input_price - addTax.innerHTML

  })
})