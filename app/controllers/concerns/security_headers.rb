# frozen_string_literal: true

module SecurityHeaders
  SCRIPT_SRC = %w[
    js-agent.newrelic.com
    *.google-analytics.com
    *.google.com
    *.googleapis.com
    bam.nr-data.net
    connect.facebook.net
  ].join(' ')

  CSP = "script-src #{SCRIPT_SRC} 'self' 'unsafe-inline' 'unsafe-eval' data:;"

  def set_security_headers!
    response.headers['X-Content-Type-Options'] = 'nosniff'
    response.headers['Server'] = 'server'
    response.headers['Referrer-Policy'] = 'same-origin'
    response.headers['Content-Security-Policy'] = CSP
  end
end
