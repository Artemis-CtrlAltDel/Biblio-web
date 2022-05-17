class AddTypeMaterielToMateriel < ActiveRecord::Migration[7.0]
  def change
    remove_column :materiels, :type
    add_column :materiels, :type_materiel, :integer
  end
end
