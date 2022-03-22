module Helpers
  module LayoutHelper
    def page_card(options={}, &block)
      options[:html_class] = options[:class]
      options[:content] = capture(&block) if block_given?
      builder = options[:builder] || 'builder/page_card'

      render builder, options
    end

    def page_dropdown(title=nil, options={}, &block)
      options[:title] = title
      options[:listing] = capture(&block) if block_given?
      builder = options[:builder] || 'builder/page_dropdown'

      render builder, options
    end

    def page_simple_accordion_button(title=nil, target=nil, options={}, &block)
      options[:title] = title
      options[:target] = target
      options[:content] = capture(&block) if block_given?
      options[:html_class] = options[:class]
      builder = options[:builder] || 'builder/page_simple_accordion_button'

      render builder, options
    end

    def page_table(options={}, &block)
      options[:html_class] = options[:class]
      options[:body] = capture(&block) if block_given?
      builder = options[:builder] || 'builder/page_table'

      render builder, options
    end

    def page_tab(options={})
      builder = options[:builder] || 'builder/page_tab'

      render builder, options
    end

    def page_title(title, options={}, &block)
      options[:title] = title
      options[:actions] = capture(&block) if block_given?
      builder = options[:builder] || 'builder/page_title'

      render builder, options
    end
  end
end

ApplicationHelper.send(:prepend, Helpers::LayoutHelper)