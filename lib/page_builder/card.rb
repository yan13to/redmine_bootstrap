# frozen_string_literal: true

module PageBuilder
  module Card
    def page_card(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'card'

      build :card, content, options
    end

    def page_card_body(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'card'

      build :body, content, options
    end

    def page_card_footer(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'card'

      build :footer, content, options
    end

    def page_card_header(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'card'

      build :header, content, options
    end
  end
end