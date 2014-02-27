require 'open-uri'
require 'json'
require 'hashie'
require 'wungine/wunder_map'

module Wungine
  class Wunderground
    DEFAULT_OPTIONS = {
      endpoint: "http://api.wunderground.com/api",
      key: "c56aca9323f84996",
      zip: "15108"
    }

    def self.get_conditions_by_zip(opts = {})
      options = DEFAULT_OPTIONS.merge(opts)
      f = open(options[:endpoint] + "/" + options[:key] + "/conditions/q/" + options[:zip] +".json")
      json_string = JSON.parse(f.read)
      raw_mash = Hashie::Mash.new(json_string)
      Wungine::WunderMap.map_raw_weather(raw_mash)
    end
  end
end