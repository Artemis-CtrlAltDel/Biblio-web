class AddCategorieToDocument < ActiveRecord::Migration[7.0]
  def change
    remove_column :documents, :categorie
    add_column :documents, :categorie, :string, default: '0'
  end
end
