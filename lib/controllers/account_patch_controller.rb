# frozen_string_literal: true

module Controllers
  module AccountPatchController
    def self.prepended(base) # :nodoc:
      base.class_eval do
        layout 'account'
      end
    end
  end
end

AccountController.send(:prepend, Controllers::AccountPatchController)