export default function mainModal(options={}) {
  let config = {};

  config.centerPosition = options.centerPosition || false;
  config.autoWidth = options.autoWidth || false;
  config.contentCached = options.contentCached || false;

  const modalId = 'mainModal';
  const modalName = 'modal';
  const dialogName = 'modal-dialog';
  const contentName = 'modal-content';
  const titleName = 'modal-title';
  const bodyName = 'modal-body';

  const dialogClass = '.'+dialogName;
  const contentClass = '.'+contentName;
  const titleClass = '.'+titleName;
  const bodyClass = '.'+bodyName;

  const modal = document.getElementById(modalId);
  const dialog = modal.querySelector(dialogClass);
  const content = dialog.querySelector(contentClass);
  const title = content.querySelector(titleClass)
  const body = content.querySelector(bodyClass);

  if (config.centerPosition) dialog.classList.add('modal-dialog-centered');
  if (config.autoWidth) content.classList.toggle('w-auto');

  modal.addEventListener('hidden.bs.modal', function(event) {
    // Reset modal classes to default values
    modal.className = modalName;
    dialog.className = dialogName;
    content.className = contentName;
    body.className = bodyName;

    if (!config.contentCached) {
      title.innerHTML = title.getAttribute('data-default');
      body.innerHTML = body.getAttribute('data-default');
    }
  });

  return modal;
}