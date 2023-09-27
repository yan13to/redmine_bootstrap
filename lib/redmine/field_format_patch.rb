# frozen_string_literal: true

module Redmine
  module FieldFormatPatch
    module StringFormat
      def edit_tag(view, tag_id, tag_name, custom_value, options={})
        view.page_text_field_tag(tag_name, custom_value.value, options.merge(:id => tag_id))
      end

      def bulk_edit_tag(view, tag_id, tag_name, custom_field, objects, value, options={})
        view.page_text_field_tag(tag_name, value, options.merge(:id => tag_id)) +
          bulk_clear_tag(view, tag_id, tag_name, custom_field, value)
      end

      def bulk_clear_tag(view, tag_id, tag_name, custom_field, value)
        if custom_field.is_required?
          ''.html_safe
        else
          view.content_tag(
            'label',
            view.page_check_box_tag(
              tag_name,
              '__none__', (value == '__none__'), :id => nil,
              :data => {:disables => "##{tag_id}"}) + l(:button_clear),
            :class => 'inline'
          )
        end
      end
    end

    module TextFormat
      def edit_tag(view, tag_id, tag_name, custom_value, options={})
        view.page_text_area_tag(tag_name, custom_value.value, options.merge(:id => tag_id, :rows => 8))
      end

      def bulk_edit_tag(view, tag_id, tag_name, custom_field, objects, value, options={})
        view.page_text_area_tag(tag_name, value, options.merge(:id => tag_id, :rows => 8)) +
          '<br />'.html_safe +
          bulk_clear_tag(view, tag_id, tag_name, custom_field, value)
      end
    end
  end
end

Redmine::FieldFormat::TextFormat.send(:prepend, Redmine::FieldFormatPatch::TextFormat)
Redmine::FieldFormat::Base.send(:prepend, Redmine::FieldFormatPatch::StringFormat)