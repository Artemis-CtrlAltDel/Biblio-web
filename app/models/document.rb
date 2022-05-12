class Document < ApplicationRecord
  belongs_to :auteur
  belongs_to :adherent

  validates_presence_of :titre, on: :create, message: "titre can't be blank"
  
  validates_presence_of :categorie, on: :create, message: "categoriecan't be blank"

  validates_presence_of :status, on: :create, message: "status can't be blank"

  validates_uniqueness_of :code, confirmation: { case_sensitive: false }

  validates_uniqueness_of :auteur, on: :create, message: "adherent must be unique"
  validates_presence_of :auteur, on: :create, message: "auteur can't be blank"

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
