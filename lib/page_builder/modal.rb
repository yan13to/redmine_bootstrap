# frozen_string_literal: true

module PageBuilder
  module Modal
    def page_modal(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'modal'

      build :modal, content, options
    end

    def page_modal_body(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'modal'

      build :body, content, options
    end

    def page_modal_content(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'modal'

      build :content, content, options
    end

    def page_modal_dialog(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'modal'

      build :dialog, content, options
    end

    def page_modal_footer(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'modal'

      build :footer, content, options
    end
    
    def page_modal_header(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'modal'

      build :header, content, options
    end

    def page_modal_title(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = 'modal'

      build :title, content, options
    end
  end
end