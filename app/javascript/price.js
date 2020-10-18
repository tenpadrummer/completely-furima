if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
    window.addEventListener("DOMContentLoaded", () => {
    const priceInput = document.getElementById("price-input");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
      profitDom.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
    })
  });
}