export default function SettingsRepositoriesCommitUpdateKeywords(currentElement) {
  currentElement.addEventListener('click', function(e) {
    e.preventDefault();

    currentElement.closest('tr')
      .previousElementSibling
      .insertAdjacentHTML('afterend', currentElement.getAttribute('data-record')); 
  });

  const callback = function(mutationsList) {
    for(const mutation of mutationsList) {
      if (mutation.type == 'childList') {
        const addedNodes = mutation.addedNodes;
        const addedElement = addedNodes[addedNodes.length - 1];

        if (addedElement) {
          const btnRemove = addedElement.querySelector('.btn-remove');

          btnRemove.addEventListener('click', function(e) {
            e.preventDefault();

            btnRemove.closest('tr').remove()
          })
        }
      }
    }
  };

  const targetNode = currentElement.closest('table');
  const config = { attributes: true, childList: true, subtree: true };
  const observer = new MutationObserver(callback);
  observer.observe(targetNode, config);
}
