class ChatsController < ApplicationController
  before_action :authenticate_group!

  def index
    chats = current_group.chats
    @existing_chat_groups = current_group.existing_chat_groups    
  end

  def create
    @other_group = Group.find(params[:other_group])
    @chat = find_chat(@other_group) || Chat.new(identifier: SecureRandom.hex)
    if !@chat.persisted?
      @chat.save
      @chat.subscriptions.create(group_id: current_group.id)
      @chat.subscriptions.create(group_id: @other_group.id)
    end
    redirect_to group_chat_path(current_group, @chat, :other_group => @other_group.id)
  end

    def show
      @other_group = Group.find(params[:other_group])
      @chat = Chat.find_by(id: params[:id])
      @message = Message.new
    end

  private

  def find_chat(second_group)
    chats = current_group.chats
    chats.each do |chat|
      chat.subscriptions.each do |s|
        if s.group_id == second_group.id
          return chat
        end
      end
    end
    nil
  end


end
