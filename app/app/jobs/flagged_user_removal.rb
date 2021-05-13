class FlaggedUserRemoval < ApplicationJob
  queue_as :default
  #self.queque_adapter = :inline

  after_perform do |job|
    # invoke another job at your time of choice 
    self.class.set(:wait => 1.hour).perform_later(job.arguments.first)
  #   if Control.first.post_decay_on
  #   	self.class.set(:wait => 
  #   		"#{Control.first.post_decay}").perform_later(job.arguments.first)
 	# end
  end

    def perform(*args)
      if Control.first.flagged_user_removal
        FlaggedUser.all.each {|user| u = User.find(user.user_id); u.destroy! }
        FlaggedUser.all.each {|user| user.destroy!}

      end

    end
  	
	
end

FlaggedUserRemoval.perform_now()