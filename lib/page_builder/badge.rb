# frozen_string_literal: true

module PageBuilder
  module Badge
    def page_badge(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}

      build :badge, content, options
    end
  end
end