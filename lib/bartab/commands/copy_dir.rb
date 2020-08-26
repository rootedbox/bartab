# frozen_string_literal: true

require_relative '../command'
require_relative '../spinner_command'
require 'tty/file'

module Bartab
  module Commands
    class CopyDir < Bartab::SpinnerCommand
      def initialize(description: nil, source:, destination:)
        @description = description
        @source = source
        @destination = destination
        @options = options

        super
      end

      def perform
        TTY::File.copy_dir(@source, @destination)
      end
    end
  end
end
