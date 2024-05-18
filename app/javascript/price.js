window.addEventListener('turbo:load', () => {
  
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profitContent = document.getElementById("profit");

  priceInput.addEventListener("input",(e) => {
    const price = e.target.value;
    const fee = Math.floor(price * 0.1);
    const profit = Math.floor(price - fee);

    addTaxPrice.innerHTML = fee;
    profitContent.innerHTML = profit;
  });
});