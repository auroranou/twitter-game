namespace :scheduler do
	desc "This task is called by the Heroku scheduler add-on"

	task :update_attributes => environment do
		Twitter.all do |t|
			t.update_attributes
		end
	end
end