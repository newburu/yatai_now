class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { viewer: 0, sender: 1, manager: 2, admin: 3 }

  # role が 'manager' の場合、1つの屋台を担当する
  has_one :stall, foreign_key: "user_id"
end
