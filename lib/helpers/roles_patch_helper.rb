# frozen_string_literal: true

module Helpers
  module RolesPatchHelper
    def options_for_role_issues_visibility
      Role::ISSUES_VISIBILITY_OPTIONS.collect {|v| [l(v.last), v.first]}
    end

    def options_for_role_time_entries_visibility
      Role::TIME_ENTRIES_VISIBILITY_OPTIONS.collect {|v| [l(v.last), v.first]}
    end

    def options_for_role_users_visibility
      Role::USERS_VISIBILITY_OPTIONS.collect {|v| [l(v.last), v.first]}
    end
  end
end

RolesHelper.send(:prepend, Helpers::RolesPatchHelper)