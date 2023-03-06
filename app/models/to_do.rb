class ToDo < ApplicationRecord
    belongs_to :user
    belongs_to :list

    validates :description, presence: true
end