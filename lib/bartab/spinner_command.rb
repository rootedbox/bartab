# frozen_string_literal: true

require 'tty/spinner'

module Bartab
  class SpinnerCommand < Command
    def initialize(*)
      @description ||= ''
      @spinner = TTY::Spinner.new("[:spinner] #{@description}", format: :pulse_2)
    end

    def start_spinner
      @spinner.auto_spin
    end

    def error_spinner
      @spinner.error('(error)')
    end

    def success_spinner
      @spinner.success('(successful)')
    end

    def perform; end

    def execute(input: $stdin, output: $stdout)
      start_spinner

      return error_spinner unless perform

      success_spinner
    end
  end
end
