export default function SettingsMailHandlerApiEnabled(currentElement) {
  const targetElement = document.getElementById('settings_mail_handler_api_key');

  currentElement.addEventListener('change', function (e) {
    e.preventDefault();

    if (currentElement.checked) {
      targetElement.removeAttribute('disabled');
    } else {
      targetElement.setAttribute('disabled', 'true');
      targetElement.value = '';
    }
  })
}