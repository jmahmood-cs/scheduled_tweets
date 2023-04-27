class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280, too_long: "A tweet is only 280 max. Everybody knows that!" }
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end
end
