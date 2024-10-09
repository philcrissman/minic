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
        @name = name
        @body = body
      end
    end

    class Return < Node
      attr_reader :exp

      def initialize(exp)
        @exp = exp
      end
    end

    class Constant < Node
      attr_reader :value

      def initialize(value)
        @value = value
      end
    end
  end
end
