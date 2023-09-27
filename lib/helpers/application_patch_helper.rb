# frozen_string_literal: true

module Helpers
  module ApplicationPatchHelper
    def link_to_if_authorized(name, options = {}, html_options = nil, *parameters_for_method_reference)
      if authorize_for(options[:controller] || params[:controller], options[:action])
        page_link_to(name, options, html_options, *parameters_for_method_reference)
      end
    end

    def link_to_back
      link_to 'javascript:window.history.back()' do
        content_tag(:i, nil, class: 'bi bi-arrow-left')
      end
    end

    def link_to_project(project, options={}, html_options = nil)
      if project.archived?
        h(project.name)
      else
        page_link_to project.name,
                     project_url(project, {only_path: true}.merge(options)),
                     html_options || {}
      end
    end

    # Displays a link to user's account page if active
    def link_to_user(user, options={})
      if user.is_a?(User)
        name = h(user.name(options[:format]))
        if user.active? || (User.current.admin? && user.logged?)
          only_path = options[:only_path].nil? ? true : options[:only_path]
          page_link_to name, user_url(user, :only_path => only_path), :class => user.css_classes
        else
          name
        end
      else
        h(user.to_s)
      end
    end

    # Displays a link to edit group page if current user is admin
    # Otherwise display only the group name
    def link_to_group(group, options={})
      if group.is_a?(Group)
        name = h(group.name)
        if User.current.admin?
          only_path = options[:only_path].nil? ? true : options[:only_path]
          page_link_to name, edit_group_path(group, :only_path => only_path)
        else
          name
        end
      end
    end

    # Generates a link to a version
    def link_to_version(version, options = {})
      return '' unless version && version.is_a?(Version)

      options = {:title => format_date(version.effective_date)}.merge(options)
      page_link_to format_version_name(version), version_path(version), options if version.visible?
    end

    # Displays a link to +issue+ with its subject.
    # Examples:
    #
    #   link_to_issue(issue)                        # => Defect #6: This is the subject
    #   link_to_issue(issue, :truncate => 6)        # => Defect #6: This i...
    #   link_to_issue(issue, :subject => false)     # => Defect #6
    #   link_to_issue(issue, :project => true)      # => Foo - Defect #6
    #   link_to_issue(issue, :subject => false, :tracker => false)     # => #6
    #
    def link_to_issue(issue, options={})
      title = nil
      subject = nil
      text = options[:tracker] == false ? "##{issue.id}" : "#{issue.tracker} ##{issue.id}"
      if options[:subject] == false
        title = issue.subject.truncate(60)
      else
        subject = issue.subject
        if truncate_length = options[:truncate]
          subject = subject.truncate(truncate_length)
        end
      end
      only_path = options[:only_path].nil? ? true : options[:only_path]
      s = page_link_to(text, issue_url(issue, :only_path => only_path),
                  :class => issue.css_classes, :title => title)
      s << h(": #{subject}") if subject
      s = h("#{issue.project} - ") + s if options[:project]
      s
    end

    # Generates a link to an attachment.
    # Options:
    # * :text - Link text (default to attachment filename)
    # * :download - Force download (default: false)
    def link_to_attachment(attachment, options={})
      text = options.delete(:text) || attachment.filename
      if options.delete(:download)
        route_method = :download_named_attachment_url
        options[:filename] = attachment.filename
      else
        route_method = :attachment_url
        # make sure we don't have an extraneous :filename in the options
        options.delete(:filename)
      end
      html_options = options.slice!(:only_path, :filename)
      options[:only_path] = true unless options.key?(:only_path)
      url = send(route_method, attachment, options)
      page_link_to text, url, html_options
    end

    def delete_link(url, options={})
      options = {
        :method => :delete,
        :data => {:confirm => l(:text_are_you_sure)},
        :class => 'icon icon-del'
      }.merge(options)

      page_link_to l(:button_delete), url, options
    end

    def time_tag(time)
      text = distance_of_time_in_words(Time.now, time)
      if @project
        page_link_to(text,
                project_activity_path(@project, :from => User.current.time_to_date(time)),
                :title => format_time(time))
      else
        content_tag('abbr', text, :title => format_time(time))
      end
    end

    RECORD_LINK = {
      'CustomValue' => lambda {|custom_value| link_to_record(custom_value.customized)},
      'Document'    => lambda {|document| page_link_to(document.title, document_path(document))},
      'Group'       => lambda {|group|    page_link_to(group.name, group_path(group))},
      'Issue'       => lambda {|issue|    link_to_issue(issue, :subject => false)},
      'Message'     => lambda {|message|  link_to_message(message)},
      'News'        => lambda {|news|     page_link_to(news.title, news_path(news))},
      'Project'     => lambda {|project|  link_to_project(project)},
      'User'        => lambda {|user|     link_to_user(user)},
      'Version'     => lambda {|version|  link_to_version(version)},
      'WikiPage'    =>
        lambda do |wiki_page|
          page_link_to(
            wiki_page.pretty_title,
            project_wiki_page_path(wiki_page.project, wiki_page.title)
          )
        end
    }

    def link_to_record(record)
      if link = RECORD_LINK[record.class.name]
        self.instance_exec(record, &link)
      end
    end

    ATTACHMENT_CONTAINER_LINK = {
      # Custom list, since project/version attachments are listed in the files
      # view and not in the project/milestone view
      'Project' =>
        lambda {|project| page_link_to(l(:project_module_files), project_files_path(project))},
      'Version' =>
        lambda {|version| page_link_to(l(:project_module_files), project_files_path(version.project))},
    }

    def link_to_attachment_container(attachment_container)
      if link = ATTACHMENT_CONTAINER_LINK[attachment_container.class.name] ||
                RECORD_LINK[attachment_container.class.name]
        self.instance_exec(attachment_container, &link)
      end
    end

    def labelled_form_for(*args, &proc)
      args << {} unless args.last.is_a?(Hash)
      options = args.last
      if args.first.is_a?(Symbol)
        options[:as] = args.shift
      end
      options[:builder] = PageFormBuilder
      form_for(*args, &proc)
    end

    def labelled_fields_for(*args, &proc)
      args << {} unless args.last.is_a?(Hash)
      options = args.last
      options[:builder] = PageFormBuilder
      fields_for(*args, &proc)
    end

    def reorder_handle(object, options={})
      data = {
        :reorder_url => options[:url] || url_for(object),
        :reorder_param => options[:param] || object.class.name.underscore
      }
      page_link_to nil, '#', class: 'bi bi-arrows-expand', data: data, title: l(:button_sort), mode: :button
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

    def page_header_title
      if @project.nil? || @project.new_record?
        content_tag(:h1, h(Setting.app_title))
      else
        b = []
        items = (@project.root? ? [] : @project.ancestors.visible.to_a).map{|p| {content: link_to_project(p, { jump: current_menu_item })}}
        items << {content: ''}
        b << page_breadcrumb(items, class: 'mb-0')
        b << content_tag(:h1, h(@project))
        safe_join b.compact
      end
    end

    # Returns a h2 tag and sets the html title with the given arguments
    def title(*args)
      strings = args.map do |arg|
        if arg.is_a?(Array) && arg.size >= 2
          page_link_to(*arg)
        else
          h(arg.to_s)
        end
      end
      html_title args.reverse.map {|s| (s.is_a?(Array) ? s.first : s).to_s}
      page_heading(:h2, strings.join(' &#187; ').html_safe)
    end

    def options_for_select_to_add_block_in_my_page
      blocks_in_use = @user.pref.my_page_layout.values.flatten

      options = Redmine::MyPage.block_options(blocks_in_use).map do |label, block|
        [label, block, { disabled: block.blank? }]
      end

      options_for_select(options)
    end

    def export_csv_encoding_select_tag
      return if l(:general_csv_encoding).casecmp('UTF-8') == 0

      options = [l(:general_csv_encoding), 'UTF-8']
      page_paragraph do
        page_select_tag 'encoding', options_for_select(options, l(:general_csv_encoding)), label: l(:label_encoding)
      end
    end

    def other_formats_links(&block)
      yield Redmine::Views::OtherFormatsBuilder.new(self)
    end
  end
end

ApplicationHelper.send(:prepend, Helpers::ApplicationPatchHelper)
ApplicationHelper.send(:prepend, SettingsHelper)