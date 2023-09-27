# frozen_string_literal: true

module PageBuilder
  module Stack
    def page_stack(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}

      build :stack, content, options
    end
  end
end