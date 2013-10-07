require "terminal_helpers"

module Sandbox
  class ConsoleOut
    include TerminalHelpers

    def confirm(config, message="Correct specs?")
      empty_line
      info "NAME:   [ #{config[:name].blue}   ]"
      info "MEMORY: [ #{config[:memory].blue} ]" if !config[:memory].nil?
      empty_line
      ask_yesno(message)
    end

    def get_name
      ask "Name is required"
    end

    def vm_created(options)
      success "VM Created"
    end

    def vm_destroyed
      success "VM Destroyed"
    end

    def vm_failed_build
      error "VM Failed to build"
    end

    def vm_failed_destroy(errors)
      info "VM was not destroyed \n".red
      error errors.to_s
    end

    def canceled_action
      info "Abort."
    end

    def exit(message, status = 1)
      STDERR.puts(message.red)
      exit(status)
    end

    def print_info(options)
      info "NAME:        [ #{options[:name].blue}   ]"
      info "MEMORY:      [ #{options[:memory].blue} ]"
      info "OTHER STUFF: [                          ]"
    end
  end
end
