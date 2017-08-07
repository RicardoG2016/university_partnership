class Post < ApplicationRecord
  searchkick
  belongs_to :group
  validates :body, presence: true,
                  length: { minimum: 2 }
end
