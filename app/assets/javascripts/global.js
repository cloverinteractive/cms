$(function() {
  $.fn.loopedSlider.defaults.addPagination = true;
  $('#slider').loopedSlider({ autoStart: 5000, containerClick: false });

  if ( $("#wmd-input").length > 0 ) {
    var converter = Markdown.getSanitizingConverter();
    var editor    = new Markdown.Editor( converter );

    Markdown.Extra.init( converter );
    editor.run();
  }
});

