module PickerCache
  CAT_KEY = "parent_category:id"

  def self.cat_id(escape_key)
    client.hget(escape_key, CAT_KEY)
  end

  def self.set_cat_id(escape_key, pc_id)
    client.hset(escape_key, CAT_KEY, pc_id)
  end

  def self.clear_keys
    client.del(*client.keys) if client.keys.any?
  end

  def self.client
    redis ||= Redis.new
    @client ||= Redis::Namespace.new(:escapes, :redis => redis)
  end
end
