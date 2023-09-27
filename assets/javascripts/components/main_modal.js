export default function mainModal(options={}) {
  let config = {};

  config.centerPosition = options.centerPosition || false;
  config.autoWidth = options.autoWidth || false;
  config.contentCached = options.contentCached || false;
  config.header = options.header;
  config.title = options.title;
  config.body = options.body;

  const modalId = 'mainModal';
  const modalName = 'modal';
  const dialogName = 'modal-dialog';
  const contentName = 'modal-content';
  const headerName = 'modal-header';
  const titleName = 'modal-title';
  const bodyName = 'modal-body';

  const dialogClass = '.'+dialogName;
  const contentClass = '.'+contentName;
  const headerClass = '.'+headerName;
  const titleClass = '.'+titleName;
  const bodyClass = '.'+bodyName;

  const modal = document.getElementById(modalId);
  const dialog = modal.querySelector(dialogClass);
  const content = dialog.querySelector(contentClass);
  const header = content.querySelector(headerClass);
  const title = content.querySelector(titleClass)
  const body = content.querySelector(bodyClass);

  if (config.centerPosition) {
    dialog.classList.add('modal-dialog-centered');
  } else {
    dialog.classList.remove('modal-dialog-centered')
  }

  if (config.autoWidth) {
    content.classList.add('w-auto');
  } else {
    content.classList.remove('w-auto');
  }

  if (config.header) {
    header.classList.remove('d-none')
  } else {
    header.classList.add('d-none')
  }

  if (config.title) {
    title.innerHTML = config.title
  }

  if (config.body) {
    body.innerHTML = config.body
  }

  modal.addEventListener('hidden.bs.modal', function(event) {
    // Reset modal classes to default values
    modal.className = modalName;
    dialog.className = dialogName;
    content.className = contentName;
    header.className = headerName;
    title.className = titleName;
    body.className = bodyName;

    if (!config.contentCached) {
      title.innerHTML = title.getAttribute('data-default');
      body.innerHTML = body.getAttribute('data-default');
    }
  });

  return modal;
}