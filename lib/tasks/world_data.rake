####
# Imports all the World Data from Grepolis Server.
###

namespace :populate do

	# Import Players
	task players: [:environment] do
		Rake::Task['import_players'].invoke
	end

	# Import Player Kills
	task pkall: [:environment] do
		Rake::Task['player_kills_all'].invoke
	end

	task pkatt: [:environment] do
		Rake::Task['player_kills_att'].invoke
	end

	task pkdef: [:environment] do
		Rake::Task['player_kills_def'].invoke
	end

	task all: [:environment] do
		TASKS = [:players, :pkall, :pkatt, :pkdef]

		TASKS.each do |t|
			Rake::Task["populate:#{t.to_s}"].invoke
		end
	end

end