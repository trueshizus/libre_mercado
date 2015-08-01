class Comment < ActiveRecord::Base
  belongs_to :comentable, polymorphic: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_ancestry
end
