class Group < ApplicationRecord
  # acts_as_voter
  searchkick
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions

  def existing_chat_groups
    existing_chat_groups = []
    self.chats.each do |chat|
      existing_chat_groups.concat(chat.subscriptions.where.not(group_id: self.id).map { |subscription| subscription.group} )
    end

    existing_chat_groups.uniq
  end


  validates :university, presence: true, uniqueness: true    
end
