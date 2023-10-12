Sequel.migration do
  change do
    puts "Sports..."
    
    from(:messages).insert([:regex, :file, :time],
    ['\b[s][p][o][r][t][s]\b','sports.gif',DateTime.now()])
  end
end
  