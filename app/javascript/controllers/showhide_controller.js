import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showhide"
export default class extends Controller {
  static targets = ["input", "frontendoutput", "backendoutput", "fullstackoutput", "questionoutput"]
  connect() {
    // hide the output targets by default:
    this.frontendoutputTarget.hidden = true
    this.backendoutputTarget.hidden = true
    this.fullstackoutputTarget.hidden = true
    this.questionoutputTarget.hidden = true
  }

  toggle(e) {
    console.log(e.target);
    const targetValue = e.target.dataset.value;
    this.questionoutputTarget.hidden = false

    if (targetValue !== this.frontendoutputTarget.dataset.value) {
      this.frontendoutputTarget.hidden = true;
    } else {
      this.frontendoutputTarget.hidden = false;
    }

    if (targetValue !== this.backendoutputTarget.dataset.value) {
      this.backendoutputTarget.hidden = true;
    } else {
      this.backendoutputTarget.hidden = false;
    }

    if (targetValue !== this.fullstackoutputTarget.dataset.value) {
      this.fullstackoutputTarget.hidden = true;
    } else {
      this.fullstackoutputTarget.hidden = false;
    }
  }
}
