require 'sudoku_validator'
require "sudoku_grid"

module SudokuValidator
  class Validate
    def self.validate_grid(filename)
      grid = SudokuGrid.new(filename)
      grid.sudoku_state
    end
  end
end
