class DataSet < ActiveRecord::Base
  attr_accessible :name

  def self.types
  	'xls', 'kmz', 'zip', 'txt', 'pdf'
  end
end
