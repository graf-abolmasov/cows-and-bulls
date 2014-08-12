require 'rails_helper'

describe Move do

  describe 'validation' do

    subject { build :move, game: game }

    context 'when game is playing' do
      let(:game) { create :game }
      specify { expect(subject).to be_valid }
    end

    context 'when game is closed' do
      let(:game) { create :game, :won }
      specify { expect(subject).to_not be_valid }
    end
  end
end
