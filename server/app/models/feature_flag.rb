class FeatureFlag < ApplicationRecord
  validates :name, presence: true
  validates :value, inclusion: { in: [true, false] }
end
