get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  @url = params[:post][:url]
  Url.create(params[:post])
  # Post.create(params[:post])
  # @url = params[:post][:url]
  # create a new Url
end


get '/:short_url' do
  # redirect to appropriate "long" URL
end
