module Rails
  module LabeledLog
    module Logging
      def self.included(base)
        base.extend(ClassMethods)
        base.send(:prepend, InstanceMethods)
      end

      module ClassMethods
        Rails::LabeledLog::LEVELS.each do |level|
          define_method("log_#{level}".to_sym) do |message|
            log_labeled(level, message)
          end
        end

        private

        def log_labeled(level, message)
          Rails::LabeledLog::Logger.new(self.name).send(level, message)
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
          define_method("log_#{level}".to_sym) do |message|
            logger.send(level, message)
          end
        end
      end
    end
  end
end
