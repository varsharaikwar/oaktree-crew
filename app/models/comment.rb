class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
  has_rich_text :content
end
