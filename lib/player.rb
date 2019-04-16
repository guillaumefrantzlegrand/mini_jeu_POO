class Player
    attr_accessor :name, :life_points
    
    def initialize(player_name) #méthode qui définit le nom et les points de vie
        @name = player_name
        @life_points = 10
    end

    def show_state #méthode qui affiche l'état d'un joueur
        puts "#{@name} il vous reste #{@life_points} points de vie!"
    end

    def gets_damage(damage) #le joueur subit une attaque
        @life_points = @life_points - damage
        if @life_points <= 0
            puts "le joueur #{@name} a été tué!"
            #le joueur meurt si ses points de vie sont nuls
        end
    end

    def attacks(player) #un joueur en attaque un autre
        puts "Le joueur #{@name} attaque le joueur #{player.name}!"
        damage = compute_damage 
        puts "Le joueur #{@name} lui inflige #{damage} de dommages!"
        player.gets_damage(damage)
    end

    def compute_damage
            return rand(1..6)
    end

end
