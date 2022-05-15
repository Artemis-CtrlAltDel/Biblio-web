class Respo < ApplicationRecord

    before_save {self.email = email.downcase}
    has_secure_password

    validates_presence_of :nom, on: :create, message: "nom can't be blank"
    validates_presence_of :prenom, on: :create, message: "prenom can't be blank"

    validates_uniqueness_of :email, confirmation: { case_sensitive: false }
    validates_format_of :email, uniqueness: true, :with => /\A([^@\s]+)@(uit|UIT){1}(.ac){1}(.ma){1}\Z/i, :on => :create
    
    validates :password, presence: true, confirmation: true, length: { minimum: 8 }

end
