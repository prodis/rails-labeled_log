module Rails
  module LabeledLog
    class Logger
      attr_reader :labels

      def initialize(*labels)
        @labels = labels
      end

      LabeledLog::LEVELS.each do |level|
        define_method(level) do |message, *additional_labels|
          log(level, message, additional_labels)
        end
      end

      private

      def log(level, message, *additional_labels)
        Rails.logger.tagged(*(labels + additional_labels)) do
          Rails.logger.send(level, format_message(message))
        end
      end

      def format_message(message)
        "#{message} at #{Time.now}"
      end
    end
  end
end
