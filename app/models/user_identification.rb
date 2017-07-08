class UserIdentification < ApplicationRecord

  self.primary_key = "username"

  has_secure_password

  validates_presence_of :username
  validates_length_of :username, :maximum => 40
  validates_uniqueness_of :username

  has_many :journal_entries, :foreign_key => "user_identification_username", dependent: :destroy

end
