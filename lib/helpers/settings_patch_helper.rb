# frozen_string_literal: true

module Helpers
  module SettingsPatchHelper
    def options_for_setting_login_required
      options = [[l(:label_login_required_yes), "1"], [l(:label_login_required_no), "0"]]
      options_for_select options, selected: Setting.login_required.to_s
    end

    def options_for_setting_autologin
      options = [[l(:label_disabled), 0]] + [1, 7, 30, 365].collect{|days| [l('datetime.distance_in_words.x_days', count: days), days.to_s]}
      options_for_select options, selected: Setting.autologin.to_s
    end

    def options_for_setting_self_registration
      options = [
        [l(:label_disabled), "0"],
        [l(:label_registration_activation_by_email), "1"],
        [l(:label_registration_manual_activation), "2"],
        [l(:label_registration_automatic_activation), "3"]
      ]
      options_for_select options, selected: Setting.self_registration.to_s
    end

    def options_for_setting_password_max_age
      options = [[l(:label_disabled), 0]] + [7, 30, 60, 90, 180, 365].collect{|days| [l('datetime.distance_in_words.x_days', count: days), days.to_s]}
      options_for_select options, selected: Setting.password_max_age
    end

    def options_for_setting_twofa
      options = [[l(:label_disabled), "0"], [l(:label_optional), "1"], [l(:label_required_lower), "2"]]
      options_for_select options, selected: Setting.twofa.to_s
    end

    def options_for_setting_ui_theme
      options_for_select Redmine::Themes.themes.collect {|t| [t.name, t.id]}, selected: Setting.ui_theme.to_s
    end

    def options_for_setting_start_of_week
      options = [[day_name(1),'1'], [day_name(6),'6'], [day_name(7),'7']]
      options_for_select options, selected: Setting.start_of_week.to_s
    end

    def options_for_setting_date_format
      options_for_select date_format_setting_options(locale), selected: Setting.date_format.to_s
    end

    def options_for_setting_time_format
      options = Setting::TIME_FORMATS.collect {|f| [::I18n.l(Time.now, locale: locale, format: f), f]}
      options_for_select options, selected: Setting.time_format.to_s
    end

    def options_for_setting_timespan_format
      options = [["%.2f" % 0.75, 'decimal'], ['0:45 h', 'minutes']]
      options_for_select options, selected: Setting.timespan_format
    end

    def options_for_setting_gravatar_default
      options_for_select gravatar_default_setting_options, selected: Setting.gravatar_default.to_s
    end

    def options_for_setting_new_item_menu_tab
      options = [[l(:label_none), '0'], [l(:label_new_project_issue_tab_enabled), '1'], [l(:label_new_object_tab_enabled), '2']]
      options_for_select options, selected: Setting.new_item_menu_tab.to_s
    end

    def options_for_setting_protocol
      options = [['HTTP', 'http'], ['HTTPS', 'https']]
      options_for_select options, selected: Setting.protocol.to_s
    end

    def options_for_setting_text_formatting
      options = Redmine::WikiFormatting.formats_for_select
      options_for_select options, selected: Setting.text_formatting.to_s
    end

    def options_for_setting_wiki_compression
      options = [['Gzip', 'gzip']]
      options_for_select options, selected: Setting.wiki_compression.to_s
    end

    def options_for_setting_issue_done_ratio
      options = Issue::DONE_RATIO_OPTIONS.collect {|i| [l("setting_issue_done_ratio_#{i}"), i]}
      options_for_select options, selected: Setting.issue_done_ratio.to_s
    end

    def options_for_setting_mail_handler_preferred_body_part
      options = [[l(:label_preferred_body_part_text), 'plain'], [l(:label_preferred_body_part_html), 'html']]
      options_for_select options, selected: Setting.mail_handler_preferred_body_part.to_s
    end

    def options_for_setting_new_project_user_role_id
      options = Role.find_all_givable.collect {|r| [r.name, r.id.to_s]}
      options_for_select options, selected: Setting.new_project_user_role_id.to_s
    end

    def options_for_setting_commit_logtime_activity_id
      options = [[l(:label_default), 0]] + TimeEntryActivity.shared.active.collect{|activity| [activity.name, activity.id.to_s]}
      options_for_select options, selected: Setting.commit_logtime_activity_id.to_s
    end

    def options_for_setting_commit_update_keywords_if_tracker_id(selected)
      options = [[l(:label_all), ""]] + Tracker.sorted.map {|t| [t.name, t.id.to_s]}
      options_for_select options, selected: selected
    end

    def options_for_setting_commit_update_keywords_status_id(selected)
      options = [["", 0]] + IssueStatus.sorted.collect{|status| [status.name, status.id.to_s]}
      options_for_select options, selected: selected
    end

    def options_for_setting_commit_update_keywords_done_ratio(selected)
      options = [["", ""]] + (0..10).to_a.collect {|r| ["#{r*10} %", "#{r*10}"] }
      options_for_select options, selected: selected
    end

    private

    def locale
      User.current.language.blank? ? ::I18n.locale : User.current.language
    end
  end
end

SettingsHelper.send(:prepend, Helpers::SettingsPatchHelper)