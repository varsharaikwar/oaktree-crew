class User < ApplicationRecord
  rolify
  has_many :comments
  has_many :candidates, through: :comments
  has_many :leads
  has_many :notifications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

