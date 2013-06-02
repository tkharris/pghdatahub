class InsertRoles < ActiveRecord::Migration
  def self.up
	r = Role.new(:name => "Admin")
	r.save
	r = Role.new(:name => "Registered")
	r.save
	r = Role.new(:name => "Robbers")
	r.save	
  end
end