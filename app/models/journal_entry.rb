class JournalEntry < ApplicationRecord

  belongs_to :user_identification, :foreign_key => "user_identification_username"
end
