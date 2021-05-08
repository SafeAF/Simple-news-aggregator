class PostUpvoteDecayJob < ApplicationJob
  queue_as :default
  #self.queque_adapter = :inline

  after_perform do |job|
    # invoke another job at your time of choice 
    self.class.set(:wait => 1.minutes).perform_later(job.arguments.first)
  end

  def perform(*args)
  	posts = Post.where("cached_votes_up > 0")
  	#return if p.count <= 0
    posts.each do |post|
    	
    	post.get_positives.first.destroy!
    	#post.save!
    end
  end
end

PostUpvoteDecayJob.perform_now()