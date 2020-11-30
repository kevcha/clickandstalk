class Resource < ApplicationRecord

  DATA_KEY_LINKEDIN = [:profile, :geolocalisation, :connections, :industry, :experience, :school, :education, :skill, :honor, :language ]
  DATA_KEY_TWITTER = [:name, :likes]

  belongs_to :user

  store :data, accessors: DATA_KEY_LINKEDIN + DATA_KEY_TWITTER

  scope :with_key, ->(key) { where("data->>'#{key}' IS NOT NULL") }
end
