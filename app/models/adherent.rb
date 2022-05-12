class Adherent < ApplicationRecord
    has_many :materiels, dependent: :destroy
    validates_format_of :email, uniqueness: true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
    validates :password, presence: true, confirmation: true, length: { minimum: 8 }
end
