# == Schema Information
#
# Table name: miom_rankings
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  year       :integer
#  score      :float
#  change     :string
#  rank       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MiomRanking < ApplicationRecord
end
