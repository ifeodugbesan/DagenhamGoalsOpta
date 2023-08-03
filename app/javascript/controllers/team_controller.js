import { Controller } from "stimulus"
import $ from 'jquery'

export default class extends Controller {
  static targets = ['captain', 'player', 'button', 'captainContainer', 'playersContainer']
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
      console.log(count)
      myArray.push(this.captainTarget.value != "")
      this.playerTargets.forEach((input) => {
        if (count == 7) {
          input.checked ? input.nextElementSibling.classList.remove('disabled') : input.nextElementSibling.classList.add('disabled')
        } else {
          input.nextElementSibling.classList.remove('disabled');
        }
      });
      if (myArray.every(isfilled) && count == 7) {
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

    checkFields()
  }

  toggleCaptainActive() {
    this.captainTargets.forEach(input => input.nextElementSibling.classList.remove('match-goal-active'))
    event.currentTarget.classList.toggle('match-goal-active')
    if (this.hasCaptainContainerTarget) {
      this.captainContainerTarget.classList.add('d-none')
      this.playersContainerTarget.classList.remove('d-none')
    }
  }

  toggleActive() {
    event.currentTarget.classList.toggle('player-active')
    console.log('toggle')
  }

  showPlayers(event) {
    console.log(`${window.location.href}&captain=${event.currentTarget.dataset.captain}`)
    fetch(`${window.location.href}&captain=${event.currentTarget.dataset.captain}`, {
    method: "GET", // Could be dynamic with Stimulus values
    headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        // console.log(data.form)
        if (data.form) {
          // beforeend could also be dynamic with Stimulus values
          this.playersContainerTarget.innerHTML = ""
          this.playersContainerTarget.insertAdjacentHTML("beforeend", data.form)
        }
      })
  }

  enableButton() {
    console.log('yoooooo')
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
      console.log(count)
      myArray.push(this.captainTarget.value != "")
      this.playerTargets.forEach((input) => {
        if (count == 7) {
          input.checked ? input.nextElementSibling.classList.remove('disabled') : input.nextElementSibling.classList.add('disabled')
        } else {
          input.nextElementSibling.classList.remove('disabled');
        }
      });
      if (myArray.every(isfilled) && count == 7) {
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
}
