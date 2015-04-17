class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
       
	belongs_to :user
	#has_many :address, :dependent => :destroy
	has_many :jobs, :dependent => :destroy
	
	validates :user_id, :uniqueness => true
	extend FriendlyId
  	friendly_id :trading_name, use: :slugged

end
