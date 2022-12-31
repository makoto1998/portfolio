// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require bootstrap-sprockets
//= require jquery_ujs
// 追加分

// = require jquery3
// = require popper
// = require bootstrap
// 上の三つ後bootstrap入れてから追記した

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// Bootstrap
//= require bootstrap-sprockets

import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"
import "bootstrap";
import "../stylesheets/application.scss";
