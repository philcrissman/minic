module Minic
  class CodeGen

    class << self
      def generate_code ast
        generate_program ast
      end

      def generate_program program
        function = generate_function program.function_definition
        Minic::AssemblyAST::Program.new function
      end

      def generate_function function_definition
        instructions = generate_instructions function_definition.body
        Minic::AssemblyAST::Function.new function_definition.name, instructions
      end

      def generate_instructions statement
        instructions = []

        src = generate_constant(statement.exp)
        instructions << Minic::AssemblyAST::Mov.new(
          src,
          Minic::AssemblyAST::Register.new) 

        instructions << Minic::AssemblyAST::Ret.new
        instructions
      end

      def generate_constant exp
        Minic::AssemblyAST::Imm.new(exp.value)
      end
    end
  end
end
