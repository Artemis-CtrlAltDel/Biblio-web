class Adherent < ApplicationRecord
    has_many :materiels, dependent: :destroy
end
