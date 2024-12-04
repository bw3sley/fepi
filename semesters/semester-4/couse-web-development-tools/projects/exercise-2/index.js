function convertCurrency({ location, number, ISOCode }) {
  return new Intl.NumberFormat(location, { style: 'currency', currency: ISOCode }).format(number);
}

form.onsubmit = (event) => {
  event.preventDefault();

  const currency = document.querySelector("#currency").value;

  result.textContent = convertCurrency({
    location: "pt-BR", 
    number: Number(currency), 
    ISOCode: "BRL"
  });
}

// console.log(convertCurrency({
//   location: "pt-BR",
//   number: 12900120491,
//   ISOCode: "BRL"
// }))