module UsesFaraday
	def build_conn(host)
    raise ArgumentError, 'host is blank, build_conn requires host' if host.blank?

    Faraday.new(
      url: host, 
      request: {timeout: Settings.service_call_timeout}
    ) do |builder|
      builder.request :json
      builder.response :mashify
      builder.response :json, :content_type => /\bjson$/
      builder.response :xml, :content_type => /\bxml$/
      builder.adapter :net_http
    end
  end
end