//= require rails-ujs

// require("@rails/ujs").start();
// require("turbolinks").start();
// require("@rails/activestorage").start();
// require("channels");

import '../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js';
import TabCallback from './callback/tab.js';
import JsProcessor from './callback/js-processor.js';

const loadTooltip = () => {
  const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  tooltipTriggerList.map(function (tooltipTriggerEl) { return new bootstrap.Tooltip(tooltipTriggerEl) })
}

const loadApp = () => {
  TabCallback();
  JsProcessor();
  loadTooltip();
}

// document.addEventListener('turbolinks:load', loadApp);
document.addEventListener('DOMContentLoaded', loadApp);