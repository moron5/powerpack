require 'spec_helper'

describe 'Enumerable#exactly' do
  context 'with block' do
    it 'returns true for exact number of matches' do
      expect([1, 2, 3, 4].exactly?(2, &:even?)).to be_true
    end

    it 'returns false for less matches' do
      expect([1, 3, 4].exactly?(2, &:even?)).to be_false
    end

    it 'returns false for more matches' do
      expect([1, 3, 4, 6, 8].exactly?(2, &:even?)).to be_false
    end
  end

  context 'without block' do
    it 'returns true for exact number of non nil/false elements' do
      expect([1, 2, 3, 4].exactly?(4)).to be_true
    end

    it 'returns false if there are less non nil/false elements' do
      expect([1, nil, false].exactly?(4)).to be_false
    end
  end
end
