class Document < ApplicationRecord
  belongs_to :adherent, optional: true
  belongs_to :auteur, optional: true

  validates_presence_of :status, on: :create, message: "status can't be blank"

  validates_presence_of :code, on: :create, message: "code can't be blank"
  validates_uniqueness_of :code, confirmation: { case_sensitive: false }

  validates_presence_of :titre, on: :create
  validates_presence_of :publie, on: :create
  validates_presence_of :categorie, on: :create

  validates :langue, presence: true

  enum :status, {
    En_Rupture: false,
    Disponible: true
  }
  enum categorie: {
    Horreur: '0',
    Comédie: '1',
    Mystère: '2',
    Drama: '3'
  }
  enum langue: {
    fr: '0',
    ar: '1',
    en: '2',
  }
end
