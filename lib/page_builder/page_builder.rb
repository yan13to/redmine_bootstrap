# frozen_string_literal: true

module PageBuilder
  include Accordion
  include Alert
  include Badge
  include Breadcrumb
  include Card
  include Dropdown
  include Flex
  include FormTag
  include Grid
  include Icon
  include Layout
  include List
  include Modal
  include Navigation
  include Pagination
  include Paragraph
  include Stack
  include Table
  include Text

  def build(name, content = nil, options = nil, &block)
    options, content = content, capture(&block) if block_given?
    options ||= {}
    builder = [page_builder_path, options[:dir], "page_#{name.to_s}"].compact.join('/')
    options.delete(:dir)

    render builder, content: content, options: options
  end

  def page_empty(content = nil, options = nil, &block)
    options, content = content, capture(&block) if block_given?
    options ||= {}

    build :empty, content, options
  end

  def page_heading(name, content = nil, options = nil, &block)
    options, content = content, capture(&block) if block_given?
    options ||= {}
    options[:dir] = 'heading'

    build name, content, options
  end

  def page_label(content = nil, options = nil, &block)
    options, content = content, capture(&block) if block_given?
    options ||= {}

    build :label, content, options
  end

  def page_link_to(name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, block if block_given?
    options ||= {}
    html_options ||= {}

    html_options[:url] = url_for(options)

    build :link_to, name, html_options
  end

  def page_title(label, options = {}, &block)
    content = capture(&block) if block_given?
    options[:label] = label

    build :title, content, options
  end

  def page_toast(content = nil, options = nil, &block)
    options, content = content, capture(&block) if block_given?
    options ||= {}

    build :toast, content, options
  end

  def to_html_options(options = nil)
    options ||= {}
    toggle = options[:toggle]&.to_sym
    toggle = :tooltip if options[:title].present?

    if available_toggles.include?(toggle)
      options['data-bs-toggle'] = toggle
      options.delete :toggle

      if toggle == :collapse
        collapse = options[:collapse] || {}
      end

      if toggle == :tooltip
        tooltip = options[:tooltip] || {}

        if tooltip.present?
          options['data-bs-placement'] = tooltip[:placement] if tooltip[:placement].present?
          options['data-bs-html'] = tooltip[:html] if tooltip[:html].present?
        end

        options.delete :tooltip
      end
    end

    if options[:processor].present?
      options['data-bs-processor'] = options[:processor]
      options.delete :processor
    end

    if options[:target].present?
      options['data-bs-target'] = options[:target]
      options.delete :target
    end

    return options
  end

  private

  def available_toggles
    %I[collapse modal offcanvas popover tab tooltip]
  end

  def page_builder_path
    'page_builder'
  end
end

ApplicationHelper.send(:prepend, PageBuilder)