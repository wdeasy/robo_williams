# frozen_string_literal: true

Sequel.migration do
  up do
    puts 'Kicking up the 4d3d3d3...'

    celery = [
      { regex: '\b[c][e][l][e][r][y][ ]?[m][a][n]\b', file: 'celery5.gif' },
      { regex: '\b[c][e][l][e][r][y][ ]?[m][a][n]\b', file: 'celery7.gif' },
      { regex: '\b[c][e][l][e][r][y][ ]?[m][a][n]\b', file: 'celery8.gif' },
      { regex: '\b[4][d][3][d][3][d][3]\b', file: 'celery6.gif' },
      { regex: '\b[m][o][z][z][a]-?[r][e][l][l]\b', file: 'mozza19.gif' },
      { regex: '\b[m][o][z][z][a]-?[r][e][l][l]\b', file: 'mozza20.gif' },
      { regex: '\b[o][y][s][t][e][r] [s][m][i][l][i][n][g]\b', file: 'oyster12.png' },
      { regex: '\b[o][y][s][t][e][r]\b', file: 'oyster9.gif' },
      { regex: '\b[o][y][s][t][e][r]\b', file: 'oyster10.gif' },
      { regex: '\b[o][y][s][t][e][r]\b', file: 'oyster11.gif' },
      { regex: '\b[n][u][d][e] [t][a][y][n][e]\b', file: 'tayne18.png' },
      { regex: '\b[t][a][y][n][e]\b', file: 'tayne13.gif' },
      { regex: '\b[t][a][y][n][e]\b', file: 'tayne14.gif' },
      { regex: '\b[t][a][y][n][e]\b', file: 'tayne17.gif' },
      { regex: '\b[f][l][a][r][h][g][u][n][n][s][t][o][w]\b', file: 'tayne15.gif' },
      { regex: '\b[h][a][t] [w][o][b][b][l][e]\b', file: 'tayne16.gif' }
    ]

    from(:messages).multi_insert(celery)
  end
end
