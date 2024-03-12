import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // static targets = [ "regular", "filled" ]
  static values = { url: String }
  static targets = [ "bookmark" ]

  connect() {
    console.log("connected");
    console.log(this.urlValue);
    console.log(this.bookmarkTarget)
  }

  create(event) {
    event.preventDefault();
    const url = this.urlValue;
    fetch(url, {
      method: 'POST',
      headers: {"Accept": "text/plain", 'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')},
    }).then(response => response.text())
      .then((data) => {
      console.log(data);
      this.bookmarkTarget.outerHTML = data
    })
  }

  destroy(event) {
    event.preventDefault();
    let url = this.urlValue
    fetch(url, {
      method: 'DELETE',
      headers: {
        "Accept": "text/plain",
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      }
    }).then(response => response.text())
    .then((data) => {
      console.log(data);
      this.bookmarkTarget.outerHTML = data
    })
  }
}
