class Game < ActiveRecord::Base

  enum result: [:won, :failed]

  before_validation :init_random_number, if: :new_record?
  validates :level, numericality: { greater_than_or_equal_to: 4, less_than_or_equal_to: 9 }
  validates_presence_of :random_number

  has_many :moves

  def init_random_number
    self.random_number = RandomNumberGenerator.rand(level, allow_repetitions) if random_number.nil?
  end

  def make_move!(number)
    result = check(number)
    move = moves.create!(result)
    close(:won) if result[:bulls] == level
    move
  end

  def over!
    close :failed
  end

  def closed?
    result.present?
  end

  private

  def close(result)
    self.result = result
    self.closed_at = Time.zone.now
    save!
  end

  def check(number)
    return {number: number, bulls: level, cows: 0} if number == random_number

    digits = number.to_s.split('').to_a
    my_digits = random_number.to_s.split('').to_a

    b = 0
    my_digits.each_with_index { |d, i| b += 1 if d == digits[i] }

    c = 0
    my_digits.each {|d| c += 1 if digits.include?(d) }

    {number: number, bulls: b, cows: c-b}
  end
end
