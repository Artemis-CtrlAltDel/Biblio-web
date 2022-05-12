class Document < ApplicationRecord
  belongs_to :auteur
  belongs_to :adherent

  enum :status, {
    En_Rupture: false,
    Disponible: true
  }
  enum :categorie, {
    Horreur: 0,
    Comedie: 1,
    Romance: 2,
    Sci_Fic: 3
  }
end
