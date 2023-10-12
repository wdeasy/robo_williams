Sequel.migration do
  change do
    puts "Put some speck on it..."

    from(:messages).insert([:regex, :text, :emoji, :time],
      ['\b[r][i][p]\b','press F to put some speck on it.','🇫',DateTime.now()])
  end
end
