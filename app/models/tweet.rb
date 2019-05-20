class Tweet < ApplicationRecord
belongs_to :user
    validates :body, length: { in: 2...75 }, presence: true

end
