# frozen_string_literal: true

require_relative '../command'
require_relative '../spinner_command'
require 'yaml'
# require_relative 'commands/execute'
# require_relative 'commands/chmod'
# require_relative 'commands/download'
# require_relative 'commands/copy_dir'
# require_relative 'commands/copy'
# require_relative 'commands/insert'
# require_relative 'commands/install'
# require_relative 'commands/setup'

module Bartab
  module Commands
    class Setup < Bartab::SpinnerCommand
      def initialize(description: nil, bartab:)
        tab_file = YAML.load(File.read(bartab))

        @description = description
        @description ||= tab_file["description"]
        @tab = tab_file["tab"]
        super
      end

      def perform
        @tab.each do |tab_operation|
          execute_operation(tab_operation)
        end

        true
      end

      def execute_operation(tab_operation)
        operation = tab_operation.keys[0]
        params = tab_operation[operation]

        instance_eval(execute_string(operation, params))
      end

      def execute_string(operation, params)
        puts params_to_string(params)
        "Bartab::Commands::#{operation.capitalize}.new(#{params_to_string(params)}).execute"
      end

      def params_to_string(params)
        strings = []

        params.each do |key, value|
          strings << "#{key}: \"#{value}\""
        end

        #puts @spinner.class.instance_methods
        strings << "parent_spinner: @spinner"
        strings.join(",")
      end
    end
  end
end
