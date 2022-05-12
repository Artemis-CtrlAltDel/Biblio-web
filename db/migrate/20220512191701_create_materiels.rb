class CreateMateriels < ActiveRecord::Migration[7.0]
  def change
    create_table :materiels do |t|
      t.references :adherent, null: false, foreign_key: true
      t.string :code
      t.integer :type
      t.boolean :status

      t.timestamps
    end
  end
end
