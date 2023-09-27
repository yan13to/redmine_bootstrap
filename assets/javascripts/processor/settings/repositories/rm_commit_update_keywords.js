export default function btnDelete(currentElement) {
  currentElement.addEventListener('click', function(e) {
    e.preventDefault();

    currentElement.closest('tr').remove();
  })
}