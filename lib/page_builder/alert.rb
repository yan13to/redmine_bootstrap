# frozen_string_literal: true

module PageBuilder
  module Alert
    def page_alert(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'alert'

      build :alert, content, options
    end

    def page_alert_button(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'alert'

      build :button, content, options
    end

    def page_alert_container(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'alert'

      build :container, content, options
    end

    def page_alert_heading(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'alert'

      build :heading, content, options
    end

    def page_alert_icon(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'alert'

      build :icon, content, options
    end
  end
end