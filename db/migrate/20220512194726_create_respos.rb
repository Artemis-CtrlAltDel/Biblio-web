class CreateRespos < ActiveRecord::Migration[7.0]
  def change
    create_table :respos do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
