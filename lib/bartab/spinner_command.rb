# frozen_string_literal: true

#require 'tty/spinner'
require 'tty/spinner/multi'

module Bartab
  class SpinnerCommand < Command

    def initialize(*args, **keyword_args)
      set_instances(keyword_args)

      @description ||= ''

      set_spinner

      super()
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

    private

    def set_spinner
      if @parent_spinner
        puts @parent_spinner.class.instance_methods
        #@spinner = ::TTY::Spinner.new("[:spinner] one")
        #@parent_spinner.register @spinner
        #puts TTY::Spinner::Multi.methods
     else
       #TTY::Spinner::Multi.new("[:spinner] top")
       @spinner = TTY::Spinner::Multi.new("[:spinner] #{@description}")
     end
    end

    def set_instances(**keywords)
      keywords.keys.each do |key|
        eval_string = keywords[key].nil? ? "@#{key} ||= ''" : "@#{key} ||= '#{keywords[key]}'"

        instance_eval(eval_string)
      end
    end
  end
end
