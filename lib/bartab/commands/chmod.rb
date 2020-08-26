# frozen_string_literal: true

require_relative '../command'

module Bartab
  module Commands
    class Chmod < Bartab::Command
      def initialize(description: nil, file:, permissions:)
        @description = description
        @file = file
        @permissions = permissions
        @options = options

        super
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        output.puts "OK"
      end
    end
  end
end
