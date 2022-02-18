# frozen_string_literal: true

module Helpers
  module ApplicationPatchHelper
    def link_to_back
      link_to 'javascript:window.history.back()' do
        content_tag(:i, nil, class: 'bi bi-arrow-left')
      end
    end

    def render_alert(type, message)
      render('alert', type: type, message: message) if message.present?
    end

    def render_flash_messages
      render 'flash_messages'
    end

    def render_project_jump_box
      projects = projects_for_jump_box(User.current)

      render 'project_jump_box', links: render_projects_for_jump_box(projects, selected: @project)
    end

    def render_projects_for_jump_box(projects, selected: nil, query: nil)
      if query.blank?
        jump_box = Redmine::ProjectJumpBox.new User.current
        bookmarked = jump_box.bookmarked_projects
        recents = jump_box.recently_used_projects
        projects_label = :label_project_all
      else
        projects_label = :label_result_plural
      end

      jump = params[:jump].presence || current_menu_item
      s = []

      build_project_link = lambda do |project, level = 0|
        s << { text: project.name, url: project_path(project, jump: jump), selected: (project == selected), level: level }
      end

      [
        [bookmarked, :label_optgroup_bookmarks, true],
        [recents,   :label_optgroup_recents,    false],
        [projects,  projects_label,             true]
      ].each do |projects, label, is_tree|
        next if projects.blank?

        s << { text: l(label), url: nil, selected: false, level: -1 }

        if is_tree
          project_tree(projects, &build_project_link)
        else
          # we do not want to render recently used projects as a tree, but in the
          # order they were used (most recent first)
          projects.each(&build_project_link)
        end
      end

      s

    end

    def options_for_select_to_add_block_in_my_page
      blocks_in_use = @user.pref.my_page_layout.values.flatten

      options = Redmine::MyPage.block_options(blocks_in_use).map do |label, block|
        [label, block, { disabled: block.blank? }]
      end

      options_for_select(options)
    end

    def render_icon(name, options={})
      icon_type = options[:type]

      icon_name = case name
                  when :administration
                    'tools'
                  when :groups
                    'vinyl'
                  when :help
                    'question-circle'
                  when :home
                    'house'
                  when :info
                    'exclamation-triangle'
                  when :my_page
                    'laptop'
                  when :projects
                    'briefcase'
                  when :roles
                    'lock'
                  when :settings
                    'gear'
                  when :users
                    'people'
                  else
                      'bootstrap'
                  end

      icon_class = [icon_name, icon_type].compact.join('-')
      content_tag :i, nil, class: "bi bi-#{icon_class} #{options[:class]}"
    end
  end
end

ApplicationHelper.send(:prepend, Helpers::ApplicationPatchHelper)
ApplicationHelper.send(:prepend, SettingsHelper)