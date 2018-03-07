class MiomRank < ApplicationRecord
  #TODO: change miom_ranks to miom_rankings, change score to decimal finish testing out rest of rake tasks
  self.table_name = "miom_rankings"
  belongs_to :player
end
