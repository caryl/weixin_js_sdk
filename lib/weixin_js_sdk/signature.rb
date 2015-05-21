require 'digest/sha1'

module WeixinJsSDK
  class Signature
    TEMPLATE = 'jsapi_ticket=%{jsapi_ticket}&noncestr=%{nonce_str}&timestamp=%{timestamp}&url=%{url}'.freeze

    def initialize(ps={})
      @ticket = ps[:ticket] || ''
      @nonce_str = ps[:nonce_str] || ''
      @timestamp = ps[:timestamp] || ''
      @url = ps[:url] || ''
    end

    def sign
      str = TEMPLATE % {
        jsapi_ticket: @ticket,
        nonce_str: @nonce_str,
        timestamp: @timestamp,
        url: @url
      }

      Digest::SHA1.hexdigest(str)
    end
  end
end
