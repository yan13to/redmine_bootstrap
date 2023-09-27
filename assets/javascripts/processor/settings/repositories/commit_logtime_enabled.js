export default function (currentElement) {
  const targetElement = document.getElementById('settings_commit_logtime_activity_id');

  currentElement.addEventListener('change', function (e) {
    e.preventDefault();

    if (currentElement.checked) {
      targetElement.removeAttribute('disabled')
    } else {
      targetElement.setAttribute('disabled', 'true')
    }
  })
}