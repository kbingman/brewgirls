(function($) {
  
  var main_controller = $.sammy(function() {
	   
	  this.get('#/', function(context) {
	    var url = '/index.js';
	    $.ajax({
        url: url,
        success: function(results){
          Site.load_images(results);
        }
      });
    });
     
    this.get('#/months/:name', function(context) {
      var url = '/months/' + this.params['name'] + '.js';
      $.ajax({
        url: url,
        success: function(results){
          Site.load_images(results);
        }
      });
    });
    
    this.bind('run', function() {
      var context = this;
      Site.sammify_links();
      $('#main img').hide();
    });

  });
  
  $(function() {
    main_controller.run('#/');
  });
  
})(jQuery);