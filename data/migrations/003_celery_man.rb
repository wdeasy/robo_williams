Sequel.migration do
  change do
    puts "Kicking up the 4d3d3d3..."
    
    from(:messages).insert([:regex, :file, :time],
      ['\b[c][e][l][e][r][y][ ]?[m][a][n]\b','celery5.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[c][e][l][e][r][y][ ]?[m][a][n]\b','celery7.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[c][e][l][e][r][y][ ]?[m][a][n]\b','celery8.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[4][d][3][d][3][d][3]\b','celery6.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[m][o][z][z][a]-?[r][e][l][l]\b','mozza19.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[m][o][z][z][a]-?[r][e][l][l]\b','mozza20.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[o][y][s][t][e][r] [s][m][i][l][i][n][g]\b','oyster12.png',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[o][y][s][t][e][r]\b','oyster9.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[o][y][s][t][e][r]\b','oyster10.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[o][y][s][t][e][r]\b','oyster11.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[n][u][d][e] [t][a][y][n][e]\b','tayne18.png',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[t][a][y][n][e]\b','tayne13.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[t][a][y][n][e]\b','tayne14.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[t][a][y][n][e]\b','tayne17.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[f][l][a][r][h][g][u][n][n][s][t][o][w]\b','tayne15.gif',DateTime.now()])
    from(:messages).insert([:regex, :file, :time],
      ['\b[h][a][t] [w][o][b][b][l][e]\b','tayne16.gif',DateTime.now()])
  end
end
