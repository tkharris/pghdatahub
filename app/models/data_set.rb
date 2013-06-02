class DataSet < ActiveRecord::Base
  attr_accessible :name

  def self.types
  	return ['xls', 'kmz', 'zip', 'txt', 'pdf']
  end
end
