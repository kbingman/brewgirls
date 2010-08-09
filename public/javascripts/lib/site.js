var Site = {
  sammify_links: function(){
    $('a.sammy').each(function(){
      var path = $(this).attr('href');
      $(this).attr('href','#' + path);
    });
  },
  
  load_images: function(results){
    $('#content').html(results).find('img').hide();
    $('img').load(function(){
      $(this).fadeIn('slow');
    });
    Site.sammify_links();
  }
}