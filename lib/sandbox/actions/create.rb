require "sandbox/random_name"

module Sandbox
  module Actions
    class Create < BasicAction

      def initialize(client, ui, options = {})
        @client  = client
        @ui      = ui
        @name    = options[:name]
        @memory  = options[:memory]
      end

      def call
        if ui.confirm(config)
          resp = client.create(config)
          resp.success? ? ui.vm_created(resp) : ui.vm_failed_build
        else
          ui.canceled_action
        end
      end

      private

      def name
        @name ||= Sandbox::RandomName.generate
      end

      def memory_size
        @memory ||= "512"
      end

      def config
        {
          name:   name,
          memory: memory_size
        }
      end
    end
  end
end
