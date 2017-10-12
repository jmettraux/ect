
#
# specifying ect
#
# Thu Oct 12 15:46:20 JST 2017
#

require 'spec_helper'

describe 'Enumerable#bisect' do

  it 'is an alias to partition' do

    expect(
      (1..21).bisect(&:odd?)
    ).to eq(
      (1..21).partition(&:odd?)
    )
  end
end

describe 'Enumerable#dissect' do

  it 'partitions into multiple arrays' do

    a0, a1, a2 = (1..14).dissect { |i| i % 3 }

    expect(a0).to eq([ 3, 6, 9, 12 ])
    expect(a1).to eq([ 1, 4, 7, 10, 13 ])
    expect(a2).to eq([ 2, 5, 8, 11, 14 ])
  end

  it 'returns nil instead of unpopulated arrays' do

    a0, a1, a2 = (1..14)
      .dissect { |i|
        case m = i % 3
        when 0, 2 then m
        else 0
        end }

    expect(a0).to eq([ 1, 3, 4, 6, 7, 9, 10, 12, 13 ])
    expect(a1).to eq(nil)
    expect(a2).to eq([ 2, 5, 8, 11, 14 ])
  end
end

