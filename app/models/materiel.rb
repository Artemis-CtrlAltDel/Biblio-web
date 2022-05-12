class Materiel < ApplicationRecord
  belongs_to :adherent

  enum :status, {
    En_Rupture: false,
    Disponible: true
  }
end
