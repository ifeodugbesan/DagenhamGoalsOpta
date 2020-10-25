import { Controller } from "stimulus"
import $ from 'jquery'

export default class extends Controller {
  static targets = ['captain', 'player', 'button']
  connect() {
    const isfilled = (element) => {
      return element != ""
    }

    const checkFields = () => {
      let myArray = []
      let button = this.buttonTarget
      this.playerTargets.forEach(input => input.checked ? myArray.push(input.checked) : '' )
      let count = 0
      myArray.forEach((input) => {
        if (input == true) {
          count ++
        }
      })
      myArray.push(this.captainTarget.value != "")
      this.playerTargets.forEach((input) => {
        if (count == 6) {
          input.checked ? input.nextElementSibling.classList.remove('disabled') : input.nextElementSibling.classList.add('disabled')
        } else {
          input.nextElementSibling.classList.remove('disabled');
        }
      });
      if (myArray.every(isfilled) && count == 6) {
        button.classList.remove('disabled')
      } else {
        button.classList.add('disabled')
      }
    }

    this.playerTargets.forEach((input) => {
      input.addEventListener('change', () => {
        checkFields()
      })
    });

    this.captainTarget.addEventListener('change', () => {
      checkFields()
    })
  }

  toggleActive() {
    event.currentTarget.classList.toggle('player-active')
  }
}
