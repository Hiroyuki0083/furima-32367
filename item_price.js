window.addEventListener('load', () => {
   console.log("OK");
   const priceInput = document.getElementById(price);
console.log(priceInput);
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);
   const addTaxDom = document.getElementById(price);
   addTaxDom.innerHTML = Math.floor(price * 0.1)
 })})