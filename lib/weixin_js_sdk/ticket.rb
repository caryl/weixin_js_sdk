module WeixinJsSDK
  class Ticket
    URI_TEMPLATE = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%{access_token}&type=jsapi'.freeze

    def initialize(ps={})
      @access_token = ps[:access_token] || ''
    end

    def fetch
      url = URI_TEMPLATE % {
        access_token: @access_token
      }

      json = Util.get_json(url)

      ticket = json['ticket']
      expires_in = json['expires_in']

      ticket
    end
  end
end
