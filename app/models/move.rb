class Move < ActiveRecord::Base
  belongs_to :game

  validates_presence_of :number
  validate :game_not_closed
  validate :number_matches_level

  private

  def number_matches_level
    level = game.level
    min = 10**(level-1)
    max = 10**level
    errors.add(:number, "Number not in range [#{min}..#{max}") if number < 10**(level-1) || number >= 10**level
  end

  def game_not_closed
    errors.add(:game, 'Cannot make move in closed game') if game.closed?
  end
end
