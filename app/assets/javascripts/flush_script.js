var startFn = function() {
  if (typeof(window.init) !== 'undefined') {
    for (var i = 0 ; i < window.init.length ; i++) {
      window.init[i]()
    }
  }
};

if (Turbolinks.supported) {
  $(document).on('turbolinks:load', startFn);
} else {
  $(document).ready(startFn);
}
