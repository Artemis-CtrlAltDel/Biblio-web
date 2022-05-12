class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.references :auteur, null: false, foreign_key: true
      t.references :adherent, null: false, foreign_key: true
      t.string :code
      t.string :titre
      t.integer :categorie
      t.boolean :status

      t.timestamps
    end
  end
end
