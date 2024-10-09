module Minic
  module AssemblyAST
    class Program
      attr_reader :function_definition
      
      def initialize function_definition
        @function_definition = function_definition
      end
    end

    class Function
      attr_reader :name, :instructions

      def initialize name, instructions
        @name = name
        @instructions = instructions
      end
    end

    class Instruction
    end

    class Mov < Instruction
      attr_reader :src, :dest

      def initialize src, dest
        @src = src
        @dest = dest
      end
    end

    class Ret < Instruction

    end

    class Operand
    end

    class Imm < Operand
      attr_reader :int

      def initialize int
        @int = int
      end
    end

    class Register < Operand

    end

  end
end
