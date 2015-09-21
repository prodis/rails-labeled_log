module Rails
  module LabeledLog
    class Logger
      attr_reader :labels

      def initialize(*labels)
        @labels = labels
      end

      LabeledLog::LEVELS.each do |level|
        define_method(level) do |message|
          log(level, message)
        end
      end

      private

      def log(level, message)
        Rails.logger.tagged(*labels) do
          Rails.logger.send(level, format_message(message))
        end
      end

      def format_message(message)
        "#{message} at #{Time.now}"
      end
    end
  end
end
