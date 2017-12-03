class Post < ActiveRecord::Base
    
    # associations
    belongs_to :user
    has_many :comments
    has_many :likes
    
    # validations
    validates_presence_of :photo_url, :user
    
    # some methods
    def humanized_time_ago
        time_ago_in_seconds = Time.now - self.created_at
        time_ago_in_minutes = time_ago_in_seconds / 60
        if (time_ago_in_minutes/60) >= 24
            "#{(time_ago_in_minutes / 1440).to_i} days ago"
        elsif time_ago_in_minutes >= 60
            "#{(time_ago_in_minutes / 60).to_i} hours ago"
        else
            "#{time_ago_in_minutes.to_i} minutes ago"
        end
    end
    
    def like_count
        self.likes.size
    end
    
    def comment_count
        self.comments.size
    end

end
