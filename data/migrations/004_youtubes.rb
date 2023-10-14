Sequel.migration do
  change do
    puts "Hello youtubes..."
    
    from(:messages).insert([:regex, :text],
      ['\b[c][o][l][d] [o][u][t][s][i][d][e]\b','https://www.youtube.com/watch?v=m5vgrB3tlkk'])

    from(:messages).insert([:regex, :text],
      ['\b[p][u][t] [i][t] [i][n] [h][e][r] [b][u][t][t]\b','https://www.youtube.com/watch?v=uiWLMGNyDZU'])

    from(:messages).insert([:regex, :text],
      ['\b[d][e][l][i][v][e][r][t]\b','https://www.youtube.com/watch?v=OFtMVY-uD-0'])

    from(:messages).insert([:regex, :text],
      ['\b[b][a][z][i][n][g][a]\b','https://www.youtube.com/watch?v=dPiaxrE8-OI'])

    from(:messages).insert([:regex, :text],
      ['\b[s][t][e][ea][l][ ]?[r][o][s][e]\b','https://www.youtube.com/watch?v=wxIMfW0Z2Bk'])

    from(:messages).insert([:regex, :text],
      ['\b[h][e][r][e] [w][e] [g][o]\b','https://www.youtube.com/watch?v=EmMM4fOVzPA'])

    from(:messages).insert([:regex, :text],
      ['\b[m][yeua\'][h]?[ ]?[b][ae]?[b][ye][h]?\s+[g][iuy][ru][lh]?\b','https://www.youtube.com/watch?v=ZTfxHh6NM48'])

    from(:messages).insert([:regex, :text],
      ['\b[s][h][e][\'s]?[s]? [m][y] [w][ai][if][fe][u]?\b','https://youtu.be/xx3eUXY0Ck4'])

  end
end
