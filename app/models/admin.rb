class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #    :registerable, :validatable, :trackable, :recoverable,
  devise :database_authenticatable, :rememberable

end 

