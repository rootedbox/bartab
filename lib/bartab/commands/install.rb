# frozen_string_literal: true

require_relative '../command'
require_relative '../spinner_command'
require 'tty-command'
#require_relative 'commands/execute'

module Bartab
  module Commands
    class Install < Bartab::SpinnerCommand
      def initialize(description: nil, package:)
        @description = description
        @package

        command = "brew install #{package}"

        @executor = Bartab::Commands::Execute.new(description: description, command: command)
        super
      end

      def perform
        @executor.perform
      end
    end
  end
end
