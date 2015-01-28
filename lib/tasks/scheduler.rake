namespace :scheduler do
	desc "This task is called by the Heroku scheduler add-on"

	task :update_attributes => :environment do
		Tweeter.all.each do |t|
			t.update_attributes
		end
		puts "update complete"
	end
end