namespace :populate_players_and_rankings do
  response = HTTParty.get(ENV['ranked_player_info_url'])
  payload ||= Nokogiri::HTML(response)

  desc 'Populate all players and rankings'
  task all: %i[rankings_2017 rankings_2016 rankings_2015 rankings_2014 rankings_2013] do
    puts "\rFinished populating all players and rankings"
  end

  desc 'Populate 2017 ssbm rankings and players'
  task rankings_2017: :environment do
    puts "\rCreating and populating 2017 ranking"
    table = payload.css('.content8').css('table').first
    rows = table.css('tr')
    rows.map do |row|
      row_values = row.css('td').map(&:text)
      next if row_values.blank?
      @player = Player.find_or_create_by(gamer_tag: row_values[2].downcase.strip,
                                         country: row.css('td')[1].css('a')[0]['title'].downcase.strip)
      @player.characters = row.css('td')[3].css('img').map { |i| i['alt'] }
      @player.miom_rankings.create(year: '2017',
                                   score: row_values[4].to_f,
                                   change: (row_values[5].squish.include?('9000') ? 'NEW' : row_values[5].squish),
                                   rank: row_values[0].to_f)
      @player.save
    end
    puts "\r2017 ranking done"
  end

  desc 'Populate 2016 ssbm rankings and players'
  task rankings_2016: :environment do
    puts "\rCreating and populating 2016 ranking"
    table = payload.css('.content6').css('table').first
    rows = table.css('tr')
    rows.map do |row|
      row_values = row.css('td').map(&:text)
      next if row_values.blank?
      @player = Player.find_or_create_by(gamer_tag: row_values[2].downcase.strip,
                                         country: row.css('td')[1].css('a')[0]['title'].downcase.strip)
      @player.characters = row.css('td')[3].css('img').map { |i| i['alt'] }
      @player.miom_rankings.create(year: '2016',
                                   score: (row_values[4].include?('.') ? row_values[4].delete('.').insert(2, '.').to_f : row_values[4].insert(1, '0').to_f),
                                   change: (row_values[5].squish.include?('9000') ? 'NEW' : row_values[5].squish),
                                   rank: row_values[0].to_f)
      @player.save
    end
    puts "\r2016 ranking done"
  end

  desc 'Populate 2015 ssbm rankings and players'
  task rankings_2015: :environment do
    puts "\rCreating and populating 2015 ranking"
    table = payload.css('.content5').css('table').first
    rows = table.css('tr')
    rows.map do |row|
      row_values = row.css('td').map(&:text)
      next if row_values.blank?
      @player = Player.find_or_create_by(gamer_tag: row_values[2].downcase.strip,
                                         country: row.css('td')[1].css('a')[0]['title'].downcase.strip)
      @player.characters = row.css('td')[3].css('img').map { |i| i['alt'] }
      @player.miom_rankings.create(year: '2015',
                                   score: (row_values[4].include?('.') ? row_values[4].delete('.').insert(2, '.').to_f : row_values[4].insert(1, '0').to_f),
                                   change: (row_values[5].squish.include?('9000') ? 'NEW' : row_values[5].squish),
                                   rank: row_values[0].to_f)
      @player.save
    end
    puts "\r2015 ranking done"
  end

  desc 'Populate 2014 ssbm rankings and players'
  task rankings_2014: :environment do
    puts "\rCreating and populating 2014 ranking"
    table = payload.css('.content3').css('table').first
    rows = table.css('tr')
    rows.map do |row|
      row_values = row.css('td').map(&:text)
      next if row_values.blank?
      @player = Player.find_or_create_by(gamer_tag: row_values[2].downcase.strip,
                                         country: row.css('td')[1].css('a')[0]['title'].downcase.strip)
      @player.characters = row.css('td')[3].css('img').map { |i| i['alt'] }

      @player.miom_rankings.create(year: '2014',
                                   score: (row_values[4].include?('.') ? row_values[4].delete('.').insert(2, '.').to_f : row_values[4].insert(1, '0').to_f),
                                   change: (row_values[5].squish.include?('9000') ? 'NEW' : row_values[5].squish),
                                   rank: row_values[0].to_f)
      @player.save
    end
    puts "\r2014 ranking done"
  end

  desc 'Populate 2013 ssbm rankings and players'
  task rankings_2013: :environment do
    puts "\rCreating and populating 2013 ranking"
    table = payload.css('.content1').css('table').first
    rows = table.css('tr')
    rows.map do |row|
      row_values = row.css('td').map(&:text)
      next if row_values.blank?
      @player = Player.find_or_create_by(gamer_tag: row_values[2].downcase.strip,
                                         country: row.css('td')[1].css('a')[0]['title'].downcase.strip)
      @player.characters = row.css('td')[3].css('img').map { |i| i['alt'] }

      @player.miom_rankings.create(year: '2013',
                                   score: (row_values[4].include?('.') ? row_values[4].delete('.').insert(2, '.').to_f : row_values[4].insert(1, '0').to_f),
                                   rank: row_values[0].to_f)
      @player.save
    end
    puts "\r2013 ranking done"
  end
end
