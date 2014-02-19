
require 'pry'
require 'pry-nav'

class Url < ActiveRecord::Base

  before_create :shorten_url
  validate :validate_url

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
    if self.url == ""
      return errors.add(:url, "You must enter a url into the form!")
    end
    unless self.url.match(/\Ahttps?:\/\//)
      self.url = "http://".concat(self.url)
    end
    binding.pry
    response = Net::HTTP.get_response(URI(self.url))
    binding.pry
    unless 200 <= response.code.to_i && response.code.to_i < 400
      return errors.add(:url, "this is not a valid web address")
    end
  end
end
