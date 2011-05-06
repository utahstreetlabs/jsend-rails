require 'active_support/json'
require 'action_controller/test_case'

module JSend
  module Rails
    module Test
      module Response
        def json
          ActiveSupport::JSON.decode(body)
        end

        def jsend_status
          json['status']
        end

        def jsend_data
          json['data']
        end
      end
    end
  end
end

ActionController::TestResponse.send :include, JSend::Rails::Test::Response
