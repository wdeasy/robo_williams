Sequel.migration do
  change do
    puts "Hello youtubes..."
    
    from(:messages).insert([:regex, :text, :time],
      ['\b[c][o][l][d] [o][u][t][s][i][d][e]\b','https://www.youtube.com/watch?v=m5vgrB3tlkk',DateTime.now()])

    from(:messages).insert([:regex, :text, :time],
      ['\b[p][u][t] [i][t] [i][n] [h][e][r] [b][u][t][t]\b','https://www.youtube.com/watch?v=uiWLMGNyDZU',DateTime.now()])

    from(:messages).insert([:regex, :text, :time],
      ['\b[d][e][l][i][v][e][r][t]\b','https://www.youtube.com/watch?v=OFtMVY-uD-0',DateTime.now()])

    from(:messages).insert([:regex, :text, :time],
      ['\b[b][a][z][i][n][g][a]\b','https://www.youtube.com/watch?v=dPiaxrE8-OI',DateTime.now()])

    from(:messages).insert([:regex, :text, :time],
      ['\b[s][t][e][ea][l][ ]?[r][o][s][e]\b','https://www.youtube.com/watch?v=wxIMfW0Z2Bk',DateTime.now()])

    from(:messages).insert([:regex, :text, :time],
      ['\b[h][e][r][e] [w][e] [g][o]\b','https://www.youtube.com/watch?v=EmMM4fOVzPA',DateTime.now()])

    from(:messages).insert([:regex, :text, :time],
      ['\b[m][yeua\'][h]?[ ]?[b][ae]?[b][ye][h]?\s+[g][iuy][ru][lh]?\b','https://www.youtube.com/watch?v=ZTfxHh6NM48',DateTime.now()])

    from(:messages).insert([:regex, :text, :time],
      ['\b[s][h][e][\'s]?[s]? [m][y] [w][ai][if][fe][u]?\b','https://youtu.be/xx3eUXY0Ck4',DateTime.now()])

  end
end
