class User < ApplicationRecord
  has_one  :profile
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :recieved_messages, :class_name => 'Message', :foreign_key => 'reciever_id'
  has_one :role, :through => :profile
  accepts_nested_attributes_for :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_superadmin?
  	self.role.name == 'superadmin'
  end

  def is_admin?
  	self.role.name == 'admin'
  end

  def user?
  	self.role.name == 'simple_user'
  end

  def name
    self.profile.first_name.nil? ? self.email : (self.profile.first_name + ' ' + self.profile.last_name)
  end
end
