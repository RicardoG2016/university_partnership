class Event < ApplicationRecord
  searchkick
  belongs_to :group
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :time, presence: true
  validates :date, presence: true
end
