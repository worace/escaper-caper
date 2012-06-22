class FlickrJob
  @queue = :flickr

  def self.perform(event_json)
    puts event_json.inspect

  end
end

