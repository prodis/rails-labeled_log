require 'spec_helper'

module FakeModule
  class FakeClass
    include Rails::LabeledLog::Logging
  end
end

describe Rails::LabeledLog::Logging do
  before(:all) do
    @log_stream = StringIO.new
    Rails.logger = ActiveSupport::TaggedLogging.new(Logger.new(@log_stream))
  end

  after(:all) do
    Rails.logger = nil
  end

  context 'class methods' do
    subject { FakeModule::FakeClass }

    Rails::LabeledLog::LEVELS.each do |level|
      describe "#log_#{level}" do
        it 'logs with class name' do
          subject.send("log_#{level}", "Message for #{level} in class methods")
          expect(@log_stream.string).to include("[FakeModule::FakeClass] Message for #{level} in class methods at ")
        end
      end
    end
  end

  context 'instance methods' do
    subject { FakeModule::FakeClass.new }

    Rails::LabeledLog::LEVELS.each do |level|
      describe "#log_#{level}" do
        it 'logs with class name' do
          subject.send("log_#{level}", "Message for #{level} in instance methods")
          expect(@log_stream.string).to include("[FakeModule::FakeClass] Message for #{level} in instance methods at ")
        end
      end
    end
  end
end
