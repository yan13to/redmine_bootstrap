export default function JsProcessor() {
  const elements = [].slice.call(document.querySelectorAll('[data-bs-processor]'));

  for(const element of elements) {
    const processor = element.getAttribute('data-bs-processor');

    if (!processor) return;

    import('../processor/' + processor + '.js')
      .then(module => module.default(element))
      .catch(error => console.error(error))
  }
}
