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
  @record = Url.where('shortened_url =?', params[:short_url])[0]
  @record.click_count += 1
  @record.save
  redirect to(@record.url)
end
