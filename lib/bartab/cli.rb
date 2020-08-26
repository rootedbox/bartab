# frozen_string_literal: true

require 'thor'
require_relative 'commands/execute'
require_relative 'commands/chmod'
require_relative 'commands/download'
require_relative 'commands/copy_dir'
require_relative 'commands/copy'
require_relative 'commands/insert'
require_relative 'commands/install'
require_relative 'commands/setup'

module Bartab
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #

  DEFAULT_BARTAB = "#{Dir.pwd}/default.bartab"

  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'Get the bartab version.'
    def version
      require_relative 'version'
      puts "v#{Bartab::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'execute COMMAND', 'Execute a command from command line.'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :description, type: :array, banner: "description value",
                  desc: "Uses alternative description from default."
    def execute(command)
      if options[:help]
        invoke :help, ['execute']
      else
        description = get_description(options)

        Bartab::Commands::Execute.new(description: description, command: command).execute
      end
    end

    desc 'chmod FILE PERMISSIONS', 'Change permissions of a file.'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :description, type: :array, banner: "description value",
                  desc: "Uses alternative description from default."

    def chmod(file, permissions)
      if options[:help]
        invoke :help, ['chmod']
      else
        description = get_description(options)

        Bartab::Commands::Chmod.new(description: description, file: file, permissions: permissions).execute
      end
    end

    desc 'download SOURCE DESTINATION', 'Download a remote file locally.'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :description, type: :array, banner: "description value",
                  desc: "Uses alternative description from default."
    def download(source, destination)
      if options[:help]
        invoke :help, ['download']
      else
        description = get_description(options)

        Bartab::Commands::Download.new(description: description, source: source, destination: destination).execute
      end
    end

    desc 'copy_dir SOURCE DESTINATION', 'Copy a directory from one location to another.'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :description, type: :array, banner: "description value",
                  desc: "Uses alternative description from default."
    def copy_dir(source, destination)
      if options[:help]
        invoke :help, ['copy_dir']
      else
        description = get_description(options)

        Bartab::Commands::CopyDir.new(description: description, source: source, destination: destination).execute
      end
    end

    desc 'copy SOURCE DESTINATION', 'Copy a file from one location to another'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :description, type: :array, banner: "description value",
                  desc: "Uses alternative description from default."
    def copy(source, destination)
      if options[:help]
        invoke :help, ['copy']
      else
        description = get_description(options)

        Bartab::Commands::Copy.new(description: description, source: source, destination: destination).execute
      end
    end

    desc 'insert FILE TEXT', 'Insert a line into a text file if it doesnot already exist.'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :description, type: :array, banner: "description value",
                  desc: "Uses alternative description from default."
    def insert(file, text)
      if options[:help]
        invoke :help, ['insert']
      else
        description = get_description(options)

        Bartab::Commands::Insert.new(description: description, file: file, text: text).execute
      end
    end

    desc 'install PACKAGE', 'Installs a package using brew.'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :description, type: :array, banner: "description value",
                  desc: "Uses alternative description from default."
    def install(package)
      if options[:help]
        invoke :help, ['install']
      else
        description = get_description(options)

        Bartab::Commands::Install.new(description: description, package: package).execute
      end
    end

    desc 'setup', 'Setup via a brewtab file.'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    method_option :description, type: :array, banner: "description value",
                  desc: "Uses alternative description from default."
    def setup(bartab = nil)
      if options[:help]
        invoke :help, ['setup']
      else
        description = get_description(options)
        bartab ||= get_bartab(bartab)

        Bartab::Commands::Setup.new(description: description, bartab: bartab).execute if bartab
      end
    end

    private

    def get_bartab(bartab)
      return DEFAULT_BARTAB if File.exist?(DEFAULT_BARTAB)

      bartabs = Dir["#{Dir.pwd}/*.bartab"]
      return bartabs[0] if bartabs.one?

      nil
    end

    def get_description(options)
      options[:description] ? options[:description].join(" ") : nil
    end
  end
end
