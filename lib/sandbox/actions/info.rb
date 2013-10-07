module Sandbox
  module Actions
    class Info < BasicAction
      
      def initialize(client, ui, options = {})
        @client = client
        @ui     = ui
        @name   = options[:name]
      end

      def call
        resp = client.info(name)
        if resp.success?
          ui.print_info({name: "foo", memory: "512"})
        else
          ui.exit(resp.errors)
        end
      end

      def name
        @name ||= ui.get_name
      end
    end
  end
end
