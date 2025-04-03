# frozen_string_literal: true

Sequel.migration do
  up do
    puts 'Wait a minute! Who are you?'

    from(:messages).insert(%i[regex text],
                          ['\b[n][i][c][k]\b', 'Who the fuck is Nick?'])
  end
end