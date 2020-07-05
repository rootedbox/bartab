# frozen_string_literal: true

require 'thor'

module Bartab
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'bartab version'
    def version
      require_relative 'version'
      puts "v#{Bartab::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'install', 'Command description...'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def install(*)
      if options[:help]
        invoke :help, ['install']
      else
        require_relative 'commands/install'
        Bartab::Commands::Install.new(options).execute
      end
    end

    desc 'setup', 'Command description...'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def setup(*)
      if options[:help]
        invoke :help, ['setup']
      else
        require_relative 'commands/setup'
        Bartab::Commands::Setup.new(options).execute
      end
    end
  end
end
