class Campaign < ActiveRecord::Base
  validates_presence_of :title, :small_image_url, :large_image_url, :tagline, :web_url
  validates_uniqueness_of :title, :web_url

  def self.search(endpoint=INDIEGOGO_ENDPOINT)
    uri = URI.parse(endpoint)
    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)

    campaigns = data['response'].map do |item|
      c = Campaign.new
      c.title = item['title']
      c.small_image_url = item['image_types']['small']
      c.large_image_url = item['image_types']['large']
      c.tagline = item['tagline']
      c.web_url = item['web_url']
      c.save
      c
    end
    campaigns.select(&:persisted?)

  end

end
