class AddAdminToAdherent < ActiveRecord::Migration[7.0]
  def change
    add_column :adherents, :admin, :boolean, :default => false
    #Ex:- :default =>''
  end
end
