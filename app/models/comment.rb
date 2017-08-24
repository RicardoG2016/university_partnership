class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :group
  acts_as_likeable
end
