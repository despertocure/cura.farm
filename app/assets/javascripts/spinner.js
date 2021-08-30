window.startSpinner = function (message) {
  var message = "<p class='w-100 mv1 tc f3'>" + message + "</p>";

  var overlayDiv = "" +
    "<div id='spinnerDiv' class='white fixed bg-black-60 w-100 h-100 top-0 flex flex-column items-center justify-center'>" +
      "<div class='tc w-100'>" +
        "<div class='self-center spinner'><div></div><div></div><div></div><div></div></div></div>" +
        message +
      "</div>" +
    "</div>";

  $('body').append($(overlayDiv));
}

window.stopSpinner = function () {
  $('#spinnerDiv').remove();
}
