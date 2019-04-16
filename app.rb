require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('Josiane') #création du premier player
player2 = Player.new('José') #création du second player

puts "Voici l'état de chaque joueur:"
puts "\n"
player1.show_state #indique l'état de Josiane
player2.show_state #indique l'état de José
puts "\n"

puts "Passons à la phase d'attaque:"
puts "\n"

while player1.life_points > 0 && player2.life_points > 0 #boucle pour continuer le combat
    player1.attacks(player2) #Josiane attaque José en premier
    if player2.life_points > 0 
        player2.attacks(player1) #Le combat continue si José n"a pas perdu toutes ses vies
        puts "\n"
        puts "Voici l'état de chaque joueur:"
            player1.show_state
            player2.show_state
        puts "\n"
    else
        puts "\n"
        break

    end
end

binding.pry
