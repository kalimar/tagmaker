class PcChannel < ActiveRecord::Base
  belongs_to :pc_department

  has_many :pc_programs  
end
