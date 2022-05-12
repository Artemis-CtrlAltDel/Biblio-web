class Auteur < ApplicationRecord
    has_many :documents, dependent: :destroy
end
