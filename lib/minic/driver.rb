# frozen_string_literal: true

module Minic
  class Driver
    class << self
      def run filename, opts
        object_filename = filename.split('.').first
        preprocessed_filename = object_filename + ".i"
        `gcc -E -P #{filename} -o #{preprocessed_filename}`

        code = compile preprocessed_filename, opts
        return if opts[:lex]
        return if opts[:parse]

        File.delete(preprocessed_filename)

        assembly_filename = object_filename + '.s'

        assemble code, assembly_filename, opts
        return if opts[:codegen]
        return if opts[:S]

        `gcc #{assembly_filename} -o #{object_filename}`
        
        File.delete(assembly_filename)
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
          return
        end
        f = File.open(filename, "w+")
        f.write output
        f.close
      end
    end
  end
end
