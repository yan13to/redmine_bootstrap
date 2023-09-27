import Sortable from '../../../node_modules/sortablejs/modular/sortable.complete.esm.js';

const handleClass = '.handle-move';
const handleIcon = `<i class="bi bi-arrows-move"></i>`;
const progressIcon = `
  <span class="spinner-border" role="status" style="width:1rem;height:1rem;">
    <span class="visually-hidden">Loading...</span>
  </span>
`
const handleEnd = (e) => {
  e.preventDefault();

  // TODO: Replace with Element.setHTML() see https://developer.mozilla.org/en-US/docs/Web/API/Element/setHTML
  e.item.querySelector(handleClass).innerHTML = progressIcon;

  setTimeout(() => {
    e.item.querySelector(handleClass).innerHTML = handleIcon;
  }, 1000)
}

export default function(currentElement) {
  Sortable.create(currentElement, {
    handle: handleClass,
    animation: 150,
    onEnd: handleEnd
  })
}