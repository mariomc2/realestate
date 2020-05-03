class Building < ApplicationRecord
	has_many :engagements
	has_many :users, through: :engagements
end
