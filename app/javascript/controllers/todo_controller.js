import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input"]

  connect() {
    this.formTarget.addEventListener("turbo:submit-end", () => {
      this.inputTarget.value = null;
    });
  }
  submitForm(e) {
    if (e.key === "Enter") {
      this.formTarget.requestSubmit();
    }
  }
}