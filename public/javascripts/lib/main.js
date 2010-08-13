(function($) {
  
  var main_controller = $.sammy(function() {
	   
	  this.use(Sammy.Haml, 'haml');
	  var assets = {}
	  
	  this.swap = function(content) {
      $('#main').html(content).find('img').hide();
      $('img').load(function(){
        $(this).fadeIn('slow');
      });
    };
     
	  this.get('#/', function(context) {
	    var data = {};
	    Site.get_keys(assets);
	    data.keys = keys;
	    data.assets = assets;
  	  context.partial('/javascripts/views/thumbnails.haml', data);
    });
     
    this.get('#/months/:name', function(context) {
      // This way it doesn't touch the application, but grabs all the data
      // from the page and uses haml to replace it
      var name = this.params['name'];      
      var data = assets[name];
      context.partial('/javascripts/views/display.haml', data);
      pre_load_images(assets[name].next_path, assets[name].previous_path);
    });
    
    this.bind('run', function(context) {
      $('#main img').hide();
      Site.fill_image_array(assets);
    });

  });
  
  $(function() {
    main_controller.run('#/');
  });
  
})(jQuery);