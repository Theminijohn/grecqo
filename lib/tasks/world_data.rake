####
# Imports all the World Data from Grepolis Server.
###

namespace :populate do

	# Players
	task players: [:environment] do
		Rake::Task['import_players'].invoke
	end

	# Player Bash Points
	task pkall: [:environment] do
		Rake::Task['player_kills_all'].invoke
	end

	task pkatt: [:environment] do
		Rake::Task['player_kills_att'].invoke
	end

	task pkdef: [:environment] do
		Rake::Task['player_kills_def'].invoke
	end

	# Towns
	task towns: [:environment] do
		Rake::Task['import_towns'].invoke
	end

	# Alliances
	task alliances: [:environment] do
		Rake::Task['import_alliances'].invoke
	end

	# Alliance Bash Points
	task akall: [:environment] do
		Rake::Task['aly_kills_all'].invoke
	end

	task akatt: [:environment] do
		Rake::Task['aly_kills_att'].invoke
	end

	task akdef: [:environment] do
		Rake::Task['aly_kills_def'].invoke
	end

	# Conquers
	task conquers: [:environment] do
		Rake::Task['import_conquers'].invoke
	end

	task all: [:environment] do
		TASKS = [:players, :pkall, :pkatt, :pkdef, :alliances, :akall, :akatt, :akdef, :towns, :conquers]

		TASKS.each do |t|
			Rake::Task["populate:#{t.to_s}"].invoke
		end
	end

end
