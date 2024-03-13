import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showhide"
export default class extends Controller {
  static targets = ["input", "frontendoutput", "backendoutput", "fullstackoutput", "questionoutput", "frontend", "backend", "fullstack"]
  connect() {
    // hide the output targets by default:
    this.frontendoutputTarget.hidden = true
    this.backendoutputTarget.hidden = true
    this.fullstackoutputTarget.hidden = true
    this.questionoutputTarget.hidden = true
    document.querySelectorAll("legend").forEach(element => {
      element.classList.add("d-none")
    });
    }


  toggle(e) {
    // console.log(e.target);
    const targetValue = e.target.dataset.value;
    this.questionoutputTarget.hidden = false

    if (targetValue === this.frontendoutputTarget.dataset.value) {
      this.frontendoutputTarget.hidden = false;
      this.backendoutputTarget.hidden = true
      this.fullstackoutputTarget.hidden = true
      this.frontendTarget.style.opacity = 1;
      this.backendTarget.style.opacity = 0.5;
      this.fullstackTarget.style.opacity = 0.5;
    }

    if (targetValue === this.backendoutputTarget.dataset.value) {
      this.backendoutputTarget.hidden = false;
      this.frontendoutputTarget.hidden = true
      this.fullstackoutputTarget.hidden = true
      this.backendTarget.style.opacity = 1;
      this.frontendTarget.style.opacity = 0.5;
      this.fullstackTarget.style.opacity = 0.5;
    }

    if (targetValue === this.fullstackoutputTarget.dataset.value) {
      this.fullstackoutputTarget.hidden = false;
      this.frontendoutputTarget.hidden = true
      this.backendoutputTarget.hidden = true
      this.fullstackTarget.style.opacity = 1;
      this.frontendTarget.style.opacity = 0.5;
      this.backendTarget.style.opacity = 0.5;
    }
  }

}
