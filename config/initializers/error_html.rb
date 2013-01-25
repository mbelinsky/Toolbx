ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  errors = Array(instance.error_message).join(', ')
  tag_name = html_tag.match(/<(\w+)/)[1]
  hidden = html_tag.include?('type="hidden"')

  if tag_name == 'label' || hidden
    html_tag.html_safe
  else
    %(<div class="field_with_errors">#{html_tag}</div><div class="validation-error">#{errors}</div>).html_safe
  end
end