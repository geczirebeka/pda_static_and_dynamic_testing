require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../card_game')
require_relative('../card')

class CardGameTest < Minitest::Test

    def setup

        @card1 = Card.new("ace", 1)
        @card2 = Card.new("king", 10)

        @cards = [@card1, @card2]

        @card_game = CardGame.new()
    end

    def test_card_game_has_ace
        result = @card_game.check_for_ace(@card1)
        assert_equal(true, result)
    end

    def test_highest_card
        result = @card_game.highest_card(@card1, @card2)
        assert_equal(@card2, result)
    end

    def test_cards_total
        result = CardGame.cards_total(@cards)
        assert_equal("You have a total of 11", result)
    end

end
