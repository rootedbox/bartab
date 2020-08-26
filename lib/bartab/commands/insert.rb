# frozen_string_literal: true

require_relative '../command'
require_relative '../spinner_command'
require 'tty/file'

module Bartab
  module Commands
    class Insert < Bartab::SpinnerCommand
      def initialize(description: nil, file:, text:)
        @description = description
        @file = file
        @text = text

        super
      end

      def line_exists?
        File.read(@file).split.include? @text
      end

      def create_file
        TTY::File.create_file @file, nil, skip: true, verbose: false
      end

      def append_file
        TTY::File.append_to_file(@file, "\r#{@text}", verbose: false)
      end

      def perform
        create_file

        line_exists? || append_file
      end
    end
  end
end
