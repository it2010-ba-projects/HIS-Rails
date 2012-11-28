class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :last_name, :first_name
  # attr_accessible :title, :body
  
  has_and_belongs_to_many :groups
  has_many                :user_histories
  
  def name
    "#{last_name}, #{first_name}"
  end
  
  def is? group
    groups.map{ |g| g.name.to_sym }.include? group.to_sym
  end
end
