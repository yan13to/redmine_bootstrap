//= require rails-ujs

// require("@rails/ujs").start();
// require("turbolinks").start();
// require("@rails/activestorage").start();
// require("channels");

import '../bootstrap/js/bootstrap.bundle.min.js';

import TabCallback from './callback/tab.js';
import JsProcessor from './callback/js-processor.js';

const loadApp = () => {
  TabCallback();
  JsProcessor();
}

// document.addEventListener('turbolinks:load', loadApp);
document.addEventListener('DOMContentLoaded', loadApp);