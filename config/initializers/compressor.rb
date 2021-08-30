# frozen_string_literal: true

require 'htmlcompressor'

Rails.application.configure do
  config.middleware.use Rack::Deflater
  config.middleware.insert_before ActionDispatch::Static, Rack::Deflater

  config.middleware.use HtmlCompressor::Rack,
                        enabled: true,
                        preserve_line_breaks: false,
                        remove_comments: true,
                        remove_form_attributes: false,
                        remove_http_protocol: false,
                        remove_https_protocol: false,
                        remove_input_attributes: true,
                        remove_intertag_spaces: false,
                        remove_javascript_protocol: true,
                        remove_link_attributes: true,
                        remove_multi_spaces: true,
                        remove_quotes: true,
                        remove_script_attributes: true,
                        remove_style_attributes: true,
                        simple_boolean_attributes: true,
                        simple_doctype: false
end
