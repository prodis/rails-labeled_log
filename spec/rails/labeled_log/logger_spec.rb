describe Rails::LabeledLog::Logger do
  subject { described_class.new('Chefe', 'Pixel') }

  before(:all) do
    @log_stream = StringIO.new
    Rails.logger = ActiveSupport::TaggedLogging.new(Logger.new(@log_stream))
  end

  after(:all) do
    Rails.logger = nil
  end

  Rails::LabeledLog::LEVELS.each do |level|
    describe "##{level}" do
      it 'logs with labels' do
        subject.send(level, "Message for #{level}")
        expect(@log_stream.string).to include("[Chefe] [Pixel] Message for #{level} at ")
      end
    end
  end
end
