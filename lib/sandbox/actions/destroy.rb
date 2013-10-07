module Sandbox
  module Actions
    class Destroy < BasicAction

      def initialize(client, ui, options = {})
        @client = client
        @ui     = ui
        @name   = options[:name]
      end

      def call
        if ui.confirm({name: name}, "Destroy?")
          resp = client.destroy(name)
          resp.success? ? ui.vm_destroyed : ui.vm_failed_destroy(resp.errors)
        else
          ui.canceled_action
        end
      end

      def name
        @name ||= ui.get_name
      end
    end
  end
end
