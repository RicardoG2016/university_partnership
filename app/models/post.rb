class Post < ApplicationRecord
  searchkick
  # acts_as_votable
  belongs_to :group
  has_many :comments, dependent: :destroy
  validates :body, presence: true,
                  length: { minimum: 2 }
end
