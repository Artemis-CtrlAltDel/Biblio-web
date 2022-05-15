class CreateAdherents < ActiveRecord::Migration[7.0]
  def change
    create_table :adherents do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :password_digest
      t.integer :quota_document, :default => 5
      #Ex:- :default =>''
      t.integer :quota_materiel, :default => 5
      #Ex:- :default =>''

      t.timestamps
    end
  end
end
