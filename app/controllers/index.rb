get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  @url = Url.create(params[:post])
  erb :index
end


get '/:short_url' do
  # redirect to appropriate "long" URL
end
