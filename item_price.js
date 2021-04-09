window.addEventListener('load', () => {
   console.log("OK");
   const priceInput = document.getElementById("金額を入力する場所のid");
console.log(priceInput);
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);
   const addTaxDom = document.getElementById("販売手数料を表示する場所のid");
   addTaxDom.innerHTML = "入力した金額をもとに販売手数料を計算する処理"
 })