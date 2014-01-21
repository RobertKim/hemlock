require 'spec_helper'

describe Hemlock::CSVtoFlashcards do

  subject { described_class }
  let(:csv) { './spec/stub.csv' }

  context '#from_file' do
    let(:flashcards) { subject.from_file(csv) }

    specify { expect(flashcards.length).to eq 3 }
    specify { expect(flashcards.first).to be_a_kind_of Hemlock::Flashcard }
    specify { expect(flashcards.first.question).to eq 'do' }
    specify { expect(flashcards.last.answer).to eq 'a name I call myself' }
  end
end
