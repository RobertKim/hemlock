require_relative 'flashcard'
require 'csv'

module Hemlock
  class CSVtoFlashcards

    def self.create_flashcards(folder_name)
      flashcards = []
      Dir["#{folder_name}/*.csv"].each do |file|
        flashcards = from_file(file)
      end
      return flashcards.flatten
    end

    def self.from_file(file)
      flashcards = []
      CSV.read(file).each do |row|
        flashcards << Flashcard.new(row[0], row[1])
      end
      return flashcards
    end
  end
end
