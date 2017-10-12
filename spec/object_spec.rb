
#
# specifying ect
#
# Thu Oct 12 16:15:04 JST 2017
#

require 'spec_helper'


describe 'Object#deflect' do

  it 'yields self and returns the yielded result' do

    expect(
      (1..21).deflect { |a| a.reduce(:+) }
    ).to eq(
      231
    )
  end
end

