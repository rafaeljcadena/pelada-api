class SelectInput < Formtastic::Inputs::SelectInput

  def to_html
    if self.errors? || self.hint?

      lines = [self.hint_text];
      lines += self.errors
      lines = lines.join("<br/>")
      lines = lines.byteslice(5,lines.length)

      return "<div class='form-group #{'has-error' if self.errors?}'>#{super}<span class='help-block'>#{lines}</span></div>".html_safe
    else
      return "<div class='form-group'>#{super}</div>".html_safe
    end
  end

  def hint_html
    ""
  end

  def error_html
    ""
  end

  def input_html_options
    super.merge(:class => "#{super[:class]} #{super["class"]} form-control fg-input")
  end

  def wrapper_html_options
    super.merge(:class => "fg-line #{self.object && self.object.send(self.method) ? 'fg-toggled-manual' : ''}")
  end

  def label_html_options
    super.merge(:class => "fg-label")
  end
end
