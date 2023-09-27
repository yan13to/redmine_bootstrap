# frozen_string_literal: true

module PageBuilder
  module Grid
    def page_row(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'grid'

      build :row, content, options
    end

    def page_col(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'grid'

      build :col, content, options
    end
  end
end