# frozen_string_literal: true

require_relative '../command'
require_relative '../spinner_command'
require 'tty/file'

module Bartab
  module Commands
    class Download < Bartab::SpinnerCommand
      # def initialize(description: nil, source:, destination:)
      #   @description = description
      #   @source = source
      #   @destination = destination
      #
      #   super
      # end

      def perform
        TTY::File.download_file(@source, @destination)
      end
    end
  end
end
