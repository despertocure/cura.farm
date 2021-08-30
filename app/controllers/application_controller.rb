# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SecurityHeaders

  protect_from_forgery with: :exception

  after_action :set_security_headers!
end
