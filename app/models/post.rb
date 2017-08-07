class Post < ApplicationRecord
  searchkick
  belongs_to :group
  has_many :comments, dependent: :destroy
  validates :body, presence: true,
                  length: { minimum: 2 }
end
