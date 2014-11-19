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
      content = find_most_valuable_text_chunk

      sanitize_markup(content)
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

    def find_most_valuable_text_chunk
      parents = document.css('p').map(&:parent).uniq

      qualified_chunks = parents.select do |candidate|
        satisfy_rules?(candidate)
      end

      qualified_chunks.first
    end

    def sanitize_markup(content)
      return '' if content.blank?

      content.css('iframe, link, style, script').remove
      content.xpath('//@class').remove

      content.inner_html
    end
  end
end
