class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def recent_posts
    posts.order('id DESC').limit(5)
  end

  def featured_post
    posts.max_by { |post| post.likes }
  end

  def average_age
    bloggers.distinct.average(:age).round
  end


end
