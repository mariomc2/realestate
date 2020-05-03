class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :terms, acceptance: { message: 'must be accepted' }

  enum role:{
    "admin" => 0,
    "self" => 1,
    "managed" => 2,
  }
end
