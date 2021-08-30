window.onActivate = function (selector, fn) {
  $(document.body).on('keypress', selector, function (e) {
    //Enter key pressed
    if (e.which == 13 || e.which == 32){
      e.preventDefault();
      fn(e);
    }
  });

  $(document.body).on('click', selector, function (e) {
    fn(e);
  });
};
