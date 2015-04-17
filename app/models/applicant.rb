class Applicant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
    belongs_to :user
	has_one :profile, :dependent => :destroy
	has_and_belongs_to_many :jobs, join_table: :applicants_jobs
	has_many :applicant_jobs
	extend FriendlyId
  	friendly_id :first_name, use: :slugged
end
