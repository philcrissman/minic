# frozen_string_literal: true

require_relative "minic/version"
require_relative "minic/driver"
require_relative "minic/lexer"

module Minic
  class Error < StandardError; end

  def self.start file, opts
    Minic::Driver.run file, opts
  end
end
