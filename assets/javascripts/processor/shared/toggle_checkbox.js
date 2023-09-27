import targetElement from "../shared/target_element.js";

export default function(currentElement) {
  currentElement.addEventListener('click', function(event) {
    event.preventDefault();

    const checkboxes = targetElement(currentElement);
    let allChecked = true;

    Array.prototype.forEach.call(checkboxes, function (checkbox) {
      if (!checkbox.checked) allChecked = false;
    });

    Array.prototype.forEach.call(checkboxes, function (check) {
      check.checked = !allChecked
    })
  })
}