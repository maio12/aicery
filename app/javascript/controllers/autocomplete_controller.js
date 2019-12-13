import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "results"]

  connect() {
    console.log("hello autocomplete")
  }

  load() {
    console.log(this.query)
    fetch(`${this.url}?query=${this.query}`)
      .then(response => response.json())
      .then(products => {
        this.results.innerHTML = products.join('');
      });
  }

  get query() {
    return this.inputTarget.value
  }

  get url() {
    return this.data.get('url');
  }

  get results() {
    return this.resultsTarget;
  }
}
