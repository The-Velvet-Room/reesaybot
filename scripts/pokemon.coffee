# Description:
#   Rise will display type information about a given Pokemon. Updated to the 6th generation.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   HEAR pokemon (name)
#
# Author:
#   Cameron Crockrom

#TODO Load this externally
pokemon = [{"Name":"Bulbasaur","Type":"Grass","Type2":"Poison"},
{"Name":"Ivysaur","Type":"Grass","Type2":"Poison"},
{"Name":"Venusaur","Type":"Grass","Type2":"Poison"},
{"Name":"Charmander","Type":"Fire"},
{"Name":"Charmeleon","Type":"Fire"},
{"Name":"Charizard","Type":"Fire","Type2":"Flying"},
{"Name":"Squirtle","Type":"Water"},
{"Name":"Wartortle","Type":"Water"},
{"Name":"Blastoise","Type":"Water"},
{"Name":"Caterpie","Type":"Bug"},
{"Name":"Metapod","Type":"Bug"},
{"Name":"Butterfree","Type":"Bug","Type2":"Flying"},
{"Name":"Weedle","Type":"Bug","Type2":"Poison"},
{"Name":"Kakuna","Type":"Bug","Type2":"Poison"},
{"Name":"Beedrill","Type":"Bug","Type2":"Poison"},
{"Name":"Pidgey","Type":"Normal","Type2":"Flying"},
{"Name":"Pidgeotto","Type":"Normal","Type2":"Flying"},
{"Name":"Pidgeot","Type":"Normal","Type2":"Flying"},
{"Name":"Rattata","Type":"Normal"},
{"Name":"Raticate","Type":"Normal"},
{"Name":"Spearow","Type":"Normal","Type2":"Flying"},
{"Name":"Fearow","Type":"Normal","Type2":"Flying"},
{"Name":"Ekans","Type":"Poison"},
{"Name":"Arbok","Type":"Poison"},
{"Name":"Pikachu","Type":"Electric"},
{"Name":"Raichu","Type":"Electric"},
{"Name":"Sandshrew","Type":"Ground"},
{"Name":"Sandslash","Type":"Ground"},
{"Name":"Nidoran","Type":"Poison"},
{"Name":"Nidorina","Type":"Poison"},
{"Name":"Nidoqueen","Type":"Poison","Type2":"Ground"},
{"Name":"Nidoran","Type":"Poison"},
{"Name":"Nidorino","Type":"Poison"},
{"Name":"Nidoking","Type":"Poison","Type2":"Ground"},
{"Name":"Clefairy","Type":"Fairy"},
{"Name":"Clefable","Type":"Fairy"},
{"Name":"Vulpix","Type":"Fire"},
{"Name":"Ninetales","Type":"Fire"},
{"Name":"Jigglypuff","Type":"Normal","Type2":"Fairy"},
{"Name":"Wigglytuff","Type":"Normal","Type2":"Fairy"},
{"Name":"Zubat","Type":"Poison","Type2":"Flying"},
{"Name":"Golbat","Type":"Poison","Type2":"Flying"},
{"Name":"Oddish","Type":"Grass","Type2":"Poison"},
{"Name":"Gloom","Type":"Grass","Type2":"Poison"},
{"Name":"Vileplume","Type":"Grass","Type2":"Poison"},
{"Name":"Paras","Type":"Bug","Type2":"Grass"},
{"Name":"Parasect","Type":"Bug","Type2":"Grass"},
{"Name":"Venonat","Type":"Bug","Type2":"Poison"},
{"Name":"Venomoth","Type":"Bug","Type2":"Poison"},
{"Name":"Diglett","Type":"Ground"},
{"Name":"Dugtrio","Type":"Ground"},
{"Name":"Meowth","Type":"Normal"},
{"Name":"Persian","Type":"Normal"},
{"Name":"Psyduck","Type":"Water"},
{"Name":"Golduck","Type":"Water"},
{"Name":"Mankey","Type":"Fighting"},
{"Name":"Primeape","Type":"Fighting"},
{"Name":"Growlithe","Type":"Fire"},
{"Name":"Arcanine","Type":"Fire"},
{"Name":"Poliwag","Type":"Water"},
{"Name":"Poliwhirl","Type":"Water"},
{"Name":"Poliwrath","Type":"Water","Type2":"Fighting"},
{"Name":"Abra","Type":"Psychic"},
{"Name":"Kadabra","Type":"Psychic"},
{"Name":"Alakazam","Type":"Psychic"},
{"Name":"Machop","Type":"Fighting"},
{"Name":"Machoke","Type":"Fighting"},
{"Name":"Machamp","Type":"Fighting"},
{"Name":"Bellsprout","Type":"Grass","Type2":"Poison"},
{"Name":"Weepinbell","Type":"Grass","Type2":"Poison"},
{"Name":"Victreebel","Type":"Grass","Type2":"Poison"},
{"Name":"Tentacool","Type":"Water","Type2":"Poison"},
{"Name":"Tentacruel","Type":"Water","Type2":"Poison"},
{"Name":"Geodude","Type":"Rock","Type2":"Ground"},
{"Name":"Graveler","Type":"Rock","Type2":"Ground"},
{"Name":"Golem","Type":"Rock","Type2":"Ground"},
{"Name":"Ponyta","Type":"Fire"},
{"Name":"Rapidash","Type":"Fire"},
{"Name":"Slowpoke","Type":"Water","Type2":"Psychic"},
{"Name":"Slowbro","Type":"Water","Type2":"Psychic"},
{"Name":"Magnemite","Type":"Electric","Type2":"Steel"},
{"Name":"Magneton","Type":"Electric","Type2":"Steel"},
{"Name":"Farfetchd","Type":"Normal","Type2":"Flying"},
{"Name":"Doduo","Type":"Normal","Type2":"Flying"},
{"Name":"Dodrio","Type":"Normal","Type2":"Flying"},
{"Name":"Seel","Type":"Water"},
{"Name":"Dewgong","Type":"Water","Type2":"Ice"},
{"Name":"Grimer","Type":"Poison"},
{"Name":"Muk","Type":"Poison"},
{"Name":"Shellder","Type":"Water"},
{"Name":"Cloyster","Type":"Water","Type2":"Ice"},
{"Name":"Gastly","Type":"Ghost","Type2":"Poison"},
{"Name":"Haunter","Type":"Ghost","Type2":"Poison"},
{"Name":"Gengar","Type":"Ghost","Type2":"Poison"},
{"Name":"Onix","Type":"Rock","Type2":"Ground"},
{"Name":"Drowzee","Type":"Psychic"},
{"Name":"Hypno","Type":"Psychic"},
{"Name":"Krabby","Type":"Water"},
{"Name":"Kingler","Type":"Water"},
{"Name":"Voltorb","Type":"Electric"},
{"Name":"Electrode","Type":"Electric"},
{"Name":"Exeggcute","Type":"Grass","Type2":"Psychic"},
{"Name":"Exeggutor","Type":"Grass","Type2":"Psychic"},
{"Name":"Cubone","Type":"Ground"},
{"Name":"Marowak","Type":"Ground"},
{"Name":"Hitmonlee","Type":"Fighting"},
{"Name":"Hitmonchan","Type":"Fighting"},
{"Name":"Lickitung","Type":"Normal"},
{"Name":"Koffing","Type":"Poison"},
{"Name":"Weezing","Type":"Poison"},
{"Name":"Rhyhorn","Type":"Ground","Type2":"Rock"},
{"Name":"Rhydon","Type":"Ground","Type2":"Rock"},
{"Name":"Chansey","Type":"Normal"},
{"Name":"Tangela","Type":"Grass"},
{"Name":"Kangaskhan","Type":"Normal"},
{"Name":"Horsea","Type":"Water"},
{"Name":"Seadra","Type":"Water"},
{"Name":"Goldeen","Type":"Water"},
{"Name":"Seaking","Type":"Water"},
{"Name":"Staryu","Type":"Water"},
{"Name":"Starmie","Type":"Water","Type2":"Psychic"},
{"Name":"Mr. Mime","Type":"Psychic","Type2":"Fairy"},
{"Name":"Scyther","Type":"Bug","Type2":"Flying"},
{"Name":"Jynx","Type":"Ice","Type2":"Psychic"},
{"Name":"Electabuzz","Type":"Electric"},
{"Name":"Magmar","Type":"Fire"},
{"Name":"Pinsir","Type":"Bug"},
{"Name":"Tauros","Type":"Normal"},
{"Name":"Magikarp","Type":"Water"},
{"Name":"Gyarados","Type":"Water","Type2":"Flying"},
{"Name":"Lapras","Type":"Water","Type2":"Ice"},
{"Name":"Ditto","Type":"Normal"},
{"Name":"Eevee","Type":"Normal"},
{"Name":"Vaporeon","Type":"Water"},
{"Name":"Jolteon","Type":"Electric"},
{"Name":"Flareon","Type":"Fire"},
{"Name":"Porygon","Type":"Normal"},
{"Name":"Omanyte","Type":"Rock","Type2":"Water"},
{"Name":"Omastar","Type":"Rock","Type2":"Water"},
{"Name":"Kabuto","Type":"Rock","Type2":"Water"},
{"Name":"Kabutops","Type":"Rock","Type2":"Water"},
{"Name":"Aerodactyl","Type":"Rock","Type2":"Flying"},
{"Name":"Snorlax","Type":"Normal"},
{"Name":"Articuno","Type":"Ice","Type2":"Flying"},
{"Name":"Zapdos","Type":"Electric","Type2":"Flying"},
{"Name":"Moltres","Type":"Fire","Type2":"Flying"},
{"Name":"Dratini","Type":"Dragon"},
{"Name":"Dragonair","Type":"Dragon"},
{"Name":"Dragonite","Type":"Dragon","Type2":"Flying"},
{"Name":"Mewtwo","Type":"Psychic"},
{"Name":"Mew","Type":"Psychic"},
{"Name":"Pokémon","Type":"Type"},
{"Name":"Chikorita","Type":"Grass"},
{"Name":"Bayleef","Type":"Grass"},
{"Name":"Meganium","Type":"Grass"},
{"Name":"Cyndaquil","Type":"Fire"},
{"Name":"Quilava","Type":"Fire"},
{"Name":"Typhlosion","Type":"Fire"},
{"Name":"Totodile","Type":"Water"},
{"Name":"Croconaw","Type":"Water"},
{"Name":"Feraligatr","Type":"Water"},
{"Name":"Sentret","Type":"Normal"},
{"Name":"Furret","Type":"Normal"},
{"Name":"Hoothoot","Type":"Normal","Type2":"Flying"},
{"Name":"Noctowl","Type":"Normal","Type2":"Flying"},
{"Name":"Ledyba","Type":"Bug","Type2":"Flying"},
{"Name":"Ledian","Type":"Bug","Type2":"Flying"},
{"Name":"Spinarak","Type":"Bug","Type2":"Poison"},
{"Name":"Ariados","Type":"Bug","Type2":"Poison"},
{"Name":"Crobat","Type":"Poison","Type2":"Flying"},
{"Name":"Chinchou","Type":"Water","Type2":"Electric"},
{"Name":"Lanturn","Type":"Water","Type2":"Electric"},
{"Name":"Pichu","Type":"Electric"},
{"Name":"Cleffa","Type":"Fairy"},
{"Name":"Igglybuff","Type":"Normal","Type2":"Fairy"},
{"Name":"Togepi","Type":"Fairy"},
{"Name":"Togetic","Type":"Fairy","Type2":"Flying"},
{"Name":"Natu","Type":"Psychic","Type2":"Flying"},
{"Name":"Xatu","Type":"Psychic","Type2":"Flying"},
{"Name":"Mareep","Type":"Electric"},
{"Name":"Flaaffy","Type":"Electric"},
{"Name":"Ampharos","Type":"Electric"},
{"Name":"Bellossom","Type":"Grass"},
{"Name":"Marill","Type":"Water","Type2":"Fairy"},
{"Name":"Azumarill","Type":"Water","Type2":"Fairy"},
{"Name":"Sudowoodo","Type":"Rock"},
{"Name":"Politoed","Type":"Water"},
{"Name":"Hoppip","Type":"Grass","Type2":"Flying"},
{"Name":"Skiploom","Type":"Grass","Type2":"Flying"},
{"Name":"Jumpluff","Type":"Grass","Type2":"Flying"},
{"Name":"Aipom","Type":"Normal"},
{"Name":"Sunkern","Type":"Grass"},
{"Name":"Sunflora","Type":"Grass"},
{"Name":"Yanma","Type":"Bug","Type2":"Flying"},
{"Name":"Wooper","Type":"Water","Type2":"Ground"},
{"Name":"Quagsire","Type":"Water","Type2":"Ground"},
{"Name":"Espeon","Type":"Psychic"},
{"Name":"Umbreon","Type":"Dark"},
{"Name":"Murkrow","Type":"Dark","Type2":"Flying"},
{"Name":"Slowking","Type":"Water","Type2":"Psychic"},
{"Name":"Misdreavus","Type":"Ghost"},
{"Name":"Unown","Type":"Psychic"},
{"Name":"Wobbuffet","Type":"Psychic"},
{"Name":"Girafarig","Type":"Normal","Type2":"Psychic"},
{"Name":"Pineco","Type":"Bug"},
{"Name":"Forretress","Type":"Bug","Type2":"Steel"},
{"Name":"Dunsparce","Type":"Normal"},
{"Name":"Gligar","Type":"Ground","Type2":"Flying"},
{"Name":"Steelix","Type":"Steel","Type2":"Ground"},
{"Name":"Snubbull","Type":"Fairy"},
{"Name":"Granbull","Type":"Fairy"},
{"Name":"Qwilfish","Type":"Water","Type2":"Poison"},
{"Name":"Scizor","Type":"Bug","Type2":"Steel"},
{"Name":"Shuckle","Type":"Bug","Type2":"Rock"},
{"Name":"Heracross","Type":"Bug","Type2":"Fighting"},
{"Name":"Sneasel","Type":"Dark","Type2":"Ice"},
{"Name":"Teddiursa","Type":"Normal"},
{"Name":"Ursaring","Type":"Normal"},
{"Name":"Slugma","Type":"Fire"},
{"Name":"Magcargo","Type":"Fire","Type2":"Rock"},
{"Name":"Swinub","Type":"Ice","Type2":"Ground"},
{"Name":"Piloswine","Type":"Ice","Type2":"Ground"},
{"Name":"Corsola","Type":"Water","Type2":"Rock"},
{"Name":"Remoraid","Type":"Water"},
{"Name":"Octillery","Type":"Water"},
{"Name":"Delibird","Type":"Ice","Type2":"Flying"},
{"Name":"Mantine","Type":"Water","Type2":"Flying"},
{"Name":"Skarmory","Type":"Steel","Type2":"Flying"},
{"Name":"Houndour","Type":"Dark","Type2":"Fire"},
{"Name":"Houndoom","Type":"Dark","Type2":"Fire"},
{"Name":"Kingdra","Type":"Water","Type2":"Dragon"},
{"Name":"Phanpy","Type":"Ground"},
{"Name":"Donphan","Type":"Ground"},
{"Name":"Porygon2","Type":"Normal"},
{"Name":"Stantler","Type":"Normal"},
{"Name":"Smeargle","Type":"Normal"},
{"Name":"Tyrogue","Type":"Fighting"},
{"Name":"Hitmontop","Type":"Fighting"},
{"Name":"Smoochum","Type":"Ice","Type2":"Psychic"},
{"Name":"Elekid","Type":"Electric"},
{"Name":"Magby","Type":"Fire"},
{"Name":"Miltank","Type":"Normal"},
{"Name":"Blissey","Type":"Normal"},
{"Name":"Raikou","Type":"Electric"},
{"Name":"Entei","Type":"Fire"},
{"Name":"Suicune","Type":"Water"},
{"Name":"Larvitar","Type":"Rock","Type2":"Ground"},
{"Name":"Pupitar","Type":"Rock","Type2":"Ground"},
{"Name":"Tyranitar","Type":"Rock","Type2":"Dark"},
{"Name":"Lugia","Type":"Psychic","Type2":"Flying"},
{"Name":"Ho-Oh","Type":"Fire","Type2":"Flying"},
{"Name":"Celebi","Type":"Psychic","Type2":"Grass"},
{"Name":"Pokémon","Type":"Type"},
{"Name":"Treecko","Type":"Grass"},
{"Name":"Grovyle","Type":"Grass"},
{"Name":"Sceptile","Type":"Grass"},
{"Name":"Torchic","Type":"Fire"},
{"Name":"Combusken","Type":"Fire","Type2":"Fighting"},
{"Name":"Blaziken","Type":"Fire","Type2":"Fighting"},
{"Name":"Mudkip","Type":"Water"},
{"Name":"Marshtomp","Type":"Water","Type2":"Ground"},
{"Name":"Swampert","Type":"Water","Type2":"Ground"},
{"Name":"Poochyena","Type":"Dark"},
{"Name":"Mightyena","Type":"Dark"},
{"Name":"Zigzagoon","Type":"Normal"},
{"Name":"Linoone","Type":"Normal"},
{"Name":"Wurmple","Type":"Bug"},
{"Name":"Silcoon","Type":"Bug"},
{"Name":"Beautifly","Type":"Bug","Type2":"Flying"},
{"Name":"Cascoon","Type":"Bug"},
{"Name":"Dustox","Type":"Bug","Type2":"Poison"},
{"Name":"Lotad","Type":"Water","Type2":"Grass"},
{"Name":"Lombre","Type":"Water","Type2":"Grass"},
{"Name":"Ludicolo","Type":"Water","Type2":"Grass"},
{"Name":"Seedot","Type":"Grass"},
{"Name":"Nuzleaf","Type":"Grass","Type2":"Dark"},
{"Name":"Shiftry","Type":"Grass","Type2":"Dark"},
{"Name":"Taillow","Type":"Normal","Type2":"Flying"},
{"Name":"Swellow","Type":"Normal","Type2":"Flying"},
{"Name":"Wingull","Type":"Water","Type2":"Flying"},
{"Name":"Pelipper","Type":"Water","Type2":"Flying"},
{"Name":"Ralts","Type":"Psychic","Type2":"Fairy"},
{"Name":"Kirlia","Type":"Psychic","Type2":"Fairy"},
{"Name":"Gardevoir","Type":"Psychic","Type2":"Fairy"},
{"Name":"Surskit","Type":"Bug","Type2":"Water"},
{"Name":"Masquerain","Type":"Bug","Type2":"Flying"},
{"Name":"Shroomish","Type":"Grass"},
{"Name":"Breloom","Type":"Grass","Type2":"Fighting"},
{"Name":"Slakoth","Type":"Normal"},
{"Name":"Vigoroth","Type":"Normal"},
{"Name":"Slaking","Type":"Normal"},
{"Name":"Nincada","Type":"Bug","Type2":"Ground"},
{"Name":"Ninjask","Type":"Bug","Type2":"Flying"},
{"Name":"Shedinja","Type":"Bug","Type2":"Ghost"},
{"Name":"Whismur","Type":"Normal"},
{"Name":"Loudred","Type":"Normal"},
{"Name":"Exploud","Type":"Normal"},
{"Name":"Makuhita","Type":"Fighting"},
{"Name":"Hariyama","Type":"Fighting"},
{"Name":"Azurill","Type":"Normal","Type2":"Fairy"},
{"Name":"Nosepass","Type":"Rock"},
{"Name":"Skitty","Type":"Normal"},
{"Name":"Delcatty","Type":"Normal"},
{"Name":"Sableye","Type":"Dark","Type2":"Ghost"},
{"Name":"Mawile","Type":"Steel","Type2":"Fairy"},
{"Name":"Aron","Type":"Steel","Type2":"Rock"},
{"Name":"Lairon","Type":"Steel","Type2":"Rock"},
{"Name":"Aggron","Type":"Steel","Type2":"Rock"},
{"Name":"Meditite","Type":"Fighting","Type2":"Psychic"},
{"Name":"Medicham","Type":"Fighting","Type2":"Psychic"},
{"Name":"Electrike","Type":"Electric"},
{"Name":"Manectric","Type":"Electric"},
{"Name":"Plusle","Type":"Electric"},
{"Name":"Minun","Type":"Electric"},
{"Name":"Volbeat","Type":"Bug"},
{"Name":"Illumise","Type":"Bug"},
{"Name":"Roselia","Type":"Grass","Type2":"Poison"},
{"Name":"Gulpin","Type":"Poison"},
{"Name":"Swalot","Type":"Poison"},
{"Name":"Carvanha","Type":"Water","Type2":"Dark"},
{"Name":"Sharpedo","Type":"Water","Type2":"Dark"},
{"Name":"Wailmer","Type":"Water"},
{"Name":"Wailord","Type":"Water"},
{"Name":"Numel","Type":"Fire","Type2":"Ground"},
{"Name":"Camerupt","Type":"Fire","Type2":"Ground"},
{"Name":"Torkoal","Type":"Fire"},
{"Name":"Spoink","Type":"Psychic"},
{"Name":"Grumpig","Type":"Psychic"},
{"Name":"Spinda","Type":"Normal"},
{"Name":"Trapinch","Type":"Ground"},
{"Name":"Vibrava","Type":"Ground","Type2":"Dragon"},
{"Name":"Flygon","Type":"Ground","Type2":"Dragon"},
{"Name":"Cacnea","Type":"Grass"},
{"Name":"Cacturne","Type":"Grass","Type2":"Dark"},
{"Name":"Swablu","Type":"Normal","Type2":"Flying"},
{"Name":"Altaria","Type":"Dragon","Type2":"Flying"},
{"Name":"Zangoose","Type":"Normal"},
{"Name":"Seviper","Type":"Poison"},
{"Name":"Lunatone","Type":"Rock","Type2":"Psychic"},
{"Name":"Solrock","Type":"Rock","Type2":"Psychic"},
{"Name":"Barboach","Type":"Water","Type2":"Ground"},
{"Name":"Whiscash","Type":"Water","Type2":"Ground"},
{"Name":"Corphish","Type":"Water"},
{"Name":"Crawdaunt","Type":"Water","Type2":"Dark"},
{"Name":"Baltoy","Type":"Ground","Type2":"Psychic"},
{"Name":"Claydol","Type":"Ground","Type2":"Psychic"},
{"Name":"Lileep","Type":"Rock","Type2":"Grass"},
{"Name":"Cradily","Type":"Rock","Type2":"Grass"},
{"Name":"Anorith","Type":"Rock","Type2":"Bug"},
{"Name":"Armaldo","Type":"Rock","Type2":"Bug"},
{"Name":"Feebas","Type":"Water"},
{"Name":"Milotic","Type":"Water"},
{"Name":"Castform","Type":"Normal"},
{"Name":"Castform","Type":"Fire"},
{"Name":"Castform","Type":"Water"},
{"Name":"Castform","Type":"Ice"},
{"Name":"Kecleon","Type":"Normal"},
{"Name":"Shuppet","Type":"Ghost"},
{"Name":"Banette","Type":"Ghost"},
{"Name":"Duskull","Type":"Ghost"},
{"Name":"Dusclops","Type":"Ghost"},
{"Name":"Tropius","Type":"Grass","Type2":"Flying"},
{"Name":"Chimecho","Type":"Psychic"},
{"Name":"Absol","Type":"Dark"},
{"Name":"Wynaut","Type":"Psychic"},
{"Name":"Snorunt","Type":"Ice"},
{"Name":"Glalie","Type":"Ice"},
{"Name":"Spheal","Type":"Ice","Type2":"Water"},
{"Name":"Sealeo","Type":"Ice","Type2":"Water"},
{"Name":"Walrein","Type":"Ice","Type2":"Water"},
{"Name":"Clamperl","Type":"Water"},
{"Name":"Huntail","Type":"Water"},
{"Name":"Gorebyss","Type":"Water"},
{"Name":"Relicanth","Type":"Water","Type2":"Rock"},
{"Name":"Luvdisc","Type":"Water"},
{"Name":"Bagon","Type":"Dragon"},
{"Name":"Shelgon","Type":"Dragon"},
{"Name":"Salamence","Type":"Dragon","Type2":"Flying"},
{"Name":"Beldum","Type":"Steel","Type2":"Psychic"},
{"Name":"Metang","Type":"Steel","Type2":"Psychic"},
{"Name":"Metagross","Type":"Steel","Type2":"Psychic"},
{"Name":"Regirock","Type":"Rock"},
{"Name":"Regice","Type":"Ice"},
{"Name":"Registeel","Type":"Steel"},
{"Name":"Latias","Type":"Dragon","Type2":"Psychic"},
{"Name":"Latios","Type":"Dragon","Type2":"Psychic"},
{"Name":"Kyogre","Type":"Water"},
{"Name":"Groudon","Type":"Ground"},
{"Name":"Rayquaza","Type":"Dragon","Type2":"Flying"},
{"Name":"Jirachi","Type":"Steel","Type2":"Psychic"},
{"Name":"Deoxys","Type":"Psychic"},
{"Name":"Turtwig","Type":"Grass"},
{"Name":"Grotle","Type":"Grass"},
{"Name":"Torterra","Type":"Grass","Type2":"Ground"},
{"Name":"Chimchar","Type":"Fire"},
{"Name":"Monferno","Type":"Fire","Type2":"Fighting"},
{"Name":"Infernape","Type":"Fire","Type2":"Fighting"},
{"Name":"Piplup","Type":"Water"},
{"Name":"Prinplup","Type":"Water"},
{"Name":"Empoleon","Type":"Water","Type2":"Steel"},
{"Name":"Starly","Type":"Normal","Type2":"Flying"},
{"Name":"Staravia","Type":"Normal","Type2":"Flying"},
{"Name":"Staraptor","Type":"Normal","Type2":"Flying"},
{"Name":"Bidoof","Type":"Normal"},
{"Name":"Bibarel","Type":"Normal","Type2":"Water"},
{"Name":"Kricketot","Type":"Bug"},
{"Name":"Kricketune","Type":"Bug"},
{"Name":"Shinx","Type":"Electric"},
{"Name":"Luxio","Type":"Electric"},
{"Name":"Luxray","Type":"Electric"},
{"Name":"Budew","Type":"Grass","Type2":"Poison"},
{"Name":"Roserade","Type":"Grass","Type2":"Poison"},
{"Name":"Cranidos","Type":"Rock"},
{"Name":"Rampardos","Type":"Rock"},
{"Name":"Shieldon","Type":"Rock","Type2":"Steel"},
{"Name":"Bastiodon","Type":"Rock","Type2":"Steel"},
{"Name":"Burmy","Type":"Bug"},
{"Name":"Burmy","Type":"Bug"},
{"Name":"Burmy","Type":"Bug"},
{"Name":"Wormadam","Type":"Bug","Type2":"Grass"},
{"Name":"Wormadam","Type":"Bug","Type2":"Ground"},
{"Name":"Wormadam","Type":"Bug","Type2":"Steel"},
{"Name":"Mothim","Type":"Bug","Type2":"Flying"},
{"Name":"Combee","Type":"Bug","Type2":"Flying"},
{"Name":"Vespiquen","Type":"Bug","Type2":"Flying"},
{"Name":"Pachirisu","Type":"Electric"},
{"Name":"Buizel","Type":"Water"},
{"Name":"Floatzel","Type":"Water"},
{"Name":"Cherubi","Type":"Grass"},
{"Name":"Cherrim","Type":"Grass"},
{"Name":"Shellos","Type":"Water"},
{"Name":"Shellos","Type":"Water"},
{"Name":"Gastrodon","Type":"Water","Type2":"Ground"},
{"Name":"Gastrodon","Type":"Water","Type2":"Ground"},
{"Name":"Ambipom","Type":"Normal"},
{"Name":"Drifloon","Type":"Ghost","Type2":"Flying"},
{"Name":"Drifblim","Type":"Ghost","Type2":"Flying"},
{"Name":"Buneary","Type":"Normal"},
{"Name":"Lopunny","Type":"Normal"},
{"Name":"Mismagius","Type":"Ghost"},
{"Name":"Honchkrow","Type":"Dark","Type2":"Flying"},
{"Name":"Glameow","Type":"Normal"},
{"Name":"Purugly","Type":"Normal"},
{"Name":"Chingling","Type":"Psychic"},
{"Name":"Stunky","Type":"Poison","Type2":"Dark"},
{"Name":"Skuntank","Type":"Poison","Type2":"Dark"},
{"Name":"Bronzor","Type":"Steel","Type2":"Psychic"},
{"Name":"Bronzong","Type":"Steel","Type2":"Psychic"},
{"Name":"Bonsly","Type":"Rock"},
{"Name":"Mime Jr.","Type":"Psychic","Type2":"Fairy"},
{"Name":"Happiny","Type":"Normal"},
{"Name":"Chatot","Type":"Normal","Type2":"Flying"},
{"Name":"Spiritomb","Type":"Ghost","Type2":"Dark"},
{"Name":"Gible","Type":"Dragon","Type2":"Ground"},
{"Name":"Gabite","Type":"Dragon","Type2":"Ground"},
{"Name":"Garchomp","Type":"Dragon","Type2":"Ground"},
{"Name":"Munchlax","Type":"Normal"},
{"Name":"Riolu","Type":"Fighting"},
{"Name":"Lucario","Type":"Fighting","Type2":"Steel"},
{"Name":"Hippopotas","Type":"Ground"},
{"Name":"Hippowdon","Type":"Ground"},
{"Name":"Skorupi","Type":"Poison","Type2":"Bug"},
{"Name":"Drapion","Type":"Poison","Type2":"Dark"},
{"Name":"Croagunk","Type":"Poison","Type2":"Fighting"},
{"Name":"Toxicroak","Type":"Poison","Type2":"Fighting"},
{"Name":"Carnivine","Type":"Grass"},
{"Name":"Finneon","Type":"Water"},
{"Name":"Lumineon","Type":"Water"},
{"Name":"Mantyke","Type":"Water","Type2":"Flying"},
{"Name":"Snover","Type":"Grass","Type2":"Ice"},
{"Name":"Abomasnow","Type":"Grass","Type2":"Ice"},
{"Name":"Weavile","Type":"Dark","Type2":"Ice"},
{"Name":"Magnezone","Type":"Electric","Type2":"Steel"},
{"Name":"Lickilicky","Type":"Normal"},
{"Name":"Rhyperior","Type":"Ground","Type2":"Rock"},
{"Name":"Tangrowth","Type":"Grass"},
{"Name":"Electivire","Type":"Electric"},
{"Name":"Magmortar","Type":"Fire"},
{"Name":"Togekiss","Type":"Fairy","Type2":"Flying"},
{"Name":"Yanmega","Type":"Bug","Type2":"Flying"},
{"Name":"Leafeon","Type":"Grass"},
{"Name":"Glaceon","Type":"Ice"},
{"Name":"Gliscor","Type":"Ground","Type2":"Flying"},
{"Name":"Mamoswine","Type":"Ice","Type2":"Ground"},
{"Name":"Porygon-Z","Type":"Normal"},
{"Name":"Gallade","Type":"Psychic","Type2":"Fighting"},
{"Name":"Probopass","Type":"Rock","Type2":"Steel"},
{"Name":"Dusknoir","Type":"Ghost"},
{"Name":"Froslass","Type":"Ice","Type2":"Ghost"},
{"Name":"Rotom","Type":"Electric","Type2":"Ghost"},
{"Name":"Uxie","Type":"Psychic"},
{"Name":"Mesprit","Type":"Psychic"},
{"Name":"Azelf","Type":"Psychic"},
{"Name":"Dialga","Type":"Steel","Type2":"Dragon"},
{"Name":"Palkia","Type":"Water","Type2":"Dragon"},
{"Name":"Heatran","Type":"Fire","Type2":"Steel"},
{"Name":"Regigigas","Type":"Normal"},
{"Name":"Giratina","Type":"Ghost","Type2":"Dragon"},
{"Name":"Cresselia","Type":"Psychic"},
{"Name":"Phione","Type":"Water"},
{"Name":"Manaphy","Type":"Water"},
{"Name":"Darkrai","Type":"Dark"},
{"Name":"Shaymin","Type":"Grass"},
{"Name":"Shaymin","Type":"Grass","Type2":"Flying"},
{"Name":"Arceus","Type":"Normal"},
{"Name":"Pokémon","Type":"Type"},
{"Name":"Victini","Type":"Psychic","Type2":"Fire"},
{"Name":"Snivy","Type":"Grass"},
{"Name":"Servine","Type":"Grass"},
{"Name":"Serperior","Type":"Grass"},
{"Name":"Tepig","Type":"Fire"},
{"Name":"Pignite","Type":"Fire","Type2":"Fighting"},
{"Name":"Emboar","Type":"Fire","Type2":"Fighting"},
{"Name":"Oshawott","Type":"Water"},
{"Name":"Dewott","Type":"Water"},
{"Name":"Samurott","Type":"Water"},
{"Name":"Patrat","Type":"Normal"},
{"Name":"Watchog","Type":"Normal"},
{"Name":"Lillipup","Type":"Normal"},
{"Name":"Herdier","Type":"Normal"},
{"Name":"Stoutland","Type":"Normal"},
{"Name":"Purrloin","Type":"Dark"},
{"Name":"Liepard","Type":"Dark"},
{"Name":"Pansage","Type":"Grass"},
{"Name":"Simisage","Type":"Grass"},
{"Name":"Pansear","Type":"Fire"},
{"Name":"Simisear","Type":"Fire"},
{"Name":"Panpour","Type":"Water"},
{"Name":"Simipour","Type":"Water"},
{"Name":"Munna","Type":"Psychic"},
{"Name":"Musharna","Type":"Psychic"},
{"Name":"Pidove","Type":"Normal","Type2":"Flying"},
{"Name":"Tranquill","Type":"Normal","Type2":"Flying"},
{"Name":"Unfezant","Type":"Normal","Type2":"Flying"},
{"Name":"Blitzle","Type":"Electric"},
{"Name":"Zebstrika","Type":"Electric"},
{"Name":"Roggenrola","Type":"Rock"},
{"Name":"Boldore","Type":"Rock"},
{"Name":"Gigalith","Type":"Rock"},
{"Name":"Woobat","Type":"Psychic","Type2":"Flying"},
{"Name":"Swoobat","Type":"Psychic","Type2":"Flying"},
{"Name":"Drilbur","Type":"Ground"},
{"Name":"Excadrill","Type":"Ground","Type2":"Steel"},
{"Name":"Audino","Type":"Normal"},
{"Name":"Timburr","Type":"Fighting"},
{"Name":"Gurdurr","Type":"Fighting"},
{"Name":"Conkeldurr","Type":"Fighting"},
{"Name":"Tympole","Type":"Water"},
{"Name":"Palpitoad","Type":"Water","Type2":"Ground"},
{"Name":"Seismitoad","Type":"Water","Type2":"Ground"},
{"Name":"Throh","Type":"Fighting"},
{"Name":"Sawk","Type":"Fighting"},
{"Name":"Sewaddle","Type":"Bug","Type2":"Grass"},
{"Name":"Swadloon","Type":"Bug","Type2":"Grass"},
{"Name":"Leavanny","Type":"Bug","Type2":"Grass"},
{"Name":"Venipede","Type":"Bug","Type2":"Poison"},
{"Name":"Whirlipede","Type":"Bug","Type2":"Poison"},
{"Name":"Scolipede","Type":"Bug","Type2":"Poison"},
{"Name":"Cottonee","Type":"Grass","Type2":"Fairy"},
{"Name":"Whimsicott","Type":"Grass","Type2":"Fairy"},
{"Name":"Petilil","Type":"Grass"},
{"Name":"Lilligant","Type":"Grass"},
{"Name":"Basculin","Type":"Water"},
{"Name":"Basculin","Type":"Water"},
{"Name":"Sandile","Type":"Ground","Type2":"Dark"},
{"Name":"Krokorok","Type":"Ground","Type2":"Dark"},
{"Name":"Krookodile","Type":"Ground","Type2":"Dark"},
{"Name":"Darumaka","Type":"Fire"},
{"Name":"Darmanitan","Type":"Fire"},
{"Name":"Darmanitan","Type":"Fire","Type2":"Psychic"},
{"Name":"Maractus","Type":"Grass"},
{"Name":"Dwebble","Type":"Bug","Type2":"Rock"},
{"Name":"Crustle","Type":"Bug","Type2":"Rock"},
{"Name":"Scraggy","Type":"Dark","Type2":"Fighting"},
{"Name":"Scrafty","Type":"Dark","Type2":"Fighting"},
{"Name":"Sigilyph","Type":"Psychic","Type2":"Flying"},
{"Name":"Yamask","Type":"Ghost"},
{"Name":"Cofagrigus","Type":"Ghost"},
{"Name":"Tirtouga","Type":"Water","Type2":"Rock"},
{"Name":"Carracosta","Type":"Water","Type2":"Rock"},
{"Name":"Archen","Type":"Rock","Type2":"Flying"},
{"Name":"Archeops","Type":"Rock","Type2":"Flying"},
{"Name":"Trubbish","Type":"Poison"},
{"Name":"Garbodor","Type":"Poison"},
{"Name":"Zorua","Type":"Dark"},
{"Name":"Zoroark","Type":"Dark"},
{"Name":"Minccino","Type":"Normal"},
{"Name":"Cinccino","Type":"Normal"},
{"Name":"Gothita","Type":"Psychic"},
{"Name":"Gothorita","Type":"Psychic"},
{"Name":"Gothitelle","Type":"Psychic"},
{"Name":"Solosis","Type":"Psychic"},
{"Name":"Duosion","Type":"Psychic"},
{"Name":"Reuniclus","Type":"Psychic"},
{"Name":"Ducklett","Type":"Water","Type2":"Flying"},
{"Name":"Swanna","Type":"Water","Type2":"Flying"},
{"Name":"Vanillite","Type":"Ice"},
{"Name":"Vanillish","Type":"Ice"},
{"Name":"Vanilluxe","Type":"Ice"},
{"Name":"Deerling","Type":"Normal","Type2":"Grass"},
{"Name":"Sawsbuck","Type":"Normal","Type2":"Grass"},
{"Name":"Emolga","Type":"Electric","Type2":"Flying"},
{"Name":"Karrablast","Type":"Bug"},
{"Name":"Escavalier","Type":"Bug","Type2":"Steel"},
{"Name":"Foongus","Type":"Grass","Type2":"Poison"},
{"Name":"Amoonguss","Type":"Grass","Type2":"Poison"},
{"Name":"Frillish","Type":"Water","Type2":"Ghost"},
{"Name":"Frillish","Type":"Water","Type2":"Ghost"},
{"Name":"Jellicent","Type":"Water","Type2":"Ghost"},
{"Name":"Jellicent","Type":"Water","Type2":"Ghost"},
{"Name":"Alomomola","Type":"Water"},
{"Name":"Joltik","Type":"Bug","Type2":"Electric"},
{"Name":"Galvantula","Type":"Bug","Type2":"Electric"},
{"Name":"Ferroseed","Type":"Grass","Type2":"Steel"},
{"Name":"Ferrothorn","Type":"Grass","Type2":"Steel"},
{"Name":"Klink","Type":"Steel"},
{"Name":"Klang","Type":"Steel"},
{"Name":"Klinklang","Type":"Steel"},
{"Name":"Tynamo","Type":"Electric"},
{"Name":"Eelektrik","Type":"Electric"},
{"Name":"Eelektross","Type":"Electric"},
{"Name":"Elgyem","Type":"Psychic"},
{"Name":"Beheeyem","Type":"Psychic"},
{"Name":"Litwick","Type":"Ghost","Type2":"Fire"},
{"Name":"Lampent","Type":"Ghost","Type2":"Fire"},
{"Name":"Chandelure","Type":"Ghost","Type2":"Fire"},
{"Name":"Axew","Type":"Dragon"},
{"Name":"Fraxure","Type":"Dragon"},
{"Name":"Haxorus","Type":"Dragon"},
{"Name":"Cubchoo","Type":"Ice"},
{"Name":"Beartic","Type":"Ice"},
{"Name":"Cryogonal","Type":"Ice"},
{"Name":"Shelmet","Type":"Bug"},
{"Name":"Accelgor","Type":"Bug"},
{"Name":"Stunfisk","Type":"Ground","Type2":"Electric"},
{"Name":"Mienfoo","Type":"Fighting"},
{"Name":"Mienshao","Type":"Fighting"},
{"Name":"Druddigon","Type":"Dragon"},
{"Name":"Golett","Type":"Ground","Type2":"Ghost"},
{"Name":"Golurk","Type":"Ground","Type2":"Ghost"},
{"Name":"Pawniard","Type":"Dark","Type2":"Steel"},
{"Name":"Bisharp","Type":"Dark","Type2":"Steel"},
{"Name":"Bouffalant","Type":"Normal"},
{"Name":"Rufflet","Type":"Normal","Type2":"Flying"},
{"Name":"Braviary","Type":"Normal","Type2":"Flying"},
{"Name":"Vullaby","Type":"Dark","Type2":"Flying"},
{"Name":"Mandibuzz","Type":"Dark","Type2":"Flying"},
{"Name":"Heatmor","Type":"Fire"},
{"Name":"Durant","Type":"Bug","Type2":"Steel"},
{"Name":"Deino","Type":"Dark","Type2":"Dragon"},
{"Name":"Zweilous","Type":"Dark","Type2":"Dragon"},
{"Name":"Hydreigon","Type":"Dark","Type2":"Dragon"},
{"Name":"Larvesta","Type":"Bug","Type2":"Fire"},
{"Name":"Volcarona","Type":"Bug","Type2":"Fire"},
{"Name":"Cobalion","Type":"Steel","Type2":"Fighting"},
{"Name":"Terrakion","Type":"Rock","Type2":"Fighting"},
{"Name":"Virizion","Type":"Grass","Type2":"Fighting"},
{"Name":"Tornadus","Type":"Flying"},
{"Name":"Thundurus","Type":"Electric","Type2":"Flying"},
{"Name":"Reshiram","Type":"Dragon","Type2":"Fire"},
{"Name":"Zekrom","Type":"Dragon","Type2":"Electric"},
{"Name":"Landorus","Type":"Ground","Type2":"Flying"},
{"Name":"Kyurem","Type":"Dragon","Type2":"Ice"},
{"Name":"Keldeo","Type":"Water","Type2":"Fighting"},
{"Name":"Meloetta","Type":"Normal","Type2":"Psychic"},
{"Name":"Meloetta","Type":"Normal","Type2":"Fighting"},
{"Name":"Genesect","Type":"Bug","Type2":"Steel"},
{"Name":"Pokémon","Type":"Type"},
{"Name":"Chespin","Type":"Grass"},
{"Name":"Quilladin","Type":"Grass"},
{"Name":"Chesnaught","Type":"Grass","Type2":"Fighting"},
{"Name":"Fennekin","Type":"Fire"},
{"Name":"Braixen","Type":"Fire"},
{"Name":"Delphox","Type":"Fire","Type2":"Psychic"},
{"Name":"Froakie","Type":"Water"},
{"Name":"Frogadier","Type":"Water"},
{"Name":"Greninja","Type":"Water","Type2":"Dark"},
{"Name":"Bunnelby","Type":"Normal"},
{"Name":"Diggersby","Type":"Normal","Type2":"Ground"},
{"Name":"Fletchling","Type":"Normal","Type2":"Flying"},
{"Name":"Fletchinder","Type":"Fire","Type2":"Flying"},
{"Name":"Talonflame","Type":"Fire","Type2":"Flying"},
{"Name":"Scatterbug","Type":"Bug"},
{"Name":"Spewpa","Type":"Bug"},
{"Name":"Vivillon","Type":"Bug","Type2":"Flying"},
{"Name":"Litleo","Type":"Fire","Type2":"Normal"},
{"Name":"Pyroar","Type":"Fire","Type2":"Normal"},
{"Name":"Flabébé","Type":"Fairy"},
{"Name":"Floette","Type":"Fairy"},
{"Name":"Florges","Type":"Fairy"},
{"Name":"Skiddo","Type":"Grass"},
{"Name":"Gogoat","Type":"Grass"},
{"Name":"Pancham","Type":"Fighting"},
{"Name":"Pangoro","Type":"Fighting","Type2":"Dark"},
{"Name":"Furfrou","Type":"Normal"},
{"Name":"Espurr","Type":"Psychic"},
{"Name":"Meowstic","Type":"Psychic"},
{"Name":"Honedge","Type":"Steel","Type2":"Ghost"},
{"Name":"Doublade","Type":"Steel","Type2":"Ghost"},
{"Name":"Aegislash","Type":"Steel","Type2":"Ghost"},
{"Name":"Spritzee","Type":"Fairy"},
{"Name":"Aromatisse","Type":"Fairy"},
{"Name":"Swirlix","Type":"Fairy"},
{"Name":"Slurpuff","Type":"Fairy"},
{"Name":"Inkay","Type":"Dark","Type2":"Psychic"},
{"Name":"Malamar","Type":"Dark","Type2":"Psychic"},
{"Name":"Binacle","Type":"Rock","Type2":"Water"},
{"Name":"Barbaracle","Type":"Rock","Type2":"Water"},
{"Name":"Skrelp","Type":"Poison","Type2":"Water"},
{"Name":"Dragalge","Type":"Poison","Type2":"Dragon"},
{"Name":"Clauncher","Type":"Water"},
{"Name":"Clawitzer","Type":"Water"},
{"Name":"Helioptile","Type":"Electric","Type2":"Normal"},
{"Name":"Heliolisk","Type":"Electric","Type2":"Normal"},
{"Name":"Tyrunt","Type":"Rock","Type2":"Dragon"},
{"Name":"Tyrantrum","Type":"Rock","Type2":"Dragon"},
{"Name":"Amaura","Type":"Rock","Type2":"Ice"},
{"Name":"Aurorus","Type":"Rock","Type2":"Ice"},
{"Name":"Sylveon","Type":"Fairy"},
{"Name":"Hawlucha","Type":"Fighting","Type2":"Flying"},
{"Name":"Dedenne","Type":"Electric","Type2":"Fairy"},
{"Name":"Carbink","Type":"Rock","Type2":"Fairy"},
{"Name":"Goomy","Type":"Dragon"},
{"Name":"Sliggoo","Type":"Dragon"},
{"Name":"Goodra","Type":"Dragon"},
{"Name":"Klefki","Type":"Steel","Type2":"Fairy"},
{"Name":"Phantump","Type":"Ghost","Type2":"Grass"},
{"Name":"Trevenant","Type":"Ghost","Type2":"Grass"},
{"Name":"Pumpkaboo","Type":"Ghost","Type2":"Grass"},
{"Name":"Gourgeist","Type":"Ghost","Type2":"Grass"},
{"Name":"Bergmite","Type":"Ice"},
{"Name":"Avalugg","Type":"Ice"},
{"Name":"Noibat","Type":"Flying","Type2":"Dragon"},
{"Name":"Noivern","Type":"Flying","Type2":"Dragon"},
{"Name":"Xerneas","Type":"Fairy"},
{"Name":"Yveltal","Type":"Dark","Type2":"Flying"},
{"Name":"Zygarde","Type":"Dragon","Type2":"Ground"},
{"Name":"Diancie","Type":"Rock","Type2":"Fairy"},
{"Name":"Hoopa","Type":"Psychic","Type2":"Ghost"},
{"Name":"Volcanion","Type":"Fire","Type2":"Water"}]

module.exports = (robot) ->
  robot.hear /pokemon (.*)/i, (msg) ->
    pokemonName = msg.match[1]
    returnedPokemon = getPokemon(msg, pokemonName)
    if (returnedPokemon? and returnedPokemon)
    	returnedPokemon[0].Type2 = returnedPokemon[0].Type2 ""
    	msg.send "Name: #{returnedPokemon[0].Name} Types: #{returnedPokemon[0].Type} #{returnedPokemon[0].Type2}"
    else
    	msg.send "That doesn't seem to be a real Pokemon, Senpai! Did you make it up?"

getPokemon = (msg, name) ->
    pokemon.filter (poke) ->
      poke.Name.toLowerCase() == name.toLowerCase()