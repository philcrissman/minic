module Minic
  module AST
    Program = Struct.new(:function_definition)

    Function = Struct.new(:identifier_name, :body)

    ReturnStatement = Struct.new(:expression)

    ConstantExpression = Struct.new(:int_constant)
  end
end
