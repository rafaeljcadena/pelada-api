class ColorInput < Formtastic::Inputs::StringInput
  def to_html
    id = self.object_name.to_s.gsub("[", "_").gsub("]", "_") + "_" + self.method.to_s
    name = self.object_name.to_s + "[" + self.method.to_s + "]"
    removal = self.object_name.to_s + "[" + self.method.to_s + "_remove" + "]"
    removal_id = id + "_remove"
    lines = [self.hint_text];
    lines += self.errors
    lines = lines.join("<br/>")

    return ("<div class=\"form-group #{'has-error' if self.errors?}\">" +
              "<li id='#{id}_input' class='cp-container'>" +
                "<label for='#{id}_id' class='fg-label'>#{self.label_text}</label>" +
                "<div class=\"input-group form-control\">" +
                  "<div class=\"fg-line dropdown\">" +
                    "<input type=\"text\" class=\"form-control cp-value\" value=\"#{ self.object.send("#{self.method}?") ? self.object.send("#{self.method}") : "03A9F4" }\" data-toggle=\"dropdown\"  name='#{name}' id='#{id}' />" +
                    "<div class=\"dropdown-menu\">" +
                      "<div class=\"color-picker\" data-cp-default=\"#{ self.object.send("#{self.method}?") ? self.object.send("#{self.method}") : "03A9F4" }\"></div>" +
                    "</div>" +
                    "<i class=\"cp-value\"></i>" +
                  "</div>" +
                "</div>" +
              "</li>" +
              (if self.errors? || self.hint? then "<span class='help-block'>#{lines}</span>" else "" end) +
            "</div>").html_safe
  end
end
