# frozen_string_literal: true

require_relative '../command'
require_relative '../spinner_command'


module Bartab
  module Commands
    class Copy < Bartab::SpinnerCommand
      def initialize(description: nil, source:, destination:)
        @description = description
        @source = source
        @destination = destination

        super
      end

      def perform
        FileUtils.cp(@source, @destination)

        true
      end
    end
  end
end
