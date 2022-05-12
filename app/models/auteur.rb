class Auteur < ApplicationRecord
    has_many :documents, dependent: :destroy

    validates_presence_of :nom, on: :create, message: "nom can't be blank"
    validates_presence_of :nom, on: :create, message: "prenom can't be blank"
end
