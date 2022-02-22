import { Controller } from "@hotwired/stimulus"
// Don't forget to import the NPM package
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Rent a flat", "Have fun with your friends", "Enjoy quality time", "Buy Bitcoin"],
      typeSpeed: 50,
      loop: true
    });
  }
}
