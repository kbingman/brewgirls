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
  }, 
  fill_image_array: function(assets){
    $('.thumbnail').each(function(){
      var asset = $(this)
      var name = asset.attr('id');
      var thumbnail = asset.find('img').attr('src');
      var path = thumbnail.replace('thumbnails','display');
      var title = asset.find('a').attr('title');
      var next = asset.next().attr('id') || '';
      var previous = asset.prev().attr('id') || '';
      assets[name] = { 
        'name' : name, 
        'path' : path, 
        'thumbnail' : thumbnail,
        'title' : title, 
        'next' : next, 
        'previous': previous };
    });
  },
  get_keys: function(assets){
    keys = [];
    for(key in assets) keys.push(key);
  }
}