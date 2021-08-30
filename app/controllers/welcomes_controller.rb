# frozen_string_literal: true

class WelcomesController < ApplicationController
  skip_before_action :authenticate_user!, raise: false

  def show
    @supress_main = true

    return redirect_to site_path if user_signed_in?
  end
end
