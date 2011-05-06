require 'rails'

module JSend
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "jsend.configure_rails_initialization" do
        ActionController::Base.send :include, JSend::Rails::Controller
      end
    end
  end
end
