require 'active_support/json'
require 'action_controller/test_case'

module JSend
  module Rails
    module Test
      module Response
        def json
          HashWithIndifferentAccess.new(ActiveSupport::JSON.decode(body))
        end

        def jsend_code
          json[:code]
        end

        def jsend_message
          json[:message]
        end

        def jsend_status
          json[:status]
        end

        def jsend_data
          json[:data]
        end
      end
    end
  end
end

ActionController::TestResponse.send :include, JSend::Rails::Test::Response
ActionDispatch::TestResponse.send :include, JSend::Rails::Test::Response
