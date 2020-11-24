import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["navbar", "pwaNavbar", "pwaNavbarSpacer"]

  connect() {
    if (navigator.standalone) {
      if (this.hasNavbarTarget) {
        this.navbarTarget.style.display = 'none'
      }
      this.pwaNavbarTarget.style.display = 'flex';
      this.pwaNavbarSpacerTarget.style.display = 'block';
      this.pwaTopBarTarget.style.display = 'flex';
      this.pwaTopBarSpacerTarget.style.display = 'block';
    }
  }
}
