# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Post < ApplicationRecord

  has_many(:comments, { :class_name => "Comment", :foreign_key => "post_id", :dependent => :destroy })

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
end
