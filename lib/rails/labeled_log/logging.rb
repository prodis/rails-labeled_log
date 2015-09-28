module Rails
  module LabeledLog
    module Logging
      def self.included(base)
        base.extend(ClassMethods)
        base.send(:prepend, InstanceMethods)
      end

      module ClassMethods
        Rails::LabeledLog::LEVELS.each do |level|
          define_method("log_#{level}".to_sym) do |message, *additional_labels|
            log_labeled(level, message, additional_labels)
          end
        end

        private

        def log_labeled(level, message, *additional_labels)
          Rails::LabeledLog::Logger.new(self.name).send(level, message, additional_labels)
        end
      end

      module InstanceMethods
        attr_reader :logger

        def initialize(*args)
          @logger = Rails::LabeledLog::Logger.new(self.class.name)
          super
        end

        private

        Rails::LabeledLog::LEVELS.each do |level|
          define_method("log_#{level}".to_sym) do |message, *additional_labels|
            logger.send(level, message, additional_labels)
          end
        end
      end
    end
  end
end
