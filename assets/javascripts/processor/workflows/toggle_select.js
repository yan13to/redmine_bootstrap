import targetElement from "../shared/target_element.js";

export default function(currentElement) {
  const collapsedIcon = `<i class="bi bi-dash"></i>`
  const collapseIcon = `<i class="bi bi-plus"></i>`

  currentElement.addEventListener('click', function(event) {
    event.preventDefault();

    const target = targetElement(currentElement)[0]

    target.toggleAttribute('multiple');

    if (target.hasAttribute('multiple')) {
      currentElement.innerHTML = collapsedIcon;
      target.querySelector('option[value="all"]').style.display = 'none';
    } else {
      currentElement.innerHTML = collapseIcon;
      target.querySelector('option[value="all"]').removeAttribute('style');
    }
  })
}