export default function targetElement(currentElement) {
  const target = currentElement.getAttribute('data-bs-target');

  return document.querySelectorAll(target);
}