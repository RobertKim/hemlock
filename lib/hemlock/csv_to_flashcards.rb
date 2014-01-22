require_relative 'flashcard'
require 'csv'

module Hemlock
  class CSVtoFlashcards

    def self.create_flashcards(folder_name)
      folder_name = "~/Dropbox/bar_flashcards" if folder_name.empty?
      folder_name = self.replace_tildes(folder_name)
      flashcards = []
      Dir["#{folder_name}/*.csv"].each do |file|
        flashcards << self.from_file(file)
      end
      return flashcards.flatten
    end

    def self.from_file(file)
      flashcards = []
      CSV.read(file).each do |row|
        flashcards << Flashcard.new(row[0], row[1]) unless row[0].nil?
      end
      return flashcards
    end

    def self.replace_tildes(folder_name)
      folder_name.sub(/~/, Dir.home)
    end
  end
end
