require 'spec_helper'

describe Swrve do

  subject { Swrve }
  let(:event_sender) { mock('event_sender') }
  let(:resource_getter) { mock('resource_getter') }

  before do
    Swrve::Api::Events.stubs(new: event_sender)
    Swrve::Api::Resources.stubs(new: resource_getter)
    Swrve.configure do |config|
      config.game_id = 1
      config.api_key = 'key'
      config.app_version = '9.9'
    end
  end

  describe ".config" do
    it 'is a configuration' do
      expect(Swrve.config).to be_a(Swrve::Configuration)
    end

    it 'responds to required configurations' do
      cfgs = [:ab_test_url, :api_url, :app_version, :api_key, :local_resource_path, :game_id,
       :load_local_resources, :debug, :http_adapter].map do |value|
        Swrve.config.respond_to?(value)
      end
      expect(cfgs.uniq).to eq([true])
    end
  end

  describe '.configure' do

    before { Swrve.configure { |config| config.app_version = '11' }}

    it 'should be configurable' do
      expect(Swrve.config.app_version).to eq('11')
    end

  end

  it "has a version" do
    expect(Swrve::VERSION).to be_a(String)
  end

  describe 'methods_delegated to event_sender' do
    let(:event_sender) { Swrve::Api::Events.new }
    @delegated_events = [
      :session_start, :session_end, :create_event,
      :purchase, :buy_in, :currency_given, :update_user
    ]

    @delegated_events.each do |event|
      specify { expect(subject).respond_to?(event) }
      specify { expect(event_sender).respond_to?(event) }

      it "send the #{event} request to the resources endpoint" do
        event_sender.expects(event)

        subject.send(event)
      end
    end
    
  end

  describe 'methods_delegated to resource_getter' do
    let(:resource_getter) { Swrve::Api::Resources.new }
    @delegated_events = [:resource, :resources_diff, :resources]

    @delegated_events.each do |event|
      specify { expect(subject).respond_to?(event) }
      specify { expect(resource_getter).respond_to?(event) }

      it "send the #{event} request to the resources endpoint" do
        resource_getter.expects(event)

        subject.send(event)
      end
    end
  end
end
