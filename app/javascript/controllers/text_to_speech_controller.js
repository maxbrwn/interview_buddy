import { Controller } from "@hotwired/stimulus"



export default class extends Controller {
  speak(event) {
    event.preventDefault();

    const text = this.element.getAttribute("data-text");
    fetch("/generate_speech", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({ text: text })
    })
    .then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.blob();
    })
    .then(blob => {
      const url = window.URL.createObjectURL(blob);
      const audio = new Audio(url);
      audio.play();
    })
    .catch(error => {
      console.error("There was a problem with your fetch operation:", error);
    });
  }
}
