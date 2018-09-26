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
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap

 // 添加 ajax 描述
function add_ajax_desc(class_name, desc_content) {
  content  = '<div class="alert alert-dismissible alert-' + class_name + '"'+ '>';
  content += '<button aria-label="Close" class="close" data-dismiss="alert">×</button>';
  content += desc_content;
  content += '</div>';
  
  $("#flash-location").html(content);
}
