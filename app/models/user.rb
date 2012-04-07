class User < ActiveRecord::Base

  # Validations
  validates :username, :presence => true, :uniqueness => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me

  has_many :cash_flow_plans
  has_many :cash_flow_plan_items, :through => :cash_flow_plans

  has_many :allocated_spending_plans
  has_many :allocated_spending_plan_items, :through => :allocated_spending_plans

  has_many :breakdown_of_savings
  has_many :breakdown_of_saving_items, :through => :breakdown_of_savings

end
