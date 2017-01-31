// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require materialize/extras/nouislider
//= require clipboard
//= require turbolinks
//= require_tree .
$(document).on('turbolinks:load', function() {
  $('.dropdown-button').dropdown();
  $('.button-collapse').sideNav();
  $('select').material_select();
  Waves.displayEffect();
  new Clipboard('.clipboard-btn');

  $('#offer_price, #offer_percentage').on('change', function() {
    var price = parseInt($('#offer_price').val()) || 0;
    var percentage = parseInt($('#offer_percentage').val()) || 0;
    var payableAmount = price/100*percentage;
    console.log(payableAmount)
    $('#payable_amount').html(payableAmount);
  })
})