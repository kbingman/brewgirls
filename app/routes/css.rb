class Main    
  
  get '/css/:stylesheet.css' do
    content_type 'text/css', :charset => 'UTF-8'  
    response['Cache-Control'] = 'max-age=600, public'
    sass :"css/#{params[:stylesheet]}"
  end   
  
end
