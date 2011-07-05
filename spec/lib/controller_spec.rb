require 'spec_helper'
require 'jsend-rails/controller'
require 'active_support/all'

describe JSend::Rails::Controller do
  class C
    include JSend::Rails::Controller
  end

  describe "#render_jsend" do
    let (:c) { C.new }
    let (:envelope) { {status: :success, result: {}} }
    before do
      JSend::Rails::Envelope.should_receive(:compute).and_return(envelope)
    end

    it "should render json by default" do
      c.should_receive(:render).with(json: envelope.to_json)
      c.render_jsend({success: {}})
    end

    it "should render text if requested" do
      c.should_receive(:render).with(text: envelope.to_json, layout: true)
      c.render_jsend({success: {}, render: {as: :text, layout: true}})
    end
  end
end
