class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  CATEGORY = [:category, :level , :attempt]

  private_constant :CATEGORY

  def self.category
    CATEGORY
  end

end
