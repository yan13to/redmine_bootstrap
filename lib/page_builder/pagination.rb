module PageBuilder
  module Pagination
    def page_pagination(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'pagination'

      build :pagination, content, options
    end

    def page_pagination_item(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'pagination'

      build :item, content, options
    end

    def page_pagination_link(name = nil, url = nil, options = nil)
      options ||= {}
      options[:dir] = 'pagination'
      options[:url] = url

      build :link, name, options
    end
  end
end