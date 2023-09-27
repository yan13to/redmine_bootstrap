# frozen_string_literal: true

module Helpers
  module WatchersPatchHelper
    def watcher_link(objects, user)
      return '' unless user && user.logged?

      objects = Array.wrap(objects)
      return '' unless objects.any?

      watched = Watcher.any_watched?(objects, user)
      css = [watcher_css(objects), watched ? 'icon icon-fav' : 'icon icon-fav-off'].join(' ')
      text = watched ? l(:button_unwatch) : l(:button_watch)
      icon = watched ? :watched : :watch
      url = watch_path(
        :object_type => objects.first.class.to_s.underscore,
        :object_id => (objects.size == 1 ? objects.first.id : objects.map(&:id).sort)
      )
      method = watched ? 'delete' : 'post'

      page_link_to text, url, :remote => true, :method => method, :class => css, :icon => icon
    end
  end
end

WatchersHelper.send(:prepend, Helpers::WatchersPatchHelper)