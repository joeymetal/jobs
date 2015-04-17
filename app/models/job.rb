class Job < ActiveRecord::Base
	belongs_to :customer
	has_and_belongs_to_many :applicants, join_table: :applicants_jobs
	has_many :applicant_jobs #, through: :applicant
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	validates_presence_of :title
	def self.search(query)
		where("title LIKE :q", :q => "%#{query}%")
	end
end
