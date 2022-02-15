export default function SettingsMailHandlerApiEnabled(currentElement) {
  currentElement.addEventListener('change', function (e) {
    e.preventDefault();

    if (currentElement.checked) {
      document.getElementById('settings_mail_handler_api_key').removeAttribute('disabled')
    } else {
      document.getElementById('settings_mail_handler_api_key').setAttribute('disabled', 'true')
    }
  })
}