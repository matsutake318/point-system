class AddTypeToPoint < ActiveRecord::Migration
  def change
    add_column :points, :type, :string
  end
end
