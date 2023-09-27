# frozen_string_literal: true

module PageBuilder
  module Layout
    def page_container(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'layout'

      build :container, content, options
    end
  end
end