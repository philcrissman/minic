require "test_helper"

class AssemblyASTTest < Minitest::Test
  def test_imm_return
    imm = Minic::AssemblyAST::Imm.new(3)

    assert_equal "$3", imm.output
  end

  def test_generate_instructions
    tokens = Minic::Lexer.tokenize("return 2;")
    ast = Minic::Parser.parse_statement(tokens)
    instructions = Minic::CodeGen.generate_instructions(ast)
    
    assert_equal "movl $2, %eax\nret", instructions.map{|n| n.output.strip }.join("\n")
  end

  def test_mov_output
    src = Minic::AssemblyAST::Imm.new("3")
    dest = Minic::AssemblyAST::Register.new
    mov = Minic::AssemblyAST::Mov.new(src, dest)

    assert_equal "movl $3, %eax", mov.output.strip
  end

  def test_ast_output
    tokens = ::Minic::Lexer.tokenize("int main(void) {\n\treturn 2;\n}")
    ast = Minic::Parser.parse(tokens)
    assembly_ast = Minic::CodeGen.generate_code(ast)

    puts assembly_ast.output
  end
end
