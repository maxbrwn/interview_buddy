import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-limit"
export default class extends Controller {
  connect() {
    this.maxCheckboxes = 1;
    this.updateCheckboxLimit();
  }

  updateCheckboxLimit() {
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.addEventListener("change", () => {
        this.handleCheckboxChange();
      });
    });
  }

  handleCheckboxChange() {
    const checkedCheckboxes = this.checkboxTargets.filter((checkbox) => checkbox.checked);

    if (checkedCheckboxes.length > this.maxCheckboxes) {
      checkedCheckboxes.pop().checked = false;
      alert(`You can only select up to ${this.maxCheckboxes} checkboxes.`);
    }
  }
}
