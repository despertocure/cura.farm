# frozen_string_literal: true

module SiteSecurityHeaders
  def set_security_headers!
    response.headers['X-Content-Type-Options'] = 'nosniff'
    response.headers['Server'] = 'server'
    response.headers['Referrer-Policy'] = 'same-origin'
    response.headers['Content-Security-Policy'] = "default-src * 'unsafe-inline' 'unsafe-eval'; script-src * 'unsafe-inline' 'unsafe-eval'; connect-src * 'unsafe-inline'; img-src * data: blob: 'unsafe-inline'; frame-src *; style-src * 'unsafe-inline';"
  end
end
