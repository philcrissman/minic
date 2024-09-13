module Minic
  module AST
    class Node
    end

    class Program < Node
      attr_reader :function_definition

      def initialize(function_definition)
        @function_definition = function_definition
    end
    end

    class Function < Node
      attr_reader :name, :body

      def initialize(name, body)

      end
    end
  end
end
