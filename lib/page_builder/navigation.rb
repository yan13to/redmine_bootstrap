# frozen_string_literal: true

module PageBuilder
  module Navigation
    def page_navbar(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'navigation'

      build :navbar, content, options
    end

    def page_nav(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'navigation'

      build :nav, content, options
    end

    def page_nav_item(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'navigation'

      build :item, content, options
    end

    def page_nav_link(name = nil, url = nil, options = nil)
      options ||= {}
      options[:dir] = 'navigation'
      options[:url] = url

      build :link, name, options
    end

    def page_navs(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'navigation'

      build :navs, content, options
    end
  end
end