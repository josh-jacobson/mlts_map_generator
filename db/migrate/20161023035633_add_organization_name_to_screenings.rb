class AddOrganizationNameToScreenings < ActiveRecord::Migration
  def change
    add_column :screenings, :organization_name, :string
  end
end
