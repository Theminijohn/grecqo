class ApiController < ActionController::Metal

  include ActionController::MimeResponds
  include AbstractController::Rendering
  include ActionController::Renderers::All

  # need this to build params 
  # include ActionController::Instrumentation
  # include AbstractController::Callbacks
  
  # Tell the controller where to look for templates
  # include actionview::layouts
  # append_view_path "#{Rails.root}/app/views" 

end
