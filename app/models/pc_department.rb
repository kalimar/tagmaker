class PcDepartment < ActiveRecord::Base
  belongs_to :promo_code

  has_many :pc_channels
  has_many :pc_programs, :through =>  :pc_channels
end
