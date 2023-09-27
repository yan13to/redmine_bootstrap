# frozen_string_literal: true

module Helpers
  module WikiPatchHelper
    def wiki_page_breadcrumb(page)
      page_breadcrumb(
        page.ancestors.reverse.collect do |parent|
          {
            content: page_link_to(h(parent.pretty_title), {:controller => 'wiki', :action => 'show', :id => parent.title, :project_id => parent.project, :version => nil})
          }
        end << { content: nil },
        class: 'mb-0'
      )
    end
  end
end

WikiHelper.send(:prepend, Helpers::WikiPatchHelper)