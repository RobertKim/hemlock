require_relative 'CSVtoFlashcards'

module Hemlock
  class CLI < Thor

    desc "drink", "memory through written repetition - Socrates is disappointed"
    def drink(folder_name="~/Dropbox/bar_flashcards")
      initialize_flashcards(folder_name)
      42.times do
        flashcard = get_random_flashcard
        answer = ask(flashcard.question)
        if answer == flashcard.answer
          puts 'Correct!'
        else
          punishment(flashcard)
        end
      end
    end

    private

    def initialize_flashcards(folder_name)
      @flashcards = CSVtoFlashcard.create_flashcards(folder_name)
    end

    def get_random_flashcard
      seed = rand(0..(@flashcards.legnth - 1))
    end

    def punishment(flashcard)
      3.times do
        ask(flashcard.question)
      end
      puts 'Get it right next time!'
    end
  end
end
