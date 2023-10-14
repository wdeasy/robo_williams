Sequel.migration do
  change do
    puts "Adding Shoutouts..."

    from(:shoutouts).insert([:name, :day, :discord],
      ["Richard Dunn's Clone",'1900-01-02',nil])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-01-03',"<@294353126671122444>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-01-08',"<@!160619908063952907>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-02-02',"<@!302219894454222859>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-03-19',"<@!165489755620900864>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-04-18',"<@!195331188540309505>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-05-15',"<@!165310795360632832>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["Rune Niserius",'1900-06-13',nil])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-06-27',"<@!165613111368351744>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-08-18',"<@!165313516985778176>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["'nil'",'1900-08-27',"<@164140817718575106>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["THE CAT FRANKLIN",'1900-09-16',nil])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-09-22',"<@!154437803562762240>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-10-07',"<@186187913745137675>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-10-07',"<@165310768286400513>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-11-21',"<@!95203364001812480>"])
    from(:shoutouts).insert([:name, :day, :discord],
      ["",'1900-07-25',"<@!168179450666680322>"])
  end
end
