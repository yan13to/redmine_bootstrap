# frozen_string_literal: true

module Helpers
  module SortPatchHelper
    def sort_link(column, caption, default_order)
      css, order = nil, default_order

      if column.to_s == @sort_criteria.first_key
        if @sort_criteria.first_asc?
          css = 'sort asc bi bi-caret-up'
          order = 'desc'
        else
          css = 'sort desc bi bi-caret-down'
          order = 'asc'
        end
      end
      caption = column.to_s.humanize unless caption

      sort_options = {:sort => @sort_criteria.add(column.to_s, order).to_param}
      page_link_to(caption, {:params => request.query_parameters.merge(sort_options)}, :class => css)
    end
  end
end

SortHelper.send(:prepend, Helpers::SortPatchHelper)