class Main  
  
  get '/' do
    response['Cache-Control'] = 'max-age=600, public'
    haml :'pages/home'
  end     
  
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
