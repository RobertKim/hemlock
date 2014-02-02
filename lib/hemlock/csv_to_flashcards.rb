require_relative 'flashcard'
require 'csv'

module Hemlock
  class CSVtoFlashcards

    def self.default_flashcard_directory
      spec = Gem::Specification.find_by_name('hemlock')
      gem_root = spec.gem_dir
      folder = gem_root + '/flashcards'
    end

    def self.create_flashcards(folder_name)
      folder_name = default_flashcard_directory if folder_name.empty?
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
