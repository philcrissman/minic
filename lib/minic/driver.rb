# frozen_string_literal: true

module Minic
  class Driver
    class << self
      def run filename, opts
        preprocessed_filename = filename.split('.')[0] + ".i"
        `gcc -E -P #{filename} -o #{preprocessed_filename}`

        code = compile preprocessed_filename, opts
        return if opts[:S]

        assemble code
      end

      def compile filename, opts
        file_contents = File.read(filename)
        tokens = Minic::Lexer.tokenize(file_contents)
        return if opts[:lex]
      end

      def assemble code

      end
    end
  end
end
