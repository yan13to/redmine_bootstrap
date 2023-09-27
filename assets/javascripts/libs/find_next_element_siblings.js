export default function findNextElementSiblings(currentElement) {
  let siblings = [];
  let sibling = currentElement.nextSibling;

  while (sibling) {
    siblings.push(sibling);
    sibling = sibling.nextSibling;
  }

  return siblings;
}