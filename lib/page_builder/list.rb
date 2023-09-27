# frozen_string_literal: true

module PageBuilder
  module List
    def page_list(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'list'

      build :list, content, options
    end

    def page_list_item(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'list'

      build :item, content, options
    end

    def page_list_link(name = nil, options = nil, html_options = nil, &block)
      html_options, options, name = options, name, block if block_given?
      options ||= {}

      html_options = convert_options_to_data_attributes(options, html_options)

      url = url_for(options)
      html_options["href".freeze] ||= url
      html_options[:dir] = 'list'

      build :link, (name || url), html_options
    end
  end
end