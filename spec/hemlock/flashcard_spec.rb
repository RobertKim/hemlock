require "spec_helper"

describe Hemlock::Flashcard do

  let(:flashcard) { Hemlock::Flashcard.new('blue', 'a great color') }

  specify { expect(flashcard.term).to eq 'blue' }
  specify { expect(flashcard.question).to eq 'blue' }

  specify { expect(flashcard.definition).to eq 'a great color' }
  specify { expect(flashcard.answer).to eq 'a great color' }

end
