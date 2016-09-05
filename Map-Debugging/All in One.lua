
        backupCount = 0
	mount = "Bicycle"
	
digger = 4		--Set the index number of Pokemon with digs
butter = 5		--Set the index number of Pokemon with headbutt


	MtMoon == false		--Set this to false if the dig spots are on cooldown to not encounter an error



	--CATCHING CONFIGURATION
	
		--PLEASE SET TO normal catch if you're not using Synchronize pokemon
		
catchUncaught = true		--set to true if you want to catch uncaught pokes else false
catchShiny = true		--set to true if you want to catch encountered shiny's else false
catchList = {"Golett", "Gligar", "Noibat", "Aron", "Beldum", "Mawile", "Absol", "Pawniard", "Litleo", "Vanillite", "Skorupi", "Trapinch", "Ferroseed", "Sawk", "Throh", "Timburr"}

normalCatchOn = false        --Directly throw pokeballs on hunted pokemons
fswipeOn = true       --Switch to pokemon with false swipe, use false swipe until the hunted pokes hp is reach to 1 then throw pokeballs
sleepOn = false            --Switch to pokemon with sleep move, use sleep move until the hunted pokes status is SLEEPING then throw pokeballs
advanceCatchOn = false        --Use fswipeOn and sleepOn to catch hunted pokes

falseswiper = 2            --Index of pokemon with false swipe
fswipeHP = 10            --Returns the health percent of the false swiper, then heal to PC
weakmove = "False Swipe"    --False Swipe move

sleeper = 6            --Index of pokemon with sleep move
sleeperHP = 10            --Returns the health percent of the false swiper, then heal to PC
sleepmove = "Spore"        --Set/Change the name of the sleep move




