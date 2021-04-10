window.addEventListener('load', () => {
    const priceInput = document.getElementById('item-price'); // elementsとその左隣の矢印からIDを確認する
 console.log(priceInput);
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);
   const addTaxDom = document.getElementById('add-tax-price');
   addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
   const addProfitDom = document.getElementById('profit');
   addProfitDom.innerHTML = Math.floor(inputValue - (inputValue * 0.1)) // addTaxDomは一度しか使えないので、2度使うとエラーになる
//  })})
})})