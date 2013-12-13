require 'spec_helper'

describe SudokuValidator do
  before :each do
    @sudoku_validator = SudokuValidator.new "valid_incomplete.sudoku"
  end

  describe '#new' do
    it "takes one parameter - the filename and returns a SudokuValidator object" do
      @sudoku_validator.should be_an_instance_of SudokuValidator
    end
  end

  describe 'any_duplicates?' do

    subject { SudokuValidator.new("invalid_incomplete.sudoku").any_duplicates?(num_set) }

    context 'no duplicates' do
      let(:num_set) { %w(1 3 5 7 . 4 . 6 9)}
      it {should be_false}
    end

    context 'duplicates' do
      let(:num_set) { %w( 1 3 2 5 . . 3 5.) }
      it {should be_true}
    end
  end

  describe '#rows' do
    subject { SudokuValidator.new("invalid_incomplete.sudoku").rows }
    it { should == {  0 => %w(8 5 . . . 2 4 . .),
                      1 => %w(7 2 . . 8 . . . 9),
                      2 => %w(. . 4 . . . . . .),
                      3 => %w(. . . 1 . 7 . . 2),
                      4 => %w(3 . 5 . . . 9 . .),
                      5 => %w(. 4 . . . . . . .),
                      6 => %w(. 5 . . 8 . . 7 .),
                      7 => %w(. 1 7 . . . . . .),
                      8 => %w(. . . . 3 6 . 4 .)}}
  end

  describe '#columns' do
    subject { SudokuValidator.new("invalid_incomplete.sudoku").columns }
    it { should == { 0 => %w(8 7 . . 3 . . . .),
                     1 => %w(5 2 . . . 4 5 1 .),
                     2 => %w(. . 4 . 5 . . 7 .),
                     3 => %w(. . . 1 . . . . .),
                     4 => %w(. 8 . . . . 8 . 3),
                     5 => %w(2 . . 7 . . . . 6),
                     6 => %w(4 . . . 9 . . . .),
                     7 => %w(. . . . . . 7 . 4),
                     8 => %w(. 9 . 2 . . . . .)}}
  end

  describe '#grids' do
    subject { SudokuValidator.new("invalid_incomplete.sudoku").grids }
    it { should == { 0 => %w(8 5 . 7 2 . . . 4),
                     1 => %w(. . 2 . 8 . . . .),
                     2 => %w(4 . . . . 9 . . .),
                     3 => %w(. . . 3 . 5 . 4 .),
                     4 => %w(1 . 7 . . . . . .),
                     5 => %w(. . 2 9 . . . . .),
                     6 => %w(. 5 . . 1 7 . . .),
                     7 => %w(. 8 . . . . . 3 6),
                     8 => %w(. 7 . . . . . 4 .)}}

  end

  describe '#row' do
    subject { SudokuValidator.new("invalid_incomplete.sudoku").row(0) }
    it {should == %w(8 5 . . . 2 4 . .) }
  end

  describe '#column' do
    subject { SudokuValidator.new("invalid_incomplete.sudoku").column(1) }
    it { should == %w(5 2 . . . 4 5 1 .)}
  end

  describe '#grid' do
    subject { SudokuValidator.new("invalid_incomplete.sudoku").grid(3) }
    it {should == %w( . . . 3 . 5 . 4 .)}
  end

  describe '#sudoku_valid?' do
    context "known valid sudoku" do
      subject { SudokuValidator.new("valid_complete.sudoku").sudoku_valid?}
      it {should be_true}
    end

    context "invalid sudoku" do
      subject { SudokuValidator.new("invalid_incomplete.sudoku").sudoku_valid?}
      it {should be_false}
    end
  end

  describe '#sudoku_complete?' do
    context "known complete sudoku" do
      subject { SudokuValidator.new("valid_complete.sudoku").sudoku_valid?}
      it {should be_true}
    end

    context "known incomplete sudoku" do
      subject { SudokuValidator.new("invalid_incomplete.sudoku").sudoku_valid?}
      it {should be_false}
    end
  end

  describe '#sudoku_state' do
    context "known valid complete sudoku" do
      subject { SudokuValidator.new("valid_complete.sudoku").sudoku_state}
      it {should == "This sudoku is valid."}
    end

    context "known valid incomplete sudoku" do
      subject { SudokuValidator.new("valid_incomplete.sudoku").sudoku_state }
      it {should == "This sudoku is valid, but incomplete."}
    end

    context "invalid_complete" do
      subject { SudokuValidator.new("invalid_complete.sudoku").sudoku_state }
      it {should == "This sudoku is invalid."}
    end

    context "invalid incomplete" do
      subject { SudokuValidator.new("invalid_incomplete.sudoku").sudoku_state }
      it {should == "This sudoku is invalid."}
    end
  end
end
