require 'spec_helper'

describe Hemlock::Turn do

  subject { described_class }
  let(:flashcard) { Hemlock::Flashcard.new('blue', 'a great color') }
  let(:turn) { Hemlock::Turn.new(flashcard) }

  context '#take_turn' do
    it 'should print correct on a correct guess' do
      pending
    end

    it 'should punish the user for an incorrect guess' do
      pending
    end
  end
end
