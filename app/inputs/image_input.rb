class ImageInput < Formtastic::Inputs::FileInput
  def to_html
    id = self.object_name.to_s.gsub("[", "_").gsub("]", "_") + "_" + self.method.to_s
    name = self.object_name.to_s + "[" + self.method.to_s + "]"
    removal = self.object_name.to_s + "[" + self.method.to_s + "_remove" + "]"
    removal_id = id + "_remove"
    lines = [self.hint_text];
    lines += self.errors
    lines = lines.join("<br/>")

    return ("<div class='form-group #{'has-error' if self.errors?}'>" +
              "<li class='' id='#{id}_input'>" +
                "<label for='#{id}_id' class='fg-label'>#{self.label_text}</label>" +
                "<div class='fileinput #{self.object.send("#{self.method}?") ? "fileinput-exists" : "fileinput-new"}' data-provides='fileinput' style='display: block;'>" +
                  "<div class='fileinput-preview thumbnail' data-trigger='fileinput' style='line-height: 150px; height: 150px;'>" +
                  (self.object.send("#{self.method}?") ? "<img src='#{self.object.send("#{self.method}").url(:thumb)}'/>" : "") +
                  "</div><br/>" +
                  "<span class='btn btn-info btn-sm btn-file waves-effect'>" +
                      "<span class='fileinput-new'>Selecione a imagem</span>" +
                      "<span class='fileinput-exists'>Mudar</span>" +
                      "<input type='hidden' value='' name='#{name}''><input onchange='if (this.value != \"\") { $(\"##{id}_remove\").val(0) }' type='file' name='#{name}' id='#{id}'>" +
                  "</span>&nbsp;" +
                  "<a href='#' onclick='$(\"##{removal_id}\").val(1)' class='btn btn-danger btn-sm fileinput-exists waves-effect' data-dismiss='fileinput'>Remover</a>&nbsp;" +
                  "<span class='fileinput-filename'></span>" +
                  "<input type='hidden' name='#{removal}' id='#{removal_id}' value='0'/>" +
                "</div>" +
              "</li>" +
              (if self.errors? || self.hint? then "<span class='help-block'>#{lines}</span>" else "" end) +
            "</div>").html_safe
  end
end
