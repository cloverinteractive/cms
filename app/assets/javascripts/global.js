/*
$(function() {
  $.fn.loopedSlider.defaults.addPagination = true;
  $('#slider').loopedSlider({ autoStart: 5000, containerClick: false });
});
*/

// Add images to editor
function add_images()
{
  $("#images_list img").each(function(){
    $(this).click(function(){
      image_operations({ element: this, title: 'Add image', text: 'Would you like to add this image to the page?' })
    });
  });
}

function remove_uploaded()
{
  $("p.fields").each(function() {
      if ( $(this).children("input:first").val() != "" )
        $(this).remove();
  });
}

// Add documents to editor

function add_documents()
{
$("#documents a").each(function(){
  $(this).click(function(){
    document_operations({ element: this, title: 'Add document', text: 'Would you like to add this document to the page?' } );
    return false;
    });
  });
}

// Dialog box functions

function delete_confirmation_dialog( params ) {
  element = '<div id="dialog-confirm" title="' + params.title + '"><p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>';
  element += params.text + '</p></div>';

  $("#main").append(element);

  $(function() {
    // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
    $("#dialog").dialog("destroy");
    $("#dialog-confirm").dialog({
      resizable: false,
      modal: true,
      dialogClass: 'alert',
      buttons: {
        'Delete': function() {
          $(this).dialog('close');
          $(params.element).remove();
          eval(params.onsuccess + '()');
          $(this).remove();
        },
        Cancel: function() {
          $(this).dialog('close');
          $(this).remove();
        }
      }
    });
  });
}

function image_operations( params ) {
  element = '<div id="dialog-pictures" title="' + params.title + '"><p><span class="ui-icon ui-icon-image" style="float:left; margin:0 7px 20px 0;"></span>';
  element += params.text + '</p></div>';
  $("#main").append(element);

  $(function() {
    $("#dialog-pictures").dialog({
      resizable:     false,
      modal:         true,
      dialogClass: 'info',
      buttons: {
        'Add picture to page': function() {
          $(this).dialog('close');
          var img = document.createElement("img");
          var p   = document.createElement(p)
          p.innerHTML = ' ';
          img.src = params.element.src.replace(/small/, 'medium' );
          $("body", $("iframe").contents()).append(img, p);
          $("a[href=#tabs-1]").click();
          $(this).remove();
      },
      Cancel: function() {
        $(this).dialog('close');
        $(this).remove();
        }
      }
    });
  });
}

$(function() {
  $('#tabs').tabs();
  add_images();
});
