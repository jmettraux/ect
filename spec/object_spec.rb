
#
# specifying ect
#
# Thu Oct 12 16:15:04 JST 2017
#

require 'spec_helper'


describe Object do

  describe '#inflect' do

    it 'is an alias to #tap' do

      a = nil

      expect(
        (0..9).inflect { |x| a = x; -1 }
      ).to eq(
        0..9
      )

      expect(a).to eq(0..9)
    end
  end

  describe '#deflect' do

    it 'yields self and returns the yielded result' do

      expect(
        (1..21).deflect { |a| a.reduce(:+) }
      ).to eq(
        231
      )
    end
  end
end

