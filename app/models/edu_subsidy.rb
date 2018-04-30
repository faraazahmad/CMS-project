class EduSubsidy < ApplicationRecord
  has_and_belongs_to_many :citizen

  validates :citizen_id, presence: true, uniqueness: true
end
