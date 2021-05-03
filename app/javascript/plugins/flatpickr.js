import flatpickr from "flatpickr";
import "flatpickr/dist/themes/light";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
  });
}

export { initFlatpickr };