class RadioInput < Formtastic::Inputs::RadioInput
  def choice_wrapping_html_options(choice)
    super(choice).merge(:class => "radio m-b-15")
  end

  def choice_label(choice)
    return "<i class='input-helper'>#{super(choice)}</i>".html_safe
  end

  def to_html
    super
  end
end
