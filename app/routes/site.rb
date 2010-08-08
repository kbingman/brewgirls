class Main  
  
  get '/' do
    response['Cache-Control'] = 'max-age=600, public'
    @assets = ['01_january', '02_february', '03_march', '04_april', '05_may', '06_june',
              '07_july', '08_august', '09_september', '10_october', '11_november', '12_december']
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
