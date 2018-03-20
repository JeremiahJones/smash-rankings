# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  gamer_tag  :string
#  country    :string
#  first_name :string
#  last_name  :string
#  characters :string           default([]), is an Array
#  youtube    :string
#  twitter    :string
#  twitch     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ApplicationRecord
  has_many :miom_rankings, :dependent => :destroy

end
