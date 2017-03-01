$(document).on('turbolinks:load', function() {
  $.each($(':checkbox'), function(k, v) { var label = $('label[for="' + this.id + '"]');
      $(this).insertBefore(label); });

  $('select').material_select();

});
