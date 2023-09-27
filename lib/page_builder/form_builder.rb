# frozen_string_literal: true

# PageFormBuilder
class PageFormBuilder < ActionView::Helpers::FormBuilder
  def page_error_messages(content = nil, options = {}, &block)
    options, content = content, capture(&block) if block_given?
    renderer = options.delete(:renderer) || 'page_builder/alert/page_alert'

    content ||= @object.errors.full_messages.join(', ')

    @template.render renderer, content: content, options: options
  end

  def page_check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
    renderer = options[:renderer] || 'page_builder/form/page_check_box'

    @template.render renderer, f: self, method: method, options: options, checked_value: checked_value, unchecked_value: unchecked_value
  end

  def page_date_field(method, options = {})
    renderer = options[:renderer] || 'page_builder/form/page_date_field'

    @template.render renderer, f: self, method: method, options: options
  end

  def page_hint(method, content = nil, options = {}, &block)
    options, content = content, capture(&block) if block_given?
    renderer = options.delete(:renderer) || 'page_builder/form/page_hint'

    @template.render renderer, f: self, method: method, content: content, options: options
  end

  def page_hours_field(method, options = {})
    renderer = options[:renderer] || 'page_builder/form/page_hours_field'

    @template.render renderer, f: self, method: method, options: options
  end

  def page_feedback(method, type = :invalid, content = nil, options = {})
    type = [:invalid, :valid].include?(type) ? type : :invalid
    renderer = options.delete(:renderer) || "page_builder/form/page_#{type.to_s}_feedback"

    @template.render renderer, f: self, method: method, content: content, options: options
  end

  def page_label(method, content = nil, options = {}, &block)
    options, content = content, capture(&block) if block_given?
    renderer = options.delete(:renderer) || 'page_builder/form/page_label'

    @template.render renderer, f: self, method: method, content: content, options: options
  end

  def page_password_field(method, options = {})
    renderer = options[:renderer] || 'page_builder/form/page_password_field'

    @template.render renderer, f: self, method: method, options: options
  end

  def page_select(method, choices = nil, options = {}, html_options = {}, &block)
    renderer = options[:renderer] || 'page_builder/form/page_select'

    @template.render renderer, f: self, method: method, choices: choices, options: options, html_options: html_options
  end

  def page_text_area(method, options = {})
    renderer = options[:renderer] || 'page_builder/form/page_text_area'

    @template.render renderer, f: self, method: method, options: options
  end

  def page_text_field(method, options = {})
    renderer = options[:renderer] || 'page_builder/form/page_text_field'

    @template.render renderer, f: self, method: method, options: options
  end
end