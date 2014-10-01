require 'smarter_csv'
require 'open-uri'
require 'ruby-progressbar'
desc 'Importing Player Bash Points'


# All Bash Points
task player_kills_all: [:environment] do
	progress = ProgressBar.create( format:         '%a %bᗧ%i %p%% %t',
																 progress_mark:  ' ',
																 remainder_mark: '･',
																 total:          nil,
																 title:          'Importing Player All Bash')

	url = "http://#{Settings.current_server}.grepolis.com/data/player_kills_all.txt"
	url_data = open(url).read()
	File.open('/tmp/player_kills_all.txt', 'w') { |file| file.write(url_data) }
	progress.total = open(url).readlines.size

	SmarterCSV.process('/tmp/player_kills_all.txt', {
			user_provided_headers: [
					'all_rank', 'grepo_id', 'all_points'
			], headers_in_file: false
	}) do |array|

		array.each do |a|
			Player.where(grepo_id: a[:grepo_id]).update_all(all_rank: a[:all_rank], all_points: a[:all_points])
			progress.increment
		end

	end
end

# ---------------------------------------------------------------------------------------------------------

# Defensive Bash Points
task player_kills_def: [:environment] do
	progress = ProgressBar.create( format:         '%a %bᗧ%i %p%% %t',
																 progress_mark:  ' ',
																 remainder_mark: '･',
																 total:          nil,
																 title:          'Importing Player Def Bash')

  url = "http://#{Settings.current_server}.grepolis.com/data/player_kills_def.txt"
  url_data = open(url).read()
  File.open('/tmp/player_kills_def.txt', 'w') { |file| file.write(url_data) }
  progress.total = open(url).readlines.size

  SmarterCSV.process('/tmp/player_kills_def.txt', {
      user_provided_headers: [
          'def_rank', 'grepo_id', 'def_points'
      ], headers_in_file: false
  }) do |array|

    array.each do |a|
      Player.where(grepo_id: a[:grepo_id]).update_all(def_rank: a[:def_rank], def_points: a[:def_points])
      progress.increment
    end

  end
end

# ---------------------------------------------------------------------------------------------------------

# Attack Bash Points
task player_kills_att: [:environment] do
	progress = ProgressBar.create( format:         '%a %bᗧ%i %p%% %t',
																 progress_mark:  ' ',
																 remainder_mark: '･',
																 total:          nil,
																 title:          'Importing Player Att Bash')

	url = "http://#{Settings.current_server}.grepolis.com/data/player_kills_att.txt"
  url_data = open(url).read()
  File.open('/tmp/player_kills_att.txt', 'w') { |file| file.write(url_data) }
  progress.total = open(url).readlines.size

  SmarterCSV.process('/tmp/player_kills_att.txt', {
      user_provided_headers: [
          'att_rank', 'grepo_id', 'att_points'
      ], headers_in_file: false
  }) do |array|

    array.each do |a|
      Player.where(grepo_id: a[:grepo_id]).update_all(att_rank: a[:att_rank], att_points: a[:att_points])
      progress.increment
    end

  end
end
