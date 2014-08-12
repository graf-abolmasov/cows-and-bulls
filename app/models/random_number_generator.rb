class RandomNumberGenerator

  def self.rand(level = 4, allow_repetitions = false)
    if level < 4
      Rails.logger.warn 'Minimum level is 4. Force level to 4'
      level = 4
    end

    if level > 9
      Rails.logger.warn 'Maximum level is 9. Force level to 9'
      level = 9
    end

    if allow_repetitions
      random_number_allowed_repetitions(level)
    else
      random_number_without_repetitions(level)
    end
  end

  private

  def self.random_number_allowed_repetitions(level)
    max = 10**level - 1
    min = 10**(level-1)
    min + Random.rand(max - min)
  end

  def self.random_number_without_repetitions(level)
    first_digit = (1..9).to_a.sample
    digits = (0..9).to_a
    digits.delete(first_digit)
    digits = digits.sample(level - 1).unshift(first_digit)
    digits.join.to_i
  end
end