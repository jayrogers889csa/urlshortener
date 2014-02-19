class Url < ActiveRecord::Base

  validates :url, presence: true,
  before_create :shorten_url

  def shorten_url
    self.shortened_url = rand(99).to_s.concat(('a'..'z').to_a.sample).concat(('a'..'z').to_a.sample).concat(rand(99).to_s).concat(('a'..'z').to_a.sample)
  end

  def to_url
    "http://oursite.#{shortened_url}"
  end

  def listify
    "#{to_url}   (#{url})"
  end

  def validate_url
    unless self.url.match(/\Ahttps?:\/\//)
      self.url = "http://".concat(self.url)

  end
end



=begin
require 'uri'

url.class == String
! url.empty?
URI.parse(url).kind_of?(URI::HTTP) == true

net:http, open: uri , ask server if valid and check if GET return is within 200
=end
