// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function mostFollowers() {
  $('.answer').one('click', function(event){
    event.preventDefault();
    if ($(this).attr('id') > $(this).siblings('.answer').attr('id')){
      alert('you win!');
    }
    else {
      alert('sorry, you lose!');
    }
    showFollowers();
  });
}

function showFollowers() {
  $('.answer').each(function(){
    $(this).append( ' has ' + $(this).attr('id') + ' followers');
  });
}