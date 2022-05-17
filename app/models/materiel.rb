class Materiel < ApplicationRecord
  belongs_to :adherent, optional: true

  validates_presence_of :status, on: :create, message: "status can't be blank"

  validates_uniqueness_of :code, confirmation: { case_sensitive: false }

  enum :status, {
    En_Rupture: false,
    Disponible: true
  }
  enum type_materiel: {
    Laptop: '0',
    Souris: '1',
    Clavier: '2',
    CD: '3',
    USB: '4',
  }
end
