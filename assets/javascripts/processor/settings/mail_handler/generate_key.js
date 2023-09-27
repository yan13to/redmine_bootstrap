import { randomKey } from "../../../libs/constants.js";

export default function (currentElement) {
  currentElement.addEventListener('click', function(e) {
    e.preventDefault();

    const settings_mail_handler_api_key = document.getElementById('settings_mail_handler_api_key');

    if (!settings_mail_handler_api_key.disabled) {
      settings_mail_handler_api_key.value = randomKey(20);
    } else {
      settings_mail_handler_api_key.value = '';
    }
  })
}