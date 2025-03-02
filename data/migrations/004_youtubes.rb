# frozen_string_literal: true

Sequel.migration do
  up do
    puts 'Hello youtubes...'

    youtubes = [
      { regex: '\b[c][o][l][d] [o][u][t][s][i][d][e]\b', text: 'https://www.youtube.com/watch?v=m5vgrB3tlkk' },
      { regex: '\b[p][u][t] [i][t] [i][n] [h][e][r] [b][u][t][t]\b',
        text: 'https://www.youtube.com/watch?v=uiWLMGNyDZU' },
      { regex: '\b[d][e][l][i][v][e][r][t]\b', text: 'https://www.youtube.com/watch?v=OFtMVY-uD-0' },
      { regex: '\b[b][a][z][i][n][g][a]\b', text: 'https://www.youtube.com/watch?v=dPiaxrE8-OI' },
      { regex: '\b[s][t][e][ea][l][ ]?[r][o][s][e]\b', text: 'https://www.youtube.com/watch?v=wxIMfW0Z2Bk' },
      { regex: '\b[h][e][r][e] [w][e] [g][o]\b', text: 'https://www.youtube.com/watch?v=EmMM4fOVzPA' },
      { regex: '\b[m][yeua\'][h]?[ ]?[b][ae]?[b][ye][h]?\s+[g][iuy][ru][lh]?\b',
        text: 'https://www.youtube.com/watch?v=ZTfxHh6NM48' },
      { regex: '\b[s][h][e][\'s]?[s]? [m][y] [w][ai][if][fe][u]?\b', text: 'https://youtu.be/xx3eUXY0Ck4' }
    ]

    from(:messages).multi_insert(youtubes)
  end
end
