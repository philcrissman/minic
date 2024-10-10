module Minic
  module AssemblyAST
    class Program
      attr_reader :function_definition
      
      def initialize function_definition
        @function_definition = function_definition
      end

      def output
        function_definition.output
      end
    end

    class Function
      attr_reader :name, :instructions

      def initialize name, instructions
        @name = name
        @instructions = instructions
      end

      def output
        out = <<-EOS
            .globl
        _#{name}:
        EOS

        instructions.each do |instruction|
          out += instruction.output
        end

        out
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

      def output
        out = <<-EOS
            movl #{src.output}, #{dest.output}
        EOS

        out
      end
    end

    class Ret < Instruction
      def output
        out = <<-EOS
            "ret\n"
        EOS
        out
      end
    end

    class Operand
    end

    class Imm < Operand
      attr_reader :int

      def initialize int
        @int = int
      end

      def output
        "$#{int}"
      end
    end

    class Register < Operand
      def output
        "%eax"
      end
    end

  end
end
