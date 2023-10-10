import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select"
export default class extends Controller {
  submit() {
    this.element.requestSubmit()
  }
}
