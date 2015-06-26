ThinkingSphinx::Index.define :article, :with => :active_record, :delta => true do
  indexes title
  indexes header_one
  indexes header_two
  indexes url
  indexes description
  indexes body
  indexes user.username, :as => :user
  indexes user.email, :as => :user_email
  indexes category.name, :as => :category
  indexes comments.body, :as => :comment_body
  has category_id, :as => :category_id
  has posted_at
  has created_at
  where 'posted_at IS NOT NULL'
end
