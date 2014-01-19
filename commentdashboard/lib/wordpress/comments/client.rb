require 'nokogiri'
require 'date'
require 'open-uri'

module Wordpress
  module Comments
    class Client

      def initialize url
        @url = url
      end

      def fetch
        xml = get @url
        parse xml
      end

      def parse xml
        doc = Nokogiri::XML xml
        doc.remove_namespaces!
        doc.search('item').map do |doc_item|
          item = {}
          item[:title] = doc_item.at('title').text
          item[:link]  = doc_item.at('link').text
          item[:commenter]  = doc_item.xpath('creator').text
          item[:description]  = doc_item.at('description').text
          item[:date] = DateTime.parse(doc_item.at('pubDate'))
          item
        end
      end

      private

      # Retrieve the XML comment data for this blog.
      def get url
        open url
      end

    end
  end
end
