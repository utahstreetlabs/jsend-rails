require 'rails'

module JSend
  module Rails
    class Engine < ::Rails::Engine
      initializer "extend Controller with jsend-rails" do |app|
        ActionController::Base.send :include, JSend::Rails::Controller
      end
    end
  end
end
