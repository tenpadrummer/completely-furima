class Tag < ApplicationRecord
  has_many :item_tags
  has_many :items, through: :tweet_tag_relations
end
