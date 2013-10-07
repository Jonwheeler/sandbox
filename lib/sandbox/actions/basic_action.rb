module Sandbox
  module Actions
    class BasicAction
      attr_reader :client, :ui

      def call
        raise NotImplementedError "Must be implemented"
      end
    end
  end
end
