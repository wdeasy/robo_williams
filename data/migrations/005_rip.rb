# frozen_string_literal: true

Sequel.migration do
  change do
    puts 'Put some speck on it...'

    from(:messages).insert(%i[regex text emoji],
                           ['\b[r][i][p]\b', 'press F to put some speck on it.', '🇫'])
  end
end
