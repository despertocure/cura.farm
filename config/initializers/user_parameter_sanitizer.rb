# frozen_string_literal: true

class UserParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: %i[name email password password_confirmation])
    permit(:account_update, keys: %i[name
                                     email
                                     avatar
                                     bio
                                     password
                                     password_confirmation
                                     current_password])
  end
end
