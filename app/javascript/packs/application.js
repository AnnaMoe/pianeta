

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import initGranim from '../plugins/init_granim';


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initGranim();
});
