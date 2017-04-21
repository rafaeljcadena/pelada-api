class DropzoneInput < Formtastic::Inputs::StringInput

  def to_html
    id = self.object_name.to_s.gsub("[", "_").gsub("]", "_") + "_" + self.method.to_s
    name = self.object_name.to_s + "[" + self.method.to_s + "]"
    url = self.options[:dz_url].blank? ? "/" : self.options[:dz_url]
    lines = [self.hint_text];
    lines += self.errors
    lines = lines.join("<br/>")
    return "
<script language=\"javascript\">
var #{id};
$(function () {
  #{id} = new Dropzone(\"div##{id}\", {
    url: \"#{url}\",
    method: \"patch\",
    paramName: \"#{name}\",
    maxFiles: 1
  }).on(\"addedfile\", function(file) {
    $('##{id}').find('img.existing_preview').remove();
    prevent_leave.push('#{id}');
    if (typeof upload_started == 'function') {
      upload_started();
    }
  }).on(\"maxfilesexceeded\", function(file) {
    if (this.getUploadingFiles().length == 0) {
      this.removeAllFiles();
      this.addFile(file);
    }
  }).on('complete', function(file) {
    var index = prevent_leave.indexOf('#{id}');
    if (index > -1) {
      prevent_leave.splice(index, 1);
    }
    this.removeAllFiles();
    if (file.status == 'success') {
      $('##{id}').html(\"<img class='existing_preview' src='\" + file.xhr.responseText + \"'/>\");
      $('##{id}').parents(\".form-group\").removeClass(\"has-error\");
      $('##{id}').parents(\".form-group\").find(\".help-block\").remove();
    } else {
      //$('##{id}').html('Erro ao enviar imagem, tente novamente.');
    }
    if (typeof upload_complete == 'function') {
      upload_complete();
    }
  });
});
</script>
<div class='form-group #{'has-error' if self.errors?}'>
  <li>
    <label class=\"fg-label\">
      #{self.label_text}
    </label>
    <div class=\"fileinput\" style=\"display: block;\">
      <div id=\"#{id}\" class=\"fileinput-preview thumbnail\" style=\"line-height: 150px; height: 150px;\">
        #{(self.object.send("#{self.method}?") ? "<img class='existing_preview' src='#{self.object.send("#{self.method}").url(:thumb)}'/>" : "")}
      </div>
      <span class=\"btn btn-info btn-sm btn-file waves-effect\">
        <span class=\"fileinput-new\" onclick=\"#{id}.hiddenFileInput.click();\">
          #{(self.object.send("#{self.method}?") ? I18n.t('change_image') : I18n.t('select_image'))}
        </span>
      </span>
    </div>
  </li>
  #{if self.errors? || self.hint? then "<span class='help-block'>#{lines}</span>" else "" end}
  </div>
    ".html_safe
  end

  def hint_html
    ""
  end

  def error_html
    ""
  end
end
