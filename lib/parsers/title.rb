module Parsers
  class Title
    attr_reader :document

    def self.parse(html)
      new(html).parse_title
    end

    def initialize(html)
      @document = Nokogiri::HTML(html)
    end

    def parse_title
      document.css('title').text
    end
  end
end
