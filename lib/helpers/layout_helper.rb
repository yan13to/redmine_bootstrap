module Helpers
  module LayoutHelper
    def page_title(title, options = {}, &block)
      options[:title] = title
      options[:actions] = capture(&block) if block_given?

      render 'page_title', options
    end
  end
end

ApplicationHelper.send(:prepend, Helpers::LayoutHelper)