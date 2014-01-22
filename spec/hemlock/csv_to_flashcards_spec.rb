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

  context '#create_flashcards' do
    specify { expect(subject.create_flashcards(nil)).to_not eq [] }
  end

  context "#replace_tildes" do
    let(:dropbox) { "~/dropbox/" }
    let(:ohmy) { "~/ohmy~/" }

    specify { expect(subject.replace_tildes(dropbox)).to eq "#{Dir.home}/dropbox/" }
    specify { expect(subject.replace_tildes(ohmy)).to eq "#{Dir.home}/ohmy~/" }
  end
end
