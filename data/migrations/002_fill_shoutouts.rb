# frozen_string_literal: true

Sequel.migration do
  up do
    puts 'Adding Shoutouts...'

    shoutouts = [
      { name: "Richard Dunn's Clone", day: '1900-01-02', discord: nil },
      { name: '', day: '1900-01-03', discord: '<@294353126671122444>' },
      { name: '', day: '1900-01-08', discord: '<@!160619908063952907>' },
      { name: '', day: '1900-02-02', discord: '<@!302219894454222859>' },
      { name: '', day: '1900-03-19', discord: '<@!165489755620900864>' },
      { name: '', day: '1900-04-18', discord: '<@!195331188540309505>' },
      { name: '', day: '1900-05-15', discord: '<@!165310795360632832>' },
      { name: 'Rune Niserius', day: '1900-06-13', discord: nil },
      { name: '', day: '1900-06-27', discord: '<@!165613111368351744>' },
      { name: '', day: '1900-08-18', discord: '<@!165313516985778176>' },
      { name: '', day: '1900-08-27', discord: '<@164140817718575106>' },
      { name: 'THE CAT FRANKLIN', day: '1900-09-16', discord: nil },
      { name: '', day: '1900-09-22', discord: '<@!154437803562762240>' },
      { name: '', day: '1900-10-07', discord: '<@186187913745137675>' },
      { name: '', day: '1900-10-07', discord: '<@165310768286400513>' },
      { name: '', day: '1900-11-21', discord: '<@!95203364001812480>' },
      { name: '', day: '1900-07-25', discord: '<@!168179450666680322>' }
    ]

    from(:shoutouts).multi_insert(shoutouts)
  end
end
