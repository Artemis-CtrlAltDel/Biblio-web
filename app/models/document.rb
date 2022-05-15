class Document < ApplicationRecord
  belongs_to :adherent, optional: true
  belongs_to :auteur, optional: true
end
