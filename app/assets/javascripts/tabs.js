window.addAppScript(function () {
  var initializeTabs = function (tabs) {

    var select = function (ev) {
      var cel = $(ev.currentTarget);

      $(tabs).find('.tab-button').removeClass('tab-button-selected');
      cel.addClass('tab-button-selected');

      $(tabs).find('.tab-panel').each(function (i, tp) {
        var tpEl = $(tp);
        if (tpEl.data('index') == cel.data('index')) {
          tpEl.show();
        } else {
          tpEl.hide();
        }
      });
    }

    $(tabs).find('.tab-button').each(function (i, e) {
      var el = $(e);
      el.data('index', i);
      el.attr('focusable', true);
      el.attr('tabindex', 0);

      el.on('click', select);
      el.on('keydown', function(ev) {
        if (ev.which === 13 || ev.which === 32 ) {
          event.preventDefault();
          select(ev);
        }
      });

      if (i == 0) {
        el.addClass('tab-button-selected');
      }
    });

    $(tabs).find('.tab-panel').each(function (i, e) {
      var el = $(e);
      el.data('index', i);

      if (i > 0) {
        el.hide();
      }
    });
  }

  $('[data-component="tabs"]').each(function (i, e) {
    initializeTabs(e);
  });
});
