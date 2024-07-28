# frozen_string_literal: true

Sequel.migration do
  change do
    puts 'Sports...'

    from(:messages).insert(%i[regex file],
                           ['\b[s][p][o][r][t][s]\b', 'sports.gif'])
  end
end
