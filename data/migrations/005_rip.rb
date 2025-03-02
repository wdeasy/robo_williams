# frozen_string_literal: true

Sequel.migration do
  up do
    puts 'Put some speck on it...'

    from(:messages).insert(%i[regex text emoji],
                           ['\b[r][i][p]\b', 'Press F to put some speck on it', '🇫'])
  end
end
