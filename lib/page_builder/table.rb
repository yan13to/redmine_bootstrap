# frozen_string_literal: true

module PageBuilder
  module Table
    def page_table(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'table'

      build :table, content, options
    end

    def page_table_tbody(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'table'

      build :tbody, content, options
    end

    def page_table_td(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'table'

      build :td, content, options
    end

    def page_table_tfoot(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'table'

      build :tfoot, content, options
    end

    def page_table_th(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'table'

      build :th, content, options
    end

    def page_table_thead(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'table'

      build :thead, content, options
    end

    def page_table_tr(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'table'

      build :tr, content, options
    end
  end
end