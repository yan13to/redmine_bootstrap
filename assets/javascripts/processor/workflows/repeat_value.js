import findNextElementSiblings from "../../libs/find_next_element_siblings.js";

export default function (currentElement) {
  currentElement.addEventListener('click', function(event) {
    event.preventDefault();

    const currentEl = currentElement.closest('td');
    const currentSelect = currentEl.querySelector('select');
    const targetEls = findNextElementSiblings(currentEl);

    targetEls.map(el => (el instanceof HTMLElement) ? el : null).filter(Boolean).forEach(el => {
      el.querySelector('select').value = currentSelect.value;
    });
  })
}