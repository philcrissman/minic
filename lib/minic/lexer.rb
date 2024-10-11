module Minic
  class Lexer
    IDENTIFIER     = /\A[a-zA-Z_]\w*\b/
    CONSTANT       = /\A[0-9]+\b/
    INT_KEYWORD    = /\Aint\b/
    VOID_KEYWORD   = /\Avoid\b/
    RETURN_KEYWORD = /\Areturn\b/
    OPEN_PAREN     = /\A\(/
    CLOSE_PAREN    = /\A\)/
    OPEN_BRACE     = /\A{/
    CLOSE_BRACE    = /\A}/
    SEMICOLON      = /\A;/
    TILDE          = /\A~/
    MINUS          = /\A-/
    DECREMENT      = /\A--/

    class << self
      def tokenize str
        tokens = []

        while !str.empty?
          str.lstrip!
          case str
          in IDENTIFIER
            match = str.match(IDENTIFIER).to_s
            case match
            in INT_KEYWORD
              tokens << [:int_keyword]
            in VOID_KEYWORD
              tokens << [:void_keyword]
            in RETURN_KEYWORD
              tokens << [:return_keyword]
            else
              tokens << [:identifier, match]
            end
            str.sub!(IDENTIFIER, '')
          in CONSTANT
            constant = str.match(CONSTANT).to_s.to_i
            tokens << [:constant, constant]
            str.sub!(CONSTANT, '')
          in OPEN_PAREN
            tokens << [:open_paren]
            str.sub!(OPEN_PAREN, '')
          in CLOSE_PAREN
            tokens << [:close_paren]
            str.sub!(CLOSE_PAREN, '')
          in OPEN_BRACE
            tokens << [:open_brace]
            str.sub!(OPEN_BRACE, '')
          in CLOSE_BRACE
            tokens << [:close_brace]
            str.sub!(CLOSE_BRACE, '')
          in SEMICOLON
            tokens << [:semicolon]
            str.sub!(SEMICOLON, '')
          in TILDE
            tokens << [:bitwise_complement]
            str.sub!(TILDE, '')
          in DECREMENT
            tokens << [:decrement]
            str.sub!(DECREMENT, '')
          in MINUS
            tokens << [:negation]
            str.sub!(MINUS, '')
          else
            raise "Unrecognized token at #{str}" unless str.empty?
          end
        end


        tokens
      end
    end
  end
end
