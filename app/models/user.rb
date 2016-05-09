class User < ApplicationRecord
  has_one  :profile
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :recieved_messages, :class_name => 'Message', :foreign_key => 'reciever_id'
  has_many :technologies
  accepts_nested_attributes_for :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
