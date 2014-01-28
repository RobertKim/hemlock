module Hemlock
  class Flashcard
    def initialize(term, definition)
      @term = term
      @definition = definition
    end

    attr_reader :term, :definition

    alias_method :question, :term
    alias_method :answer, :definition

    def correct?(guess)
      guess.upcase == self.answer.upcase ? true : false
    end
  end
end
