class List < ApplicationRecord
    belongs_to :user
    has_many :to_dos

    validates :category, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { minimum: 3, maximum: 20 }
end