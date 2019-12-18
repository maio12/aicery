let counter = 0;
let ratio = "1";
let timer;
const cart = document.querySelector(".fa-shopping-cart");

function startTimer() {
  // if (counter < 6) {timer = setInterval(animateCart(), 60)}
  console.log("after timout")
}


function animateCart() {
  if (ratio === "1") {
    ratio = "1.2";
  } else {
    ratio = "1";
  }

  counter += 1;
  cart.style.transform = `scale(${ratio})`
console.log(counter)
  if (counter >= 6) {
    console.log("inside if")
    clearTimeout(timer);
    cart.style.transform = "scale(1)"
    counter = 0;
  }

}

function initAnimateCart() {
  // if (!cart) { return }

  // const buttons = document.querySelectorAll(".js-add-to-cart");

  // buttons.forEach(button => {
  //   button.addEventListener("click", () => startTimer())
  // })
}

export { initAnimateCart };
