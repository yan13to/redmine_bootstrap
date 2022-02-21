import mainModal from "../../../components/main_modal.js";
import requestHeaders from "../../../components/request_headers.js";

export default function(currentElement) {
  currentElement.addEventListener('click', function(event) {
    event.preventDefault();

    mainModal({ centerPosition: true, autoWidth: true });
  })

  mainModal().addEventListener('shown.bs.modal', function(event) {
    const title = currentElement.getAttribute('data-modal-title');
    const path = currentElement.getAttribute('data-modal-path');

    const targetTitle = event.target.querySelector('.modal-title');
    const targetBody = event.target.querySelector('.modal-body');

    targetTitle.innerHTML = title;

    fetch(path, requestHeaders)
      .then(data => data.text())
      .then(html => {
        targetBody.innerHTML = html;
    })
  });
}