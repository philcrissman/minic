require "test_helper"

class LexerTest < Minitest::Test
  def test_that_tokenize_returns_an_array
    result = ::Minic::Lexer.tokenize("")
    assert result.is_a?(Array)
  end

  def test_tokenize_with_an_identifier
    result = ::Minic::Lexer.tokenize("hello")
    assert_equal [[:identifier, "hello"]], result
  end

  def test_tokenize_with_leading_whitespace
    result = ::Minic::Lexer.tokenize("hello    world")
    assert_equal [[:identifier, "hello"], [:identifier, "world"]], result
  end

  def test_tokenize_with_int_keyword
    result = ::Minic::Lexer.tokenize("int")

    assert_equal [[:int_keyword]], result
  end

  def test_tokenize_with_void_keyword
    result = ::Minic::Lexer.tokenize("void")

    assert_equal [[:void_keyword]], result
  end

  def test_tokenize_with_return_keyword
    result = ::Minic::Lexer.tokenize("return")

    assert_equal [[:return_keyword]], result
  end

  def test_tokenize_constant
    result = ::Minic::Lexer.tokenize("42")

    assert_equal [[:constant, 42]], result
  end

  def test_tokenize_keyword_identifier_and_constant
    result = ::Minic::Lexer.tokenize("int x 42")

    assert_equal [[:int_keyword], [:identifier, "x"], [:constant, 42]], result
  end

  def test_tokenize_open_paren
    result = ::Minic::Lexer.tokenize("(")

    assert_equal [[:open_paren]], result
  end

  def test_tokeize_with_close_paren
    result = ::Minic::Lexer.tokenize(")")

    assert_equal [[:close_paren]], result
  end

  def test_tokenize_with_open_brace
    result = ::Minic::Lexer.tokenize("{")

    assert_equal [[:open_brace]], result
  end

  def test_tokenize_with_close_brace
    result = ::Minic::Lexer.tokenize("}")

    assert_equal [[:close_brace]], result
  end

  def test_tokenize_with_semicolon
    result = ::Minic::Lexer.tokenize(";")

    assert_equal [[:semicolon]], result
  end

  def test_tokenize_tilde
    result = ::Minic::Lexer.tokenize("~")

    assert_equal [[:bitwise_complement]], result
  end

  def test_tokenize_negation
    result = ::Minic::Lexer.tokenize("-")

    assert_equal [[:negation]], result
  end

  def test_tokenize_decrement
    result = ::Minic::Lexer.tokenize("--")

    assert_equal [[:decrement]], result
  end

  def test_tokenize_with_full_function
    result = ::Minic::Lexer.tokenize("int main(void) {\n\treturn 2;\n}")

    assert_equal [[:int_keyword],
                  [:identifier, "main"],
                  [:open_paren],
                  [:void_keyword],
                  [:close_paren],
                  [:open_brace],
                  [:return_keyword],
                  [:constant, 2],
                  [:semicolon],
                  [:close_brace]], result
  end

  def test_tokenize_with_invalid_token
    assert_raises do
      result = ::Minic::Lexer.tokenize("123bar")
    end
  end
end
