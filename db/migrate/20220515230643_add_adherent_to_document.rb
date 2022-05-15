class AddAdherentToDocument < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :adherent, null: false, foreign_key: true
  end
end
