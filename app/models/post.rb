class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination
  validates :title, presence: true
  validates :content, length: { minimum: 101 }
  
  def add_one_like!
    self.likes += 1
    self.save
  end

end
