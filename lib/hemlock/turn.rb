require 'readline'
require 'rainbow'

module Hemlock
  class Turn

    def initialize(flashcard)
      @flashcard = flashcard
    end

    def take_turn
      puts @flashcard.question
      guess = Readline.readline('>> ', false)
      if @flashcard.correct?(guess)
        puts Rainbow('Correct').green
      else
        puts Rainbow('You must submit to the quarries').red
        punishment
      end
    end

    private

    def punishment
      i = 1
      while i < 3 do
        puts @flashcard.question
        puts @flashcard.answer
        guess = Readline.readline('>> ', true)
        break if guess == 'next'.downcase
        if @flashcard.correct?(guess)
          i += 1
        else
          puts Rainbow('Who are you? Sisyphus?!').red
          redo
        end
      end
    end
  end
end
