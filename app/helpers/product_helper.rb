# frozen_string_literal: true

module ProductHelper
  PRODUCT_IMAGE_PLACEHOLDER = 'https://res.cloudinary.com/htevdpdtw/image/upload/c_scale,h_197/v1523891286/no-image-place-holder.png'

  def product_image(image, html_options = {}, cl_options = {})
    img_src = product_image_url(image, cl_options)

    content_tag(:img, '', html_options.merge(src: img_src))
  end

  def product_image_url(image, cl_options = {})
    if image.present?
      Cloudinary::Utils.cloudinary_url(image, cl_options.merge(secure: true))
    else
      PRODUCT_IMAGE_PLACEHOLDER
    end
  end

  def product_availability(product)
    'Produto feito sob encomenda' if product.on_request?
  end

  def product_price(product)
    if product.price_on_request?
      'Preço sob consulta'
    else
      number_to_currency(product.price, unit: 'R$ ', separator: ',', delimiter: '.')
    end
  end

  def present_form_field?(product_type, field)
    yield if product_type.show_field?(field)
  end

  def present_form_sections?(_product_type, _fields)
    # if fields.any? { |field| product_type.show_field?(field) }

    yield
  end
end
