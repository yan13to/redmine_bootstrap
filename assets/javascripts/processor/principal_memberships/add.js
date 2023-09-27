import mainModal from "../../../components/main_modal.js";
import requestHeaders from "../../../components/request_headers.js";
import toggleCheckbox from "./toggle_checkbox.js";

export default function(currentElement) {
  currentElement.addEventListener('click', function(event) {
    event.preventDefault();

    mainModal({ centerPosition: true, autoWidth: true, header: false });
  })

  mainModal().addEventListener('shown.bs.modal', function(event) {
    const title = currentElement.getAttribute('data-modal-title');
    const path = currentElement.getAttribute('data-modal-path');

    fetch(path, requestHeaders)
      .then(data => data.text())
      .then(html => {
        const modal = mainModal({ centerPosition: true, autoWidth: true, header: true, title: title, body: html });

        for(const selector of modal.querySelectorAll('.check-all')) {
          toggleCheckbox(selector)
        }
      })
  });
}