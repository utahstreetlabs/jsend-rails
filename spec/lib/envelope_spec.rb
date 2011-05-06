require 'spec_helper'
require 'jsend-rails/envelope'

describe JSend::Rails::Envelope do
  context "#compute" do
    it "accepts a bare status" do
      status = :success
      JSend::Rails::Envelope.compute(status).should == {:status => status, :data => {}}
    end

    it "rejects an unknown bare status" do
      expect { JSend::Rails::Envelope.compute(:booya) }.to raise_error
    end

    it "accepts an error hash" do
      message = 'whoops'
      code = 123
      data = []
      JSend::Rails::Envelope.compute(:error => message, :code => code, :data => data).should ==
        {:status => :error, :message => message, :code => code, :data => data}
    end

    it "accepts a failure hash" do
      data = []
      JSend::Rails::Envelope.compute(:fail => data).should == {:status => :fail, :data => data}
    end

    it "accepts a success hash" do
      data = []
      JSend::Rails::Envelope.compute(:success => data).should == {:status => :success, :data => data}
    end

    it "rejects a hash with unknown status" do
      expect { JSend::Rails::Envelope.compute(:booya => []) }.to raise_error
    end
  end
end
