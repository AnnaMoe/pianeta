// new Date("dateString") is browser-dependent and discouraged, so we'll write
// a simple parse function for U.S. date format (which does no error checking)

const datediff = (first, second) => {
  // Take the difference between the dates and divide by milliseconds per day.
  // Round to nearest whole number to deal with DST.
  return Math.round((second - first) / (1000 * 60 * 60 * 24));
}

const handleBookingFormChange = (e) => {
  // classes are automatically generate by simple for gem, you find it upon browser inspect elements
  const checkIn = document.querySelector('.booking_check_in_date input');
  const checkOut = document.querySelector('.booking_check_out_date input');
  let numberOfGuests = document.querySelector('.booking_number_of_guests input');
  //hidden input in the form
  let planetPrice = document.querySelector('.booking_price input');

  // https://stackoverflow.com/questions/5515310/is-there-a-standard-function-to-check-for-null-undefined-or-blank-variables-in
  if (checkIn.value && checkOut.value  && numberOfGuests.value) {
    const days = datediff(new Date(checkIn.value), new Date(checkOut.value))
    numberOfGuests = Number.parseInt(numberOfGuests.value, 10);
    planetPrice = Number.parseInt(planetPrice.value, 10);

    const newTotal = days * numberOfGuests * planetPrice;
    const totalElement = document.querySelector('.booking-form .total');
    totalElement.innerHTML = `$${newTotal}`;
  }
}

export { handleBookingFormChange };