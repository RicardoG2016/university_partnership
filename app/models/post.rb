class Post < ApplicationRecord
  belongs_to :group
  validates :body, presence: true,
                  length: { minimum: 2 }
end
