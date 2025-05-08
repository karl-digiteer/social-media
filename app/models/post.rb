class Post < ApplicationRecord
    before_validation :disable_featured_if_inactive
    validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
    validates :content, presence: true, length: { maximum: 1500 }
    validate :limit_featured_posts

    private
        def limit_featured_posts
            return unless featured

            count = Post.where(featured: true)
                        .where.not(id: id)
                        .count

            if count >= 5
                errors.add(:featured, "Only 5 posts can be featured at a time.")
            end
        end

        def disable_featured_if_inactive
            self.featured = false if active == false
        end
end
