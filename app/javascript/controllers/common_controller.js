import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['container', 'homepage']
  connect() {
    this.containerTargets.forEach(container => container.style.minHeight = `${window.innerHeight - 66}px`)
    if (this.hasHomepageTarget) {
      this.homepageTarget.style.minHeight = `${window.innerHeight - 66}px`
    }
  }
}
