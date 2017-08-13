module DeviseHelper
  def devise_error_messages!
   
   return '' if resource.errors.empty?
   count = "#{resource.errors.count} error"
   if (resource.errors.count > 1)
      count = "#{resource.errors.count} errors"      
    end
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
      <div id="error_explanation" class="col-md-8">
        <i class="material-icons md-24 error-icon right">close</i>
        <h3> #{count} prohibited this article from being saved:</h3>
        <hr style="color: #555;">
        <ul>
          #{messages}
        </ul>
      </div>
    HTML

    html.html_safe
  end
end