class Player():
    def __init__(self, hp, mp, att, matt, defense, mdefense):
        self.hp = hp
        self.mp = mp
        self.att = att
        self.matt = matt
        self.defense = defense
        self.mdefense = mdefense
    
    def offset_stat(self, stat, ):
        stat_map = {
            'hp': 'hp',
            'mp': 'mp',
            'attack': 'att',
            'magic_attack': 'matt',
            'defense': 'defense',
            'magic_defense': 'mdefense'
        }
        
        # Get the attribute name from the map, defaulting to None if not found
        attr_name = stat_map.get(stat.lower())
        
        if attr_name is None:
            raise ValueError(f"Invalid stat: {stat}")
            
        # Return the attribute value using getattr
        return getattr(self, attr_name)

class Card():
    def __init__(self, attribute, magnitude, stat):
        self.attribute = attribute # 
        self.magnitude = magnitude
        self.stat = stat

    def modify(self):
        return (self.attribute, self.magnitude, self.stat)

    def magnitude_increase(self, value):
        self.magnitude += value