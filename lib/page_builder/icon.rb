# frozen_string_literal: true

module PageBuilder
  module Icon
    def page_icon(name = nil, options = {})
      build :icon, icon_name(name), options
    end

    def icon_name(name)
      icon_name = case name.to_s
                  when 'administration'
                    'tools'
                  when 'attachment'
                    'paperclip'
                  when 'boards'
                    'clipboard'
                  when 'copy'
                    'clipboard2'
                  when 'custom_fields'
                    'snow'
                  when 'delete'
                    'trash'
                  when 'documents'
                    'file-word'
                  when 'edit'
                    'pencil'
                  when 'enumerations'
                    'collection'
                  when 'gantt'
                    'pie-chart'
                  when 'groups'
                    'vinyl'
                  when 'help'
                    'question-circle'
                  when 'home'
                    'house'
                  when 'import'
                    'box-arrow-right'
                  when 'info'
                    'exclamation-triangle'
                  when 'issue'
                    'book'
                  when 'issue-closed'
                    'book-fill'
                  when 'issues'
                    'book'
                  when 'issue_statuses'
                    'flower2'
                  when 'ldap_authentication'
                    'key'
                  when 'my_page'
                    'laptop'
                  when 'new'
                    'plus'
                  when 'news'
                    'newspaper'
                  when 'overview'
                    'card-heading'
                  when 'plugins'
                    'plugin'
                  when 'projects'
                    'briefcase'
                  when 'roadmap'
                    'box'
                  when 'roles'
                    'lock'
                  when 'settings'
                    'gear'
                  when 'time-entry'
                    'clock'
                  when 'time_entries'
                    'clock'
                  when 'trackers'
                    'ticket-detailed'
                  when 'users'
                    'people'
                  when 'watch'
                    'tv'
                  when 'watched'
                    'tv-fill'
                  when 'wiki'
                    'file-post'
                  when 'wiki-page'
                    'file-post'
                  when 'workflows'
                    'infinity'
                  else
                    name
                  end
      icon_name
    end
  end
end