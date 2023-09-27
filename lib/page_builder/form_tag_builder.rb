# frozen_string_literal: true

module PageBuilder
  module FormTag
    def page_button_tag(content = nil, options = nil, &block)
      options, content = content, capture(&block) if block_given?
      options ||= {}
      options[:dir] = dir_path

      build :button_tag, content, options
    end

    def page_check_box_tag(name, value = "1", checked = false, options = {})
      options[:value] = value
      options[:checked] = checked
      options[:dir] = dir_path

      build :check_box_tag, name, options
    end

    def page_date_field_tag(name, value = nil, options = {})
      options[:content] = value
      options[:dir] = dir_path

      build :date_field_tag, name, options
    end

    def page_form_tag(url_for_options = {}, options = {}, &block)
      content = capture(&block)

      build :form_tag, content, url: url_for_options, options: options, dir: dir_path
    end

    def page_select_tag(name, option_tags = nil, options = {})
      options[:dir] = dir_path
      options[:option_tags] = option_tags

      build :select_tag, name, options
    end

    def page_submit_tag(value = nil, options = {})
      options[:dir] = dir_path

      build :submit_tag, value, options
    end

    def page_text_area_tag(name, content = nil, options = {})
      options[:content] = content
      options[:dir] = dir_path

      build :text_area_tag, name, options
    end

    def page_text_field_tag(name, content = nil, options = {})
      options[:content] = content
      options[:dir] = dir_path

      build :text_field_tag, name, options
    end

    def page_password_field_tag(name, content = nil, options = {})
      options[:content] = content
      options[:dir] = dir_path

      build :password_field_tag, name, options
    end

    def page_radio_button_tag(name, value = "1", checked = false, options = {})
      options[:value] = value
      options[:checked] = checked
      options[:dir] = dir_path

      build :radio_button_tag, name, options
    end

    private

    def dir_path
      'form_tag'
    end
  end
end