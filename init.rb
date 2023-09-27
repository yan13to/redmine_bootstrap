require 'redmine/field_format_patch'
require 'page_builder/form_builder'
require 'page_builder/form_tag_builder'
require 'page_builder/page_builder'
require 'helpers/application_patch_helper'
require 'helpers/pagination_patch_helper'
require 'helpers/projects_patch_helper'
require 'helpers/roles_patch_helper'
require 'helpers/settings_patch_helper'
require 'helpers/sort_patch_helper'
require 'helpers/watchers_patch_helper'
require 'helpers/wiki_patch_helper'
require 'helpers/workflows_patch_helper'
require 'controllers/account_patch_controller'

Redmine::Plugin.register :redmine_bootstrap do
  name 'Bootstrap plugin'
  author 'yan13to'
  description 'Bootstrap theme for Redmine'
  version '0.0.1'
  url 'https://github.com/yan13to/redmine_bootstrap'
  author_url 'https://github.com/yan13to'

  # delete_menu_item :top_menu, :help
end
