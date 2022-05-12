class Document < ApplicationRecord
  belongs_to :auteur
  belongs_to :adherent
end
