import { Controller } from "stimulus"
import $ from 'jquery'

export default class extends Controller {
  static targets = ['goal', 'assist', 'button']
  connect() {
    const isfilled = (element) => {
      return element != ""
    }

    const checkFields = () => {
      let myArray = []
      let button = this.buttonTarget
      this.goalTargets.forEach(input => input.checked ? myArray.push(input.checked) : '' )
      this.assistTargets.forEach(input => input.checked ? myArray.push(input.checked) : '' )
      console.log(myArray)
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

  toggleGoalActive() {
    this.goalTargets.forEach(input => input.nextElementSibling.classList.remove('match-goal-active'))
    event.currentTarget.classList.toggle('match-goal-active')
  }

  toggleAssistActive() {
    this.assistTargets.forEach(input => input.nextElementSibling.classList.remove('match-goal-active'))
    event.currentTarget.classList.toggle('match-goal-active')
  }
}
