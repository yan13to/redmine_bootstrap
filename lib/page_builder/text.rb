module PageBuilder
  module Text
    def page_text(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'text'

      build :text, content, options
    end
  end
end