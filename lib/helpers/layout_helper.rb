module Helpers
  module LayoutHelper
    def page_card(options={}, &block)
      options[:html_class] = options[:class]
      options[:content] = capture(&block) if block_given?

      render 'page_card', options
    end

    def page_dropdown(title = nil, options={}, &block)
      options[:title] = title
      options[:listing] = capture(&block) if block_given?

      render 'page_dropdown', options
    end

    def page_table(options={}, &block)
      options[:html_class] = options[:class]
      options[:body] = capture(&block) if block_given?

      render 'page_table', options
    end

    def page_tab(options={})
      render 'page_tab', options
    end

    def page_title(title, options={}, &block)
      options[:title] = title
      options[:actions] = capture(&block) if block_given?

      render 'page_title', options
    end
  end
end

ApplicationHelper.send(:prepend, Helpers::LayoutHelper)