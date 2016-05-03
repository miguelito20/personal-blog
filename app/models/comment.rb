class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates :user_id, presence: true
  validates :article_id, presence: true
  validates :body, presence: true, length: {maximum: 400}
  default_scope -> { order(created_at: :desc) }
end
