class AddExternalIdToDataSet < ActiveRecord::Migration
  def change
    add_column :data_sets, :external_id, :integer
  end
end
