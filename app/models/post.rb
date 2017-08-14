class Post < ApplicationRecord
  searchkick
  acts_as_likeable
  belongs_to :group
  has_many :comments, dependent: :destroy
  validates :body, presence: { message: "Post can not be blank."}
  validates :body, length: { minimum: 2 }
end
