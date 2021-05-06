import { initFlatpickr } from "../plugins/flatpickr";

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import initGranim from '../plugins/init_granim';
import { handleBookingFormChange } from "../views/bookings/index";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initFlatpickr();
  initGranim();
});

window.handleBookingFormChange = handleBookingFormChange;
