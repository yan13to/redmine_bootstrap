export default function toggleCheckbox(currentElement) {
  currentElement.addEventListener('click', function(event) {
    event.preventDefault();

    const target = currentElement.getAttribute('data-target')
    const targetElement = document.querySelector(target);
    const checkboxes = targetElement.querySelectorAll('input[type="checkbox"]')

    for(const checkbox of checkboxes) {
      checkbox.checked = !checkbox.checked
    }
  })
}