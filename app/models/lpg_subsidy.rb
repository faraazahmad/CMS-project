class LpgSubsidy < ApplicationRecord
  has_and_belongs_to_many :citizen

  validates :citizen_id, presence: true
end
