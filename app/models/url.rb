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
      errors.add(:url, "You must enter a url into the form!")
    unless self.url.match(/\Ahttps?:\/\//)
      self.url = "http://".concat(self.url)
    end
    response = Net::HTTP.get_response(URI(self.url)
    unless response.class == Net::HTTPSuccess || response.class == Net::HTTPOK then
      errors.add(:url, "this is not a valid web address")
    end
  end
end
