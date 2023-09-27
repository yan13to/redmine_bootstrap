module PageBuilder
  module Paragraph
    def page_paragraph(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}

      build :paragraph, content, options
    end
  end
end