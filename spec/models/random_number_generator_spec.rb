require 'rails_helper'

describe RandomNumberGenerator do

  subject { RandomNumberGenerator.rand(level, allow_repetitions) }

  describe '#rand' do
    context 'when repetitions are allowed' do
      let(:allow_repetitions) { true }
      (4...9).each do |l|
        context "when level #{l}" do
          let(:level) { l }
          it { expect(subject).to be >= 10**(level-1) }
          it { expect(subject).to be < 10**level }
        end
      end
    end

    context 'when repetitions are not allowed' do
      let(:allow_repetitions) { false }

      (4...9).each do |l|
        context "when level #{l}" do
          let(:level) { l }
          it('contains uniq digits') { expect(subject.to_s.split('').uniq.size).to eq(level) }
        end
      end
    end
  end
end
