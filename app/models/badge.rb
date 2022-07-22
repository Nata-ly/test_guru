class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  CATEGORY = [:category, :level , :attempt]
end
