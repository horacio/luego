module Parsers
  class Body
    attr_reader :document

    def self.parse(html)
      new(html).parse_body
    end

    def initialize(html)
      @document = Nokogiri::HTML(html)
    end

    def parse_body
      parents = document.css('p').map(&:parent).uniq

      parent = parents.select { |candidate| satisfy_rules?(candidate) }.first

      return '' unless parent

      parent.css('iframe, link, style, script').remove

      parent.inner_html
    end

    private

    def satisfy_rules?(candidate)
      possible_element_tags = Regexp.new('article|section')
      possible_classes_and_ids = Regexp.new('article|content|entry|post|text')

      matches_element = candidate.name =~ possible_element_tags
      matches_classes = candidate.attr('class') =~ possible_classes_and_ids
      matches_ids = candidate.attr('id') =~ possible_classes_and_ids

      matches_element || matches_classes || matches_ids
    end
  end
end
