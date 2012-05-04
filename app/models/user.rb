class User < ActiveRecord::Base

  # Validations
  validates :username, :uniqueness => {:case_sensitive => false}, :allow_blank => true
  validates :username, :format => {:with => /^[a-zA-Z0-9_-]$/, :message => 'must contain only letters, numbers, underscores and dashes'}, :allow_blank => true
  validates :username, :length => {:in => 3..16}, :allow_blank => true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :login

  attr_accessor :login

  has_many :cash_flow_plans
  has_many :cash_flow_plan_items, :through => :cash_flow_plans

  has_many :allocated_spending_plans
  has_many :allocated_spending_plan_items, :through => :allocated_spending_plans

  has_many :breakdown_of_savings
  has_many :breakdown_of_saving_items, :through => :breakdown_of_savings

  ## override to allow username or email as login
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if reset_password_token = conditions[:reset_password_token]
      where(conditions).where(["reset_password_token = ?", reset_password_token]).first
    else
      login = conditions.delete(:login).downcase
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    end
  end

end
