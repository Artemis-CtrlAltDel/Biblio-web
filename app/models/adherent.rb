class Adherent < ApplicationRecord

    has_many :materiels, dependent: :nullify
    has_many :documents, dependent: :nullify

    before_save {self.email = email.downcase}
    has_secure_password

    validates_presence_of :nom, on: :create, message: "nom can't be blank"
    validates_presence_of :prenom, on: :create, message: "prenom can't be blank"

    validates_uniqueness_of :email, confirmation: { case_sensitive: false }
    validates_format_of :email, uniqueness: true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
    
    validates :password, presence: true, confirmation: true, length: { minimum: 8 }

end
