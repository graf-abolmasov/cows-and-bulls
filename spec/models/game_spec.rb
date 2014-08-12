require 'rails_helper'

describe Game do

  describe '#over' do
    let!(:game) { create :game }
    subject { game }
    it { expect { subject.over! }.to change(game, :failed?).to(true) }
  end

  describe '#make_move' do
    let(:random_number) { 12345 }
    let(:number) { random_number }
    let(:level) { 5 }
    let!(:game) { create :game, level: level, random_number: random_number }

    subject do
      move = game.make_move!(number)
      {b: move.bulls, c: move.cows}
    end

    it { expect { subject }.to change(Move, :count).by(1) }
    it { expect { subject }.to change(game.moves, :count).by(1) }

    context 'when win' do
      it { expect(subject).to eq({b: level, c: 0}) }
      it { expect { subject }.to change(game, :won?).to(true) }
    end

    context 'when closed' do
      before { game.update_attribute(:result, :won) }
      it { expect { subject }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'when only cows' do
      context 'when single cow' do
        let(:random_number) { 12345 }
        let(:number) { 98756 }
        it { expect(subject).to eq({b: 0, c: 1}) }
      end
      context 'when multiple cows' do
        let(:random_number) { 12345 }
        let(:number) { 98754 }
        it { expect(subject).to eq({b: 0, c: 2}) }
      end
      context 'when all cows' do
        let(:random_number) { 12345 }
        let(:number) { 53421 }
        it { expect(subject).to eq({b: 0, c: 5}) }
      end
    end

    context 'when only bulls' do
      context 'when single bull' do
        let(:random_number) { 12345 }
        let(:number) { 98765 }
        it { expect(subject).to eq({b: 1, c: 0}) }
      end
      context 'when multiple bulls' do
        let(:random_number) { 12345 }
        let(:number) { 98745 }
        it { expect(subject).to eq({b: 2, c: 0}) }
      end
    end

    context 'when cows and bulls' do
      let(:random_number) { 12345 }
      let(:number) { 92715 }
      it { expect(subject).to eq({b: 2, c: 1}) }
    end
  end

  describe 'validation' do
    let!(:game) { build :game, level: level }
    subject { game }

    context 'when valid' do
      let(:level) { 6 }
      it { expect(subject).to be_valid }
    end

    context 'when wrong level' do
      context 'when level < 4' do
        let(:level) { 3 }
        it { expect(subject).to_not be_valid }
      end

      context 'when level > 9' do
        let(:level) { 10 }
        it { expect(subject).to_not be_valid }
      end
    end
  end
end
