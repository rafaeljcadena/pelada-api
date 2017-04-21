class BooleanInput < Formtastic::Inputs::BooleanInput

  def to_html
    super
  end

  def check_box_html
    "#{super}<i class='input-helper'></i>".html_safe
  end

  def wrapper_html_options
    super.merge(:class => "checkbox m-b-15")
  end
end
