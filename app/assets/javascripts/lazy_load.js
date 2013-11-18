$(document).ready(function(){

 var $window = $(window),
    run = true,
    event_name = 'lazy-load:fetch',
    lazy_load_attribute = 'data-lazy-load',
    lazy_load_selector = '['+lazy_load_attribute+']',
    lazy_loading_attribute = 'data-lazy-loading',
    lazy_loading_attribute_value = 'loading';

  var loadLazy = function(e){
    var $this = $(this),
      url = $this.attr(lazy_load_attribute);

    var success = function(data) {
      $this.html(data);
      $this.removeAttr(lazy_load_attribute);
      $('.carousel').tinycarousel({ display: 2 });
    };

    var complete = function() {
      $this.removeAttr(lazy_loading_attribute);
    };

    $this.attr(lazy_loading_attribute,lazy_loading_attribute_value);

    // delay lazy loading each partial for a moment to avoid starving out other resource loading.
    window.setTimeout( function(){
      $.ajax(url,{
        success:success,
        complete:complete
      });
    }, 10 );

  };

  $('body').on(event_name,lazy_load_selector, loadLazy);

  $(lazy_load_selector).each(function(){
    var $this = $(this);
    $this.trigger(event_name);
  });

});