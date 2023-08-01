import { Controller } from "stimulus"
import $ from 'jquery'

export default class extends Controller {
  static targets = ['goal', 'assist', 'button', 'goalContainer', 'assistContainer']
  connect() {
    const isfilled = (element) => {
      return element != ""
    }

    const checkFields = () => {
      if (this.hasButtonTarget) {
        let myArray = []
        let button = this.buttonTarget
        this.goalTargets.forEach(input => input.checked ? myArray.push(input.checked) : '' )
        this.assistTargets.forEach(input => input.checked ? myArray.push(input.checked) : '' )
        // console.log(myArray)
        this.goalTargets.forEach((input) => {
          if (myArray.length < 1) {
            input.checked ? input.nextElementSibling.classList.remove('disabled') : input.nextElementSibling.classList.add('disabled')
          } else {
            input.nextElementSibling.classList.remove('disabled');
          }
        });
        if (myArray.every(isfilled) && myArray.length == 2) {
          button.classList.remove('disabled')
        } else {
          button.classList.add('disabled')
        }
      }
    }

    this.goalTargets.forEach((input) => {
      input.addEventListener('change', () => {
        checkFields()
      })
    });

    this.assistTargets.forEach((input) => {
      input.addEventListener('change', () => {
        checkFields()
      })
    });

  }

  toggleGoalActive() {
    this.goalTargets.forEach(input => input.nextElementSibling.classList.remove('match-goal-active'))
    event.currentTarget.classList.toggle('match-goal-active')
    if (this.hasGoalContainerTarget) {
      this.goalContainerTarget.classList.add('d-none')
      this.assistContainerTarget.classList.remove('d-none')
    }
  }

  toggleAssistActive() {
    this.assistTargets.forEach(input => input.nextElementSibling.classList.remove('match-goal-active'))
    event.currentTarget.classList.toggle('match-goal-active')
  }

  scorerAndAssister(event) {
    console.log(`${window.location.href}?scorer=${event.currentTarget.dataset.scorer}`)
    fetch(`${window.location.href}?scorer=${event.currentTarget.dataset.scorer}`, {
    method: "GET", // Could be dynamic with Stimulus values
    headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        // console.log(data.form)
        if (data.form) {
          // beforeend could also be dynamic with Stimulus values
          this.assistContainerTarget.innerHTML = ""
          this.assistContainerTarget.insertAdjacentHTML("beforeend", data.form)
        }
      })
  }

  enableButton() {
    const isfilled = (element) => {
      return element != ""
    }

    const checkFields = () => {
      let myArray = []
      let button = this.buttonTarget
      this.goalTargets.forEach(input => input.checked ? myArray.push(input.checked) : '' )
      this.assistTargets.forEach(input => input.checked ? myArray.push(input.checked) : '' )
      // console.log(myArray)
      this.goalTargets.forEach((input) => {
        if (myArray.length < 1) {
          input.checked ? input.nextElementSibling.classList.remove('disabled') : input.nextElementSibling.classList.add('disabled')
        } else {
          input.nextElementSibling.classList.remove('disabled');
        }
      });
      if (myArray.every(isfilled) && myArray.length == 2) {
        button.classList.remove('disabled')
      } else {
        button.classList.add('disabled')
      }
    }

    this.goalTargets.forEach((input) => {
      input.addEventListener('change', () => {
        checkFields()
      })
    });

    this.assistTargets.forEach((input) => {
      input.addEventListener('change', () => {
        checkFields()
      })
    });
  }
}
