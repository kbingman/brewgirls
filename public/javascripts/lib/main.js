(function($) {
  
  var main_controller = $.sammy(function() {
	   
	  this.get('#/', function(context) {
	    var url = '/index.js';
	    $.ajax({
        url: url,
        success: function(results){
          $('#content').html(results);
          Site.sammify_links();
        }
      });
    });
     
    this.get('#/months/:name', function(context) {
      var url = '/months/' + this.params['name'] + '.js';
      $.ajax({
        url: url,
        success: function(results){
          $('#content').html(results);
          Site.sammify_links();
        }
      });
    });
    
    this.bind('run', function() {
      var context = this;
      Site.sammify_links();
    });

  });
  
  $(function() {
    main_controller.run('#');
  });
  
})(jQuery);