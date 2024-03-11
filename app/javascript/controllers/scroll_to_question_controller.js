import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-to-question"
export default class extends Controller {
static targets = ["question"]
static values = { id: String }

  connect() {

    console.log(this.questionTarget);
    console.log(this.idValue);

    if (this.idValue) {
      this.scrollToQuestion();

    }
  }
  scrollToQuestion() {
    console.log("scrolling to question");
    this.questionTarget.scrollIntoView({ behavior: "smooth" });
  }
}
