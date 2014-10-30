//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require rails-timeago
//= require highcharts
//= require highcharts/highcharts-more
//= require highcharts/modules/data
//= require highcharts/modules/exporting
//= require locales/jquery.timeago.de.js
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
//= require_tree .

NProgress.configure({
  showSpinner: true,
  ease: 'ease',
  speed: 500
});

$(document).on('page:fetch',   function() { NProgress.start();  });
$(document).on('page:change',  function() { NProgress.done();  });
$(document).on('page:restore', function() { NProgress.remove();  });
