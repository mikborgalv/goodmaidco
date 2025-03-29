import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select", "details"]
  
  connect() {
    this.toggleDetails()
  }
  
  updateDetails() {
    if (this.selectTarget.value) {
      fetch(`/accounts/${this.selectTarget.value}.json`)
        .then(response => response.json())
        .then(this.displayDetails.bind(this))
    }
    this.toggleDetails()
  }
  
  displayDetails(account) {
    this.detailsTarget.innerHTML = `
      <h6>Account Details</h6>
      <div><strong>Name:</strong> ${account.name}</div>
      <div><strong>Phone:</strong> ${account.phone_number}</div>
      <div><strong>Locations:</strong> ${account.locations.map(l => l.name).join(', ')}</div>
    `
  }
  
  toggleDetails() {
    this.detailsTarget.style.display = this.selectTarget.value ? 'block' : 'none'
  }
}