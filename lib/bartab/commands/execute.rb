# frozen_string_literal: true

require_relative '../command'
require_relative '../spinner_command'
require 'tty-command'

module Bartab
  module Commands
    class Execute < Bartab::SpinnerCommand
      def initialize(description: nil, command:)
        @description = description
        @command = command

        @executor = TTY::Command.new(printer: :null)
        super
      end

      def perform
        out, error = @executor.run!(@command)
        puts "\r\n"
        puts out

        !!error
      end
    end
  end
end
