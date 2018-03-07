class Player < ApplicationRecord
  has_many :miom_ranks, :dependent => :destroy

end
