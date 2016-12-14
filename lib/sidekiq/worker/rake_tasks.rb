module Sidekiq
  module Worker
    # Define some helper methods
    module RakeTasks
      def self.included(base)
        base.extend ClassMethods
      end

      def validate_rake_arguments(args)
        return false unless validate_non_empty_args(args)
        return false unless validate_args_exist(args)
        true
      end

      # Allow these methods to be accessed from the mixer
      module ClassMethods
        def expected_args(*argument_names)
          @expected_arg_names = [] if @expected_arg_names.nil?
          @expected_arg_names << argument_names.flatten
        end

        def expected_arg_names
          @expected_arg_names = [] if @expected_arg_names.nil?
          @expected_arg_names.flatten
        end
      end

      private

      def validate_args_exist(args)
        self.class.expected_arg_names.each do |arg_name|
          unless args.key?(arg_name.to_s)
            logger.error("Missing argument #{arg_name}")
            return false
          end
        end
      end

      def validate_non_empty_args(args)
        if self.class.expected_arg_names.empty?
          true
        elsif args.empty?
          logger.error("No arguments for #{self.class}")
          false
        else
          true
        end
      end
    end
  end
end
