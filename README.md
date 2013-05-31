# jsend-rails

extensions to Rails for rendering JSON responses in the [JSend](http://labs.omniti.com/labs/jsend) format

## Usage

In a controller:

    def create
      thing = Thing.new_from_json(request.body)
      if thing.save
        render_jsend(:success => thing)
      else
        render_jsend(:fail => thing.errors)
      end
    rescue Exception => e
      render_jsend(:error => e.message, :code => 12345, :data => ['other', 'stuff'])
    end

Valid statuses are `:success`, `:fail` and `:error`. You can pass either the status itself (which implies an empty data
object) or a hash of options; in the case of options, one of the keys must be the status, and its value is used for the
data object.

## Tests

Some handy matchers are provided for RSpec users, and `ActionController::TestResponse` is extended with a few methods:

    require 'jsend-rails/test/matchers'
    require 'jsend-rails/test/response'

    describe Thing do
      let(:thing) { Thing.create(...) }

      before(:each) do
        xhr :get, :show, :id => thing.id
      end

      it "succeeds" do
        response.should be_jsend_success
      end

      it "returns thing id" do
        response.jsend_data['id'].should == thing.id
      end
    end

## Copyright

Copyright (c) 2011 Utah Street Labs. See LICENSE for details.
