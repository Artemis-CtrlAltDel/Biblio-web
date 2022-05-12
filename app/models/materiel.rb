class Materiel < ApplicationRecord
  belongs_to :adherent

  validates_presence_of :status, on: :create, message: "status can't be blank"

  validates_uniqueness_of :code, confirmation: { case_sensitive: false }

  enum :status, {
    En_Rupture: false,
    Disponible: true
  }
end
