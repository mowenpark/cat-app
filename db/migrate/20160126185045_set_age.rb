class SetAge < ActiveRecord::Migration
  def change
    add_column :cats, :age, :integer, null: false
  end
end
