require "optparse"

module Sandbox
  class CLI
    attr_reader :options, :command, :ui

    def initialize
      @options    = {}
      @connection = Sandbox::Connection.new
      @ui         = Sandbox::ConsoleOut.new
    end

    def call
      parse_options
      parse_command

      cmd = @command.capitalize

      begin 
        klass = Kernel.const_get("Sandbox::Actions::#{cmd}")
      rescue NameError
        @ui.exit("Invalid Command")
      end

      klass.new(@connection, ui, options).call
    end

    private

    def parse_command
      case ARGV.size
      when 0
        ui.exit("Command required")
      when 1
        @command          = ARGV.shift
      when 2
        @command          = ARGV.shift
        @options[:name]   = ARGV.shift
        @options[:memory] = nil
      when 3
        @command          = ARGV.shift
        @options[:name]   = ARGV.shift
        @options[:memory] = ARGV.shift
      else
        ui.exit("Maximum of 2 arguments allowed")
      end
    end
    
    def parse_options
      parser = OptionParser.new do |opts|
        opts.on('-v', '--version', 'Show version') do
          puts "Sandbox version #{Sandbox::VERSION}"
          exit 0
        end

        opts.on('-n', '--name', 'Name of Sandbox Virtual Server') do |v|
          @options[:name] = v
        end

        opts.on('-m', '--memory', 'Memory Requirement for Server (defaults to 512MB)') do |v|
          @options[:memory] = v
        end

        opts.on('-d', '--debug', 'Enable debugging') do
          @options[:log] = true
        end
      end

      begin
        parser.parse!
      rescue OptionParser::ParseError => e
        ui.exit(e.message)
      end
    end
  end
end
