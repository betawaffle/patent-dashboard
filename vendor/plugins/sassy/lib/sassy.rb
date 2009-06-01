require 'sassy/template_handlers/sass'

ActionView::Template.register_template_handler :sass, Sassy::TemplateHandlers::Sass
#ActionController::Base.exempt_from_layout :sass