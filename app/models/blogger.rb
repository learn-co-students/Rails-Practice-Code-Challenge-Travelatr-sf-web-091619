class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 31 }

  def total_likes
    posts.sum(:likes)
  end

  def featured_post
    posts.max_by { |post| post.likes }
  end

  def top_five
    posts.select('destination_id, COUNT(destination_id) as dest_count').includes(:destination).group(:destination_id).order('dest_count DESC').limit(5).map { |post| [post.destination.name, post.dest_count] }
  end


end
