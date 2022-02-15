export default function SettingsRepositoriesSysApiEnabled(currentElement) {
  const targetElement = document.getElementById('settings_sys_api_key');

  currentElement.addEventListener('change', function (e) {
    e.preventDefault();

    if (currentElement.checked) {
      targetElement.removeAttribute('disabled')
    } else {
      targetElement.value = '';
      targetElement.setAttribute('disabled', 'true');
    }
  })
}