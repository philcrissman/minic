# frozen_string_literal: true

module Minic
  class Driver
    class << self
      def run filename, opts
        preprocessed_filename = filename.split('.')[0] + ".i"
        `gcc -E -P #{filename} -o #{preprocessed_filename}`

        code = compile preprocessed_filename, opts
        return if opts[:S]

        assemble code, preprocessed_filename, opts
      end

      def compile filename, opts
        file_contents = File.read(filename)
        tokens = Minic::Lexer.tokenize(file_contents)
        return if opts[:lex]
        ast = Minic::Parser.parse(tokens)
        return if opts[:parse]

        ast
      end

      def assemble code, filename, opts
        assembly = Minic::CodeGen.generate_code(code)
        return if opts[:codegen]
        output = assembly.output
        if opts[:S]
          print output
          puts
        end
        filename = filename.split(".").first
        puts filename
        f = File.write "#{filename}", output
        binding.pry
        f.close
      end
    end
  end
end
