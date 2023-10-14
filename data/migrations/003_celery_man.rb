Sequel.migration do
  change do
    puts "Kicking up the 4d3d3d3..."
    
    from(:messages).insert([:regex, :file],
      ['\b[c][e][l][e][r][y][ ]?[m][a][n]\b','celery5.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[c][e][l][e][r][y][ ]?[m][a][n]\b','celery7.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[c][e][l][e][r][y][ ]?[m][a][n]\b','celery8.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[4][d][3][d][3][d][3]\b','celery6.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[m][o][z][z][a]-?[r][e][l][l]\b','mozza19.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[m][o][z][z][a]-?[r][e][l][l]\b','mozza20.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[o][y][s][t][e][r] [s][m][i][l][i][n][g]\b','oyster12.png'])
    from(:messages).insert([:regex, :file],
      ['\b[o][y][s][t][e][r]\b','oyster9.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[o][y][s][t][e][r]\b','oyster10.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[o][y][s][t][e][r]\b','oyster11.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[n][u][d][e] [t][a][y][n][e]\b','tayne18.png'])
    from(:messages).insert([:regex, :file],
      ['\b[t][a][y][n][e]\b','tayne13.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[t][a][y][n][e]\b','tayne14.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[t][a][y][n][e]\b','tayne17.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[f][l][a][r][h][g][u][n][n][s][t][o][w]\b','tayne15.gif'])
    from(:messages).insert([:regex, :file],
      ['\b[h][a][t] [w][o][b][b][l][e]\b','tayne16.gif'])
  end
end
