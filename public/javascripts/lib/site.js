var Site = {
  sammify_links: function(html,data){
    $('a.sammy').each(function(){
      var path = $(this).attr('href');
      $(this).attr('href','#' + path);
    });
  }
}