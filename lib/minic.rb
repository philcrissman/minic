# frozen_string_literal: true

require_relative "minic/version"
require_relative "minic/driver"
require_relative "minic/lexer"
require_relative "minic/ast"
require_relative "minic/parser"
require_relative "minic/assembly_ast.rb"
require_relative "minic/code_gen.rb"
require 'pry'
require 'pry-byebug'

module Minic
  class Error < StandardError; end

  def self.start file, opts
    Minic::Driver.run file, opts
  end
end
