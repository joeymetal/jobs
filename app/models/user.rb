class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #attr_accessor :email, :password, :password_confirmation, :remember_me, :username
  apply_simple_captcha
  # User::Roles
  # The available roles
  #Roles = [ :admin , :applicant, :customer, :default ]
  ROLES = %w[admin customer applicant moderator author default banned]

  #Roles #
  #1 = admin	
  #2 = customer
  #3 = author
  #4 = 
  #5 = moderator
  # 	#
  attr_accessor :login

  has_one :customer
	has_one :applicant
	has_one :phone, :dependent => :destroy
	has_one :address, :dependent => :destroy
	has_many :jobs, through: :customer
	has_one :profile, through: :applicant
  has_many :applicant_jobs, through: :job
  has_many :applicant_jobs, through: :applicant

  	  #validates_uniqueness_of :username
	  #validates_presence_of :username
	  validates :username, :presence => true, :uniqueness => true, :format => /[a-z]/

	  validates :username, length: { in: 4..20 }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
####


			# in models/user.rb
def roles=(roles)
  self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
end

def roles
  ROLES.reject do |r|
    ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
  end
end

# in models/user.rb
def is?(role)
  roles.include?(role.to_s)
end

         	def self.find_for_database_authentication(warden_conditions)
		      conditions = warden_conditions.dup
		      if login = conditions.delete(:login)
		        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
		      else
		        where(conditions.to_h).first
		      end
		    end

		  protected

		  def configure_permitted_parameters
		    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :username, roles: [])}
		  end
end
