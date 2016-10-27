class AddStateToScreenings < ActiveRecord::Migration
  def change
    add_column :screenings, :state, :string
  end
end
