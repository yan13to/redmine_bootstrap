# frozen_string_literal: true

module PageBuilder
  module Breadcrumb
    def page_breadcrumb(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}

      build :breadcrumb, content, options
    end
  end
end