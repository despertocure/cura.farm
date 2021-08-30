# frozen_string_literal: true

class UrlShortener
  def self.shorten(long_url)
    return long_url if Rails.env.development?

    client.shorten(long_url: long_url).link
  end

  private_class_method def self.client
    @client ||= Bitly::API::Client.new(token: ENV['BITLY_API'])
  end
end
