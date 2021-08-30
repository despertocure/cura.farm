# frozen_string_literal: true

class TachyonsFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper
  include ActionView::Context
  include React::Rails::ViewHelper

  def input_classes
    'input-reset bg-near-white ba b--black-40 pa2 pa3-l pr5 pr2-l mv1 db w-100 f5 dark-gray border-box lh-title br1'
  end

  def button_submit_classes
    'f5 b link br1 ph4 pv2 pv3-l mv4 dib white pointer lh-copy w-100 white bg-blue hover-bg-dark-blue bb--primary-blue'
  end

  def color_input_classes
    'input-reset bn mt2 mb3 db w-100 f5 dark-gray pa0'
  end

  def label(method, options = {})
    new_options = options.merge('class': 'dib w-100 f5 b normal black-60 mt3')

    super(method, new_options)
  end

  def explanation(_field, text)
    content_tag :p, text.to_s, class: 'w-100 dib mv0 fw1 f6'
  end

  def email_field(method, options = {})
    new_options = options.merge('class': input_classes)

    content_tag :div, class: 'relative' do
      cts(
        super(method, new_options),
        field_icon('envelope')
      )
    end
  end

  def color_field(method, options = {})
    new_options = options.merge('class': color_input_classes, style: 'height: 54px;')

    content_tag :div, class: 'relative' do
      cts(
        super(method, new_options),
        field_icon('tint', 'white')
      )
    end
  end

  def text_field(method, options = {})
    new_options = options.merge('class': input_classes)

    super(method, new_options)
  end

  def number_field(method, options = {})
    new_options = options.merge('class': input_classes)

    super(method, new_options)
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    new_html_options = html_options.merge('class': input_classes)

    super(method, choices, options, new_html_options, &block)
  end

  def collection_select(method,
                        collection,
                        value_method,
                        text_method,
                        options = {},
                        html_options = {})

    new_html_options = html_options.merge('class': input_classes)

    content_tag :div, class: 'relative' do
      cts(
        super(method,
              collection,
              value_method,
              text_method,
              options,
              new_html_options),
        field_icon('caret-down')
      )
    end
  end

  def collection_select_or_text_field(method,
                                      collection,
                                      value_method,
                                      text_method,
                                      options = {},
                                      html_options = {})

    select_component = collection_select(method,
                                         collection,
                                         value_method,
                                         text_method,
                                         options,
                                         html_options)

    select_doc = Nokogiri::HTML.fragment(select_component).children.first
    name = select_doc['name']

    option_values = select_doc.children
                              .select { |c| c.name == 'option' }
                              .map { |e| { value: e['value'], text: e.children.text, selected: e['selected'] } }

    selected_option = select_doc.children
                                .select { |c| c.name == 'option' }
                                .find { |e| e['selected'].present? }

    react_component('SelectOrTextField',
                    value: selected_option&.[]('value'),
                    name: name,
                    newName: "new_#{method}",
                    options: option_values)
  end

  def code_text_area(method, options = {})
    content_tag :div, class: 'relative' do
      cts(
        text_area(method, options.merge(data: { code: true }, onkeydown: 'window.textAreaCodeOnKeyDown(this, event);')),
        field_icon('code')
      )
    end
  end

  def text_area(method, options = {})
    new_options = options.merge('class': input_classes)

    super(method, new_options)
  end

  def toggle_field(method, options = {})
    new_options = options.merge('class': 'toggle')

    content_tag(:div, class: 'w-100 db mt2 mb3') do
      check_box(method, new_options)
    end
  end

  def password_field(method, options = {})
    new_options = options.merge('class': input_classes)

    content_tag :div, class: 'relative' do
      cts(
        super(method, new_options),
        field_icon('key')
      )
    end
  end

  def submit(value = nil, options = {})
    options = options.merge('class': button_submit_classes)

    super(value, options)
  end

  private

  def field_icon(icn, classes = '')
    content_tag(:i, '', class: "fa fa-#{icn} absolute top-0 top-1-l right-1 black-60 f4 mt2 mt0-l #{classes}")
  end

  def cts(*els)
    els.join.html_safe
  end
end

ActionView::Base.default_form_builder = TachyonsFormBuilder
