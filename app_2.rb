require 'dotenv'
require 'bundler'
require 'pry'
Bundler.require

#require_relative './lib/game'
require_relative './lib/player'

puts "///////////////////////////////////"
puts "Le but du jeu est d'être le dernier survivant !"
puts "///////////////////////////////////"
puts ""

puts "Quel est le nom de votre héro ?"
print "> "
# demande le nom du HumanPlayer
user_name = gets.chomp.to_s
puts ""

# crée le HumanPlayer
user = HumanPlayer.new(user_name)

# crée les deux Player
player1 = Player.new("Josiane")
player2 = Player.new("José")

# les place dans un array
enemies = []
  enemies << player1
  enemies << player2

  # le jeu fontionne tant que le HumanPlayer est en vie et un des Player est en viee
  while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

    puts "Voici l'état de vote héro :"
    # montre l'état du HumanPlayer
      user.show_state

    # menu d'action
    puts "Quelle action veux-tu effectuer ?\n\n"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner\n\n"
    puts "attaquer un joueur en vue :"
      if player1.life_points > 0
        print "0 - " 
        player1.show_state
        puts ""
      else
        puts "#{player1.name} est morte."
      end
    if player2.life_points > 0
      print "1 - "
      player2.show_state
      puts ""
    else
      puts "#{player2.name} est morte.\n"
    end

    print "> "
    # choisi l'option
    i = gets.chomp.to_s
    puts ""

      if i == "a"
        user.search_weapon
      elsif i == "s"
        user.search_health
      elsif i == "0"
        user.perform_attack(player1)
      elsif i == "1"
        user.perform_attack(player2)
      else
        puts "Invalid command. Try again ..."
      end

    puts "Les autres joueures ripostent\n"

    # see l'HumanPlayer est toujours en vie les Players l'attaquent
    if user.life_points > 0
      enemies.each do |player|
        player.perform_attack(user)
      end
    end

  end

  # la partie est finie
  print  "La partie est finie : " 
    # l'HumanPlayer est en vie 
    if user.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    # l'HumanPlayer est mort 
    else
      puts "Loser ! Tu as perdu !"
    end
