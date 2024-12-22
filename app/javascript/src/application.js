// app/javascript/src/application.js
//= require rails-ujs

import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import 'channels';

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// Ваш код JavaScript может идти здесь
console.log('Hello from Webpacker');