class FileInput < Formtastic::Inputs::FileInput
  def to_html
    id = self.object_name.to_s + "_" + self.method.to_s
    name = self.object_name.to_s + "[" + self.method.to_s + "]"
    lines = [self.hint_text];
    lines += self.errors
    lines = lines.join("<br/>")

    return ("<div class='form-group #{'has-error' if self.errors?}'>" +
              "<li class='' id='#{id}_input'>" +
                "<label for='#{id}_id' class='fg-label'>#{self.label_text}</label>" +
                "<div class='fileinput fileinput-new' data-provides='fileinput' style='display: block;'>" +
                  "<span class='btn btn-info btn-sm btn-file waves-effect'>" +
                      "<span class='fileinput-new'>Selecione o arquivo</span>" +
                      "<span class='fileinput-exists'>Mudar</span>" +
                      "<input type='hidden' value='' name='#{name}''><input type='file' name='#{name}' id='#{id}'>" +
                  "</span>&nbsp;" +
                  "<a href='#' class='btn btn-danger btn-sm fileinput-exists waves-effect' data-dismiss='fileinput'>Remover</a>&nbsp;" +
                  "<span class='fileinput-filename'></span>" +
                "</div>" +
              "</li>" +
              (if self.errors? || self.hint? then "<span class='help-block'>#{lines}</span>" else "" end) +
            "</div>").html_safe
  end
end
