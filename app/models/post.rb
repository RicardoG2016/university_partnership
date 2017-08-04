class Post < ApplicationRecord
  belongs_to :group
  validates :title, :body, presence: true,
                           length: { minimum: 2 }
end
