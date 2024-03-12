import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-to-question"
export default class extends Controller {
static targets = ["question"]
static values = { id: String }

  connect() {


    if (this.idValue) {
      this.scrollToQuestion();
    }
  }
  scrollToQuestion() {

    this.questionTarget.scrollIntoView({ behavior: "smooth" });
  }
}
