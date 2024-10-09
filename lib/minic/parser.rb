module Minic
  class Parser

    class << self
      def parse tokens
        parse_program tokens
      end

      def parse_program tokens
        function_definition = parse_function tokens
        Minic::AST::Program.new function_definition
      end

      def parse_function tokens
        expect :int_keyword, tokens
        function_name = expect :identifier, tokens
        expect :open_paren, tokens
        expect :void_keyword, tokens
        expect :close_paren, tokens
        expect :open_brace, tokens
        statement = parse_statement tokens
        expect :close_brace, tokens
        expect_empty tokens
        Minic::AST::Function.new function_name, statement
      end

      def parse_statement tokens
        expect :return_keyword, tokens
        return_value = parse_expression tokens
        expect :semicolon, tokens
        Minic::AST::Return.new return_value
      end

      def parse_expression tokens
        value = expect :constant, tokens
        Minic::AST::Constant.new value
      end

      def expect expected, tokens
        actual = tokens.shift

        token_type = actual.shift

        if token_type != expected
          raise "Syntax Error: expected #{expected} but found #{token_type}"
        end

        actual.shift
      end

      def expect_empty tokens
        unless tokens.empty?
          raise "Syntax error: no more tokens expected, but found #{tokens}"
        end
      end
    end
  end
end
