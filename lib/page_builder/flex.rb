# frozen_string_literal: true

module PageBuilder
  module Flex
    def page_flex(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'flex'

      build :flex, content, options
    end
  end
end