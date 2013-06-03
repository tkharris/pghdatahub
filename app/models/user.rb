class User < ActiveRecord::Base
  has_and_belongs_to_many :roles  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :setup_role

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_ids
  # attr_accessible :title, :body
  
  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end

  # Default role is "Registered"
  def setup_role 
    if self.role_ids.empty?     
      self.role_ids = [2] 
    end
  end
    
end
