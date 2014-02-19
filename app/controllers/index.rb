get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  p params.inspect
  p params[:post].inspect

  # Post.create(params[:post])
  # @url = params[:post][:url]
  # create a new Url
end


get '/:short_url' do
  # redirect to appropriate "long" URL
end
