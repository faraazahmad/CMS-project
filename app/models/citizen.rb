class Citizen < ApplicationRecord
	# before_save { self.name = name.upcase }

	validates :name, presence: true, length: { minimum: 2 }
	validates :gender, presence: true
	validates :occupation, presence: true
	validates :dob, presence: true
	validates :address, presence: true

	VALID_PHONE_NO_REGEX = /\+([0-9\s\-]{7,})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/
	validates :phone_number, length: { is: 13 },
						format: { with: VALID_PHONE_NO_REGEX, :multiline => true}

	has_secure_password					
	validates :password, length: { minimum: 12 }, allow_nil: true
end
