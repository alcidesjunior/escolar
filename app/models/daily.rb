class Daily < ActiveRecord::Base
	belongs_to :student
	belongs_to :discipline
end
