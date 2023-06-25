class Post < ApplicationRecord
    CATEGORY = ['Fiction', 'Non-fiction']
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: CATEGORY}
    validate :clickbait_title, on: :title, on: :category, {in: CATEGORY}
private

  def clickbait_title
    clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]
    unless clickbait_phrases.any? { |phrase| title.include?(phrase) }
      errors.add(:title, "should be clickbait-y")
    end
  end
end
