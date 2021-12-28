import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input"]

  initialize() {
    this.formTarget.addEventListener("turbo:submit-end", () => {
      this.inputTarget.value = null;
    })
    this.inputTarget.addEventListener("keyup", (e) => {
      if (e.key === "Enter") {
        this.formTarget.requestSubmit();
      }
    })
  }
}