function onStart()
    ex = backupCount
    digcount = 0
	hbuttcount = 0
	pc = 0
	jto = 0
    smash = 1
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT in Excavation Site in case the bot DISCONNECTED---")
	log("--- Enter your BACK-UP COUNT if your disconnected in the middle of Hunting Sites ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
end
function onPause()
	
	log("Headbutt count: "..hbuttcount)
	log("Dig count: "..digcount)
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Debug count: "..ex)
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- You smashed "..smash.." fools in all sites!!! ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
end
function onStop()

end
function onDialogMessage(message)
	if message == "Reselect a different Pokemon?" then
		pushDialogAnswer(2)
	end
	if message == "Select a Pokemon that has Headbutt." then
		hbuttcount = hbuttcount + 1
		pushDialogAnswer(butter)
	elseif message == "Select a Pokemon that has Dig." then
		digcount = digcount + 1
		pushDialogAnswer(digger)
	elseif message == "Please select a Pokemon that knows the Dig technique." then
		pushDialogAnswer(digger)
	end
	

end
function IsPokemonOnCaptureList()
    result = false
    if catchList[1] ~= "" then
    for i = 1, TableLength(catchList), 1 do
        if getOpponentName() == catchList[i] then
            result = true
            break
        end
    end
    end
    return result
end
function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function onBattleAction()
	if isWildBattle() and ((catchShiny and isOpponentShiny()) or (catchUncaught and not isAlreadyCaught()) or IsPokemonOnCaptureList()) then
		if fswipeOn then
           	log("-------- Commencing False Swipe --------")
            		fswipe()
        	elseif sleepOn then
            	log("-------- Commencing Sleep Move --------")
            		sleep()
        	elseif advanceCatchOn then
            	log("-------- Commencing False Swipe with Sleep Move --------")
            		advanceCatch()
        	elseif normalCatchOn then
            	log("-------- Starting to throw Pokeballs --------")
            		normal()  
		end 
	else
		return run() or sendPokemon(3) or sendAnyPokemon() or attack()
	end
end
function onPathAction()
  if not isMounted() and hasItem(mount) and not isSurfing() and isOutside() then
		log("---------------------------")
		log("~~~ Riding on my pet!!! ~~~")
		log("---------------------------")
		return useItem(mount)
  elseif isPokemonUsable(1) then
    	if getMapName() == "Pallet Town" then
  			if isNpcOnCell(28, 22) then
  				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(28, 22)	--Tree 1
			elseif isNpcOnCell(27, 16) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(27, 16)	--Tree 2
			elseif isNpcOnCell(20, 7) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(20, 7)	--Tree 3
			elseif isNpcOnCell(8, 5) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(8, 5)	--Tree 4
			elseif isNpcOnCell(4, 7) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(4, 7)	--Tree 5
			elseif isNpcOnCell(13, 17) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(13, 17)	--Tree 6
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 1")
			end
		elseif getMapName() == "Route 1" then
			if isNpcOnCell(6,7) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(6,7)	--Tree 1
			elseif isNpcOnCell(19,5) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(19,5)	--Tree 2
			elseif isNpcOnCell(13,23) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(13,23)	--Tree 3
			elseif isNpcOnCell(17,23) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(17,23)	--Tree 4
			elseif isNpcOnCell(14,28) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(14,28)	--Tree 5
			elseif isNpcOnCell(17,35) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(17,35)	--Tree 6
			elseif isNpcOnCell(9,37) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(9,37)	--Tree 7
			elseif isNpcOnCell(28,43) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(28,43)	--Tree 8
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 1 Stop House")
			end
		elseif getMapName() == "Route 1 Stop House" then
			moveToMap("Viridian City")
		elseif getMapName() == "Viridian City" then
			if jto == 0 then
				
			if pc == 0 then
				if isNpcOnCell(25,58) then
				
				log("---Headbutting 1st tree---")
					return talkToNpcOnCell(25,58)	--Tree 1
				elseif isNpcOnCell(27,57) then
	
				log("---Headbutting 2nd tree---")
					return talkToNpcOnCell(27,57)	--Tree 2
				elseif isNpcOnCell(43,56) then
				
				log("---Headbutting 3rd tree---")
					return talkToNpcOnCell(43,56)	--Tree 3
				elseif isNpcOnCell(24,46) then
					
				log("---Headbutting 4th tree---")
					return talkToNpcOnCell(24,46)	--Tree 4
				elseif isNpcOnCell(65,47) then
				
				log("---Headbutting 5th tree---")
					return talkToNpcOnCell(65,47)	--Tree 5
				elseif isNpcOnCell(45,33) then
				
				log("---Headbutting 6th tree---")
					return talkToNpcOnCell(45,33)	--Tree 6
				elseif isNpcOnCell(43,34) then
				
				log("---Headbutting 7th tree---")
					return talkToNpcOnCell(43,34)	--Tree 7
				elseif isNpcOnCell(34,34) then
				
				log("----Headbutting 8th tree---")
					return talkToNpcOnCell(34,34)	--Tree 8
				elseif isNpcOnCell(33,13) then
				
				log("---Headbutting 9th tree---")
					return talkToNpcOnCell(33,13)	--Tree 9
				elseif isNpcOnCell(45,25) then
				
				log("---Headbutting 10th tree---")
					return talkToNpcOnCell(45,25)	--Tree 10
				elseif isNpcOnCell(56,27) then
				
				log("---Headbutting 11th tree---")
					return talkToNpcOnCell(56,27)	--Tree 11
				elseif isNpcOnCell(43,15) then
				
				log("---Headbutting Last tree---")
					return talkToNpcOnCell(43,15)	--Tree 12
				else
					log("--- Pokecenter found! Registering on PC ---")
					moveToMap("Pokecenter Viridian")
					pc = pc + 1
				end
			elseif pc == 1 then
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 2")
			end
			elseif jto == 1 then
				log("We are now near JOHTO REGION...Prepare yourself!")
				moveToMap("Route 22")
			end
		elseif getMapName() == "Pokecenter Viridian" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Viridian City")
		elseif getMapName() == "Pokecenter Pewter" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Pewter City")
		elseif getMapName() == "Pokecenter Route 3" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Route 3")
		elseif getMapName() == "Pokecenter Cerulean" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Cerulean City")
		elseif getMapName() == "Pokecenter Route 10" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Route 10")
		elseif getMapName() == "Pokecenter Lavender" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Lavender Town")
		elseif getMapName() == "Pokecenter Fuchsia" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Fuchsia City")
		elseif getMapName() == "Pokecenter Celadon" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Celadon City")
		elseif getMapName() == "Pokecenter Saffron" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Saffron City")
		elseif getMapName() == "Pokecenter Vermilion" then
			log("--- Successfully Registered on "..getMapName()..",,,Going back for the ROUTINE ---")
			moveToMap("Vermilion City")
		elseif getMapName() == "Route 2" then
			pc = 0
			if jto == 0 then
				
			if isNpcOnCell(36,125) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(36,125)	--Tree 1
			elseif isNpcOnCell(12,16) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(12,16) or moveToMap("Route 2 Stop")	--Tree 2
			elseif isNpcOnCell(10,9) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(10,9)	--Tree 3
			elseif isNpcOnCell(14,9) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(14,9)	--Tree 4
			elseif isNpcOnCell(16,9) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(16,9)	--Tree 5
			elseif isNpcOnCell(19,9) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(19,9)	--Tree 6
			elseif isNpcOnCell(21,9) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(21,9)	--Tree 7
			elseif isNpcOnCell(39,54) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(39,54)	--Tree 8
			elseif isNpcOnCell(42,66) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(42,66)	--Berry 1
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				return moveToMap("Route 2 Stop") or moveToMap("Pewter City")
			end
			elseif jto == 1 then
				return moveToMap("Viridian City") or moveToMap("Route 2 Stop1")
			end
		elseif getMapName() == "Route 2 Stop1" then
			moveToMap("Route 2")
		elseif getMapName() == "Route 2 Stop" then
			moveToMap("Viridian Forest")
		elseif getMapName() == "Viridian Forest" then
			if isNpcOnCell(10,63) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(10,63)	--Tree 1
			elseif isNpcOnCell(19,46) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(19,46)	--Berry 1
			elseif isNpcOnCell(61,62) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(61,62)	--Berry 2
			elseif isNpcOnCell(62,62) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(62,62)	--Berry 3
			elseif isNpcOnCell(24,8) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(24,8)	--Berry 4
			elseif isNpcOnCell(14,61) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(14,61)	--Tree 2
			elseif isNpcOnCell(15,61) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(15,61)	--Tree 3
			elseif isNpcOnCell(30,62) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(30,62)	--Tree 4
			elseif isNpcOnCell(35,62) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(35,62)	--Tree 5
			elseif isNpcOnCell(12,43) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(12,43)	--Tree 6
			elseif isNpcOnCell(24,42) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(24,42)	--Tree 7
			elseif isNpcOnCell(27,42) then
			
			log("----Headbutting 8th tree---")
				return talkToNpcOnCell(27,42)	--Tree 8
			elseif isNpcOnCell(35,41) then
				
			log("---Headbutting 9th tree---")
				return talkToNpcOnCell(35,41)	--Tree 9
			elseif isNpcOnCell(39,40) then
				
			log("---Headbutting 10th tree---")
				return talkToNpcOnCell(39,40)	--Tree 10
			elseif isNpcOnCell(58,59) then
				
			log("---Headbutting 11th tree---")
				return talkToNpcOnCell(58,59)	--Tree 11
			elseif isNpcOnCell(50,35) then
				
			log("---Headbutting 12th tree---")
				return talkToNpcOnCell(50,35)	--Tree 12
			elseif isNpcOnCell(51,18) then
				
			log("---Headbutting 13rd tree---")
				return talkToNpcOnCell(51,18)	--Tree 13
			elseif isNpcOnCell(46,18) then
				
			log("---Headbutting 14th tree---")
				return talkToNpcOnCell(46,18)	--Tree 14
			elseif isNpcOnCell(39,8) then
				
			log("---Headbutting 15th tree---")
				return talkToNpcOnCell(39,8)	--Tree 15
			elseif isNpcOnCell(46,7) then
				
			log("---Headbutting 16th tree---")
				return talkToNpcOnCell(46,7)	--Tree 16
			elseif isNpcOnCell(49,7) then
				
			log("---Headbutting 17th tree---")
				return talkToNpcOnCell(49,7)	--Tree 17
			elseif isNpcOnCell(52,8) then
				
			log("----Headbutting 18th tree---")
				return talkToNpcOnCell(52,8)	--Tree 18
			elseif isNpcOnCell(22,8) then
				
			log("---Headbutting 19th tree---")
				return talkToNpcOnCell(22,8)	--Tree 19
			elseif isNpcOnCell(20,8) then
				
			log("---Headbutting 20th tree---")
				return talkToNpcOnCell(20,8)	--Tree 20
			elseif isNpcOnCell(17,8) then
				
			log("---Headbutting 21th tree---")
				return talkToNpcOnCell(17,8)	--Tree 21
			elseif isNpcOnCell(27,28) then
				
			log("---Headbutting 22th tree---")
				return talkToNpcOnCell(27,28)	--Tree 22
			elseif isNpcOnCell(32,32) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(32,32)	--Tree 23
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 2 Stop2")
			end
		elseif getMapName() == "Route 2 Stop2" then
			moveToMap("Route 2")
		elseif getMapName() == "Pewter City" then
				if isNpcOnCell(16,41) then
				
				log("---Headbutting 1st tree---")
					return talkToNpcOnCell(16,41)	--Tree 1
				elseif isNpcOnCell(28,42) then
				
				log("---Headbutting 2nd tree---")
					return talkToNpcOnCell(28,42)	--Tree 2
				elseif isNpcOnCell(21,29) then
				
				log("---Headbutting 3rd tree---")
					return talkToNpcOnCell(21,29)	--Tree 3
				elseif isNpcOnCell(29,29) then
				
				log("---Headbutting 4th tree---")
					return talkToNpcOnCell(29,29)	--Tree 4
				elseif isNpcOnCell(42,27) then
				
				log("---Headbutting 5th tree---")
					return talkToNpcOnCell(42,27)	--Tree 5
				elseif isNpcOnCell(49,6) then
				
				log("---Headbutting 6th tree---")
					return talkToNpcOnCell(49,6)	--Tree 6
				elseif isNpcOnCell(39,8) then
				
				log("---Headbutting 7th tree---")
					return talkToNpcOnCell(39,8)	--Tree 7
				elseif isNpcOnCell(42,7) then
				
				log("---Headbutting 8th tree---")
					return talkToNpcOnCell(42,7)	--Tree 8
				elseif isNpcOnCell(46,8) then
				
				log("---Headbutting 9th tree---")
					return talkToNpcOnCell(46,8)	--Tree 9
				elseif isNpcOnCell(5,7) then
				
				log("---Headbutting 10th tree---")
					return talkToNpcOnCell(5,7)	--Tree 10
				elseif isNpcOnCell(8,7) then
				
				log("---Headbutting 11th tree---")
					return talkToNpcOnCell(8,7)	--Tree 11
				elseif isNpcOnCell(11,7) then
				
				log("---Headbutting 12th tree---")
					return talkToNpcOnCell(11,7)	--Tree 12
				elseif isNpcOnCell(16,7) then
				
				log("---Headbutting 13th tree---")
					return talkToNpcOnCell(16,7)	--Tree 13
				elseif isNpcOnCell(19,7) then
				
				log("---Headbutting 14th tree---")
					return talkToNpcOnCell(19,7)	--Tree 14
				elseif isNpcOnCell(21,6) then
				
				log("---Headbutting Last tree---")
					return talkToNpcOnCell(21,6)	--Tree 15
				else

					log("---"..getMapName().." Cleared... Moving to next Map---")
					log("-- Ignoring PC here! Next route is mostly suggested --")
					moveToMap("Route 3")
				end
		elseif getMapName() == "Route 3" then
			
			if pc == 0 then
				
				if isNpcOnCell(19,21) then
				
				log("---Headbutting 1st tree---")
					return talkToNpcOnCell(19,21)	--Tree 1
				elseif isNpcOnCell(7,28) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(7,28)	--Dig 1
				elseif isNpcOnCell(8,36) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(8,36)	--Dig 2
				elseif isNpcOnCell(16,36) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(16,36)	--Dig 3
				elseif isNpcOnCell(16,30) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(16,30)	--Dig 4
				elseif isNpcOnCell(67,38) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(67,38)	--Dig 5
				elseif isNpcOnCell(71,38) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(71,38)	--Dig 6
				elseif isNpcOnCell(74,38) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(74,38)	--Dig 7
				elseif isNpcOnCell(74,37) then
				
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(74,37)	--Dig 8
				elseif isNpcOnCell(29,22) then
				
				log("---Headbutting 2nd tree---")
					return talkToNpcOnCell(29,22)	--Tree 2
				elseif isNpcOnCell(46,21) then
				
				log("---Headbutting 3rd tree---")
					return talkToNpcOnCell(46,21)	--Tree 3
				elseif isNpcOnCell(49,18) then
				
				log("---Headbutting 4th tree---")
					return talkToNpcOnCell(49,18)	--Tree 4
				elseif isNpcOnCell(83,37) then
				
				log("---Headbutting Last tree---")
					return talkToNpcOnCell(83,37)	--Tree 5
					elseif isNpcOnCell(75,33) then
				log("---Ooops! We have some berries that are ready to harvest---")
				log("---Harvesting some berries---")
					return talkToNpcOnCell(75,33)	--Berry 1
				elseif isNpcOnCell(76,33) then
				log("---Ooops! We have some berries that are ready to harvest---")
				log("---Harvesting some berries---")
					return talkToNpcOnCell(76,33)	--Berry 2
				elseif isNpcOnCell(77,33) then
				log("---Ooops! We have some berries that are ready to harvest---")
				log("---Harvesting some berries---")
					return talkToNpcOnCell(77,33)	--Berry 3

				else

				log("--- Pokecenter found! Registering on PC ---")
					moveToMap("Pokecenter Route 3")
					pc = pc + 1
				end
			elseif pc == 1 then
				if MtMoon then
					log("---"..getMapName().." Cleared... Entering Mt. Moon---")
					moveToMap("Mt. Moon 1F")
				elseif isNpcOnCell(74,16) then
					log("---"..getMapName().." Cleared... Ignoring Mt. Moon---")
					talkToNpcOnCell(74,16)
				end
			end
		elseif getMapName() == "Mt. Moon 1F" then
			if x == 3 then
				if isNpcOnCell(25,60) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(25,60)	--Dig 1
				elseif isNpcOnCell(20,60) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(20,60)	--Dig 2
				elseif isNpcOnCell(22,61) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(22,61)	--Dig 3
				elseif isNpcOnCell(22,58) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(22,58)	--Dig 4
				elseif isNpcOnCell(63,18) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(63,18)	--Dig 5
				elseif isNpcOnCell(65,20) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(65,20)	--Dig 6
				elseif isNpcOnCell(67,19) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(67,19)	--Dig 7
				elseif isNpcOnCell(66,21) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(66,21)	--Dig 8
				else
					log("--- Digging on "..getMapName().." finished! Moving to next Spot ---")
					return moveToCell(58,33)	--MOVING to 1st area of DIG SPOT in B2F
				end
			
			elseif x == 2 then
				moveToCell(37,29)
			else
				moveToCell(21,20)		--CELL EXITS
			end
		elseif digcount < 21 and getMapName() == "Mt. Moon B1F" then
			if x == 3 then
				moveToCell(43,34)
			elseif x == 2 then
				return moveToCell(18,15) or moveToCell(57,21)
			else
				return moveToCell(65,20) or moveToCell(56,34) or moveToMap("Mt. Moon Exit")
			end
		elseif getMapName() == "Mt. Moon B2F" then

			x = 2
				if isNpcOnCell(33,50) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(33,50)	--Dig 9
				elseif isNpcOnCell(38,49) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(38,49)	--Dig 10
				elseif isNpcOnCell(39,52) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(39,52)	--Dig 11
				elseif isNpcOnCell(39,55) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(39,55)	--Dig 12
				elseif isNpcOnCell(44,49) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(44,49)	--Dig 13
				elseif isNpcOnCell(50,25) then
				 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(50,25) or moveToCell(30,54) 	--Dig 14
				elseif isNpcOnCell(57,23) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(57,23)	--Dig 15
				elseif isNpcOnCell(62,21) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(62,21)	--Dig 16
				elseif isNpcOnCell(61,26) then
				 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(61,26)	--Dig 17
				elseif isNpcOnCell(56,29) then
					 
				log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
					return talkToNpcOnCell(56,29)	--Dig 18
				else
					x = x -1
					log("--- Mt. Moon cleared! Moving to next map ---")
					return moveToCell(44,30)  or moveToCell(17,27)	--GOING BACK to 1F to Exit
					
				end
		elseif getMapName() == "Mt. Moon Exit" then
			moveToMap("Route 4")
		elseif getMapName() == "Route 4" then
			pc = 0
			if isNpcOnCell(74,15) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(74,15)	--Tree 1
			elseif isNpcOnCell(79,16) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(79,16)	--Tree 2
			elseif isNpcOnCell(78,8) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(78,8)	--Berry 1
			elseif isNpcOnCell(79,8) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(79,8)	--Berry 2
			elseif isNpcOnCell(80,8) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(80,8)	--Berry 3
			elseif isNpcOnCell(81,15) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(81,15)	--Tree 3
			elseif isNpcOnCell(90,11) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(90,11)	--Tree 4
			elseif isNpcOnCell(83,25) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(83,25)	--Tree 5
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToCell(96,21)
			end
		elseif getMapName() == "Cerulean City" then
			if pc == 0 then
				if isNpcOnCell(44,8) then
				
				log("---Headbutting 1st tree---")
					return talkToNpcOnCell(44,8)	--Tree 1
				elseif isNpcOnCell(43,14) then
				
				log("---Headbutting 2nd tree---")
					return talkToNpcOnCell(43,14)	--Tree 2
				elseif isNpcOnCell(34,38) then
				
				log("---Headbutting 3rd tree---")
					return talkToNpcOnCell(34,38)	--Tree 3
				elseif isNpcOnCell(36,39) then
				
				log("---Headbutting 4th tree---")
					return talkToNpcOnCell(36,39)	--Tree 4
				elseif isNpcOnCell(38,38) then
				
				log("---Headbutting 5th tree---")
					return talkToNpcOnCell(38,38)	--Tree 5
				elseif isNpcOnCell(23,36) then
				
					log("---Headbutting Last tree---")
					return talkToNpcOnCell(23,36)	--Tree 6
				else
	
					log("--- Pokecenter found! Registering on PC ---")
						moveToMap("Pokecenter Cerulean")
						pc = pc + 1
					end
			elseif pc == 1 then
				log("---"..getMapName().." Cleared... Moving to next Map---")
					moveToMap("Route 9")
			end
		elseif getMapName() == "Route 9" then
			pc = 0
			moveToMap("Route 10")
		elseif getMapName() == "Route 10" then
			if isNpcOnCell(9,9) then
				
				return talkToNpcOnCell(9,9) or moveToMap("Lavender Town")
			
			end
		elseif getMapName() == "Lavender Town" then
			
			if pc == 0 then
				if isNpcOnCell(5,9) then
				
				log("---Headbutting 1st tree---")
					return talkToNpcOnCell(5,9)	--Tree 1
				elseif isNpcOnCell(17,19) then
				
				log("---Headbutting 2nd tree---")
					return talkToNpcOnCell(17,19)	--Tree 2
				elseif isNpcOnCell(15,14) then
					
				log("---Headbutting 3rd tree---")
					return talkToNpcOnCell(15,14)	--Tree 3
				else
					log("--- Pokecenter found! Registering on PC ---")
					moveToMap("Pokecenter Lavender")
					pc = pc + 1	
				end
			elseif pc == 1 then
				log("---"..getMapName().." Cleared... Moving to next Map---")
					moveToMap("Route 12")
			end
		elseif getMapName() == "Route 12" then
			pc = 0
			moveToMap("Route 13")
		elseif getMapName() == "Route 13" then
			if isNpcOnCell(91,15) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(91,15)	--Tree 1
			elseif isNpcOnCell(91,21) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(91,21)	--Tree 2
			elseif isNpcOnCell(87,21) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(87,21)	--Tree 3
			elseif isNpcOnCell(76,22) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(76,22)	--Tree 4
			elseif isNpcOnCell(71,15) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(71,15)	--Tree 5
			elseif isNpcOnCell(61,15) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(61,15)	--Tree 6
			elseif isNpcOnCell(57,15) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(57,15)	--Tree 7
			elseif isNpcOnCell(52,15) then
				
			log("----Headbutting 8th tree---")
				return talkToNpcOnCell(52,15)	--Tree 8
			elseif isNpcOnCell(8,15) then
				
			log("---Headbutting 9th tree---")
				return talkToNpcOnCell(8,15)	--Tree 9
			elseif isNpcOnCell(81,21) then
				
			log("---Headbutting 10th tree---")
				return talkToNpcOnCell(81,21)	--Tree 10
			elseif isNpcOnCell(12,15) then
				
			log("---Headbutting 11th tree---")
				return talkToNpcOnCell(12,15)	--Tree 11
			elseif isNpcOnCell(15,15) then
				
			log("---Headbutting 12th tree---")
				return talkToNpcOnCell(15,15)	--Tree 12
			elseif isNpcOnCell(21,15) then
				
			log("---Headbutting 13rd tree---")
				return talkToNpcOnCell(21,15)	--Tree 13
			elseif isNpcOnCell(24,15) then
				
			log("---Headbutting 14th tree---")
				return talkToNpcOnCell(24,15)	--Tree 14
			elseif isNpcOnCell(30,15) then
				
			log("---Headbutting 15th tree---")
				return talkToNpcOnCell(30,15)	--Tree 15
			elseif isNpcOnCell(32,14) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(32,14)	--Tree 16
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 14")
			end
		elseif getMapName() == "Route 14" then	
			if isNpcOnCell(21,4) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(21,4)	--Tree 1
			elseif isNpcOnCell(21,14) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(21,14)	--Tree 2
			elseif isNpcOnCell(15,17) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(15,17)	--Tree 3
			elseif isNpcOnCell(21,23) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(21,23)	--Tree 4
			elseif isNpcOnCell(14,24) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(14,24)	--Tree 5
			elseif isNpcOnCell(15,28) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(15,28)	--Tree 6
			elseif isNpcOnCell(22,30) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(22,30)	--Tree 7
			elseif isNpcOnCell(22,38) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(22,38)	--Berry 1
			elseif isNpcOnCell(21,38) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(21,38)	--Berry 2
			elseif isNpcOnCell(10,46) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(10,46)	--Dig 1
			elseif isNpcOnCell(10,48) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(10,48)	--Dig 2
			elseif isNpcOnCell(15,48) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(15,48)	--Dig 3
			elseif isNpcOnCell(13,47) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(13,47)	--Dig 4
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 15")
			end
		elseif getMapName() == "Route 15" then
			if isNpcOnCell(66,12) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(66,12)	--Tree 1
			elseif isNpcOnCell(61,13) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(61,13)	--Tree 2
			elseif isNpcOnCell(57,26) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(57,26)	--Dig 1
			elseif isNpcOnCell(57,25) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(57,25)	--Dig 2
			elseif isNpcOnCell(51,18) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(51,18)	--Dig 3
			elseif isNpcOnCell(47,21) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(47,21)	--Dig 4
			elseif isNpcOnCell(47,25) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(47,25)	--Dig 5
			elseif isNpcOnCell(50,11) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(50,11)	--Tree 3
			elseif isNpcOnCell(48,10) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(48,10)	--Tree 4
			elseif isNpcOnCell(40,12) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(40,12)	--Tree 5
			elseif isNpcOnCell(35,14) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(35,14)	--Tree 6
			elseif isNpcOnCell(11,23) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(11,23)	--Tree 7
			elseif isNpcOnCell(19,24) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(19,24)	--Tree 8
			elseif isNpcOnCell(33,14) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(33,14)	--Berry 1
			elseif isNpcOnCell(32,14) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(32,14)	--Berry 2
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 15 Stop House")
			end
		elseif getMapName() == "Route 15 Stop House" then
			moveToMap("Fuchsia City")
		elseif getMapName() == "Fuchsia City" then
			if pc == 0 then
				log("--- Pokecenter found! Registering on PC ---")
				moveToMap("Pokecenter Fuchsia")
				pc = pc + 1
			elseif pc == 1 then
				moveToMap("Route 18")
			end
		elseif getMapName() == "Route 18" then
			pc = 0
			return moveToMap("Route 17") or moveToCell(35,16)
		elseif getMapName() == "Bike Road Stop" then
			moveToCell(0,6)
		elseif getMapName() == "Route 17" then
			moveToMap("Route 16")
		elseif getMapName() == "Route 16" then
			return moveToMap("Celadon City") or moveToCell(64,13)
		elseif getMapName() == "Route 16 Stop House" then
			moveToCell(20,6)
		elseif getMapName() == "Celadon City" then
			if pc == 0 then
				log("--- Pokecenter found! Registering on PC ---")
				moveToMap("Pokecenter Route 10")
				pc = pc + 1
			elseif pc == 1 then
				moveToMap("Route 7")
			end
		elseif getMapName() == "Route 7" then
			if isNpcOnCell(2,20) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(2,20)	--Tree 1
			elseif isNpcOnCell(5,17) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(5,17)	--Tree 2
			elseif isNpcOnCell(7,17) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(7,17)	--Tree 3
			elseif isNpcOnCell(9,17) then
				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(9,17)	--Tree 4
			elseif isNpcOnCell(13,15) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(13,15)	--Tree 5
			elseif isNpcOnCell(15,15) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(15,15)	--Tree 6
			elseif isNpcOnCell(20,13) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(20,13)	--Tree 7
			elseif isNpcOnCell(14,7) then
				
			log("----Headbutting 8th tree---")
				return talkToNpcOnCell(14,7)	--Tree 8
			elseif isNpcOnCell(16,7) then
				
			log("---Headbutting 9th tree---")
				return talkToNpcOnCell(16,7)	--Tree 9
			elseif isNpcOnCell(18,7) then
				
			log("---Headbutting 10th tree---")
				return talkToNpcOnCell(18,7)	--Tree 10
			elseif isNpcOnCell(20,7) then
				
			log("---Headbutting 11th tree---")
				return talkToNpcOnCell(20,7)	--Tree 11
			elseif isNpcOnCell(20,19) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(20,19)	--Tree 12
			elseif isNpcOnCell(32,14) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(32,14)	--Berry 1
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Underground House 3")
			end
		elseif getMapName() == "Underground House 3" then
			moveToMap("Underground1")
		elseif getMapName() == "Underground1" then
			moveToMap("Underground House 4")
		elseif getMapName() == "Underground House 4" then
			moveToMap("Route 8")
		elseif getMapName() == "Route 8" then
			if isNpcOnCell(17,3) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(17,3)	--Berry 1
			elseif isNpcOnCell(18,3) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(18,3)	--Berry 2
			elseif isNpcOnCell(19,3) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(19,3)	--Berry 3
			elseif isNpcOnCell(37,4) then
				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(37,4)	--Tree 1
			elseif isNpcOnCell(52,15) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(52,15)	--Tree 2
			elseif isNpcOnCell(54,14) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(54,14)	--Tree 3
			elseif isNpcOnCell(62,6) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(62,6)	--Tree 4
			elseif isNpcOnCell(57,3) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(57,3)	--Berry 4
			elseif isNpcOnCell(56,3) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(56,3)	--Berry 5
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Route 8 Stop House")
			end
		elseif getMapName() == "Route 8 Stop House" then
			pc = 0
			moveToMap("Saffron City")
		elseif getMapName() == "Saffron City" then
			
			if pc == 0 then
				log("--- Pokecenter found! Registering on PC ---")
				moveToMap("Pokecenter Saffron")
				pc = pc + 1
			elseif pc == 1 then
				moveToMap("Route 6 Stop House")
			end
		elseif getMapName() == "Route 6 Stop House" then
			pc = 0
			moveToMap("Route 6")
		elseif getMapName() == "Route 6" then
			if isNpcOnCell(31,5) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(31,5)	--Berry 1
			elseif isNpcOnCell(32,5) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(32,5)	--Berry 2
			elseif isNpcOnCell(37,5) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(37,5)	--Berry 3
			elseif isNpcOnCell(38,5) then
			log("---Ooops! We have some berries that are ready to harvest---")
			log("---Harvesting some berries---")
				return talkToNpcOnCell(38,5)	--Berry 4
			else
				log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Vermilion City")
			end
		elseif getMapName() == "Vermilion City" then
			if pc == 0 then
				log("--- Pokecenter found! Registering on PC ---")
				moveToMap("Pokecenter Vermilion")
				pc = pc + 1
			elseif pc == 1 then
				moveToMap("Route 11")
			end
		elseif getMapName() == "Route 11" then
			if isNpcOnCell(81, 7) then
  				
			log("---Headbutting 1st tree---")
				return talkToNpcOnCell(81, 7)	--Tree 1
			elseif isNpcOnCell(78, 6) then
				
			log("---Headbutting 2nd tree---")
				return talkToNpcOnCell(78, 6)	--Tree 2
			elseif isNpcOnCell(76, 5) then
				
			log("---Headbutting 3rd tree---")
				return talkToNpcOnCell(76, 5)	--Tree 3
			elseif isNpcOnCell(19, 13) then
  				
			log("---Headbutting 4th tree---")
				return talkToNpcOnCell(19, 13)	--Tree 4
			elseif isNpcOnCell(19, 7) then
				
			log("---Headbutting 5th tree---")
				return talkToNpcOnCell(19, 7)	--Tree 5
			elseif isNpcOnCell(23, 6) then
				
			log("---Headbutting 6th tree---")
				return talkToNpcOnCell(23, 6)	--Tree 6
			elseif isNpcOnCell(72,5) then
				
			log("---Headbutting 7th tree---")
				return talkToNpcOnCell(72,5)	--Tree 7
			elseif isNpcOnCell(70,5) then
				
			log("----Headbutting 8th tree---")
				return talkToNpcOnCell(70,5)	--Tree 8
			elseif isNpcOnCell(67,5) then
				
			log("---Headbutting 9th tree---")
				return talkToNpcOnCell(67,5)	--Tree 9
			elseif isNpcOnCell(64,5) then
				
			log("---Headbutting 10th tree---")
				return talkToNpcOnCell(64,5)	--Tree 10
			elseif isNpcOnCell(61,5) then
				
			log("---Headbutting 11th tree---")
				return talkToNpcOnCell(61,5)	--Tree 11
			elseif isNpcOnCell(57,5) then
				
			log("---Headbutting 12th tree---")
				return talkToNpcOnCell(57,5)	--Tree 12
			elseif isNpcOnCell(54,5) then
				
			log("---Headbutting 13rd tree---")
				return talkToNpcOnCell(54,5)	--Tree 13
			elseif isNpcOnCell(48,5) then
				
			log("---Headbutting 14th tree---")
				return talkToNpcOnCell(48,5)	--Tree 14
			elseif isNpcOnCell(45,5) then
				
			log("---Headbutting 15th tree---")
				return talkToNpcOnCell(45,5)	--Tree 15
			elseif isNpcOnCell(43,5) then
				
			log("---Headbutting 16th tree---")
				return talkToNpcOnCell(43,5)	--Tree 16
			elseif isNpcOnCell(40,5) then
				
			log("---Headbutting 17th tree---")
				return talkToNpcOnCell(40,5)	--Tree 17
			elseif isNpcOnCell(37,5) then
				
			log("----Headbutting 18th tree---")
				return talkToNpcOnCell(37,5)	--Tree 18
			elseif isNpcOnCell(33,5) then
				
			log("---Headbutting 19th tree---")
				return talkToNpcOnCell(33,5)	--Tree 19
			elseif isNpcOnCell(31,5) then
				
			log("---Headbutting 20th tree---")
				return talkToNpcOnCell(31,5)	--Tree 20
			elseif isNpcOnCell(29,4) then
				
			log("---Headbutting Last tree---")
				return talkToNpcOnCell(29,4)	--Tree 21
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Digletts Cave Entrance 2")
			end
		elseif getMapName() == "Digletts Cave Entrance 2" then
			moveToMap("Digletts Cave")
		elseif getMapName() == "Digletts Cave" then
			if isNpcOnCell(52,42) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(52,42)	--Dig 1
			elseif isNpcOnCell(51,42) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(51,42)	--Dig 2
			elseif isNpcOnCell(47,43) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(47,43)	--Dig 3
			elseif isNpcOnCell(49,44) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(49,44)	--Dig 4
			elseif isNpcOnCell(35,35) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(35,35)	--Dig 5
			elseif isNpcOnCell(36,37) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(36,37)	--Dig 6
			elseif isNpcOnCell(32,35) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(32,35)	--Dig 7
			elseif isNpcOnCell(33,37) then
				
			log("--- "..getPokemonName(digger).." is digging spot "..digcount.." in "..getMapName().." ---")
				return talkToNpcOnCell(33,37)	--Dig 8
			else
			log("---"..getMapName().." Cleared... Moving to next Map---")
				moveToMap("Digletts Cave Entrance 1")
			end
		elseif getMapName() == "Digletts Cave Entrance 1" then
			jto = 1
			log("Route 2")
    elseif getMapName() == "Lilycove City" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- We are now in Hoenn Region! ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        moveToMap("Route 121")
    elseif getMapName() == "Route 121" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        if ex == 0 then
            moveToMap("Route 120")      --Move to next Site
        elseif ex == 6 then
            moveToMap("Lilycove City")  --End
        end
    elseif getMapName() == "Route 120" then
        if ex == 0 then
            moveToMap("Fortree City")   --Move to next Site
        elseif ex == 6 then
            moveToMap("Route 121")      --End
        end
    elseif getMapName() == "Fortree City" then
        if ex == 0 then
            moveToMap("Route 119A")     --Move to next Site
        elseif ex == 6 then
            moveToMap("Route 120")      --End
        end
    elseif getMapName() == "Route 119A" then
        if ex == 0 then
            log("Info| We are now entering Natural Site!")
            talkToNpcOnCell(16,68)      --Move to Natural Site
        elseif ex == 1 then
            log("-- Update | Backup count = "..ex)
            moveToMap("Route 119B")     --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Fortree City")   --End
        end
    elseif getMapName() == "Natural Site" then
        Natural()
    elseif getMapName() == "Route 119B" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        if ex == 1 then
            moveToMap("Route 118")      --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Route 119A")     --End
        end
    elseif getMapName() == "Route 118" then
        if ex == 1 then
            moveToMap("Mauville City Stop House 4")     --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Route 119B")                     --End
        end
    elseif getMapName() == "Mauville City Stop House 4" then
        if ex == 1 then
            moveToMap("Mauville City")                  --Move to 2nd Site
        elseif ex == 6 then
            moveToMap("Route 118")                     --End
        end
    elseif getMapName() == "Mauville City" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        if ex == 1 then
            moveToMap("Mauville City Stop House 1")     --Move to 2nd Site
        elseif ex == 2 then
            moveToMap("Mauville City Stop House 3")     --Move to 3rd Site
        elseif ex == 6 then
            moveToMap("Mauville City Stop House 4")     --End
        end
    elseif getMapName() == "Mauville City Stop House 1" then
        if ex == 1 then
            moveToMap("Route 110")                      --Move to 2nd Site
        elseif ex == 2 then
            moveToMap("Mauville City")                  --Move to 3rd Site
        end
    elseif getMapName() == "Route 110" then
        if ex == 1 then
            moveToMap("Route 103")                      --Move to 2nd Site
        elseif ex == 2 then
            moveToMap("Mauville City Stop House 1")     --Move to 3rd Site
        end
    elseif getMapName() == "Route 103" then
        if ex == 1 then
            log("-- Info| We are now entering Glacial Site! --")
            talkToNpcOnCell(55,4)                       --Glacial Site 2nd
        elseif ex == 2 then
            log("-- Update| Backup count = "..ex)
            moveToMap("Route 110")                      --Move to 3rd Site
        end
    elseif getMapName() == "Glacial Site" then
        Glacial()
    elseif getMapName() == "Mauville City Stop House 3" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        moveToMap("Route 111 South")                --Move to 3rd Site
    elseif getMapName() == "Route 111 South" then
        if ex == 2 then
            moveToMap("Route 112")                      --Move to 3rd Site
        elseif ex == 3 then
            moveToCell(20,7)               --Move to 4th Site
        end
    elseif getMapName() == "Route 112" then
        if ex == 2 then
            moveToMap("Fiery Path")                     --Move to 3rd Site
        elseif ex == 3 then
            return moveToMap("Route 111 North") or moveToMap("Route 111 South")                --Move to 4th Site
        end
    elseif getMapName() == "Fiery Path" then
        if ex == 2 then
            log("-- Info| We are now entering Feral Site! --")
            talkToNpcOnCell(14,32)                      --Feral Site 3rd
        elseif ex == 3 then
            log("-- Update| Backup count = "..ex)
            moveToCell(36,48)                      --Move to 4th Site
        end
    elseif getMapName() == "Feral Site" then
        Feral()
    elseif getMapName() == "Route 111 Desert" then
        if ex == 3 then
            log("-- Info| We are now entering Historical Site! --")
            return talkToNpc("Gingery Jones")                     --Historical Site 4th
        elseif ex == 4 then
            log("-- Update| Backup count = "..ex)
            moveToMap("Route 111 North")                --Move to 5th Site
        end
    elseif getMapName() == "Historical Site" then
        Historical()
    elseif getMapName() == "Route 111 North" then
	if ex == 3 then
		moveToMap("Route 111 Desert")
	elseif ex == 4 then
        	moveToMap("Route 113")                      --Move to 5th Site
	end
    elseif getMapName() == "Route 113" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        moveToMap("Fallarbor Town")                 --Move to 5th Site
    elseif getMapName() == "Fallarbor Town" then
        moveToMap("Route 114")                      --Move to 5th Site
    elseif getMapName() == "Route 114" then
        moveToMap("Meteor Falls 1F 1R")             --Move to 5th Site
    elseif getMapName() == "Meteor falls 1F 1R" then
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	log("--- Note: Always Remember your BACK-UP COUNT ---")
	log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        moveToMap("Route 115")                      --Move to 5th Site
    elseif getMapName() == "Route 115" then
        if ex == 4 then
            log("-- Info| We are now entering Mineral Site! --")
            talkToNpcOnCell(81,78)                      --Mineral Site 5th
        elseif ex == 5 then
            log("-- Update| Backup count = "..ex)
            moveToMap("Rustboro City")                  --Move to last Site
        end
    elseif getMapName() == "Mineral Site" then
        Mineral()
    elseif getMapName() == "Rustboro City" then
        moveToMap("Route 116")                      --Move to last Site
    elseif getMapName() == "Route 116" then
        moveToMap("Rusturf Tunnel")                 --Move to last Site
    elseif getMapName() == "Rusturf Tunnel" then
        if ex == 5 then
            log("-- Info| We are now entering Haunted Site! --")
            talkToNpc("Gingery Jones")                      --Haunted Site Last
        elseif ex == 6 then
            log("-- Update| Backup count = "..ex)
            log("-- Warning!!! No Site to Smash!!! Going back to starting map... --")
            moveToMap("Verdanturf Town")                --End
        end
    elseif getMapName() == "Haunted Site" then
        Haunted()
    elseif getMapName() == "Verdanturf Town" then
        moveToMap("Route 117")                      --End
    elseif getMapName() == "Route 117" then
        moveToMap("Mauville City Stop House 2")     --End
    elseif getMapName() == "Mauville City Stop House 2" then
        moveToMap("Mauville City")                  --End     
    end
  end
end
function Natural()
	if isNpcOnCell(4,8) then	

		 talkToNpcOnCell(4,8)
		smash = smash + 1/2
	elseif isNpcOnCell(7,6) then		
	
		 talkToNpcOnCell(7,6)
		smash = smash + 1/2
	elseif isNpcOnCell(11,4) then		
	
		 talkToNpcOnCell(11,4)
		smash = smash + 1/2
	elseif isNpcOnCell(12,3) then			
	
		 talkToNpcOnCell(12,3)
		smash = smash + 1/2
	elseif isNpcOnCell(14,5) then		
	
		 talkToNpcOnCell(14,5)
		smash = smash + 1/2
	elseif isNpcOnCell(17,1) then		
	
		 talkToNpcOnCell(17,1)
		smash = smash + 1/2
	elseif isNpcOnCell(16,2) then	
	
		 talkToNpcOnCell(16,2)
		smash = smash + 1/2
	elseif isNpcOnCell(18,3) then		
	
		 talkToNpcOnCell(18,3)
		smash = smash + 1/2
	elseif isNpcOnCell(16,8) then		
	
		 talkToNpcOnCell(16,8)
		smash = smash + 1/2
	elseif isNpcOnCell(20,5) then			
	
		 talkToNpcOnCell(20,5)
		smash = smash + 1/2
	elseif isNpcOnCell(22,7) then		
	
		 talkToNpcOnCell(22,7)
		smash = smash + 1/2
	elseif isNpcOnCell(22,4) then		
	
		 talkToNpcOnCell(22,4)
		smash = smash + 1/2
	elseif isNpcOnCell(20,10) then	
	
		 talkToNpcOnCell(20,10)
		smash = smash + 1/2
	elseif isNpcOnCell(20,15) then		
	
		 talkToNpcOnCell(20,15)
		smash = smash + 1/2
	elseif isNpcOnCell(15,13) then		
	
		 talkToNpcOnCell(15,13)
		smash = smash + 1/2
	elseif isNpcOnCell(12,17) then			
	
		 talkToNpcOnCell(12,17)
		smash = smash + 1/2
	elseif isNpcOnCell(7,17) then		
	
		 talkToNpcOnCell(7,17)
		smash = smash + 1/2
	elseif isNpcOnCell(6,11) then		
	
		 talkToNpcOnCell(6,11)
		smash = smash + 1/2
	elseif isNpcOnCell(4,11) then		
	
		 talkToNpcOnCell(4,11)
		smash = smash + 1/2
	elseif isNpcOnCell(16,17) then		
	
		 talkToNpcOnCell(16,17)
		smash = smash + 1/2
	elseif isNpcOnCell(17,14) then			
	
		 talkToNpcOnCell(17,14)
		smash = smash + 1/2
	elseif isNpcOnCell(18,16) then		
	
		 talkToNpcOnCell(18,16)
		smash = smash + 1/2
	elseif isNpcOnCell(24,18) then		
	
		 talkToNpcOnCell(24,18)
		smash = smash + 1/2
	
	elseif isNpcOnCell(24,16) then		
	
		 talkToNpcOnCell(24,16)
		smash = smash + 1/2
		
	
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(6,7)             --Done Site
        	ex = ex + 1
        end
end
function Glacial()
	if isNpcOnCell(2,11) then	
	
		 talkToNpcOnCell(2,11)
		smash = smash + 1/2
	elseif isNpcOnCell(3,13) then		
	
		 talkToNpcOnCell(3,13)
		smash = smash + 1/2
	elseif isNpcOnCell(8,3) then		
	
		 talkToNpcOnCell(8,3)
		smash = smash + 1/2
	elseif isNpcOnCell(12,4) then			
	
		 talkToNpcOnCell(12,4)
		smash = smash + 1/2
	elseif isNpcOnCell(14,1) then		
	
		 talkToNpcOnCell(14,1)
		smash = smash + 1/2
	elseif isNpcOnCell(19,1) then		
	
		 talkToNpcOnCell(19,1)
		smash = smash + 1/2
	elseif isNpcOnCell(18,3) then	
	
		 talkToNpcOnCell(18,3)
		smash = smash + 1/2
	elseif isNpcOnCell(21,4) then		
	
		 talkToNpcOnCell(21,4)
		smash = smash + 1/2
	elseif isNpcOnCell(21,8) then		
	
		 talkToNpcOnCell(21,8)
		smash = smash + 1/2
	elseif isNpcOnCell(17,9) then			
	
		 talkToNpcOnCell(17,9)
		smash = smash + 1/2
	elseif isNpcOnCell(23,5) then		
	
		 talkToNpcOnCell(23,5)
		smash = smash + 1/2
	elseif isNpcOnCell(25,4) then		
	
		 talkToNpcOnCell(25,4)
		smash = smash + 1/2
	elseif isNpcOnCell(25,1) then	
	
		 talkToNpcOnCell(25,1)
		smash = smash + 1/2
	elseif isNpcOnCell(19,14) then		
	
		 talkToNpcOnCell(19,14)
		smash = smash + 1/2
	elseif isNpcOnCell(20,16) then		
	
		 talkToNpcOnCell(20,16)
		smash = smash + 1/2
	elseif isNpcOnCell(25,11) then			
	
		 talkToNpcOnCell(25,11)
		smash = smash + 1/2
	elseif isNpcOnCell(19,17) then		
	
		 talkToNpcOnCell(19,17)
		smash = smash + 1/2
	elseif isNpcOnCell(10,18) then		
	
		 talkToNpcOnCell(10,18)
		smash = smash + 1/2
	elseif isNpcOnCell(9,16) then		
	
		 talkToNpcOnCell(9,16)
		smash = smash + 1/2
	elseif isNpcOnCell(4,18) then		
	
		 talkToNpcOnCell(4,18)
		smash = smash + 1/2
	elseif isNpcOnCell(15,14) then			
	
		 talkToNpcOnCell(15,14)
		smash = smash + 1/2
	elseif isNpcOnCell(13,16) then		
	
		 talkToNpcOnCell(13,16)
		smash = smash + 1/2
	elseif isNpcOnCell(13,11) then		
	
		 talkToNpcOnCell(13,11)
		smash = smash + 1/2
	elseif isNpcOnCell(8,14) then		
	
		 talkToNpcOnCell(8,14)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(5,5)                             --Done Site
        	ex = ex + 1
        end
end
function Feral()
	if isNpcOnCell(3,7) then	
	
		 talkToNpcOnCell(3,7)
		smash = smash + 1/2
	elseif isNpcOnCell(4,5) then		
	
		 talkToNpcOnCell(4,5)
		smash = smash + 1/2
	elseif isNpcOnCell(6,12) then		
	
		 talkToNpcOnCell(6,12)
		smash = smash + 1/2
	elseif isNpcOnCell(3,16) then			
	
		 talkToNpcOnCell(3,16)
		smash = smash + 1/2
	elseif isNpcOnCell(11,11) then		
	
		 talkToNpcOnCell(11,11)
		smash = smash + 1/2
	elseif isNpcOnCell(1,16) then		
		
		 return talkToNpcOnCell(1,16) or moveToCell(8,15)
		
	elseif isNpcOnCell(2,18) then	
	
		 talkToNpcOnCell(2,18)
		smash = smash + 1/2
	elseif isNpcOnCell(12,17) then		
	
		 talkToNpcOnCell(12,17)
		smash = smash + 1/2
	elseif isNpcOnCell(15,17) then		
	
		 talkToNpcOnCell(15,17)
		smash = smash + 1/2
	elseif isNpcOnCell(18,15) then			
	
		 talkToNpcOnCell(18,15)
		smash = smash + 1/2
	elseif isNpcOnCell(25,18) then		
	
		 talkToNpcOnCell(25,18)
		smash = smash + 1/2
	elseif isNpcOnCell(15,15) then		
	
		 return talkToNpcOnCell(15,15) or moveToCell(8,17)
		
	elseif isNpcOnCell(21,15) then	
	
		 talkToNpcOnCell(21,15)
		smash = smash + 1/2
	elseif isNpcOnCell(22,16) then		
	
		 talkToNpcOnCell(22,16)
		smash = smash + 1/2
	elseif isNpcOnCell(24,14) then		
	
		 talkToNpcOnCell(24,14)
		smash = smash + 1/2
	elseif isNpcOnCell(22,11) then			
	
		 talkToNpcOnCell(22,11)
		smash = smash + 1/2
	elseif isNpcOnCell(21,8) then		
	
		 talkToNpcOnCell(21,8)
		smash = smash + 1/2
	elseif isNpcOnCell(21,6) then		
	
		 talkToNpcOnCell(21,6)
		smash = smash + 1/2
	elseif isNpcOnCell(19,4) then		
	
		 talkToNpcOnCell(19,4)
		smash = smash + 1/2
	elseif isNpcOnCell(18,4) then		
	
		 talkToNpcOnCell(18,4)
		smash = smash + 1/2
	elseif isNpcOnCell(7,1) then		
	
		 talkToNpcOnCell(7,1)
		smash = smash + 1/2
	elseif isNpcOnCell(12,3) then			
	
		 talkToNpcOnCell(12,3)
		smash = smash + 1/2
	elseif isNpcOnCell(12,2) then		
	
		 talkToNpcOnCell(12,2)
		smash = smash + 1/2
	elseif isNpcOnCell(6,4) then		
	
		 talkToNpcOnCell(6,4)
		smash = smash + 1/2
	elseif isNpcOnCell(9,5) then		
	
		 talkToNpcOnCell(9,5)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(5,7)                             --Done Site
        	ex = ex + 1
        end
end
function Mineral()
	if isNpcOnCell(7,7) then	
	
		 talkToNpcOnCell(7,7)
		smash = smash + 1/2
	elseif isNpcOnCell(9,8) then		
	
		 talkToNpcOnCell(9,8)
		smash = smash + 1/2
	elseif isNpcOnCell(5,9) then		
	
		 talkToNpcOnCell(5,9)
		smash = smash + 1/2
	elseif isNpcOnCell(7,10) then			
	
		 talkToNpcOnCell(7,10)
		smash = smash + 1/2
	elseif isNpcOnCell(3,11) then		
	
		 talkToNpcOnCell(3,11)
		smash = smash + 1/2
	elseif isNpcOnCell(5,13) then		
	
		 talkToNpcOnCell(5,13)
		smash = smash + 1/2
	elseif isNpcOnCell(3,16) then	
	
		 talkToNpcOnCell(3,16)
		smash = smash + 1/2
	elseif isNpcOnCell(11,11) then		
	
		 talkToNpcOnCell(11,11)
		smash = smash + 1/2
	elseif isNpcOnCell(10,13) then		
	
		 talkToNpcOnCell(10,13)
		smash = smash + 1/2
	elseif isNpcOnCell(15,12) then			
	
		 talkToNpcOnCell(15,12)
		smash = smash + 1/2
	elseif isNpcOnCell(14,15) then		
	
		 talkToNpcOnCell(14,15)
		smash = smash + 1/2
	elseif isNpcOnCell(5,17) then		
	
		 return talkToNpcOnCell(5,17) or moveToCell(11,15)
		
	elseif isNpcOnCell(6,18) then	
	
		 talkToNpcOnCell(6,18)
		smash = smash + 1/2
	elseif isNpcOnCell(8,18) then		
	
		 talkToNpcOnCell(8,18)
		smash = smash + 1/2
	elseif isNpcOnCell(25,16) then		
	
		 talkToNpcOnCell(25,16)
		smash = smash + 1/2
	elseif isNpcOnCell(23,18) then			
	
		 talkToNpcOnCell(23,18)
		smash = smash + 1/2
	elseif isNpcOnCell(20,18) then		
	
		 talkToNpcOnCell(20,18)
		smash = smash + 1/2
	elseif isNpcOnCell(23,11) then		
	
		 return talkToNpcOnCell(23,11) or moveToCell(11,17)
		
	elseif isNpcOnCell(23,7) then		
	
		 talkToNpcOnCell(23,7)
		smash = smash + 1/2
	elseif isNpcOnCell(22,6) then		
	
		 talkToNpcOnCell(22,6)
		smash = smash + 1/2
	elseif isNpcOnCell(7,3) then			
	
		 talkToNpcOnCell(7,3)
		smash = smash + 1/2
	elseif isNpcOnCell(21,2) then		
	
		 talkToNpcOnCell(21,2)
		smash = smash + 1/2
	elseif isNpcOnCell(20,2) then		
	
		 talkToNpcOnCell(20,2)
		smash = smash + 1/2
	elseif isNpcOnCell(11,5) then		
	
		 talkToNpcOnCell(11,5)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(9,6)                             --Done Site
        	ex = ex + 1
        end
end
function Historical()
	if isNpcOnCell(8,8) then	
	
		 talkToNpcOnCell(8,8)
		smash = smash + 1/2
	elseif isNpcOnCell(9,7) then		
	
		 talkToNpcOnCell(9,7)
		smash = smash + 1/2
	elseif isNpcOnCell(10,6) then		
	
		 talkToNpcOnCell(10,6)
		smash = smash + 1/2
	elseif isNpcOnCell(12,6) then			
	
		 talkToNpcOnCell(12,6)
		smash = smash + 1/2
	elseif isNpcOnCell(14,5) then		
	
		 talkToNpcOnCell(14,5)
		smash = smash + 1/2
	elseif isNpcOnCell(16,5) then		
	
		 talkToNpcOnCell(16,5)
		smash = smash + 1/2
	elseif isNpcOnCell(17,5) then	
	
		 talkToNpcOnCell(17,5)
		smash = smash + 1/2
	elseif isNpcOnCell(19,5) then		
	
		 talkToNpcOnCell(19,5)
		smash = smash + 1/2
	elseif isNpcOnCell(21,6) then		
	
		 talkToNpcOnCell(21,6)
		smash = smash + 1/2
	elseif isNpcOnCell(23,1) then			
	
		 talkToNpcOnCell(23,1)
		smash = smash + 1/2
	elseif isNpcOnCell(23,2) then			
	
		 talkToNpcOnCell(23,2)
		smash = smash + 1/2
	elseif isNpcOnCell(21,2) then		
	
		 talkToNpcOnCell(21,2) 
		smash = smash + 1/2
	elseif isNpcOnCell(22,17) then		
	
		 return talkToNpcOnCell(22,17) or moveToCell(21,14)
		
	elseif isNpcOnCell(19,17) then	
	
		 talkToNpcOnCell(19,17)
		smash = smash + 1/2
	elseif isNpcOnCell(17,13) then		
	
		 return talkToNpcOnCell(17,13) or moveToCell(20,15)
	elseif isNpcOnCell(15,13) then		
	
		 talkToNpcOnCell(15,13)
		smash = smash + 1/2
	elseif isNpcOnCell(13,14) then			
	
		 talkToNpcOnCell(13,14)
		smash = smash + 1/2
	elseif isNpcOnCell(11,14) then		
	
		 talkToNpcOnCell(11,14)
		smash = smash + 1/2
	elseif isNpcOnCell(10,15) then		
	
		 talkToNpcOnCell(10,15)
		smash = smash + 1/2
	elseif isNpcOnCell(8,15) then		
	
		 talkToNpcOnCell(8,15)
		smash = smash + 1/2
	elseif isNpcOnCell(5,15) then			
	
		 talkToNpcOnCell(5,15)
		smash = smash + 1/2
	
	elseif isNpcOnCell(3,15) then		
	
		 return talkToNpcOnCell(3,15) or moveToCell(2,12)
		
	elseif isNpcOnCell(1,16) then		
	
		  talkToNpcOnCell(1,16)
		smash = smash + 1/2
	elseif isNpcOnCell(6,12) then		
	
		 return talkToNpcOnCell(6,12) or moveToCell(2,14)
		

	else
		
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(2,8)                              --Done Site
		ex = ex + 1
        	
        end
end
function Haunted()
	if isNpcOnCell(1,8) then	
	
		 talkToNpcOnCell(1,8)
		smash = smash + 1/2
	elseif isNpcOnCell(2,11) then		
	
		 talkToNpcOnCell(2,11)
		smash = smash + 1/2
	elseif isNpcOnCell(4,16) then		
	
		 talkToNpcOnCell(4,16)
		smash = smash + 1/2
	elseif isNpcOnCell(9,14) then			
	
		 talkToNpcOnCell(9,14)
		smash = smash + 1/2
	elseif isNpcOnCell(11,14) then		
	
		 talkToNpcOnCell(11,14)
		smash = smash + 1/2
	elseif isNpcOnCell(15,14) then		
	
		 talkToNpcOnCell(15,14)
		smash = smash + 1/2
	elseif isNpcOnCell(17,14) then	
	
		 talkToNpcOnCell(17,14)
		smash = smash + 1/2
	elseif isNpcOnCell(21,14) then		
	
		 talkToNpcOnCell(21,14)
		smash = smash + 1/2
	elseif isNpcOnCell(20,11) then		
	
		 talkToNpcOnCell(20,11)
		smash = smash + 1/2
	elseif isNpcOnCell(16,11) then			
	
		 talkToNpcOnCell(16,11)
		smash = smash + 1/2
	elseif isNpcOnCell(14,11) then		
	
		 talkToNpcOnCell(14,11)
		smash = smash + 1/2
	elseif isNpcOnCell(12,11) then		
	
		 talkToNpcOnCell(12,11)
		smash = smash + 1/2
	elseif isNpcOnCell(8,11) then	
	
		 talkToNpcOnCell(8,11)
		smash = smash + 1/2
	elseif isNpcOnCell(7,8) then		
	
		 talkToNpcOnCell(7,8)
		smash = smash + 1/2
	elseif isNpcOnCell(9,8) then		
	
		 talkToNpcOnCell(9,8)
		smash = smash + 1/2
	elseif isNpcOnCell(11,8) then			
	
		 talkToNpcOnCell(11,8)
		smash = smash + 1/2
	elseif isNpcOnCell(13,8) then		
	
		 talkToNpcOnCell(13,8)
		smash = smash + 1/2
	elseif isNpcOnCell(15,8) then		
	
		 talkToNpcOnCell(15,8)
		smash = smash + 1/2
	elseif isNpcOnCell(17,8) then		
	
		 talkToNpcOnCell(17,8)
		smash = smash + 1/2
	elseif isNpcOnCell(16,5) then		
	
		 talkToNpcOnCell(16,5)
		smash = smash + 1/2
	elseif isNpcOnCell(14,5) then		
	
		 talkToNpcOnCell(14,5)
		smash = smash + 1/2
	elseif isNpcOnCell(12,5) then			
	
		 talkToNpcOnCell(12,5)
		smash = smash + 1/2
	elseif isNpcOnCell(8,5) then		
	
		 talkToNpcOnCell(8,5)
		smash = smash + 1/2
	elseif isNpcOnCell(6,5) then		
	
		 talkToNpcOnCell(6,5)
		smash = smash + 1/2
	elseif isNpcOnCell(4,5) then		
	
		 talkToNpcOnCell(4,5)
		smash = smash + 1/2
	else
		log("--- "..getMapName().." cleared... Moving to next site")
		log("--- Current number of smashed "..smash)
		moveToCell(3,8)                             --Done Site
        	ex = ex + 1
        end
end
function normal()
    return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")  or sendAnyPokemon() or attack() or run()
end

function advanceCatch()
        if getActivePokemonNumber() == 1 then
            return sendPokemon(falseswiper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealth() > 1 ) then
            return weakAttack() or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == sleeper ) and ( getOpponentStatus() ~= "SLEEP" and getOpponentStatus() ~= "PARALIZE" and getOpponentStatus() ~= "POISON" and getOpponentStatus() ~= "BURN" ) and ( getOpponentHealth() == 1 ) then
            return useMove(sleepmove) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealth() == 1 ) then
            return sendPokemon(sleeper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif getOpponentStatus() == "SLEEP" or getOpponentStatus() == "PARALIZE" or getOpponentStatus() == "POISON" or getOpponentStatus() == "BURN" then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or attack() or run()
        else
                return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or attack() or run()
        end
end

function fswipe()
        if getActivePokemonNumber() == 1 then
            return sendPokemon(falseswiper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealth() > 1 ) then
            return weakAttack() or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif getOpponentHealth() == 1 then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")  or sendAnyPokemon() or attack() or run()
        end
end
function sleep()
        if getActivePokemonNumber() == 1 then
            return sendPokemon(sleeper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or run()
        elseif ( getActivePokemonNumber() == sleeper ) and ( getOpponentStatus() ~= "SLEEP" and getOpponentStatus() ~= "PARALIZE" and getOpponentStatus() ~= "POISON" and getOpponentStatus() ~= "BURN" ) then
            return useMove(sleepmove) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif getOpponentStatus() == "SLEEP" or getOpponentStatus() == "PARALIZE" or getOpponentStatus() == "POISON" or getOpponentStatus() == "BURN" then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        else
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or attack() or run()
        end    
end


