# frozen_string_literal: true

module PageBuilder
  module Dropdown
    def page_dropdown(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'dropdown'

      build :dropdown, content, options
    end

    def page_dropdown_button(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'dropdown'

      build :button, content, options
    end

    def page_dropdown_divider(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'dropdown'

      build :divider, content, options
    end

    def page_dropdown_item(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'dropdown'

      build :item, content, options
    end

    def page_dropdown_link(name = nil, options = nil, html_options = nil, &block)
      html_options, options, name = options, name, block if block_given?
      options ||= {}
      html_options ||= {}
      html_options[:dir] = 'dropdown'

      html_options[:url] = url_for(options)

      build :link, name, html_options
    end

    def page_dropdown_menu(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'dropdown'

      build :menu, content, options
    end
  end
end