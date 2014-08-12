object :@move
attributes :cows, :bulls
node(:won) { |move| @game.won? }
