
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

