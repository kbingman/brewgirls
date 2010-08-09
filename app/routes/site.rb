class Main  
  
  before do 
    
  end
  
  get '/' do
    response['Cache-Control'] = 'max-age=600, public'
    @months = Month.all
    haml :'pages/home'
  end  
  
  get '/index.js' do
    response['Cache-Control'] = 'max-age=600, public'
    @months = Month.all
    haml :'pages/home', :layout => false
  end   
  
  get '/months/:name.:format?' do
    response['Cache-Control'] = 'max-age=600, public'
    @months = Month.all
    @month = Month.find_by_name(params[:name])
    @next_month = @months[@month.id + 1]
    @previous_month = @months[@month.id - 1]
    options = params[:format] == 'js' ? { :layout => false } : {}
    unless @month.nil?
      @page_title = @month.title
      haml :'pages/month', options
    else
      @path = params[:name]
      haml :'pages/404', options 
    end
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
