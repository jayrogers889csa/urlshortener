get '/' do
  @urls = Url.all.map {|url| url.listify}
  erb :index
end

post '/urls' do
  @url = Url.create(params[:post])
  @urls = Url.all.map {|url| url.listify}
  erb :index
end


get '/:short_url' do
  # redirect to appropriate "long" URL
end
