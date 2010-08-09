class Main  
  
  get '/' do
    response['Cache-Control'] = 'max-age=600, public'
    @months = Month.all
    haml :'pages/home'
  end     
  
  get '/months/:name' do
    response['Cache-Control'] = 'max-age=600, public'
    @month = Month.find_by_name(params[:name])
    @page_title = @month.title
    haml :'pages/month'
  end
  
  # This is a catchall for pages and must come last
  get '*' do
    @path = params[:splat]
    if File.exists? root_path("app/views/pages/#{@path}.haml")
      response['Cache-Control'] = 'max-age=600, public'
      haml :"pages/#{@path}"    
    else  
      haml :'pages/404'   
    end
  end   
  
  error 404 do   
    haml :'pages/404'     
  end
  
end
