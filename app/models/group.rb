class Group < ApplicationRecord
  acts_as_liker
  acts_as_follower
  acts_as_followable
  acts_as_mentionable
  searchkick
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :chats, through: :subscriptions

  def existing_chat_groups
    existing_chat_groups = []
    self.chats.each do |chat|
      existing_chat_groups.concat(chat.subscriptions.where.not(group_id: self.id).map { |subscription| subscription.group} )
    end

    existing_chat_groups.uniq
  end

  validates :member_count, numericality: { only_integer: true }
  validates :email, presence: true, uniqueness: true
  validates :university, presence: true, uniqueness: true  
  # validates :password, presence: true, length: { minimum: 6 }  
  validates :president, presence: true
  validates :phone, presence: true, length: { minimum: 10 }
  has_attached_file :image, styles: { medium: "300x300>", thumb: "50x50>" }, default_url: "school.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
