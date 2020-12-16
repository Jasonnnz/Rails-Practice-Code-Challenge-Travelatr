class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
        if self.posts.count >= 5 
            self.posts[-5..-1]
        else
            self.posts 
        end 

    end

    def destination_featured_post
        self.posts.max {|post| post.likes}
    end

    def average_age
        total_age = self.bloggers.uniq.sum {|blogger| blogger.age}
        total_bloggers = self.bloggers.uniq.count
        avg = total_age.to_f / total_bloggers
    end
end
