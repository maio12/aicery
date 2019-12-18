import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["cart"]

  connect() {
    this.counter = 0;
    this.ratio = "1";

    console.log("hello cart")
  }

  animate(){
    console.log("animating")
    this.timer = setInterval(() => this.start(this.cart), 60);
  }

  start(cart) {
    if (this.ratio === "1") {
      this.ratio = "1.2";
    } else {
      this.ratio = "1";
    }

    this.counter += 1;
    cart.style="transition: transform 0.2s;"
    cart.style.transform = `scale(${this.ratio})`
    console.log('scaled')
    if (this.counter >= 6) {
      clearTimeout(this.timer)
      this.cart.style.transform = "scale(1)"
      this.counter = 0;
    }
}

  get cart() {
    return document.querySelector(".fa-shopping-cart")
  }
}
