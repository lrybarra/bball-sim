# bball.rb
puts "\n 2 on 2 Ruby Basketball League \n"
$Day = 1

class Season
end

class Team
    attr_accessor :player1, :player2, :tCity
	def initialize(tCity, tName, player1, player2)
	  @tCity = tCity
	  @tName = tName
	  @player1 = player1
	  @player2 = player2
	end
	
	def printTeam
	  return "The #{@tCity} #{@tName}"
	end
	
	def printRoster
	    puts "\n"
		puts "\t" + printTeam
		puts "\t" + @player1.printPlayer
		puts "\t" + @player2.printPlayer
	end
end

class Player
  attr_accessor :offAbility, :defAbility
  def initialize(fName, lName, jersey, offAbility, defAbility, superStarStatus)
    @fName = fName
	@lName = lName
	@jersey = jersey
	@offAbility = offAbility
	@defAbility = defAbility
	@superStarStatus = superStarStatus
  end
  
  def printPlayer
    return "##{@jersey} #{@fName} #{@lName}"
  end
  
  def signWithTeam(team)
    @team = team
  end
end

class Game
  attr_accessor :lead_scorer
  
  def initialize(team1, team2, marqueeGame=false)
    @team1 = team1
	@team2 = team2
  end
  
  def play
    puts "\t" + @team1.printTeam + " versus " + @team2.printTeam + "\n\n"
    scoring
  end
  
  def scoring	 b 
    @p1pts_1H = rand(@team1.player1.offAbility) 
	@p2pts_1H = rand(@team1.player2.offAbility) 
	@p3pts_1H = rand(@team2.player1.offAbility) 
	@p4pts_1H = rand(@team2.player2.offAbility)
	@p1pts_2H = rand(@team1.player1.offAbility) 
	@p2pts_2H = rand(@team1.player2.offAbility) 
	@p3pts_2H = rand(@team2.player1.offAbility) 
	@p4pts_2H = rand(@team2.player2.offAbility)
	
	@team1_1H = @p1pts_1H + @p2pts_1H
	@team2_1H = @p3pts_1H + @p4pts_1H
	@team1_2H = @p1pts_2H + @p2pts_2H
	@team2_2H = @p3pts_2H + @p4pts_2H
	
	puts "\t" + "Team \t\t 1 \t 2 \t F"
	puts "\t" + "#{@team1.tCity} \t #{@team1_1H} \t #{@team1_2H} \t #{@team1_1H + @team1_2H}"
	puts "\t" + "#{@team2.tCity} \t #{@team2_1H} \t #{@team2_2H} \t #{@team2_1H + @team2_2H}\n\n"
	
	stats(@p1pts_1H + @p1pts_2H, @p2pts_1H + @p2pts_2H, @p3pts_1H + @p3pts_2H, @p4pts_1H + @p4pts_2H)
	return [@team1_1H, @team2_1H, @team1_2H, @team2_2H]
  end
  
  def stats(p1pts, p2pts, p3pts, p4pts)
    defStats = rebounds
    puts "\t" + "Stats \n\t" + @team1.player1.printPlayer + " #{p1pts} pts #{defStats[0]} rebounds"
	puts "\t" + @team1.player2.printPlayer + " #{p2pts} pts #{defStats[1]} rebounds\n\n"
	puts "\t" + @team2.player1.printPlayer + " #{p3pts} pts #{defStats[2]} rebounds"
	puts "\t" + @team2.player2.printPlayer + " #{p4pts} pts #{defStats[3]} rebounds"
  end
  
  def rebounds
    @p1_reb = rand(@team1.player1.defAbility) * 2
	@p2_reb = rand(@team1.player2.defAbility) * 2
	@p3_reb = rand(@team2.player1.defAbility) * 2
	@p4_reb = rand(@team2.player2.defAbility) * 2
	return [@p1_reb, @p2_reb, @p3_reb, @p4_reb]
  end
end

player1 = Player.new("Derrick", "Rose", 1, 9, 7, true)
player2 = Player.new("Joakim", "Noah", 13, 5, 10, true)

my_team = Team.new("Chicago", "Bulls", player1, player2)

player3 = Player.new("Giannis", "Antetokounmpo", 34, 6, 5, false)
player4 = Player.new("Michael", "Carter-Williams", 5, 4, 4, false)

opp_team = Team.new("Milwaukee", "Bucks", player3, player4)

game_over = false

while(!game_over)
	puts "\nDay #{$Day.to_s}"
	puts "A. Play Next Game"
	puts "B. View Roster"
	puts "C. End Game"
	puts "What would you like to do?"

	choice = gets.chomp.upcase 
	$Day += 1

	case choice
	  when 'A'
		puts "\n"
		#game1 = Game.new(my_team, opp_team)
		game1 = Game.new(opp_team, my_team)
		game1.play
		game_over = true
	  when 'B'
		my_team.printRoster
	  when 'C'
	    puts "\nThanks for playing! Good bye!!"
		game_over = true
	  else
		puts "Invalid Selection!"
	end
end

#puts "Final Score: #{my_team.tCity} #{score[0] + score[2]} vs. #{opp_team.tCity} #{score[1] + score[3]}"

