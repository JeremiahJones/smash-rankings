namespace :populate_rankings do

  desc "Populate all 2017 ssbm rankings"
  task rankings_2017: :environment do
    puts "\rCreating and populating 2017 ranking"
    response = HTTParty.get(ENV['ranked_player_info_url'])
    @payload ||= Nokogiri::HTML(response)
    table = @payload.css(".content8").css("table").first
    rows = table.css('tr')
    rows.map do |row|
      row_values = row.css('td').map(&:text)
      next if row_values.blank?
      Player.create(rank: row_values[0].to_i,
                    gamer_tag: row_values[2],
                    score: row_values[4].to_i,
                    change: (row_values[5].squish.include?('9000') ?  'NEW' : row_values[5].squish )
      )
    end
    puts "\r2017 ranking done"
  end

end
