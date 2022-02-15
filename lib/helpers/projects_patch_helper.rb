# frozen_string_literal: true

module Helpers
  module ProjectsPatchHelper
    # Renders the projects index
    def render_project_hierarchy(projects)
      bookmarked_project_ids = User.current.bookmarked_project_ids

      render_project_nested_lists(projects) do |project|
        classes = project.css_classes.split
        classes += %w(icon icon-user my-project) if User.current.member_of?(project)
        classes += %w(icon icon-bookmarked-project) if bookmarked_project_ids.include?(project.id)

        s = link_to_project(project, {}, class: classes.uniq.join(' '))
        if project.description.present?
          s << content_tag('div', textilizable(project.short_description, project: project), class: 'wiki description')
        end
        s
      end
    end

    def parent_project_select_tag(project)
      selected = project.parent
      # retrieve the requested parent project
      parent_id = (params[:project] && params[:project][:parent_id]) || params[:parent_id]

      if parent_id
        selected = (parent_id.blank? ? nil : Project.find(parent_id))
      end

      options = +''
      options << "<option value=''>&nbsp;</option>" if project.allowed_parents.include?(nil)
      options << project_tree_options_for_select(project.allowed_parents.compact, selected: selected)
      content_tag('select', options.html_safe, name: 'project[parent_id]', id: 'project_parent_id', class: 'form-select')
    end

    def bookmark_link(project, user = User.current)
      return '' unless user && user.logged?

      @jump_box ||= Redmine::ProjectJumpBox.new user
      bookmarked = @jump_box.bookmark?(project)
      css = +"icon bookmarking btn btn-primary "

      if bookmarked
        css << "icon-bookmark"
        method = "delete"
        text = l(:button_project_bookmark_delete)
      else
        css << "icon-bookmark-off"
        method = "post"
        text = l(:button_project_bookmark)
      end

      render 'bookmark_link', project: project, text: text, method: method, class: css
    end
  end
end

ProjectsHelper.send(:prepend, Helpers::ProjectsPatchHelper)