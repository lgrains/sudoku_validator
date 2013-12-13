
namespace :sudoku do
  task :find_state => :environment do
    input = ''
    STDOUT.puts "path/to/file to convert: "
    input = STDIN.gets.chomp
    SudokuGrid.new(input).sudoku_state
  end
end
