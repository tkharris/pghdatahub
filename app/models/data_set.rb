class DataSet < ActiveRecord::Base
  attr_accessible :name

  def self.types do
  	'xls', 'kmz', 'zip', 'txt', 'pdf'
  end
end
