 class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_current_list

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists

  def current_list
    return nil unless current_list_id

    lists.find(current_list_id)
  end

  private

  def create_current_list
    User.transaction do
      list = lists.create
      raise ActiveRecord: :Rollback unless update(current_list_id: list.id)
    end
  end
end
