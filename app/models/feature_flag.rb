class FeatureFlag < ApplicationRecord
  validates :name, :value, presence: true
  validates :value, inclusion: { in: [true, false] }
end
