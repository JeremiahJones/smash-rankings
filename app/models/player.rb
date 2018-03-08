class Player < ApplicationRecord
  has_many :miom_rankings, :dependent => :destroy

end
