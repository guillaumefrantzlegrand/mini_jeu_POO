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

class HumanPlayer < Player
    attr_accessor :weapon_level

      # initializer un HumanPlayer
      def initialize (name)

        super(name)

        @life_points = 100
        @weapon_level = 1

      end

      # montrer le nom et les points de vie et le niveau de l'arme du HumanPlayer
      def show_state
        puts ""
        puts "#{@name} a #{@life_points} points de vie et une arme de nivea #{@weapon_level}."
        puts ""
      end

      # rajoute le bonus de l'arme a la valeur d'attaque
      def compute_damage
        return rand(1..6) * @weapon_level
      end

      # determine le bonus de l'arme
      def search_weapon
        level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{level}."

          # ne prend en compte le bonus uniqumenet si il est superieur a celui qui éxiste déja.
          if level > @weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = level
          else
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
          end
          puts ""
      end

      # determine le bonus de vie
      def search_health
        pack = rand(1..6)

        # 2 - 6 bonus 50
        if pack == 2 || pack == 3 || pack == 4 || pack == 5

          i = 0
          #si un pack de 50 est trouvé - rajouter 50 points de vie ou autant de points de vie nécéssaire pour arriver a 100
          while @life_points < 100 && i < 50
            @life_points += 1
            i += 1
          end

          puts "Bravo, tu as trouvé un pack de +50 points de vie !"

        # si 1 pas de bonus
        elsif pack == 1

            puts "Tu n'as rien trouvé... "

        # si 6 bonus 80
        else

          i = 0
          #si un pack de 80 est trouvé - rajouter 50 points de vie ou autant de points de vie nécéssaire pour arriver a 100
          while @life_points < 100 && i < 80
            @life_points += 1
            i += 1
          end

          puts "Waow, tu as trouvé un pack de +80 points de vie !"

        end

        puts ""

      end
end