class GrowthForecast
  DEFAULTADDRESS  = "127.0.0.1"
  DEFAULTPORT     = 5125
  class Client
    def initialize(address=nil, port=nil)
      address = DEFAULTADDRESS if address.nil?
      port   = DEFAULTPORT if port.nil?
      @url = sprintf("http://%s:%s/api", address, port.to_s)
    end

    def post(config, data)
      http = HttpRequest.new()
      api_url = sprintf("%s/%s/%s/%s", @url, config[:service], config[:section], config[:graph])
      http.post(api_url, {
        :number => data[:number],
        :color  => data[:color],
        :mode   => data[:mode],
      },{
        'User-Agent' => 'mruby-growthforecast',
        'Content-Type' => 'application/x-www-form-urlencoded',
      })
    end
  end
end
