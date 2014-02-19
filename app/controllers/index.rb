get '/' do
  @urls = Url.all.map {|url| "#{url.shortened_url}  (#{url.url})"}

  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  @url = Url.create(params[:post])
  @urls = Url.all.map {|url| "#{url.shortened_url}  (#{url.url})"}
  erb :index
end


get '/:short_url' do
  # redirect to appropriate "long" URL
end
