require 'rspec/core'
require 'rspec/matchers'

module JSend
  module Rails
    module Test
      module Matchers
        RSpec::Matchers.define :be_json do
          match do |response|
            response.content_type =~ /^application\/json/
          end
          failure_message_for_should do |response|
            "Response should have application/json content type"
          end
          failure_message_for_should_not do |response|
            "Response should not have application/json content type"
          end
        end

        RSpec::Matchers.define :be_jsend_success do
          match do |response|
            response.json['status'].should == 'success'
          end
          failure_message_for_should do |response|
            "Response should be JSend success"
          end
          failure_message_for_should_not do |response|
            "Response should not be JSend success"
          end
        end

        RSpec::Matchers.define :be_jsend_failure do
          match do |response|
            response.json['status'].should == 'fail'
          end
          failure_message_for_should do |response|
            "Response should be JSend failure"
          end
          failure_message_for_should_not do |response|
            "Response should not be JSend failure"
          end
        end

        RSpec::Matchers.define :be_jsend_error do
          match do |response|
            response.json['status'].should == 'error'
          end
          failure_message_for_should do |response|
            "Response should be JSend error"
          end
          failure_message_for_should_not do |response|
            "Response should not be JSend error"
          end
        end
      end
    end
  end
end
