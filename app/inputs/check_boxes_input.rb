class CheckBoxesInput < Formtastic::Inputs::CheckBoxesInput
  def check_box_without_hidden_input(choice)
    "#{super(choice)}<i class='input-helper'></i>".html_safe
  end

  def choice_wrapping_html_options(choice)
    super(choice).merge(:class => "checkbox m-b-15")
  end

  def to_html
    super
  end
end
