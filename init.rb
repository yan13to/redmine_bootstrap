require 'bootstrap_form_builder'
require 'helpers/application_patch_helper'
require 'helpers/layout_helper'
require 'helpers/projects_patch_helper'
require 'helpers/roles_patch_helper'
require 'helpers/settings_patch_helper'
require 'controllers/projects_patch_controller'

Redmine::Plugin.register :redmine_bootstrap do
  name 'Bootstrap plugin'
  author 'yan13to'
  description 'Bootstrap theme for Redmine'
  version '0.0.1'
  url 'https://github.com/yan13to/redmine_bootstrap'
  author_url 'https://github.com/yan13to'

  # delete_menu_item :top_menu, :help
end
