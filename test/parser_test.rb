require "test_helper"

class ParserText < Minitest::Test
  def test_that_parse_returns_an_AST
    tokens = ::Minic::Lexer.tokenize("int main(void) {\n\treturn 2;\n}")

    program = ::Minic::Parser.parse(tokens)

    assert program.is_a?(::Minic::AST::Program)
    assert program.function_definition.is_a?(::Minic::AST::Function)
    function = program.function_definition
    assert_equal "main", function.name

  end

  def test_that_parse_expression_returns_a_constant
    tokens = Minic::Lexer.tokenize "2"
    
    expression = Minic::Parser.parse_expression tokens

    assert expression.is_a? Minic::AST::Constant
    assert_equal 2, expression.value
  end

  def test_that_parse_statement_returns_a_return
    tokens = Minic::Lexer.tokenize "return 2;"

    statement = Minic::Parser.parse_statement tokens

    assert statement.is_a? Minic::AST::Return
    assert statement.exp.is_a? Minic::AST::Constant
  end
end
