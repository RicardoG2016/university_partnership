class Group < ApplicationRecord
  has_many :posts
  validates :university, :email , presence: true, 
                                   uniqueness: true
end
