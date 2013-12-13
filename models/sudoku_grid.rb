class SudokuGrid

  def initialize(filename)
    @sudoku_grid = {}
    counter = 1
    file = File.new(filename, "r")
    while (line = file.gets)
      line = file.gets if line[0] =='-'
      vector3 =  line.strip.split("|")
      @sudoku_grid[counter-1] = vector3.inject([]){ |arr, vs| arr << vs.split(' ') }
      @sudoku_grid[counter-1].flatten!

      counter = counter + 1
    end
    file.close
    # puts @sudoku_grid
  end

    def rows
    (0..8).inject({}){ |hash,row_num| hash[row_num] = row(row_num);hash }
  end

  def columns
    (0..8).inject({}){ |hash, col_num| hash[col_num] = column(col_num);hash}

  end

  def grids
    (0..8).inject({}){ |hash, grid_num| hash[grid_num] = grid(grid_num);hash}
  end

  def sudoku_state
    if sudoku_valid? && sudoku_complete?
      "This sudoku is valid."
    elsif sudoku_valid?
      "This sudoku is valid, but incomplete."
    else
      "This sudoku is invalid."
    end
  end

  def sudoku_valid?
    valid?(rows) && valid?(columns) && valid?(grids)
  end

  def sudoku_complete?
    complete?(rows) && complete?(columns) && complete?(grids)
  end

  def valid?(num_set_hash)
    num_set_hash.values.each do | arr |
      return false if !duplicates?(arr)
    end
    return true
  end

  def complete?(num_set_hash)
    num_set_hash.values.each do | arr |
      return false if incomplete?(arr)
    end
    return true
  end

  def duplicates?(num_set)
    no_periods = num_set - ['.']
    set = Set.new(no_periods)
    return no_periods.size == set.size
  end

  def incomplete?(row)
    row.each do |n|
      return true if n == '.'
    end
    return false
  end

  def column(col_number)
    (0..8).inject([]){|arr, index| arr << @sudoku_grid[index][col_number]}
  end

  def grid(grid_number)
    row_set = row_numbers_for_grid(grid_number)
    col_set = column_numbers_for_grid(grid_number)

    result=[]

    row_set.each do |row_num|
      col_set.each do |col_num|
        result << @sudoku_grid[row_num][col_num]
      end
    end
    result
  end

  def row(row_num)
    @sudoku_grid[row_num]
  end

  def row_numbers_for_grid(grid_number)
    row_sets = [[0,1,2],[3,4,5],[6,7,8]]
    return row_sets[grid_number / 3]
  end

  def column_numbers_for_grid(grid_number)
    col_sets = [[0,1,2],[3,4,5],[6,7,8]]
    return col_sets[grid_number % 3]
  end

end
