const pay = () => {
  Payjp.setPublicKey("pk_test_***************");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_delivery[number]"),
      cvc: formData.get("purchase_delivery[cvc]"),
      exp_month: formData.get("purchase_delivery[month]"),
      exp_year: `20${formData.get("purchase_delivery[year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }

      document.getElementById("purchase_delivery_number").removeAttribute("name");
      document.getElementById("purchase_delivery_cvc").removeAttribute("cvc");
      document.getElementById("purchase_delivery_month").removeAttribute("month");
      document.getElementById("purchase_delivery_year").removeAttribute("year");

      document.getElementById("charge-form").onsubmit();
    });
  });
};

window.addEventListener("load", pay);