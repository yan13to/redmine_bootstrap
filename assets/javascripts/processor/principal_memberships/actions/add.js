import mainModal from "../../../components/main_modal.js";

export default function(currentElement) {
  currentElement.addEventListener('click', function(event) {
    event.preventDefault();

    mainModal({ centerPosition: true, autoWidth: true });
  })

  mainModal().addEventListener('shown.bs.modal', function(event) {
    const content = currentElement.getAttribute('data-modal-body');
    const target = event.target.querySelector('.modal-body');

    console.log(content);

    target.innerHTML = content;
  });
}