var Site = {
  // sammify_links: function(){
  //   $('a.sammy').each(function(){
  //     var path = $(this).attr('href');
  //     $(this).attr('href','#' + path);
  //   });
  // },
  pre_load_images: function() {
    var args_len = arguments.length;
    for (var i = args_len; i--;) {
      var cache_image = document.createElement('img');
      cache_image.src = arguments[i];
      cache.push(cacheImage);
    }
  },
  fill_image_array: function(assets){
    $('.thumbnail').each(function(){
      var asset = $(this)
      var name = asset.attr('id');
      var thumbnail = asset.find('img').attr('src');
      var path = thumbnail.replace('thumbnails','display');
      var title = asset.find('a').attr('title');
      var next = asset.next();
      var next_name = next.attr('id') || '';
      var next_path = next.length > 0 ? next.find('img').attr('src').replace('thumbnails','display') : '';
      var previous = asset.prev();
      var previous_name = previous.attr('id') || '';
      var previous_path = previous.length > 0 ? previous.find('img').attr('src').replace('thumbnails','display') : '';
      assets[name] = { 
        'name' : name, 
        'path' : path, 
        'thumbnail' : thumbnail,
        'title' : title, 
        'next' : next_name, 
        'next_path' : next_path,
        'previous': previous_name,
        'previous_path': next_path
      };
    });
  },
  get_keys: function(assets){
    keys = [];
    for(key in assets) keys.push(key);
  }
}