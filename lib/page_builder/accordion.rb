# frozen_string_literal: true

module PageBuilder
  module Accordion
    def page_accordion(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'accordion'

      build :accordion, content, options
    end

    def page_accordion_body(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'accordion'

      build :body, content, options
    end

    def page_accordion_button(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'accordion'

      build :button, content, options
    end

    def page_accordion_header(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'accordion'

      build :header, content, options
    end

    def page_accordion_item(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'accordion'

      build :item, content, options
    end
  end
end