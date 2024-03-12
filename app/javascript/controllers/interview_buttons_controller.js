import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["enable", "disable"]
  static values = {
    currentIndex: Number,
    arraySize: Number
  }
  connect(){
    const currentIndex = this.currentIndexValue;
    const arraySize = this.arraySizeValue;

    if (currentIndex === arraySize) {
      this.enableTarget.classList.remove("d-none");
    }
    // if (currentIndex === arraySize) {
    // this.disableTarget.classList.add("d-none");
    // }

  }
}
