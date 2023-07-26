include("FLuaVector.lua")

local L = Locale.ConvertTextKey

local tLostCities = {}

local tEventChoice = {
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_BOGOTA, -- 1
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_CAPE_TOWN,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_MANILA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH, -- 6
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SIDON,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_OC_EO,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_THIMPHU,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_ANDORRA, -- 11
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_LEVUKA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_DALI,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_RISHIKESH,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_ISKANWAYA, -- 16
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_TIWANAKU,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_HONG_KONG,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL, -- 21
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_TYRE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_KABUL,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY, -- 26
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SYDNEY,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_GWYNEDD,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SINGAPORE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_RAGUSA, -- 31
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_VATICAN_CITY,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_KATHMANDU,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_IFE,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_GENEVA, -- 36
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_GENOA,
	GameInfoTypes.PLAYER_EVENT_CHOICE_MINOR_CIV_SIERRA_LEONE
}

local tBuildingsActiveAbilities = {
	GameInfoTypes.BUILDING_LHASA, -- 1
	GameInfoTypes.BUILDING_OC_EO,
	GameInfoTypes.BUILDING_OC_EO_2,
	GameInfoTypes.BUILDING_THIMPHU,
	GameInfoTypes.BUILDING_THIMPHU_2,
	GameInfoTypes.BUILDING_ANDORRA, -- 6
	GameInfoTypes.BUILDING_CANOSSA,
	GameInfoTypes.BUILDING_TEMPLE,
	GameInfoTypes.BUILDING_LEVUKA,
	GameInfoTypes.BUILDING_JERUSALEM,
	GameInfoTypes.BUILDING_RISHIKESH_2, -- 11
	GameInfoTypes.BUILDING_WELLINGTON_HORSE,
	GameInfoTypes.BUILDING_WELLINGTON_IRON,
	GameInfoTypes.BUILDING_WELLINGTON_COAL,
	GameInfoTypes.BUILDING_WELLINGTON_OIL,
	GameInfoTypes.BUILDING_WELLINGTON_ALUMINUM, -- 16
	GameInfoTypes.BUILDING_WELLINGTON_URANIUM,
	GameInfoTypes.BUILDING_WELLINGTON_PAPER,
	GameInfoTypes.BUILDING_RAGUSA_2
}

local tPromotionsActiveAbilities = {
	GameInfoTypes.PROMOTION_ISKANWAYA, -- 1
	GameInfoTypes.PROMOTION_KABUL,
	GameInfoTypes.PROMOTION_GUARDIA_SVIZZERA,
	GameInfoTypes.PROMOTION_KATZBALGER
}

local tBuildingsPassiveAbilities = {
	GameInfoTypes.BUILDING_MARITIME, -- 1
	GameInfoTypes.BUILDING_MARITIME_FRIENDLY,
	GameInfoTypes.BUILDING_MARITIME_NEUTRAL,
	GameInfoTypes.BUILDING_MARITIME_HOSTILE,
	GameInfoTypes.BUILDING_MERCANTILE,
	GameInfoTypes.BUILDING_MERCANTILE_FRIENDLY, -- 6
	GameInfoTypes.BUILDING_MERCANTILE_NEUTRAL,
	GameInfoTypes.BUILDING_MERCANTILE_HOSTILE,
	GameInfoTypes.BUILDING_CULTURED,
	GameInfoTypes.BUILDING_CULTURED_FRIENDLY,
	GameInfoTypes.BUILDING_CULTURED_NEUTRAL, -- 11
	GameInfoTypes.BUILDING_CULTURED_HOSTILE,
	GameInfoTypes.BUILDING_RELIGIOUS,
	GameInfoTypes.BUILDING_RELIGIOUS_FRIENDLY,
	GameInfoTypes.BUILDING_RELIGIOUS_NEUTRAL,
	GameInfoTypes.BUILDING_RELIGIOUS_HOSTILE, -- 16
	GameInfoTypes.BUILDING_MILITARISTIC,
	GameInfoTypes.BUILDING_MILITARISTIC_FRIENDLY,
	GameInfoTypes.BUILDING_MILITARISTIC_NEUTRAL,
	GameInfoTypes.BUILDING_MILITARISTIC_HOSTILE
}

local tPoliciesPassiveAbilities = {
	GameInfoTypes.POLICY_MARITIME, -- 1
	GameInfoTypes.POLICY_MARITIME_FRIENDLY,
	GameInfoTypes.POLICY_MARITIME_NEUTRAL,
	GameInfoTypes.POLICY_MARITIME_HOSTILE,
	GameInfoTypes.POLICY_MERCANTILE,
	GameInfoTypes.POLICY_MERCANTILE_FRIENDLY, -- 6
	GameInfoTypes.POLICY_MERCANTILE_NEUTRAL,
	GameInfoTypes.POLICY_MERCANTILE_HOSTILE,
	GameInfoTypes.POLICY_CULTURED,
	GameInfoTypes.POLICY_CULTURED_FRIENDLY,
	GameInfoTypes.POLICY_CULTURED_NEUTRAL, -- 11
	GameInfoTypes.POLICY_CULTURED_HOSTILE,
	GameInfoTypes.POLICY_RELIGIOUS,
	GameInfoTypes.POLICY_RELIGIOUS_FRIENDLY,
	GameInfoTypes.POLICY_RELIGIOUS_NEUTRAL,
	GameInfoTypes.POLICY_RELIGIOUS_HOSTILE, -- 16
	GameInfoTypes.POLICY_MILITARISTIC,
	GameInfoTypes.POLICY_MILITARISTIC_FRIENDLY,
	GameInfoTypes.POLICY_MILITARISTIC_NEUTRAL,
	GameInfoTypes.POLICY_MILITARISTIC_HOSTILE
}

local tImprovementsRegular = {
	GameInfoTypes.IMPROVEMENT_MARSH,
	GameInfoTypes.IMPROVEMENT_PLANT_FOREST,
	GameInfoTypes.IMPROVEMENT_PLANT_JUNGLE
}

local tImprovementsGreatPeople = {
	GameInfoTypes.IMPROVEMENT_EMBASSY,
	GameInfoTypes.IMPROVEMENT_HOLY_SITE,
	GameInfoTypes.IMPROVEMENT_FORT,
	GameInfoTypes.IMPROVEMENT_MANUFACTORY,
	GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE,
	GameInfoTypes.IMPROVEMENT_ACADEMY
}

local tFeatureTypes = {
	GameInfoTypes.FEATURE_FOREST,
	GameInfoTypes.FEATURE_JUNGLE,
	GameInfoTypes.FEATURE_MARSH,
	GameInfoTypes.FEATURE_OASIS,
	GameInfoTypes.FEATURE_FLOOD_PLAINS,
	GameInfoTypes.FEATURE_ICE,
	GameInfoTypes.FEATURE_FALLOUT
}

local tPlotTypes = {
	GameInfoTypes.PLOT_LAND,
	GameInfoTypes.PLOT_HILLS,
	GameInfoTypes.PLOT_MOUNTAIN,
	GameInfoTypes.PLOT_OCEAN
}

local tDomainTypes = {
	GameInfoTypes.DOMAIN_LAND,
	GameInfoTypes.DOMAIN_SEA,
	GameInfoTypes.DOMAIN_AIR
}

local tSpecialistTypes = {
	GameInfoTypes.SPECIALIST_SCIENTIST,
	GameInfoTypes.SPECIALIST_ENGINEER,
	GameInfoTypes.SPECIALIST_MERCHANT,
	GameInfoTypes.SPECIALIST_ARTIST,
	GameInfoTypes.SPECIALIST_WRITER,
	GameInfoTypes.SPECIALIST_MUSICIAN,
	GameInfoTypes.SPECIALIST_CITIZEN,
	GameInfoTypes.SPECIALIST_CIVIL_SERVANT
}

local tUnitsGreatPeople = {
	GameInfoTypes.UNIT_SCIENTIST,
	GameInfoTypes.UNIT_ENGINEER,
	GameInfoTypes.UNIT_MERCHANT,
	GameInfoTypes.UNIT_ARTIST,
	GameInfoTypes.UNIT_WRITER,
	GameInfoTypes.UNIT_MUSICIAN,
	GameInfoTypes.UNIT_GREAT_DIPLOMAT,
	GameInfoTypes.UNIT_GREAT_GENERAL,
	GameInfoTypes.UNIT_GREAT_ADMIRAL,
	GameInfoTypes.UNIT_PROPHET
}

local tUnitsCivilians = {
	GameInfoTypes.UNIT_WORKER,
	GameInfoTypes.UNIT_WORKBOAT,
	GameInfoTypes.UNIT_MISSIONARY,
	GameInfoTypes.UNIT_ARCHAEOLOGIST
}

local tUnitsTrade = {
	GameInfoTypes.UNIT_CARAVAN,
	GameInfoTypes.UNIT_CARGO_SHIP,
	GameInfoTypes.UNIT_CARAVAN_OF_DALI,
	--GameInfoTypes.UNIT_CARGO_SHIP_OF_DALI -- unused because of VP's dll constraints (Spain)
}

local tUnitsMilitary = {
	GameInfoTypes.UNIT_SWISS_GUARD,
	GameInfoTypes.UNIT_GURKHA
}

local tResourcesStrategic = {
	GameInfoTypes.RESOURCE_HORSE,
	GameInfoTypes.RESOURCE_IRON,
	GameInfoTypes.RESOURCE_COAL,
	GameInfoTypes.RESOURCE_OIL,
	GameInfoTypes.RESOURCE_ALUMINUM,
	GameInfoTypes.RESOURCE_URANIUM,
	GameInfoTypes.RESOURCE_PAPER
}

local tTechnologyTypes = {
	GameInfoTypes.TECH_ARCHAEOLOGY,
	GameInfoTypes.TECH_RADIO,
	GameInfoTypes.TECH_TELECOM
}

local eArtifactRuin = GameInfoTypes.ARTIFACT_ANCIENT_RUIN
local eResourceArtifact = GameInfoTypes.RESOURCE_ARTIFACTS

local eSphere = GameInfoTypes.RESOLUTION_SPHERE_OF_INFLUENCE


-- specific variables needed for events
-- ZURICH
local tZurichLastInterests = {}
local tZurichCounter = {}
-- PRAGUE
local bBlockedUnitFromThePreKillEvent = false


-- for city-states' verification
local tMinorTraits = {
	GameInfoTypes.MINOR_TRAIT_MARITIME,
	GameInfoTypes.MINOR_TRAIT_MERCANTILE,
	GameInfoTypes.MINOR_TRAIT_CULTURED,
	GameInfoTypes.MINOR_TRAIT_RELIGIOUS,
	GameInfoTypes.MINOR_TRAIT_MILITARISTIC
}

local tMinorPersonalities = {
	MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_FRIENDLY,
	MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_NEUTRAL,
	MinorCivPersonalityTypes.MINOR_CIV_PERSONALITY_HOSTILE
}


-- for events to start
local iThresholdPseudoAllies = 3 * GameDefines.FRIENDSHIP_THRESHOLD_ALLIES
local bIsAllyAnOption = true
local bIsEmbassyAnOption = true
local bIsPseudoAllyAnOption = true
local tEmbassies = {}

-- for plot iteration
local tDirectionTypes = {
		DirectionTypes.DIRECTION_NORTHEAST,
		DirectionTypes.DIRECTION_EAST,
		DirectionTypes.DIRECTION_SOUTHEAST,
		DirectionTypes.DIRECTION_SOUTHWEST,
		DirectionTypes.DIRECTION_WEST,
		DirectionTypes.DIRECTION_NORTHWEST
	}

-- for CS UU gifts (MinorCivGift=1)
local tUniqueUnitsFromMinors = {}
	tUniqueUnitsFromMinors["UNIT_HUNNIC_BATTERING_RAM"] = {
		eUnit = GameInfoTypes.UNIT_SPEARMAN
	}
	tUniqueUnitsFromMinors["UNIT_DANISH_SKI_INFANTRY"] = {
		eUnit = GameInfoTypes.UNIT_RIFLEMAN
	}
	tUniqueUnitsFromMinors["UNIT_BRAZILIAN_PRACINHA"] = {
		eUnit = GameInfoTypes.UNIT_INFANTRY
	}
	tUniqueUnitsFromMinors["UNIT_ENGLISH_LONGBOWMAN"] = {
		eUnit = GameInfoTypes.UNIT_CROSSBOWMAN
	}
	tUniqueUnitsFromMinors["UNIT_GREEK_COMPANIONCAVALRY"] = {
		eUnit = GameInfoTypes.UNIT_HORSEMAN
	}
	tUniqueUnitsFromMinors["UNIT_OTTOMAN_SIPAHI"] = {
		eUnit = GameInfoTypes.UNIT_LANCER
	}
	tUniqueUnitsFromMinors["UNIT_SWEDISH_HAKKAPELIITTA"] = {
		eUnit = GameInfoTypes.UNIT_LANCER
	}
	tUniqueUnitsFromMinors["UNIT_KOREAN_TURTLE_SHIP"] = {
		eUnit = GameInfoTypes.UNIT_CARAVEL
	}
	tUniqueUnitsFromMinors["UNIT_VENETIAN_GALLEASS"] = {
		eUnit = GameInfoTypes.UNIT_GALLEASS
	}
	tUniqueUnitsFromMinors["UNIT_ROMAN_BALLISTA"] = {
		eUnit = GameInfoTypes.UNIT_CATAPULT
	}
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
function RandomNumberBetween(iLower, iHigher)
    return (Game.Rand((iHigher + 1) - iLower, "")) + iLower
end

-- position calculator for custom positioning of floating text prompts (yields, additional info)
--[[function PositionCalculator(i1, i2)
	return HexToWorld(ToHexFromGrid(Vector2(i1, i2)))
end

if pPlayer:IsHuman() and pPlayer:IsTurnActive() then
	local vCityPosition = PositionCalculator(pCapital:GetX(), pCapital:GetY())
			
	Events.AddPopupTextEvent(vCityPosition, "[COLOR_MAGENTA]+" .. iCultureLiberated .. " [ICON_CULTURE][ENDCOLOR]", 1)
end--]]
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Resetting cooldown for active events for civs passing the threshold and setting new events
function MinorPlayerDoTurn(ePlayer)
	if Players[ePlayer]:IsMinorCiv() then
		local pMinorPlayer = Players[ePlayer]
		local sMinorCivType = GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type
		
		-- Ally part
		if bIsAllyAnOption then
			if pMinorPlayer:GetAlly() ~= -1 then 
				local pMajorPlayer = Players[pMinorPlayer:GetAlly()]
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) ~= 0 then
					pMajorPlayer:SetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType], 3)
				end 
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) == 0 and not pMajorPlayer:IsEventChoiceActive(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) then
					pMajorPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType])
					
					if pMajorPlayer:IsHuman() then
						pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_ALLY", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_ALLY_TITLE"), pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
					end
				end
			end
		end
		
		-- Embassy part
		if bIsEmbassyAnOption then
			if pMinorPlayer:GetImprovementCount(tImprovementsGreatPeople[1]) > 0 then
				if tEmbassies[ePlayer] == nil then
					local pMinorCapital = pMinorPlayer:GetCapitalCity()
				
					for i = 0, pMinorCapital:GetNumCityPlots() - 1, 1 do
						local pPlot = pMinorCapital:GetCityIndexPlot(i)
					   
						if pPlot and pPlot:GetOwner() == ePlayer and pPlot:GetImprovementType() == tImprovementsGreatPeople[1] then
							tEmbassies[ePlayer] = pPlot:GetPlayerThatBuiltImprovement()
							break
						end
					end
				end
				
				local pMajorPlayer = Players[tEmbassies[ePlayer]]
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) ~= 0 then
					pMajorPlayer:SetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType], 3)
				end 
				
				if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) == 0 and not pMajorPlayer:IsEventChoiceActive(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) then
					pMajorPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType])
					
					if pMajorPlayer:IsHuman() then
						pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_EMBASSY", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_EMBASSY_TITLE"), pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
					end
				end
			end
		end
		
		-- pseudoAlly part
		if bIsPseudoAllyAnOption then
			for ePlayer, pPlayer in ipairs(Players) do
				if pPlayer and pPlayer:IsAlive() then
					if pPlayer:IsMinorCiv() then break end
					if not pPlayer:IsEverAlive() then break end
					
					if pMinorPlayer:GetMinorCivFriendshipWithMajor(ePlayer) >= iThresholdPseudoAllies then
						if pPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) ~= 0 then
							pPlayer:SetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType], 3)
						end
						
						if pPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) == 0 and not pPlayer:IsEventChoiceActive(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType]) then
							pPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. sMinorCivType])
							
							if pPlayer:IsHuman() then
								pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_INFLUENCE", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_INFLUENCE_TITLE"), pMinorPlayer:GetCapitalCity():GetX(), pMinorPlayer:GetCapitalCity():GetY())
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(MinorPlayerDoTurn)

-- Setting events after Sphere of Influence voting
function MovingSwiftly(eResolution, eProposer, eChoice, bEnact, bPassed)
	if eResolution == eSphere then
		local pMinorPlayer = Players[eChoice]
		local pMajorPlayer = Players[eProposer]
	
		if bEnact and bPassed then
			if pMajorPlayer:GetEventChoiceCooldown(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type]) == 0 then
				pMajorPlayer:DoEventChoice(GameInfoTypes["PLAYER_EVENT_CHOICE_" .. GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type])	
			end
		end
	end
end
GameEvents.ResolutionResult.Add(MovingSwiftly)
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
function UnitNotificationLoad(pMinorPlayer, pMajorPlayer, sUnitName, eUnitType)
	pMajorCapitalCity = pMajorPlayer:GetCapitalCity()
	pMinorCapitalCity = pMinorPlayer:GetCapitalCity()
	sMinorCityName = pMinorCapitalCity:GetName()

	if pMajorPlayer:IsHuman() then
		pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, L("TXT_KEY_UCS_PASSIVES_GIFTS", sUnitName, sMinorCityName), L("TXT_KEY_UCS_PASSIVES_GIFTS_TITLE"), pMajorCapitalCity:GetX(), pMajorCapitalCity:GetY(), eUnitType, false)
	end
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Unique stuff for CSs types and personalities
-- MARITIME
function MaritimeCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Maritime
	-- Manufactory
	if eMinorTrait ~= tMinorTraits[1] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
		
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local ePlot = pPlot:GetPlotType()
			local eResource = pPlot:GetResourceType()
			local eImprovement = pPlot:GetImprovementType()
			local eFeature = pPlot:GetFeatureType()
			
			if not bIsCity and eImprovement == -1 and eFeature == -1 and (ePlot == tPlotTypes[1] or ePlot == tPlotTypes[2]) then
				pPlot:SetImprovementType(tImprovementsGreatPeople[4])
				break
			end
		end
		
		if i >= 18 then
			break
		end
	end
	
	-- Bonus Resource
	local tBonusResourcesIDs = {}
	local tBonusResourcesTypes = {}
	local bBonusPlaced = false
	
	for resource in GameInfo.Resources{ResourceClassType='RESOURCECLASS_BONUS'} do
		table.insert(tBonusResourcesIDs, resource.ID)
		table.insert(tBonusResourcesTypes, resource.Type)
	end
	
	repeat
		local iRandomResource = RandomNumberBetween(1, #tBonusResourcesIDs)
		local eChosenResource = tBonusResourcesIDs[iRandomResource]
		local tBonusResourceFeatures = {}
		local tBonusResourceTerrains = {}
		
		for row in GameInfo.Resource_FeatureBooleans{ResourceType=tBonusResourcesTypes[iRandomResource]} do
			table.insert(tBonusResourceFeatures, row.FeatureType)
		end
		for row in GameInfo.Resource_TerrainBooleans{ResourceType=tBonusResourcesTypes[iRandomResource]} do
			table.insert(tBonusResourceTerrains, row.TerrainType)
		end	
		
		for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
			local pPlot = pMinorCapital:GetCityIndexPlot(i)
			
			if pPlot then
				local bIsCity = pPlot:IsCity()
				local eImprovement = pPlot:GetImprovementType()
				local eResource = pPlot:GetResourceType()
				local eFeature = pPlot:GetFeatureType()
				local eTerrain = pPlot:GetTerrainType()
				local bFeaturePass = false
				local bTerrainPass = false
				
				if not bIsCity and eResource == -1 and eImprovement == -1 then
					if #tBonusResourceFeatures == 0 and eFeature == -1 then
						bFeaturePass = true
					else
						for i, value in ipairs(tBonusResourceFeatures) do
							if eFeature == FeatureTypes[value] then
								bFeaturePass = true
								break
							end
						end
					end
					
					if #tBonusResourceTerrains == 0 then
						bFeaturePass = true
					else
						for i, value in ipairs(tBonusResourceTerrains) do
							if eTerrain == TerrainTypes[value] then
								bTerrainPass = true
								break
							end
						end
					end
					
					if bFeaturePass and bTerrainPass then
						pPlot:SetResourceType(eChosenResource, 1)
						bBonusPlaced = true
						break
					end
				end
			end
			
			if i >= 36 then
				table.remove(tBonusResourcesIDs, iRandomResource)
				table.remove(tBonusResourcesTypes, iRandomResource)
				break
			end
		end
	until (bBonusPlaced or #tBonusResourcesIDs == 0)
	
	-- rest
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[1], 1)
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[1], true)
	
	-- Maritime - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[2], 1)
	end
	
	-- Maritime - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[3], 1)
	end
	
	-- Maritime - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[4], 1)
	end
end
GameEvents.PlayerCityFounded.Add(MaritimeCityStatesBonuses)

function MaritimeCityStatesBonusesLiberated(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Maritime
	if eMinorTrait ~= tMinorTraits[1] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[1], 1)
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[1], true)
	
	-- Maritime - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[2], 1)
	end
	
	-- Maritime - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[3], 1)
	end
	
	-- Maritime - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[4], 1)
	end
end
GameEvents.PlayerLiberated.Add(MaritimeCityStatesBonusesLiberated)

function FreeWorkerFromCityState(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	if pMinorCapital == nil then return end
	
	if pMinorCapital:IsHasBuilding(tBuildingsPassiveAbilities[2]) then
		local iWorkerSpawnChance = RandomNumberBetween(1, 100)
		
		if iWorkerSpawnChance <= 1 then
			for eMajorPlayer, pMajorPlayer in ipairs(Players) do
				if pMajorPlayer and pMajorPlayer:IsAlive() then
					if pMajorPlayer:IsMinorCiv() then break end
					if not pMajorPlayer:IsEverAlive() then break end
					
					if pPlayer:IsFriends(eMajorPlayer) or pPlayer:IsAllies(eMajorPlayer) then
						local iWorkerOrFishingBoatSpawnChance = RandomNumberBetween(1, 100)

						local pMajorCapital = pMajorPlayer:GetCapitalCity()
						local bIsMajorHasCoast = pMajorCapital:IsCoastal()
						local bIsMajorHasTrueSea = false

						if bIsMajorHasCoast then
							for i = 1, pMajorCapital:GetNumCityPlots() - 1, 1 do
								local pPlot = pMajorCapital:GetCityIndexPlot(i)
		
								if pPlot then
									local bIsLake = pPlot:IsLake()
									local ePlot = pPlot:GetPlotType()
			
									if ePlot == tPlotTypes[4] and not bIsLake then
										bIsMajorHasTrueSea = true
										break
									end
								end
		
								if i >= 6 then
									break
								end
							end
						end
						
						if iWorkerOrFishingBoatSpawnChance <= 50 and bIsMajorHasTrueSea then
							pMajorPlayer:AddFreeUnit(tUnitsCivilians[2], UNITAI_DEFENSE)
							UnitNotificationLoad(pPlayer, pMajorPlayer, 'Fishing Boat', tUnitsCivilians[2])
						else	
							pMajorPlayer:AddFreeUnit(tUnitsCivilians[1], UNITAI_DEFENSE)
							UnitNotificationLoad(pPlayer, pMajorPlayer, 'Worker', tUnitsCivilians[1])
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(FreeWorkerFromCityState)


-- MERCANTILE
function MercantileCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Mercantile
	-- Town
	if eMinorTrait ~= tMinorTraits[2] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
		
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local ePlot = pPlot:GetPlotType()
			local eResource = pPlot:GetResourceType()
			local eImprovement = pPlot:GetImprovementType()
			local eFeature = pPlot:GetFeatureType()
			
			if not bIsCity and eImprovement == -1 and eFeature == -1 and (ePlot == tPlotTypes[1] or ePlot == tPlotTypes[2]) then
				pPlot:SetImprovementType(tImprovementsGreatPeople[5])
				break
			end
		end
		
		if i >= 18 then
			break
		end
	end
	
	-- Luxury Resource
	local tLuxuryResourcesIDs = {}
	local tLuxuryResourcesTypes = {}
	local bLuxuryPlaced = false
	
	for resource in GameInfo.Resources{ResourceClassType='RESOURCECLASS_LUXURY', OnlyMinorCivs=0} do
		table.insert(tLuxuryResourcesIDs, resource.ID)
		table.insert(tLuxuryResourcesTypes, resource.Type)
	end
	
	repeat
		local iRandomResource = RandomNumberBetween(1, #tLuxuryResourcesIDs)
		local eChosenResource = tLuxuryResourcesIDs[iRandomResource]
		local tLuxuryResourceFeatures = {}
		local tLuxuryResourceTerrains = {}
		
		for row in GameInfo.Resource_FeatureBooleans{ResourceType=tLuxuryResourcesTypes[iRandomResource]} do
			table.insert(tLuxuryResourceFeatures, row.FeatureType)
		end
		for row in GameInfo.Resource_TerrainBooleans{ResourceType=tLuxuryResourcesTypes[iRandomResource]} do
			table.insert(tLuxuryResourceTerrains, row.TerrainType)
		end	
		
		for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
			local pPlot = pMinorCapital:GetCityIndexPlot(i)
			
			if pPlot then
				local bIsCity = pPlot:IsCity()
				local eImprovement = pPlot:GetImprovementType()
				local eResource = pPlot:GetResourceType()
				local eFeature = pPlot:GetFeatureType()
				local eTerrain = pPlot:GetTerrainType()
				local bFeaturePass = false
				local bTerrainPass = false
				
				if not bIsCity and eResource == -1 and eImprovement == -1 then
					if #tLuxuryResourceFeatures == 0 and eFeature == -1 then
						bFeaturePass = true
					else
						for i, value in ipairs(tLuxuryResourceFeatures) do
							if eFeature == FeatureTypes[value] then
								bFeaturePass = true
								break
							end
						end
					end
					
					if #tLuxuryResourceTerrains == 0 then
						bFeaturePass = true
					else
						for i, value in ipairs(tLuxuryResourceTerrains) do
							if eTerrain == TerrainTypes[value] then
								bTerrainPass = true
								break
							end
						end
					end
					
					if bFeaturePass and bTerrainPass then
						pPlot:SetResourceType(eChosenResource, 1)
						bLuxuryPlaced = true
						break
					end
				end
			end
			
			if i >= 36 then
				table.remove(tLuxuryResourcesIDs, iRandomResource)
				table.remove(tLuxuryResourcesTypes, iRandomResource)
				break
			end
		end
	until (bLuxuryPlaced or #tLuxuryResourcesIDs == 0)
	
	-- rest
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[5], 1)
	
	-- Mercantile - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[6], 1)
	end
	
	-- Mercantile - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[7], 1)
	end
	
	-- Mercantile - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[8], 1)
	end
end
GameEvents.PlayerCityFounded.Add(MercantileCityStatesBonuses)

function MercantileCityStatesBonusesLiberated(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Maritime
	if eMinorTrait ~= tMinorTraits[2] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[5], 1)
	
	-- Mercantile - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[6], 1)
	end
	
	-- Mercantile - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[7], 1)
	end
	
	-- Mercantile - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[8], 1)
	end
end
GameEvents.PlayerLiberated.Add(MercantileCityStatesBonusesLiberated)

function FreeCaravanFromCityState(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	if pMinorCapital == nil then return end
	
	if pMinorCapital:IsHasBuilding(tBuildingsPassiveAbilities[6]) then
		local iCaravanSpawnChance = RandomNumberBetween(1, 100)
							
		if iCaravanSpawnChance <= 1 then
			for eMajorPlayer, pMajorPlayer in ipairs(Players) do
				if pMajorPlayer and pMajorPlayer:IsAlive() then
					if pMajorPlayer:IsMinorCiv() then break end
					if not pMajorPlayer:IsEverAlive() then break end
					
					if pPlayer:IsFriends(eMajorPlayer) or pPlayer:IsAllies(eMajorPlayer) then
						local bIsMajorCanHaveTR = pMajorPlayer:GetNumInternationalTradeRoutesUsed() < pMajorPlayer:GetNumInternationalTradeRoutesAvailable()
						
						if bIsMajorCanHaveTR then
							local iCaravanOrCargoSpawnChance = RandomNumberBetween(1, 100)
						
							local pMajorCapital = pMajorPlayer:GetCapitalCity()
							local bIsMajorHasCoast = pMajorCapital:IsCoastal()
							local bIsMajorHasTrueSea = false

							if bIsMajorHasCoast then
								for i = 1, pMajorCapital:GetNumCityPlots() - 1, 1 do
									local pPlot = pMajorCapital:GetCityIndexPlot(i)
		
									if pPlot then
										local bIsLake = pPlot:IsLake()
										local ePlot = pPlot:GetPlotType()
			
										if ePlot == tPlotTypes[4] and not bIsLake then
											bIsMajorHasTrueSea = true
											break
										end
									end
		
									if i >= 6 then
										break
									end
								end
							end

							if iCaravanOrCargoSpawnChance <= 50 and bIsMajorHasTrueSea then
								pMajorPlayer:AddFreeUnit(tUnitsTrade[2], UNITAI_DEFENSE)
								UnitNotificationLoad(pPlayer, pMajorPlayer, 'Cargo Ship', tUnitsTrade[2])
							else	
								pMajorPlayer:AddFreeUnit(tUnitsTrade[1], UNITAI_DEFENSE)
								UnitNotificationLoad(pPlayer, pMajorPlayer, 'Caravan', tUnitsTrade[1])
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(FreeCaravanFromCityState)


-- CULTURED
function CulturedCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Cultured
	-- Academy
	if eMinorTrait ~= tMinorTraits[3] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
		
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local ePlot = pPlot:GetPlotType()
			local eResource = pPlot:GetResourceType()
			local eImprovement = pPlot:GetImprovementType()
			local eFeature = pPlot:GetFeatureType()
			
			if not bIsCity and eImprovement == -1 and eFeature == -1 and (ePlot == tPlotTypes[1] or ePlot == tPlotTypes[2]) then
				pPlot:SetImprovementType(tImprovementsGreatPeople[6])
				break
			end
		end
		
		if i >= 18 then
			break
		end
	end
	
	-- Artifact
	local tArtifactSpots = {}

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
			
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local bIsWater = pPlot:IsWater()
			local bIsMountain = pPlot:GetPlotType() == 0
			local eImprovement = pPlot:GetImprovementType()
			local eResource = pPlot:GetResourceType()
				
			if not bIsWater and not bIsMountain and not bIsCity and eResource == -1 and eImprovement == -1 then
				table.insert(tArtifactSpots, pPlot)
			end
		end
			
		if i >= 18 then
			break
		end
	end

	if #tArtifactSpots > 0 then
		local pChosenPlot = table.remove(tArtifactSpots, #tArtifactSpots)
		
		pChosenPlot:SetArchaeologicalRecord(eArtifactRuin, GameInfoTypes.ERA_ANCIENT, pPlayer:GetID())
		pChosenPlot:SetResourceType(eResourceArtifact, 1)
	end

	-- rest
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[9], 1)
	
	-- Cultured - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[10], 1)
	end
	
	-- Cultured - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[11], 1)
	end
	
	-- Cultured - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[12], 1)
	end
end
GameEvents.PlayerCityFounded.Add(CulturedCityStatesBonuses)

function CulturedCityStatesBonusesLiberated(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Maritime
	if eMinorTrait ~= tMinorTraits[3] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[9], 1)
	
	-- Cultured - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[10], 1)
	end
	
	-- Cultured - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[11], 1)
	end
	
	-- Cultured - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[12], 1)
	end
end
GameEvents.PlayerLiberated.Add(CulturedCityStatesBonusesLiberated)

function FreeArchaeologistFromCityState(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	if pMinorCapital == nil then return end
	
	if pMinorCapital:IsHasBuilding(tBuildingsPassiveAbilities[10]) then
		local iArchaeologistSpawnChance = RandomNumberBetween(1, 100)
		
		if iArchaeologistSpawnChance <= 1 then
			for eMajorPlayer, pMajorPlayer in ipairs(Players) do
				if pMajorPlayer and pMajorPlayer:IsAlive() then
					if pMajorPlayer:IsMinorCiv() then break end
					if not pMajorPlayer:IsEverAlive() then break end
					
					local pMajorTeam = Teams[pMajorPlayer:GetTeam()]
					local bCanArchaeologistBeSpawned = pMajorTeam:IsHasTech(tTechnologyTypes[1])

					if bCanArchaeologistBeSpawned then
						if pPlayer:IsFriends(eMajorPlayer) or pPlayer:IsAllies(eMajorPlayer) then
							pMajorPlayer:AddFreeUnit(tUnitsCivilians[4], UNITAI_DEFENSE)
								UnitNotificationLoad(pPlayer, pMajorPlayer, 'Archaeologist', tUnitsCivilians[4])
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(FreeArchaeologistFromCityState)


-- RELIGIOUS
function ReligiousCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Religious
	-- Holy Site
	if eMinorTrait ~= tMinorTraits[4] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
		
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local ePlot = pPlot:GetPlotType()
			local eResource = pPlot:GetResourceType()
			local eImprovement = pPlot:GetImprovementType()
			local eFeature = pPlot:GetFeatureType()
			
			if not bIsCity and eImprovement == -1 and eFeature == -1 and (ePlot == tPlotTypes[1] or ePlot == tPlotTypes[2]) then
				pPlot:SetImprovementType(tImprovementsGreatPeople[2])
				break
			end
		end
		
		if i >= 18 then
			break
		end
	end
	
	-- rest
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[13], 1)
	
	-- Religious - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[14], 1)
		pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[14], true)
	end
	
	-- Religious - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[15], 1)
	end
	
	-- Religious - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[16], 1)
	end
end
GameEvents.PlayerCityFounded.Add(ReligiousCityStatesBonuses)

function ReligiousCityStatesBonusesLiberated(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Maritime
	if eMinorTrait ~= tMinorTraits[4] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[13], 1)
	
	-- Religious - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[14], 1)
		pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[14], true)
	end
	
	-- Religious - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[15], 1)
	end
	
	-- Religious - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[16], 1)
	end
end
GameEvents.PlayerLiberated.Add(ReligiousCityStatesBonusesLiberated)

function FreeMissionariesFromCityState(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	if pMinorCapital == nil then return end
	
	if pMinorCapital:IsHasBuilding(tBuildingsPassiveAbilities[14]) then
		local iMissionarySpawnChance = RandomNumberBetween(1, 100)
		
		if iMissionarySpawnChance <= 1 then
			for eMajorPlayer, pMajorPlayer in ipairs(Players) do
				if pMajorPlayer and pMajorPlayer:IsAlive() then
					if pMajorPlayer:IsMinorCiv() then break end
					if not pMajorPlayer:IsEverAlive() then break end
					
					local bCanMissionaryBeSpawned = pMajorPlayer:HasCreatedReligion() or pMajorPlayer:GetCapitalCity():GetReligiousMajority() > 0

					if bCanMissionaryBeSpawned then
						if pPlayer:IsFriends(eMajorPlayer) or pPlayer:IsAllies(eMajorPlayer) then
							pMajorPlayer:AddFreeUnit(tUnitsCivilians[3], UNITAI_DEFENSE)
								UnitNotificationLoad(pPlayer, pMajorPlayer, 'Missionary', tUnitsCivilians[3])
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(FreeMissionariesFromCityState)


-- MILITARISTIC
function MilitaristicCityStatesBonuses(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Militaristic
	-- Fort
	if eMinorTrait ~= tMinorTraits[5] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()

	for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
		local pPlot = pMinorCapital:GetCityIndexPlot(i)
		
		if pPlot then
			local bIsCity = pPlot:IsCity()
			local ePlot = pPlot:GetPlotType()
			local eResource = pPlot:GetResourceType()
			local eImprovement = pPlot:GetImprovementType()
			local eFeature = pPlot:GetFeatureType()
			
			if not bIsCity and eImprovement == -1 and eFeature == -1 and (ePlot == tPlotTypes[1] or ePlot == tPlotTypes[2]) then
				pPlot:SetImprovementType(tImprovementsGreatPeople[3])
				break
			end
		end
		
		if i >= 18 then
			break
		end
	end
	
	-- Strategic Resource
	local tStrategicResourcesIDs = {}
	local tStrategicResourcesTypes = {}
	local bStrategicPlaced = false
	
	for resource in GameInfo.Resources{ResourceUsage=1} do
		if resource.ID ~= GameInfoTypes.RESOURCE_PAPER then
			table.insert(tStrategicResourcesIDs, resource.ID)
			table.insert(tStrategicResourcesTypes, resource.Type)
		end
	end
	
	repeat
		local iRandomResource = RandomNumberBetween(1, #tStrategicResourcesIDs)
		local eChosenResource = tStrategicResourcesIDs[iRandomResource]
		local tStrategicResourceFeatures = {}
		local tStrategicResourceTerrains = {}
			
		for row in GameInfo.Resource_FeatureBooleans{ResourceType=tStrategicResourcesTypes[iRandomResource]} do
			table.insert(tStrategicResourceFeatures, row.FeatureType)
		end
		for row in GameInfo.Resource_TerrainBooleans{ResourceType=tStrategicResourcesTypes[iRandomResource]} do
			table.insert(tStrategicResourceTerrains, row.TerrainType)
		end	
		
		for i = 1, pMinorCapital:GetNumCityPlots() - 1, 1 do
			local pPlot = pMinorCapital:GetCityIndexPlot(i)
			
			if pPlot then
				local bIsCity = pPlot:IsCity()
				local eImprovement = pPlot:GetImprovementType()
				local eResource = pPlot:GetResourceType()
				local ePlot = pPlot:GetPlotType()
				local eFeature = pPlot:GetFeatureType()
				local eTerrain = pPlot:GetTerrainType()
				local bFeaturePass = false
				local bTerrainPass = false
				
				if not bIsCity and eResource == -1 and eImprovement == -1 then
					if #tStrategicResourceFeatures == 0 and eFeature == -1 then
						bFeaturePass = true
					elseif eFeature == -1  and ePlot == tPlotTypes[4] then
						bFeaturePass = true
					else
						for i, value in ipairs(tStrategicResourceFeatures) do
							if eFeature == FeatureTypes[value] then
								bFeaturePass = true
								break
							end
						end
					end
					
					if #tStrategicResourceTerrains == 0 then
						bFeaturePass = true
					else
						for i, value in ipairs(tStrategicResourceTerrains) do
							if eTerrain == TerrainTypes[value] then
								bTerrainPass = true
								break
							end
						end
					end
					
					if bFeaturePass and bTerrainPass then
						pPlot:SetResourceType(eChosenResource, 1)
						bStrategicPlaced = true
						break
					end
				end
			end
			
			if i >= 36 then
				table.remove(tStrategicResourcesIDs, iRandomResource)
				table.remove(tStrategicResourcesTypes, iRandomResource)
				break
			end
		end
	until (bStrategicPlaced or #tStrategicResourcesIDs == 0)
	
	-- rest
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[17], 1)
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[17], true)
	
	-- Militaristic - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[18], 1)
		pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[18], true)
	end
	
	-- Militaristic - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[19], 1)
	end
	
	-- Militaristic - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[20], 1)
	end
end
GameEvents.PlayerCityFounded.Add(MilitaristicCityStatesBonuses)

function MilitaristicCityStatesBonusesLiberated(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if not pPlayer:IsMinorCiv() then return end
	
	local eMinorType = pPlayer:GetMinorCivType()
	local eMinorTrait = pPlayer:GetMinorCivTrait()
	local eMinorPersonality = pPlayer:GetPersonality()
	
	-- Maritime
	if eMinorTrait ~= tMinorTraits[5] then return end
	
	local pMinorCapital = pPlayer:GetCapitalCity()
	
	pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[17], 1)
	pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[17], true)
	
	-- Militaristic - Friendly
	if eMinorPersonality == tMinorPersonalities[1] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[18], 1)
		pPlayer:SetHasPolicy(tPoliciesPassiveAbilities[18], true)
	end
	
	-- Militaristic - Neutral
	if eMinorPersonality == tMinorPersonalities[2] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[19], 1)
	end
	
	-- Militaristic - Hostile
	if eMinorPersonality == tMinorPersonalities[3] then
		pMinorCapital:SetNumRealBuilding(tBuildingsPassiveAbilities[20], 1)
	end
end
GameEvents.PlayerLiberated.Add(MilitaristicCityStatesBonusesLiberated)

function CityStateTrainedUU(ePlayer, eCity, eUnit, bGold, bFaith)
	local pPlayer = Players[ePlayer]

	if not pPlayer:IsMinorCiv() then return end

	if pPlayer:IsMinorCivHasUniqueUnit() then
		local ePrereqTech
		
		local eUniqueUnit = pPlayer:GetMinorCivUniqueUnit()
		local sUniqueUnit = GameInfo.Units{ID=eUniqueUnit}().Type
		
		local pUnit = pPlayer:GetUnitByID(eUnit)
		local eUnitType = pUnit:GetUnitType()
		local eUnitClass = pUnit:GetUnitClassType()
		local sUnitClass = GameInfo.Units{ID=eUnitType}().Class
		
		local bUnitMatched = false

		for civclassoverrides in GameInfo.Civilization_UnitClassOverrides{UnitClassType=sUnitClass} do
			if civclassoverrides.UnitType == sUniqueUnit then
				ePrereqTech = GameInfoTypes[GameInfo.Units{Type=sUniqueUnit}().PrereqTech]				
				bUnitMatched = true
				break
			end
		end
		
		if not bUnitMatched and tUniqueUnitsFromMinors[sUniqueUnit] then
			if tUniqueUnitsFromMinors[sUniqueUnit].eUnit == eUnitType then
				ePrereqTech = GameInfoTypes[GameInfo.Units{Type=sUniqueUnit}().PrereqTech]
				bUnitMatched = true
			end
		end

		if bUnitMatched then
			local pTeam = Teams[pPlayer:GetTeam()]
			
			if pTeam:IsHasTech(ePrereqTech) then
				pUnit:Kill()
				pPlayer:AddFreeUnit(eUniqueUnit, UNITAI_DEFENSE)
			end
		end
	end
end
GameEvents.CityTrained.Add(CityStateTrainedUU)
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- BOGOTA (CULTURE FROM LIBERATION)
function LiberatedForBogota(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[1]) ~= 0 then
		local iCities = pPlayer:GetNumCities()
		local pCapital = pPlayer:GetCapitalCity()	
		local pLiberatedCity = nil
		local pMinorPlayer = Players[tLostCities["eLostBogota"]]
		
		if iCities > 6 then iCities = 6 end

		local iBaseYield = RandomNumberBetween(20, 30)
		local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
		local iCultureLiberated = iBaseYield * iEraModifier * iCities
	
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iCultureLiberated, true, pCapital:GetID())
		
		for eplayer = 0, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
			local pPlayer = Players[eplayer]

			if pPlayer:IsAlive() then
				pLiberatedCity = pPlayer:GetCityByID(eCity)	
				
				if pLiberatedCity ~= nil then
					break
				end
			end
		end

		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_BOGOTA_LIBERATION", pMinorPlayer:GetName(), iCultureLiberated), L("TXT_KEY_UCS_BONUS_BOGOTA_LIBERATION_TITLE"), pLiberatedCity:GetX(), pLiberatedCity:GetY())
		end
	end
end

function CapturedForBogota(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pPlayer = Players[eNewOwner]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[1]) ~= 0 then
		local pCapital = pPlayer:GetCapitalCity()	
		local pMinorPlayer = Players[tLostCities["eLostBogota"]]
		
		local iBaseYield = 30
		local iCurrentEraModifier = pPlayer:GetCurrentEra() + 1
		local iCultureCaptured = iBaseYield * iCurrentEraModifier
		
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iCultureCaptured, true, pCapital:GetID())
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_BOGOTA_CAPTURE", pMinorPlayer:GetName(), iCultureCaptured), L("TXT_KEY_UCS_BONUS_BOGOTA_CAPTURE_TITLE", pMinorPlayer:GetName()), iX, iY)
		end
	end
end



-- LEVUKA (GROWTH FROM KILLING AND CONQUER)
function CaptureCityForLevuka(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pPlayer = Players[eNewOwner]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[13]) ~= 0 then
		local pMinorPlayer = Players[tLostCities["eLostLevuka"]]
		
		local iBaseYield = RandomNumberBetween(100, 200)
		local iCurrentEraModifier = pPlayer:GetCurrentEra() + 1
		local iOwnedCities = pPlayer:GetNumCities()
		local iFoodBonus = (iBaseYield * iCurrentEraModifier) / iOwnedCities
		
		for city in pPlayer:Cities() do
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FOOD, iFoodBonus, true, city:GetID())
		end
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_LEVUKA_CONQUEST", pMinorPlayer:GetName(), iFoodBonus), L("TXT_KEY_UCS_BONUS_LEVUKA_CONQUEST_TITLE"), iX, iY)
		end
		
		ConquestsForLevuka(eNewOwner)
	end
end

function ConquestsForLevuka(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[13]) ~= 0 then
		local iConqueredCities = 0
		
		for city in pPlayer:Cities() do
			if city:GetOwner() ~= city:GetOriginalOwner() then
				iConqueredCities = iConqueredCities + 1
			end
		end
		
		pPlayer:GetCapitalCity():SetNumRealBuilding(tBuildingsActiveAbilities[9], iConqueredCities)
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[9]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[13]) then
				pPlayer:GetCapitalCity():SetNumRealBuilding(tBuildingsActiveAbilities[9], 0)
			end
		end
	end
end

function BarbCampForLevuka(iX, iY, ePlayer)
    local pPlayer = Players[ePlayer]
    local pTeam = Teams[pPlayer:GetTeam()]
   
	if not pPlayer:IsAlive() then return end
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[13]) ~= 0 then
		local pMinorPlayer = Players[tLostCities["eLostLevuka"]]
		
		local iBaseYield = RandomNumberBetween(30, 75)
		local iCurrentEraModifier = pPlayer:GetCurrentEra() + 1
		local iOwnedCities = pPlayer:GetNumCities()
		local iFoodBonus = (iBaseYield * iCurrentEraModifier) / iOwnedCities
		
		for city in pPlayer:Cities() do
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FOOD, iFoodBonus, true, city:GetID())
		end
			
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_LEVUKA_BARBARIANS", pMinorPlayer:GetName(), iFoodBonus), L("TXT_KEY_UCS_BONUS_LEVUKA_BARBARIANS_TITLE"), iX, iY)
		end
	end
end



-- BRUSSELS (FEATURE MARSH)
function CanWeBuildMarsh(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_MARSH then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[2]) > 0) then return false end
	
	local pPlot = Map.GetPlot(iX, iY)
	
	if pPlot and not pPlot:IsCoastalLand() then return false end
	
	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildMarsh)

function BuiltMarsh(ePlayer, iX, iY, eImprovement)
	if eImprovement == tImprovementsRegular[1] then
		local pPlot = Map.GetPlot(iX, iY)
		
		pPlot:SetImprovementType(-1)
		pPlot:SetFeatureType(tFeatureTypes[3], -1)
	end
end	



-- CAHOKIA (IMPROVEMENT MOUND)
function CanWeBuildMound(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_MOUND then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[3]) > 0) then return false end
	
	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildMound)



-- TIWANAKU (IMPROVEMENT SUNKEN COURTYARD)
function CanWeBuildSunkenCourtyard(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_SUNK_COURT then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[17]) > 0) then return false end
	
	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildSunkenCourtyard)



-- LA VENTA (IMPROVEMENT COLOSSAL HEAD)
function CanWeBuildColossalHead(ePlayer, eUnit, iX, iY, eBuild)
	if eBuild ~= GameInfoTypes.BUILD_BIG_HEAD then return true end
	
	local pPlayer = Players[ePlayer]
	
	if not (pPlayer:GetEventChoiceCooldown(tEventChoice[23]) > 0) then return false end
	
	return true
end
GameEvents.PlayerCanBuild.Add(CanWeBuildColossalHead)



-- CAPE TOWN (BENEFITS FROM TRADE ROUTES)
function TradeInCapeTown(eFromPlayer, eFromCity, eToPlayer, eToCity, eDomain, eConnectionType)
	local pPlayer = Players[eFromPlayer]
		
	if pPlayer:GetEventChoiceCooldown(tEventChoice[4]) ~= 0 then
		local pToPlayer = Players[eToPlayer]
		local iBaseYield = RandomNumberBetween(20, 40)
		local iPopulationModifier = pToPlayer:GetCityByID(eToCity):GetPopulation()
		local iActualTRNumberModifier = pPlayer:GetNumInternationalTradeRoutesUsed() * 0.6
		local iCahChing = math.ceil((iBaseYield * iPopulationModifier) / iActualTRNumberModifier)
		local pPlayerCity = pPlayer:GetCityByID(eFromCity)
		local pMinorPlayer = Players[tLostCities["eLostCapeTown"]]
		
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iCahChing, true, eFromCity)

		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_CAPE_TOWN", pMinorPlayer:GetName(), iCahChing), L("TXT_KEY_UCS_BONUS_CAPE_TOWN_TITLE"), pPlayerCity:GetX(), pPlayerCity:GetY())
		end
	end
end


-- MANILA (YIELDS AT THE END FOR TRADE)
function TradeInManila(eFromPlayer, eFromCity, eToPlayer, eToCity, eDomain, eConnectionType)
	local pPlayer = Players[eFromPlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[5]) ~= 0 then
		local pToPlayer = Players[eToPlayer]
		local iBaseYield = RandomNumberBetween(25, 50)
		local iPopulationModifier = pToPlayer:GetCityByID(eToCity):GetPopulation()
		local iActualTRNumberModifier = pPlayer:GetNumInternationalTradeRoutesUsed() * 0.6
		local iYumYum = math.ceil((iBaseYield * iPopulationModifier) / iActualTRNumberModifier)
		local pPlayerCity = pPlayer:GetCityByID(eFromCity)
		local pMinorPlayer = Players[tLostCities["eLostManila"]]

		pPlayer:DoInstantYield(GameInfoTypes.YIELD_FOOD, iYumYum, true, eFromCity)
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_PRODUCTION, iYumYum, true, eFromCity)
		
		if pPlayer:IsHuman() then 
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_MANILA", pMinorPlayer:GetName(), iYumYum), L("TXT_KEY_UCS_BONUS_MANILA_TITLE"), pPlayerCity:GetX(), pPlayerCity:GetY())
		end
	end
end


-- COLOMBO (HEAL UNITS AT THE END FOR TRADE)
function TradeInColombo(eFromPlayer, eFromCity, eToPlayer, eToCity, eDomain, eConnectionType)
	local pPlayer = Players[eFromPlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[18]) ~= 0 then
		if eFromPlayer ~= eToPlayer then
			local pCity = pPlayer:GetCityByID(eFromCity)
			local pColombo = Players[tLostCities["eLostColombo"]]

			for unit in pPlayer:Units() do
				unit:ChangeDamage(-10)
			end

			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_COLOMBO", pCity:GetName(), pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_COLOMBO_TITLE"), pCity:GetX(), pCity:GetY())
			end
		end
	end		
end



-- KIEV/MILAN/VILNIUS/VALETTA (STARTING BUILDINGS FOR CERTAIN CITY-STATES)
function SettledCityStateWithBuilding(ePlayer, eUnit, eUnitType, iPlotX, iPlotY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then
		local pSettledCity = Map.GetPlot(iPlotX, iPlotY):GetPlotCity()
		
		if GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_KIEV" then
			pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_KIEV, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_MILAN" then
			pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_MILAN, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_VALLETTA" then
			pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_VALLETTA, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_VILNIUS" then
			pSettledCity:SetNumRealBuilding(GameInfoTypes.BUILDING_VILNIUS, 1)
		end
	end
end

function LiberatedCityStateWithBuilding(ePlayer, eOtherPlayer, eCity)
	local pPlayer = Players[eOtherPlayer]
	
	if pPlayer:IsMinorCiv() then
		local pLiberatedCity = pPlayer:GetCapitalCity()
		
		if GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_KIEV" then
			pLiberatedCity:SetNumRealBuilding(GameInfoTypes.BUILDING_KIEV, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_MILAN" then
			pLiberatedCity:SetNumRealBuilding(GameInfoTypes.BUILDING_MILAN, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_VALLETTA" then
			pLiberatedCity:SetNumRealBuilding(GameInfoTypes.BUILDING_VALLETTA, 1)
		elseif GameInfo.MinorCivilizations[pPlayer:GetMinorCivType()].Type == "MINOR_CIV_VILNIUS" then
			pLiberatedCity:SetNumRealBuilding(GameInfoTypes.BUILDING_VILNIUS, 1)
		end
	end
end



-- ZURICH (GOLD INTERESTS)
function ZurichMerchants(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[6]) ~= 0 then
		local iInterest = pPlayer:GetGold() * 0.02
		local iInterestCap = 20 * (pPlayer:GetCurrentEra() + 1)
		local pCapital = pPlayer:GetCapitalCity()
		local pMinorPlayer = Players[tLostCities["eLostZurich"]]
		local iCounterThreshold = 5
		
		if iInterest > iInterestCap then iInterest = iInterestCap end
		
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iInterest, true, pCapital:GetID())
		
		if tZurichCounter[ePlayer] == nil then
			tZurichCounter[ePlayer] = 1
			tZurichLastInterests[ePlayer] = iInterest
		else
			tZurichCounter[ePlayer] = tZurichCounter[ePlayer] + 1
			tZurichLastInterests[ePlayer] = tZurichLastInterests[ePlayer] + iInterest
		end
		
		if tZurichCounter[ePlayer] >= iCounterThreshold then
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_ZURICH", pMinorPlayer:GetName(), tZurichLastInterests[ePlayer], iCounterThreshold), L("TXT_KEY_UCS_BONUS_ZURICH_TITLE"), pCapital:GetX(), pCapital:GetY())
			end

			tZurichCounter[ePlayer] = 0
			tZurichLastInterests[ePlayer] = 0
		end
	end
end

function ZurichMerchantsNoAlly(eMinor, eMajor, bIsAlly, iOldFriendship, iNewFriendship)
	local pMinorPlayer = Players[eMinor]
	local pMajorPlayer = Players[eMajor]
	
	if GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type == "MINOR_CIV_ZURICH" then
		if not bIsAlly then
			local pCapital = pMajorPlayer:GetCapitalCity()
			
			if tZurichCounter[eMajor] == 0 then
				if pMajorPlayer:IsHuman() then
					pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_ZURICH_STOP_ALLY_ZERO", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_ZURICH_STOP_ALLY_TITLE"), pCapital:GetX(), pCapital:GetY())
				end
			else
				if pMajorPlayer:IsHuman() then
					pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_ZURICH_STOP_ALLY", pMinorPlayer:GetName(), tZurichCounter[eMajor], tZurichLastInterests[eMajor]), L("TXT_KEY_UCS_BONUS_ZURICH_STOP_ALLY_TITLE"), pCapital:GetX(), pCapital:GetY())
				end
			end

			tZurichCounter[eMajor] = 0
			tZurichLastInterests[eMajor] = 0
        end
	end
end



-- JERUSALEM (SPHERE OF INFLUENCE AND RELIGION FOR AN ALLY)
function JerusalemsDevotion(ePlayer)
	for _, pplayer in ipairs(Players) do
		if pplayer and pplayer:IsAlive() and pplayer:IsMinorCiv() then
		    local pMinorPlayer = pplayer
		    
		    if GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type == "MINOR_CIV_JERUSALEM" then
				if pMinorPlayer:IsAllies(ePlayer) then
					local pMajorPlayer = Players[ePlayer]
        	    
            		if pMajorPlayer:GetMajorityReligion() ~= nil and pMajorPlayer:GetMajorityReligion() ~= pMinorPlayer:GetMajorityReligion() then
            			local pJerusalemCity = pMinorPlayer:GetCapitalCity()
				
						pJerusalemCity:AdoptReligionFully(pMajorPlayer:GetMajorityReligion())
						pJerusalemCity:SetNumRealBuilding(tBuildingsActiveAbilities[10], 1)
						
						if pMajorPlayer:IsHuman() then
							pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_JERUSALEM_RELIGION", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_JERUSALEM_RELIGION_TITLE"), pJerusalemCity:GetX(), pJerusalemCity:GetY())
						end
            		end
        		
        		    break
                end
    	    end
    	end
	end
end

function JerusalemsDevotionSphere(eMinor, eMajor, bIsAlly, iOldFriendship, iNewFriendship)
	local pMinorPlayer = Players[eMinor]
	local pMajorPlayer = Players[eMajor]
	
	if GameInfo.MinorCivilizations[pMinorPlayer:GetMinorCivType()].Type == "MINOR_CIV_JERUSALEM" then
		if bIsAlly then
			if Game.GetNumActiveLeagues() ~= 0 and not Game.IsResolutionPassed(eSphere, tLostCities["eLostJerusalem"]) then
            	local pJerusalemCity = pMinorPlayer:GetCapitalCity()
				
				Game.DoEnactResolution(eSphere, tLostCities["eLostJerusalem"], eMajor)
            			
            	if pMajorPlayer:IsHuman() then
            		pMajorPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_JERUSALEM_SPHERE", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_JERUSALEM_SPHERE_TITLE"), pJerusalemCity:GetX(), pJerusalemCity:GetY())
            	end
			end
        end
	end
end



-- SIDON (SPHERE OF INFLUENCE FROM BULLYING)
function DestroyLifeForSidon(ePlayer, eCS, iGold, eUnitType, iPlotX, iPlotY)
	local pPlayer = Players[ePlayer]

	if not Game.IsResolutionPassed(eSphere, tLostCities["eLostSidon"]) and pPlayer:GetEventChoiceCooldown(tEventChoice[7]) ~= 0 and Game.GetNumActiveLeagues() ~= 0 then
		local pSidonCity = pMinorPlayer:GetCapitalCity()
		local pMinorPlayer = Players[tLostCities["eLostSidon"]]
		
		Game.DoEnactResolution(eSphere, tLostCities["eLostSidon"], ePlayer)
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_SIDON", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_SIDON_TITLE"), pSidonCity:GetX(), pSidonCity:GetY())
		end
	end
end



-- LHASA (SPHERE OF INFLUENCE FROM WW)
function CanWeBuildPotalaPalace(ePlayer, eBuilding)
	if eBuilding ~= tBuildingsActiveAbilities[1] then return true end
	if Game.GetNumActiveLeagues() == 0 then return false end
	if Players[ePlayer]:GetEventChoiceCooldown(tEventChoice[8]) ~= 0 then return true	end
	
	return false
end

function BuiltWonderForLhasa(ePlayer, eCity, eBuilding, bGold, bFaith)
	if eBuilding == tBuildingsActiveAbilities[1] then
		local pPlayer = Players[ePlayer]
		local pCity = pPlayer:GetCityByID(eCity)
		local pMinorPlayer = Players[tLostCities["eLostLhasa"]]
		
		Game.DoEnactResolution(eSphere, tLostCities["eLostLhasa"], ePlayer)
		GameEvents.CityConstructed.Remove(BuiltWonderForLhasa)
		
		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_LHASA", pMinorPlayer:GetName()), L("TXT_KEY_UCS_BONUS_LHASA_TITLE"), pCity:GetX(), pCity:GetY())
		end
	end
end



-- ÓC EO (TRADE ROUTES INTO GROWTH)
function LordsOfTheGreatGlassRiver(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[9]) ~= 0 then
		local iInternationalSeaTradeRoutes = InternationalSeaTradeRoutes(ePlayer, pPlayer)
		local pCapitalCity = pPlayer:GetCapitalCity()
		
		for city in pPlayer:Cities() do
			if city:IsCoastal(10) then
				city:SetNumRealBuilding(tBuildingsActiveAbilities[2], iInternationalSeaTradeRoutes)
			end
		end
		
		pCapitalCity:SetNumRealBuilding(tBuildingsActiveAbilities[3], iInternationalSeaTradeRoutes)
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[2]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[3]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[9]) then
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[2], 0)
					city:SetNumRealBuilding(tBuildingsActiveAbilities[3], 0)
				end
			end
		end
	end
	
	--[[		
	Domain - DomainTypes.DOMAIN_LAND or DomainTypes.DOMAIN_SEA (int)
	TurnsLeft - turns left before the trade route can be reassigned (int)
	FromCivilizationType - eg GameInfoTypes.CIVILIZATION_ENGLAND (int)
	FromID - from player ID (int)
	FromCityName - from city name (string)
	FromCity - from city (Lua pCity object)
	ToCivilizationType - to player civ type (int)
	ToID - to player ID (int)
	ToCityName - to city name (string)
	ToCity - to city (Lua pCity object)
	FromGPT - route yield (int)
	ToGPT - route yield (int)
	ToFood - route yield (int)
	ToProduction - route yield (int)
	FromScience - route yield (int)
	ToScience - route yield (int)
	ToReligion - to religion type (or -1) (int)
	ToPressure - to pressure (int)
	FromReligion - from religion type (or -1) (int)
	FromPressure - from pressure (int)
	FromTourism - from tourism (int)
	ToTourism - to tourism (int)
	--]]
end

function LordsOfTheGreatGlassRiverCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[9]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		local pConqCity = pPlot:GetWorkingCity()
		
		if pConqCity:IsCoastal(10) then
			local iInternationalSeaTradeRoutes = InternationalSeaTradeRoutes(eNewOwner, pNewOwner)
			
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[2], iInternationalSeaTradeRoutes)
		end
	else	
		if not pNewOwner:IsEventChoiceActive(tEventChoice[9]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[2], 0)
			end
		end
	end
end

function LordsOfTheGreatGlassRiverNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[9]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
			
		if pPlot then
			local pCity = pPlot:GetWorkingCity()
			
			if pCity:IsCoastal(10) then
				local iInternationalSeaTradeRoutes = InternationalSeaTradeRoutes(ePlayer, pPlayer)
				
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[2], iInternationalSeaTradeRoutes)
			end
		end
	end
end

function InternationalSeaTradeRoutes(ePlayer, pPlayer)
	local iInternationalSeaTradeRoutes = 0
	
	for _, tradeRoute in ipairs(pPlayer:GetTradeRoutes()) do
		if tradeRoute.FromID == ePlayer and tradeRoute.ToID ~= ePlayer and tradeRoute.Domain == GameInfoTypes.DOMAIN_SEA then
			iInternationalSeaTradeRoutes = iInternationalSeaTradeRoutes + 1
		end
	end
	
	return iInternationalSeaTradeRoutes
end



-- THIMPHU (CITY ON HILL?)
function DrukTsendhen(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[10]) ~= 0 then
		for city in pPlayer:Cities() do
			-- culture on hill
			local pPlot = city:Plot()
			
			if pPlot then
				local ePlot = pPlot:GetPlotType()
			
				if ePlot == tPlotTypes[2] then
					city:SetNumRealBuilding(tBuildingsActiveAbilities[4], 1)
				end
			end
			
			-- culture to defense conversion
			local iDefenseToAdd = city:GetJONSCulturePerTurn()
			
			city:SetNumRealBuilding(tBuildingsActiveAbilities[5], iDefenseToAdd)
		end
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[4]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[5]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[10]) then
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[4], 0)
					city:SetNumRealBuilding(tBuildingsActiveAbilities[5], 0)
				end
			end
		end
	end
end

function DrukTsendhenCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[10]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
			
		if pPlot then
			local ePlot = pPlot:GetPlotType()
			local pConqCity = pPlot:GetWorkingCity()
			
			if ePlot == tPlotTypes[2] then
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[4], 1)
			end
			
			-- culture to defense conversion
			local iDefenseToAdd = pConqCity:GetJONSCulturePerTurn()
			
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[5], iDefenseToAdd)
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[10]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[4], 0)
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[5], 0)
			end
		end
	end
end

function DrukTsendhenNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[10]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
				
		if pPlot then
			-- culture on hill
			local ePlot = pPlot:GetPlotType()
			local pCity = pPlot:GetWorkingCity()
			
			if ePlot == tPlotTypes[2] then		
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[4], 1)
			end
			
			-- culture to defense conversion
			local iDefenseToAdd = city:GetJONSCulturePerTurn()
			
			pCity:SetNumRealBuilding(tBuildingsActiveAbilities[5], iDefenseToAdd)
		end
	end
end



-- RAGUSA (CITY ON COAST?)
function MaritimeSuzerainty(ePlayer)
	local pPlayer = Players[ePlayer]
			
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[31]) ~= 0 then
		for city in pPlayer:Cities() do
			if city:IsCoastal(10) then
				city:SetNumRealBuilding(tBuildingsActiveAbilities[19], 1)
			end
		end
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[19]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[31]) then
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[19], 0)
				end
			end
		end
	end
end

function MaritimeSuzeraintyCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[31]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
			
		if pPlot then
			local pConqCity = pPlot:GetWorkingCity()
			
			if pConqCity:IsCoastal(10) then
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[19], 1)
			end
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[31]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[19], 0)
			end
		end
	end
end

function MaritimeSuzeraintyNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[31]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
				
		if pPlot then
			local pCity = pPlot:GetWorkingCity()
			
			if pCity:IsCoastal(10) then		
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[19], 1)
			end
		end
	end
end



-- RISHIKESH (CITY ON RIVER?)
function HimalayanYogi(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[15]) ~= 0 then
		for city in pPlayer:Cities() do
			local pPlot = city:Plot()
			
			if pPlot then
				if pPlot:IsRiver() then
					city:SetNumRealBuilding(tBuildingsActiveAbilities[11], 1)
				end
			end
		end
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[11]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[15]) then
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[11], 0)
				end
			end
		end
	end
end

function HimalayanYogiCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[15]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		
		if pPlot then
			if pPlot:IsRiver() then
				local pCity = pPlot:GetWorkingCity()
				
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[11], 1)
			end
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[15]) then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pConqCity = pPlot:GetWorkingCity()
			
				pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[11], 0)
			end
		end
	end
end

function HimalayanYogiNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[15]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
				
		if pPlot then
			if pPlot:IsRiver() then
				local pCity = pPlot:GetWorkingCity()
			
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[11], 1)
			end
		end
	end
end



-- ANDORRA (MOUNTAIN NEARBY?)
function PyreneanPareage(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[11]) ~= 0 then
		for city in pPlayer:Cities() do
			if not city:IsHasBuilding(tBuildingsActiveAbilities[6]) then
				for i = 1, city:GetNumCityPlots() - 1, 1 do
					local pPlot = city:GetCityIndexPlot(i)
					
					if pPlot then
						local ePlot = pPlot:GetPlotType()
						
						if ePlot == tPlotTypes[3] then
							city:SetNumRealBuilding(tBuildingsActiveAbilities[6], 1)
							break
						end
					end
					
					if i >= 6 then
						break
					end
				end
			end
		end
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[6]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[11]) then
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[6], 0)
				end
			end
		end
	end
end

function PyreneanPareageCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	local pPlot = Map.GetPlot(iX, iY)
	local pConqCity = pPlot:GetWorkingCity()
			
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[11]) ~= 0 then
		for i = 1, pConqCity:GetNumCityPlots() - 1, 1 do
			local pPlot = pConqCity:GetCityIndexPlot(i)
			
			if pPlot then
				local ePlot = pPlot:GetPlotType()
				
				if ePlot == tPlotTypes[3] then
					pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[6], 1)
					break
				end
			end
			
			if i >= 6 then
				break
			end
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[11]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[6], 0)
		end
	end
end

function PyreneanPareageNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[11]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		
		if pPlot then
			local pCity = pPlot:GetWorkingCity()	
			
			for i = 1, pCity:GetNumCityPlots() - 1, 1 do
				local pPlotAround = pCity:GetCityIndexPlot(i)
				
				if pPlotAround then
					local ePlot = pPlotAround:GetPlotType()
					
					if ePlot == tPlotTypes[3] then
						pCity:SetNumRealBuilding(tBuildingsActiveAbilities[6], 1)
						break
					end
				end
				
				if i >= 6 then
					break
				end
			end
		end
	end
end



-- CANOSSA (TEMPLE BUILT?)
function ArdentFlameInPiousHeart(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[12]) ~= 0 then
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(tBuildingsActiveAbilities[8]) then
				city:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
			else
				city:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
			end
		end
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[7]) > 0 then
			if not pPlayer:IsEventChoiceActive(tEventChoice[12]) then
				for city in pPlayer:Cities() do
					city:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
				end
			end
		end
	end
end

function ArdentFlameInPiousHeartCapture(eOldOwner, bIsCapital, iX, iY, eNewOwner, iPop, bConquest)
	local pNewOwner = Players[eNewOwner]
	local pPlot = Map.GetPlot(iX, iY)
	local pConqCity = pPlot:GetWorkingCity()
			
	if pNewOwner:GetEventChoiceCooldown(tEventChoice[12]) ~= 0 then
		if pConqCity:IsHasBuilding(tBuildingsActiveAbilities[8]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
		else
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
		end
	else
		if not pNewOwner:IsEventChoiceActive(tEventChoice[12]) then
			pConqCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
		end
	end
end

function ArdentFlameInPiousHeartNewCity(ePlayer, iX, iY)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[12]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		
		if pPlot then
			local pCity = pPlot:GetWorkingCity()	

			if pCity:IsHasBuilding(tBuildingsActiveAbilities[8]) then
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
			else
				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 0)
			end
		end
	end
end

function ArdentFlameInPiousHeartBuildingConstruction(ePlayer, eCity, eBuilding, bGold, bFaith) 
	if eBuilding == tBuildingsActiveAbilities[8] then
		local pPlayer = Players[ePlayer]
	
		if pPlayer:GetEventChoiceCooldown(tEventChoice[12]) ~= 0 then
			local pPlot = Map.GetPlot(iX, iY)
			
			if pPlot then
				local pCity = pPlot:GetWorkingCity()	

				pCity:SetNumRealBuilding(tBuildingsActiveAbilities[7], 1)
			end
		end
	end
end



-- DALI (BUYING TRADE UNITS WITH FAITH)
function TradeWithFaith(ePlayer, eCity, eUnit)
	if eUnit ~= tUnitsTrade[3] --[[and eUnit ~= tUnitsTrade[4]--]] then return true end
	
	local pPlayer = Players[ePlayer]

	if pPlayer:IsMinorCiv() then return true end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[14]) ~= 0 then
		return true
	else
		return false
	end
end
GameEvents.CityCanTrain.Add(TradeWithFaith)



-- VATICAN CITY (SWISS GUARD FUNCTIONS)
function CanBuySwissGuard(ePlayer, eCity, eUnit)
	if eUnit ~= tUnitsMilitary[1] then return true end
	
	local pPlayer = Players[ePlayer]

	if pPlayer:IsMinorCiv() then return true end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[32]) ~= 0 then
		return true
	else
		return false
	end
end
GameEvents.CityCanTrain.Add(CanBuySwissGuard)

function SwissGuardHealingAttack(eAttackingPlayer, eAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, eDefendingPlayer, eDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, eInterceptingPlayer, eInterceptingUnit, iInterceptorDamage, iX, iY)
	local pAttackingPlayer = Players[eAttackingPlayer]
	
	if not (pAttackingPlayer and (iDefenderFinalDamage >= iDefenderMaxHP)) then return end
	
	local pAttackingUnit = pAttackingPlayer:GetUnitByID(eAttackingUnit)
		
	if pAttackingUnit:IsHasPromotion(tPromotionsActiveAbilities[3]) then
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetWorkingCity()
		local bInRangeOfCapital, bInRangeOfHolyCity = false, false

		if pCity == nil then return end

		bInRangeOfCapital = pCity:IsCapital() and pCity:GetOwner() == eAttackingPlayer
		bInRangeOfHolyCity = pCity:IsHolyCityAnyReligion() and pCity:GetOwner() == eAttackingPlayer

		if bInRangeOfHolyCity then
			pAttackingUnit:ChangeDamage(-40)
		elseif bInRangeOfCapital then
			pAttackingUnit:ChangeDamage(-30)
		else
			pAttackingUnit:ChangeDamage(-10)
		end
	end
end

function SwissGuardHealingDefend(eAttackingPlayer, eAttackingUnit, iAttackerDamage, iAttackerFinalDamage, iAttackerMaxHP, eDefendingPlayer, eDefendingUnit, iDefenderDamage, iDefenderFinalDamage, iDefenderMaxHP, eInterceptingPlayer, eInterceptingUnit, iInterceptorDamage, iX, iY)
	local pDefendingPlayer = Players[eDefendingPlayer]
	
	if not (pDefendingPlayer and (iAttackerFinalDamage >= iAttackerMaxHP)) then return end
	
	local pDefendingUnit = pDefendingPlayer:GetUnitByID(eDefendingUnit)
		
	if pDefendingUnit:IsHasPromotion(tPromotionsActiveAbilities[3]) then
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetWorkingCity()
		local bInRangeOfCapital, bInRangeOfHolyCity = false, false

		if pCity == nil then return end

		bInRangeOfCapital = pCity:IsCapital() and pCity:GetOwner() == eDefendingPlayer
		bInRangeOfHolyCity = pCity:IsHolyCityAnyReligion() and pCity:GetOwner() == eDefendingPlayer

		if bInRangeOfHolyCity then
			pDefendingUnit:ChangeDamage(-40)
		elseif bInRangeOfCapital then
			pDefendingUnit:ChangeDamage(-30)
		else
			pDefendingUnit:ChangeDamage(-10)
		end
	end
end

function SwissGuardYields(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if not pPlayer:IsAlive() then return end

	local iSwissGuards = pPlayer:GetUnitClassCount(GameInfoTypes.UNITCLASS_SWISS_GUARD)
	
	if iSwissGuards == 0 then return end

	local pTeam = Teams[pPlayer:GetTeam()]
	local bRadio = pTeam:IsHasTech(tTechnologyTypes[2])
	local bTelecom = pTeam:IsHasTech(tTechnologyTypes[3])
	local pCapital = pPlayer:GetCapitalCity()
	local iBaseYield = 2 * iSwissGuards
	
	pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iBaseYield, true, pCapital:GetID())

	if bRadio then
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iBaseYield, true, pCapital:GetID())
	end

	if bTelecom then
		pPlayer:DoInstantYield(GameInfoTypes.YIELD_TOURISM, iBaseYield, true, pCapital:GetID())
	end
end

function SwissGuardYieldsNotification(ePlayer, eCity, eUnit, bGold, bFaith)	
	local pPlayer = Players[ePlayer]
	local pUnit = pPlayer:GetUnitByID(eUnit)

	if pUnit:GetUnitType() == tUnitsMilitary[1] then
		local pTeam = Teams[pPlayer:GetTeam()]
		local bRadio = pTeam:IsHasTech(tTechnologyTypes[2])
		local bTelecom = pTeam:IsHasTech(tTechnologyTypes[3])
		local pCity = pPlayer:GetCityByID(eCity)
		local pVaticanCity = Players[tLostCities["eLostVaticanCity"]]
		
		if pPlayer:IsHuman() then
			if bTelecom then		
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_C", pUnit:GetName(), pVaticanCity:GetName()), L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_TITLE"), pCity:GetX(), pCity:GetY())
			elseif bRadio then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_B", pUnit:GetName(), pVaticanCity:GetName()), L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_TITLE"), pCity:GetX(), pCity:GetY())
			else
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_A", pUnit:GetName(), pVaticanCity:GetName()), L("TXT_KEY_UCS_BONUS_VATICAN_KATZBALGER_TITLE"), pCity:GetX(), pCity:GetY())
			end		
		end
	end
end



-- KATHMANDU (GURKHA FUNCTIONS)
function CanBuyGurkha(ePlayer, eCity, eUnit)
	if eUnit ~= tUnitsMilitary[2] then return true end
	
	local pPlayer = Players[ePlayer]

	if pPlayer:IsMinorCiv() then return true end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[33]) ~= 0 then
		return true
	else
		return false
	end
end
GameEvents.CityCanTrain.Add(CanBuyGurkha)



-- ISKANWAYA (PROMOTION HEALING EACH TURN)
function HealersFromIskanwaya(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[16]) ~= 0 then
		for unit in pPlayer:Units() do
			if unit then
				if unit:GetDamage() > 0 and unit:IsHasPromotion(tPromotionsActiveAbilities[1]) then
					local pPlot = unit:GetPlot()
					local iX = pPlot:GetX()
					local iY = pPlot:GetY()
					local bPlotMissionary, bPlotHolySite, bPlotMountain = false, false, false
					local bAdjacentMissionary, bAdjacentHolySite, bAdjacentMountain = false, false, false

					bPlotMissionary = pPlot:GetUnit() and pPlot:GetUnit():GetUnitType() == tUnitsCivilians[3]
					bPlotHolySite = pPlot:GetImprovementType() == tImprovementsGreatPeople[2]
					bPlotMountain = pPlot:GetPlotType() == tPlotTypes[3]

					if bPlotMissionary or bPlotHolySite or bPlotMountain then
						unit:ChangeDamage(-10)
					else
						for i, direction in ipairs(tDirectionTypes) do
							local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
						
							if pAdjacentPlot then
								bAdjacentMissionary = pAdjacentPlot:GetUnit() and pAdjacentPlot:GetUnit():GetUnitType() == tUnitsCivilians[3]
								bAdjacentHolySite = pAdjacentPlot:GetImprovementType() == tImprovementsGreatPeople[2]
								bAdjacentMountain = pAdjacentPlot:GetPlotType() == tPlotTypes[3]

								if bAdjacentMissionary or bAdjacentHolySite or bAdjacentMountain then
									break
								end
							end
						end

						if bAdjacentMissionary or bAdjacentHolySite or bAdjacentMountain then
							unit:ChangeDamage(-10)
						end
					end
				end
			end
		end
	end
end



-- KABUL (PROMOTION NEAR MOUNTAIN)
function MujahideensFromKabulOnMove(ePlayer, eUnit, iX, iY) 
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	local pUnit = pPlayer:GetUnitByID(eUnit)
	local bIsMountainAround = false
	
	if pUnit:IsHasPromotion(tPromotionsActiveAbilities[2]) then
		for i, direction in ipairs(tDirectionTypes) do
			local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)

			if pAdjacentPlot then
				if pAdjacentPlot:GetPlotType() == tPlotTypes[3] then
					bIsMountainAround = true
					break
				end
			end
		end
		
		if not bIsMountainAround or pPlayer:GetEventChoiceCooldown(tEventChoice[24]) == 0 then
			pUnit:SetHasPromotion(tPromotionsActiveAbilities[2], false)
		end
	else
		if pPlayer:GetEventChoiceCooldown(tEventChoice[24]) ~= 0 then
			if pUnit:GetDomainType() == tDomainTypes[1] then
				for i, direction in ipairs(tDirectionTypes) do
					local pAdjacentPlot = Map.PlotDirection(iX, iY, direction)
					
					if pAdjacentPlot then
						if pAdjacentPlot:GetPlotType() == tPlotTypes[3] then
							pUnit:SetHasPromotion(tPromotionsActiveAbilities[2], true)
							break
						end
					end
				end
			end
		end
	end
end

function MujahideensFromKabulOnEventOn(ePlayer, eEventChoiceType)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if eEventChoiceType == tEventChoice[24] then
		for unit in pPlayer:Units() do
			if unit:GetDomainType() == tDomainTypes[1] then
				local bIsMountainAround = false
	
				for i, direction in ipairs(tDirectionTypes) do
					local pAdjacentPlot = Map.PlotDirection(unit:GetX(), unit:GetY(), direction)
				
					if pAdjacentPlot then
						if pAdjacentPlot:GetPlotType() == tPlotTypes[3] then
							unit:SetHasPromotion(tPromotionsActiveAbilities[2], true)
							break
						end
					end
				end
			end
		end
	end
end

function MujahideensFromKabulOnEventOff(ePlayer, eEventChoiceType)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if eEventChoiceType == tEventChoice[24] then
		for unit in pPlayer:Units() do
			unit:SetHasPromotion(tPromotionsActiveAbilities[2], false)
		end
	end
end



-- HONG KONG (CITIZENS MIGRATING TO CS)
function MigrationToHongKong(ePlayer)
	local pPlayer = Players[ePlayer]

	if pPlayer:IsMinorCiv() then return end
					
	if pPlayer:GetEventChoiceCooldown(tEventChoice[19]) ~= 0 then
		local pHongKong = Players[tLostCities["eLostHongKong"]]
		local pHongKongCity = pHongKong:GetCapitalCity()		
		
		for city in pPlayer:Cities() do
			local iMigrationThreshold = (city:GetPopulation() - pHongKongCity:GetPopulation()) * 10
			local iCurrentInfluenceWithHongKong = pHongKong:GetMinorCivFriendshipWithMajor(ePlayer)

			if iMigrationThreshold > 0 and iCurrentInfluenceWithHongKong >= GameDefines.FRIENDSHIP_THRESHOLD_FRIENDS then
				local iRolledMigrationChance = RandomNumberBetween(1, 1000)
				
				if iRolledMigrationChance <= iMigrationThreshold then
					local iInfluence = 30
					local iBaseYield = RandomNumberBetween(100, 150)
					local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
					
					-- setting the peak to last forever
					if iCurrentInfluenceWithHongKong >= 570 then iCurrentInfluenceWithHongKong = 570 end

					local iInfluenceModifier = iCurrentInfluenceWithHongKong / GameDefines.FRIENDSHIP_THRESHOLD_ALLIES
					
					-- setting the somewhat logarithmic curve, because linear was too high
					local iFactor1 = 1.5
					local iFactor2 = 750
					local iInfluenceCapModifier = (iFactor1 - (iCurrentInfluenceWithHongKong - GameDefines.FRIENDSHIP_THRESHOLD_FRIENDS) / iFactor2) / iFactor1 -- for more info look at the excel calculations

					city:ChangePopulation(-1, true)
					pHongKongCity:ChangePopulation(1, true)

					local iGoldReward = math.ceil(iBaseYield * iEraModifier * iInfluenceModifier * iInfluenceCapModifier)

					pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iGoldReward, true, city:GetID())
					pHongKong:ChangeMinorCivFriendshipWithMajor(ePlayer, iInfluence)

					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_HONG_KONG", city:GetName(), pHongKongCity:GetName(), pHongKong:GetName(), iGoldReward, iInfluence), L("TXT_KEY_UCS_BONUS_HONG_KONG_TITLE"), city:GetX(), city:GetY())
					end

					break
				end
			end
		end
	end		
end



-- FLORENCE (SPAWN OF GREAT ENGINEER OR GREAT ARTIST)
function ArtistsInFlorence(ePlayer)
	local pPlayer = Players[ePlayer]

	if pPlayer:IsMinorCiv() then return end
					
	if pPlayer:GetEventChoiceCooldown(tEventChoice[20]) ~= 0 then
		local iArtistThreshold = 10
		local iArtistChance = RandomNumberBetween(1, 1000)
		
		if iArtistChance <= iArtistThreshold then
			local pFlorence = Players[tLostCities["eLostFlorence"]]
			local pCapital = pPlayer:GetCapitalCity()
			local iArtistVsEngineer = RandomNumberBetween(0, 1)		
			local pUnit
				
			if iArtistVsEngineer == 0 then
				pUnit = pPlayer:InitUnit(tUnitsGreatPeople[4], pCapital:GetX(), pCapital:GetY())
			else
				pUnit = pPlayer:InitUnit(tUnitsGreatPeople[2], pCapital:GetX(), pCapital:GetY())
			end
			
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_FLORENCE", pFlorence:GetName(), pUnit:GetName()), L("TXT_KEY_UCS_BONUS_FLORENCE_TITLE", L(GameInfo.Units[pUnit:GetUnitType()].Description)), pCapital:GetX(), pCapital:GetY())
			end
		end
	end	
end



-- KYZYL (YIELDS ON RESEARCH)
function ResearchersFromKyzyl(eTeam, eTech, iChange)
	local pActivePlayer = Players[Game.GetActivePlayer()]
	local eActiveTeam = pActivePlayer:GetTeam()
	
	if pActivePlayer:IsMinorCiv() then return end
	if eTeam ~= eActiveTeam then return end
					
	if pActivePlayer:GetEventChoiceCooldown(tEventChoice[21]) ~= 0 then
		local pCapital = pActivePlayer:GetCapitalCity()
		local pKyzyl = Players[tLostCities["eLostKyzyl"]]
		local sKyzylYields = ""
		
		for city in pActivePlayer:Cities() do
			local iBaseYield = RandomNumberBetween(5, 20)
			local iEraModifier = math.max(1, pActivePlayer:GetCurrentEra())
			local iOwnedCities = pActivePlayer:GetNumCities()

			if iOwnedCities > 8 then iOwnedCities = 8 end

			local iCitiesNumberDismodifier = 1 - ((iOwnedCities - 1) * 0.1)
			local iProductionBoostFromResearch = iBaseYield * iEraModifier * iCitiesNumberDismodifier

			pActivePlayer:DoInstantYield(GameInfoTypes.YIELD_PRODUCTION, iProductionBoostFromResearch, true, city:GetID())

			sKyzylYields = sKyzylYields .. "[NEWLINE][ICON_BULLET] " .. city:GetName() .. ": " .. iProductionBoostFromResearch .. " [ICON_PRODUCTION]"
		end
		
		if pActivePlayer:IsHuman() then
			pActivePlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_KYZYL", pKyzyl:GetName(), sKyzylYields), L("TXT_KEY_UCS_BONUS_KYZYL_TITLE"), pCapital:GetX(), pCapital:GetY())
		end	
	end	
end



-- TYRE (TOURISM FROM WW CONSTRUCTION)
function TourismFromTyre(ePlayer, eCity, eBuilding, bGold, bFaith) 
	local bBuildingSplash = GameInfo.Buildings[eBuilding].WonderSplashImage ~= nil
	local bBuildingCorporation = GameInfo.Buildings[eBuilding].IsCorporation == 1
	
	if bBuildingSplash and not bBuildingCorporation then
		local pPlayer = Players[ePlayer]
	
		if pPlayer:GetEventChoiceCooldown(tEventChoice[22]) ~= 0 then
			local pCity = pPlayer:GetCityByID(eCity)
			local iBaseYield = RandomNumberBetween(20, 40)
			local iWonderModifier = 1 + (pCity:GetNumWorldWonders() * 0.2)
			local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
			local iTourismBoost = iBaseYield * iWonderModifier * iEraModifier
			local pTyre = Players[tLostCities["eLostTyre"]]
	
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_TOURISM, iTourismBoost, true, eCity)

			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_TYRE", L(GameInfo.Buildings[eBuilding].Description), pTyre:GetName(), iTourismBoost), L("TXT_KEY_UCS_BONUS_TYRE_TITLE"), pCity:GetX(), pCity:GetY())
			end	
		end
	end
end



-- WELLINGTON (ADDS STRATEGIC RESOURCES)
function EvenMoreStrategicResources(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end

	if pPlayer:GetEventChoiceCooldown(tEventChoice[25]) ~= 0 then
		local pCapital = pPlayer:GetCapitalCity()
		
		for i, value in ipairs(tResourcesStrategic) do
			if pPlayer:GetNumResourceAvailable(value, false) > 0 then
				local iEnumerator = i + 11 -- correction for the dummies table
				
				if pPlayer:HasStrategicMonopoly(value) then
					pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[iEnumerator], 2)
				elseif pPlayer:HasGlobalMonopoly(value) then
					pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[iEnumerator], 3)
				else
					pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[iEnumerator], 1)
				end
			end
		end
	else
		if pPlayer:CountNumBuildings(tBuildingsActiveAbilities[12]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[13]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[14]) > 0
			or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[15]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[16]) > 0 or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[17]) > 0
			or pPlayer:CountNumBuildings(tBuildingsActiveAbilities[18]) > 0 then
			
			local pCapital = pPlayer:GetCapitalCity()
			
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[12], 0) -- horses
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[13], 0) -- iron
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[14], 0) -- coal
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[15], 0) -- oil
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[16], 0) -- aluminum
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[17], 0) -- uranium
			pCapital:SetNumRealBuilding(tBuildingsActiveAbilities[18], 0) -- paper
		end
	end
end



--QUEBEC CITY (FEATURE REMOVAL YIELDS)
function FeatureCutByQuebec(iX, iY, eOwner, eOldFeature, eNewFeature)
	if eNewFeature ~= -1 then return end
	if eOldFeature == tFeatureTypes[1] or eOldFeature == tFeatureTypes[2] then
		local pPlayer = Players[eOwner]
		
		if pPlayer == nil then
			print("QUEBEC-city founded?")
			pPlayer = Players[Map.GetPlot(iX, iY):GetOwner()]
		end

		if pPlayer:IsMinorCiv() then return end

		if pPlayer:GetEventChoiceCooldown(tEventChoice[26]) ~= 0 then
			local iBaseYield = 10
			local iEraModifier = ((math.max(1, pPlayer:GetCurrentEra()) - 1) * 0.7) + 1
			local iCutExtraYield = iBaseYield * iEraModifier
			local pPlot = Map.GetPlot(iX, iY)
			local pCity = pPlot:GetWorkingCity()
			local pQuebecCity = Players[tLostCities["eLostQuebecCity"]]

			pPlayer:DoInstantYield(GameInfoTypes.YIELD_PRODUCTION, iCutExtraYield, true, pCity:GetID())
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iCutExtraYield, true, pCity:GetID())

			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_QUEBEC_CITY", pQuebecCity:GetName(), pCity:GetName(), iCutExtraYield, L(GameInfo.Features[eOldFeature].Description)), L("TXT_KEY_UCS_BONUS_QUEBEC_CITY_TITLE"), pCity:GetX(), pCity:GetY())
			end	
		end
	end
end



--PRAGUE (MISSIONARY EXPENDED YIELDS)
function SpreadTheFaithInPrussia(eUnitOwner, eUnit, eUnitType, iX, iY, bDelay, eKillerPlayer)
	local pPlayer = Players[eUnitOwner]

	if pPlayer:IsMinorCiv() then return end

	if pPlayer:GetEventChoiceCooldown(tEventChoice[27]) ~= 0 then
		local pUnit = pPlayer:GetUnitByID(eUnit)
			
		-- event triggers twice on each death, so this should prevent it
		if bBlockedUnitFromThePreKillEvent == true then
			bBlockedUnitFromThePreKillEvent = false
		else
			bBlockedUnitFromThePreKillEvent = true
		end

		if pUnit:GetUnitType() == tUnitsCivilians[3] and not bBlockedUnitFromThePreKillEvent then
			local iBaseYield = RandomNumberBetween(10, 30)
			local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
			local iCultureFromDeath = iBaseYield * iEraModifier
			local iFaithFromDeath = iCultureFromDeath * 2			
			local pCapital = pPlayer:GetCapitalCity()
			local pPrague = Players[tLostCities["eLostPrague"]]

			pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iCultureFromDeath, true, pCapital:GetID())
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iFaithFromDeath, true, pCapital:GetID())
			
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_PRAGUE", pPrague:GetName(), iFaithFromDeath, iCultureFromDeath), L("TXT_KEY_UCS_BONUS_PRAGUE_TITLE"), pCapital:GetX(), pCapital:GetY())
			end	
		end
	end
end



--SINGAPORE (GOLD FROM DIPLOMACY)
function WiseDiplomatsFromSingapore(eUnitOwner, eUnit, eUnitType, iX, iY, bDelay, eKillerPlayer)
	if eKillerPlayer ~= -1 then return end
	
	local pPlayer = Players[eUnitOwner]

	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[30]) ~= 0 then
		local pUnit = pPlayer:GetUnitByID(eUnit)
			
		-- event triggers twice on each death, so this should prevent it
		if bBlockedUnitFromThePreKillEvent == true then
			bBlockedUnitFromThePreKillEvent = false
		else
			bBlockedUnitFromThePreKillEvent = true
		end
		
		if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_DIPLOMACY and not bBlockedUnitFromThePreKillEvent then
			local iBaseYield = 20
			local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
			
			local pCityStateFrom = Players[Map.GetPlot(iX, iY):GetOwner()]
			local iCurrentInfluenceWithCityState = pCityStateFrom:GetMinorCivFriendshipWithMajor(eUnitOwner)
			local iInfluenceModifier = 1

			if iCurrentInfluenceWithCityState >= GameDefines.FRIENDSHIP_THRESHOLD_ALLIES then
				iInfluenceModifier = 1.5
			elseif iCurrentInfluenceWithCityState >= 2 * GameDefines.FRIENDSHIP_THRESHOLD_ALLIES then
				iInfluenceModifier = 2.5
			elseif iCurrentInfluenceWithCityState < 0 then
				iInfluenceModifier = 0.5
			end
			
			local iDiploWealth = iBaseYield * iEraModifier * iInfluenceModifier	
			local pCapital = pPlayer:GetCapitalCity()
			local pSingapore = Players[tLostCities["eLostSingapore"]]
			
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iDiploWealth, true, pCapital:GetID())
			
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_SINGAPORE", pSingapore:GetName(), pCityStateFrom:GetName(), iDiploWealth), L("TXT_KEY_UCS_BONUS_SINGAPORE_TITLE"), pCapital:GetX(), pCapital:GetY())
			end	
		end
	end
end



-- SYDNEY (WLTKD GREAT PEOPLE POINTS)
function GenerateGPPBySydney(eCityOwner, iX, iY, iTurns)
	local pPlayer = Players[eCityOwner]

	if pPlayer:IsMinorCiv() then return end

	if pPlayer:GetEventChoiceCooldown(tEventChoice[28]) ~= 0 then
		local iBaseYieldArtist = RandomNumberBetween(5, 20)
		local iBaseYieldWriter = RandomNumberBetween(5, 20)
		local iBaseYieldMusician = RandomNumberBetween(5, 20)
		local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
		local iBoost1 = iBaseYieldArtist * iEraModifier
		local iBoost2 = iBaseYieldWriter * iEraModifier
		local iBoost3 = iBaseYieldMusician * iEraModifier
		local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
		local pSydney = Players[tLostCities["eLostSydney"]]

		pCity:ChangeSpecialistGreatPersonProgressTimes100(tSpecialistTypes[4], iBoost1 * 100)
		pCity:ChangeSpecialistGreatPersonProgressTimes100(tSpecialistTypes[5], iBoost2 * 100)
		pCity:ChangeSpecialistGreatPersonProgressTimes100(tSpecialistTypes[6], iBoost3 * 100)

		if pPlayer:IsHuman() then
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_SYDNEY", pSydney:GetName(), pCity:GetName(), L(GameInfo.Units[tUnitsGreatPeople[4]].Description), L(GameInfo.Units[tUnitsGreatPeople[5]].Description), L(GameInfo.Units[tUnitsGreatPeople[6]].Description), iBoost1, iBoost2, iBoost3), L("TXT_KEY_UCS_BONUS_SYDNEY_TITLE"), pCity:GetX(), pCity:GetY())
		end
	end
end



-- GWYNEDD (LONGER WLTKD)
function WeLoveGwyneddSoMuch(ePlayer, iX, iY, iTurns)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end

	if pPlayer:GetEventChoiceCooldown(tEventChoice[29]) ~= 0 then
		local pPlot = Map.GetPlot(iX, iY)
		
		if pPlot then
			local pCity = pPlot:GetPlotCity()
			
			if pCity then
				local iWLTKDExtendedTurns = pCity:GetWeLoveTheKingDayCounter() + ((iTurns * 34) / 100) -- the hook is called after the game has already increased the WLTKD turns in the city 
				
				pCity:SetWeLoveTheKingDayCounter(iWLTKDExtendedTurns) -- DO NOT use pCity:ChangeWeLoveTheKingDayCounter as it will call the hook again, resulting in an infinite loop
			end
		end
	end
end

function WeLoveGwyneddSoMuchOnEventOn(ePlayer, eEventChoiceType)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if eEventChoiceType == tEventChoice[29] then
		for city in pPlayer:Cities() do
			local iCurrentWLTKDTurns = city:GetWeLoveTheKingDayCounter()

			if iCurrentWLTKDTurns > 0 then
				local iWLTKDExtendedTurns = iCurrentWLTKDTurns + ((iCurrentWLTKDTurns * 34) / 100)
				
				city:SetWeLoveTheKingDayCounter(iWLTKDExtendedTurns)
			end
		end
	end
end

function WeLoveGwyneddSoMuchOnEventOff(ePlayer, eEventChoiceType)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if eEventChoiceType == tEventChoice[29] then
		for city in pPlayer:Cities() do
			local iCurrentWLTKDTurns = city:GetWeLoveTheKingDayCounter()

			if iCurrentWLTKDTurns > 0 then
				local iWLTKDReducedTurns = (iCurrentWLTKDTurns * 66) / 100
				
				city:SetWeLoveTheKingDayCounter(iWLTKDReducedTurns)
			end
		end
	end
end



-- YANGCHENG (FAITH ON ERA CHANGE)
function YearOfTheAnimal(eTeam, eEra, bFirst)
	for eplayer = 0, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
		local pPlayer = Players[eplayer]

		if pPlayer and pPlayer:IsAlive() then
			if pPlayer:IsMinorCiv() then return end

			local ePlayerTeam = pPlayer:GetTeam()

			if ePlayerTeam == eTeam then
				if pPlayer:GetEventChoiceCooldown(tEventChoice[34]) ~= 0 then
					local iRandomAnimal = RandomNumberBetween(1, 12)
					local sAnimal, sAnimalBonusYield, sAnimalBonusYield2, sAnimalBonusYieldText = "", "", "", ""
					local iAnimalBonusYield, iAnimalBonusYield2, eAnimalBonusYield, eAnimalBonusYield2 = 0, 0, 0, 0
					local iBaseYield = 70
					local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
					local iFirstModifier = 1
					local pCapital = pPlayer:GetCapitalCity()
					local pYangcheng = Players[tLostCities["eLostYangcheng"]]

					if bFirst then
						iFirstModifier = 1.3
					end

					local iAnimalFaith = iBaseYield * iEraModifier * iFirstModifier
				
					if pPlayer:IsHuman() then
						if iRandomAnimal == 1 then
							sAnimal = "Rat"
							iAnimalBonusYield = iAnimalFaith / 6
							eAnimalBonusYield = GameInfoTypes.YIELD_TOURISM
							sAnimalBonusYield = " [ICON_TOURISM] Tourism"
						elseif iRandomAnimal == 2 then
							sAnimal = "Ox"
							iAnimalBonusYield = iAnimalFaith / 4
							eAnimalBonusYield = GameInfoTypes.YIELD_PRODUCTION
							sAnimalBonusYield = " [ICON_PRODUCTION] Production"
						elseif iRandomAnimal == 3 then
							sAnimal = "Tiger"
							iAnimalBonusYield = iAnimalFaith / 5
							eAnimalBonusYield = GameInfoTypes.YIELD_GREAT_GENERAL_POINTS
							sAnimalBonusYield = " [ICON_GREAT_GENERAL] Great General Points"
						elseif iRandomAnimal == 4 then
							sAnimal = "Rabbit"
							iAnimalBonusYield = iAnimalFaith / 5
							eAnimalBonusYield = GameInfoTypes.YIELD_FAITH
							sAnimalBonusYield = " [ICON_PEACE] Faith"
						elseif iRandomAnimal == 5 then
							sAnimal = "Dragon"
							iAnimalBonusYield = iAnimalFaith / 7
							eAnimalBonusYield = GameInfoTypes.YIELD_GREAT_ADMIRAL_POINTS
							sAnimalBonusYield = " [ICON_GREAT_ADMIRAL] Great Admiral Points"
						elseif iRandomAnimal == 6 then
							sAnimal = "Snake"
							iAnimalBonusYield = iAnimalFaith / 6
							eAnimalBonusYield = GameInfoTypes.YIELD_CULTURE
							sAnimalBonusYield = " [ICON_CULTURE] Culture"
						elseif iRandomAnimal == 7 then
							sAnimal = "Horse"
							iAnimalBonusYield = iAnimalFaith / 4
							eAnimalBonusYield = GameInfoTypes.YIELD_GOLD
							sAnimalBonusYield = " [ICON_GOLD] Gold"
						elseif iRandomAnimal == 8 then
							sAnimal = "Goat"
							iAnimalBonusYield = iAnimalFaith / 4
							eAnimalBonusYield = GameInfoTypes.YIELD_FOOD
							sAnimalBonusYield = " [ICON_FOOD] Food"
							iAnimalBonusYield2 = iAnimalFaith / 6
							eAnimalBonusYield2 = GameInfoTypes.YIELD_PRODUCTION
							sAnimalBonusYield2 = " [ICON_PRODUCTION] Production"
						elseif iRandomAnimal == 9 then
							sAnimal = "Monkey"
							iAnimalBonusYield = iAnimalFaith / 6
							eAnimalBonusYield = GameInfoTypes.YIELD_SCIENCE
							sAnimalBonusYield = " [ICON_RESEARCH] Science"
						elseif iRandomAnimal == 10 then
							sAnimal = "Rooster"
							iAnimalBonusYield = iAnimalFaith / 7
							eAnimalBonusYield = GameInfoTypes.YIELD_GOLDEN_AGE_POINTS
							sAnimalBonusYield = " [ICON_GOLDEN_AGE] Golden Age Points"
						elseif iRandomAnimal == 11 then
							sAnimal = "Dog"
							iAnimalBonusYield = iAnimalFaith / 2
							eAnimalBonusYield = GameInfoTypes.YIELD_CULTURE_LOCAL
							sAnimalBonusYield = " [ICON_CULTURE_LOCAL] Border Growth Points"
						elseif iRandomAnimal == 12 then
							sAnimal = "Pig"
							iAnimalBonusYield = iAnimalFaith / 3
							eAnimalBonusYield = GameInfoTypes.YIELD_FOOD
							sAnimalBonusYield = " [ICON_FOOD] Food"
						end

						pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iAnimalFaith, true, pCapital:GetID())
						pPlayer:DoInstantYield(eAnimalBonusYield, iAnimalBonusYield, true, pCapital:GetID())

						iAnimalBonusYield = math.floor(iAnimalBonusYield)
						iAnimalBonusYield2 = math.floor(iAnimalBonusYield2)

						if iRandomAnimal == 8 then -- GOAT (2 yields exception)
							pPlayer:DoInstantYield(eAnimalBonusYield2, iAnimalBonusYield2, true, pCapital:GetID())
							sAnimalBonusYieldText = iAnimalBonusYield .. sAnimalBonusYield .. " and " .. iAnimalBonusYield2 .. sAnimalBonusYield2
						else
							sAnimalBonusYieldText = iAnimalBonusYield .. sAnimalBonusYield
						end

						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_YANGCHENG", pYangcheng:GetName(), iAnimalFaith, sAnimal, sAnimalBonusYieldText), L("TXT_KEY_UCS_BONUS_YANGCHENG_TITLE", sAnimal), pCapital:GetX(), pCapital:GetY())
					end
				end
			end
		end
	end
end



-- IFE (FAITH ON TRAINED DIPLO UNITS)
function FaithForDiploFromIfe(ePlayer, eCity, eUnit, bGold, bFaith)	
	local pPlayer = Players[ePlayer]
	local pUnit = pPlayer:GetUnitByID(eUnit)
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[35]) ~= 0 then
		if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_DIPLOMACY then
			local iBaseYield = 30
			local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
			local iYoruba = iBaseYield * iEraModifier		
			local pCity = pPlayer:GetCityByID(eCity)
			local pIfe = Players[tLostCities["eLostIfe"]]
		
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iYoruba, true, pCity:GetID())
						
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_IFE", pUnit:GetName(), pIfe:GetName(), iYoruba), L("TXT_KEY_UCS_BONUS_IFE_TITLE"), pCity:GetX(), pCity:GetY())		
			end
		end
	end
end

function FaithForDiploFromIfeSpawn(eUnitOwner, eUnit, eUnitType, iX, iY)	
	local pPlayer = Players[eUnitOwner]
	local pUnit = pPlayer:GetUnitByID(eUnit)
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[35]) ~= 0 then
		local iBaseYield = 30
		local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
		local iYoruba = iBaseYield * iEraModifier		
		local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
		local pIfe = Players[tLostCities["eLostIfe"]]
		
		if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_DIPLOMACY then
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iYoruba, true, pCity:GetID())
						
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_IFE", pUnit:GetName(), pIfe:GetName(), iYoruba), L("TXT_KEY_UCS_BONUS_IFE_TITLE"), pCity:GetX(), pCity:GetY())		
			end
		elseif pUnit:GetUnitType() == tUnitsGreatPeople[7] then
			iYoruba = iYoruba * 2

			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iYoruba, true, pCity:GetID())
						
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_IFE", pUnit:GetName(), pIfe:GetName(), iYoruba), L("TXT_KEY_UCS_BONUS_IFE_TITLE"), pCity:GetX(), pCity:GetY())		
			end
		end
	end
end



-- GENEVA (FAITH ON TRAINED GP UNITS)
function FaithForGPFromGeneva(eUnitOwner, eUnit, eUnitType, iX, iY)	
	local pPlayer = Players[eUnitOwner]
	local pUnit = pPlayer:GetUnitByID(eUnit)
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[36]) ~= 0 then
		if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SPECIAL_PEOPLE then
			local iBaseYield = 25
			local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
			local iEscalade = iBaseYield * iEraModifier		
			local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
			local pGeneva = Players[tLostCities["eLostGeneva"]]
		
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_FAITH, iEscalade, true, pCity:GetID())
						
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_GENEVA", pGeneva:GetName(), pUnit:GetName(), iEscalade), L("TXT_KEY_UCS_BONUS_GENEVA_TITLE"), pCity:GetX(), pCity:GetY())		
			end
		end
	end
end



-- GENOA (GOLD ON TRAINED GP UNITS)
function GoldForGPFromGenoa(eUnitOwner, eUnit, eUnitType, iX, iY)	
	local pPlayer = Players[eUnitOwner]
	local pUnit = pPlayer:GetUnitByID(eUnit)
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[37]) ~= 0 then
		if pUnit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SPECIAL_PEOPLE then
			local iBaseYield1 = 50
			local iBaseYield2 = 15
			local iEraModifier = math.max(1, pPlayer:GetCurrentEra())
			local iLa = iBaseYield1 * iEraModifier
			local iSuperba = iBaseYield2 * iEraModifier		
			local pCity = Map.GetPlot(iX, iY):GetWorkingCity()
			local pGenoa = Players[tLostCities["eLostGenoa"]]
		
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLD, iLa, true, pCity:GetID())
			pPlayer:DoInstantYield(GameInfoTypes.YIELD_GOLDEN_AGE_POINTS, iSuperba, true, pCity:GetID())
						
			if pPlayer:IsHuman() then
				pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, L("TXT_KEY_UCS_BONUS_GENOA", pGenoa:GetName(), pUnit:GetName(), iLa, iSuperba), L("TXT_KEY_UCS_BONUS_GENOA_TITLE"), pCity:GetX(), pCity:GetY())		
			end
		end
	end
end



-- SIERRA LEONE (CULTURE PER WORKER)
function CulturePerWorker(ePlayer)
	local pPlayer = Players[ePlayer]
	
	if pPlayer:IsMinorCiv() then return end
	
	if pPlayer:GetEventChoiceCooldown(tEventChoice[38]) ~= 0 then
		local pCapital = pPlayer:GetCapitalCity()
		local iWorkers = pPlayer:GetUnitClassCount(GameInfoTypes.UNITCLASS_WORKER)

		pPlayer:DoInstantYield(GameInfoTypes.YIELD_CULTURE, iWorkers, true, pCapital:GetID())
	end
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- INITIALIZATION
function SettingUpSpecificEvents()
	for eCS, pCS in pairs(Players) do
		if pCS:IsMinorCiv() then		
			local sMinorCivType = GameInfo.MinorCivilizations[pCS:GetMinorCivType()].Type
		
			-- unit actions effects
			if sMinorCivType == "MINOR_CIV_BOGOTA" then	
				tLostCities["eLostBogota"] = eCS
				GameEvents.PlayerLiberated.Add(LiberatedForBogota)		
				GameEvents.CityCaptureComplete.Add(CapturedForBogota)
			elseif sMinorCivType == "MINOR_CIV_LEVUKA" then
				tLostCities["eLostLevuka"] = eCS
				GameEvents.CityCaptureComplete.Add(CaptureCityForLevuka)
				GameEvents.PlayerDoTurn.Add(ConquestsForLevuka)
				GameEvents.BarbariansCampCleared.Add(BarbCampForLevuka)
				
			
			-- improvements
			elseif sMinorCivType == "MINOR_CIV_BRUSSELS" then	
				tLostCities["eLostBrussels"] = eCS
				GameEvents.BuildFinished.Add(BuiltMarsh)	
			elseif sMinorCivType == "MINOR_CIV_CAHOKIA" then	
				tLostCities["eLostCahokia"] = eCS
			elseif sMinorCivType == "MINOR_CIV_TIWANAKU" then	
				tLostCities["eLostTiwanaku"] = eCS
			

			-- trade routes bonuses
			elseif sMinorCivType == "MINOR_CIV_CAPE_TOWN" then	
				tLostCities["eLostCapeTown"] = eCS
				GameEvents.PlayerTradeRouteCompleted.Add(TradeInCapeTown)
			elseif sMinorCivType == "MINOR_CIV_MANILA" then	
				tLostCities["eLostManila"] = eCS
				GameEvents.PlayerTradeRouteCompleted.Add(TradeInManila)
			elseif sMinorCivType == "MINOR_CIV_COLOMBO" then
				tLostCities["eLostColombo"] = eCS
				GameEvents.PlayerTradeRouteCompleted.Add(TradeInColombo)
			
			
			-- starting building setup for city-states
			elseif 		sMinorCivType == "MINOR_CIV_KIEV" or sMinorCivType == "MINOR_CIV_MILAN" 
				     or	sMinorCivType == "MINOR_CIV_VILNIUS" or sMinorCivType == "MINOR_CIV_VALLETTA" then
				GameEvents.UnitCityFounded.Add(SettledCityStateWithBuilding)
				GameEvents.PlayerLiberated.Add(LiberatedCityStateWithBuilding)
				
				if sMinorCivType == "MINOR_CIV_KIEV" then	
					tLostCities["eLostKyiv"] = eCS
				elseif sMinorCivType == "MINOR_CIV_MILAN" then	
					tLostCities["eLostMilan"] = eCS
				elseif sMinorCivType == "MINOR_CIV_VILNIUS" then	
					tLostCities["eLostVilnius"] = eCS
				elseif sMinorCivType == "MINOR_CIV_VALLETTA" then	
					tLostCities["eLostValletta"] = eCS
				end
			
			
			-- gold interests
			elseif sMinorCivType == "MINOR_CIV_ZURICH" then	
				tLostCities["eLostZurich"] = eCS
				
				for eplayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
					tZurichLastInterests[eplayer] = 0
					tZurichCounter[eplayer] = 0
				end

				GameEvents.PlayerDoTurn.Add(ZurichMerchants)
				GameEvents.MinorAlliesChanged.Add(ZurichMerchantsNoAlly)
			

			-- sphere of influence
			elseif sMinorCivType == "MINOR_CIV_SIDON" then
				tLostCities["eLostSidon"] = eCS
				GameEvents.PlayerBullied.Add(DestroyLifeForSidon)
			elseif sMinorCivType == "MINOR_CIV_LHASA" then
				tLostCities["eLostLhasa"] = eCS
				
				if not Game.AnyoneHasWonder(tBuildingsActiveAbilities[1]) then
					GameEvents.PlayerCanConstruct.Add(CanWeBuildPotalaPalace)
					GameEvents.CityConstructed.Add(BuiltWonderForLhasa)
				end
			elseif sMinorCivType == "MINOR_CIV_JERUSALEM" then
				tLostCities["eLostJerusalem"] = eCS
				GameEvents.PlayerDoTurn.Add(JerusalemsDevotion)
				GameEvents.MinorAlliesChanged.Add(JerusalemsDevotionSphere)
			
			
			-- setting up specific building conditions
			elseif sMinorCivType == "MINOR_CIV_OC_EO" then	
				tLostCities["eLostOcEo"] = eCS
				GameEvents.PlayerDoTurn.Add(LordsOfTheGreatGlassRiver)
				GameEvents.CityCaptureComplete.Add(LordsOfTheGreatGlassRiverCapture)
				GameEvents.PlayerCityFounded.Add(LordsOfTheGreatGlassRiverNewCity)
			elseif sMinorCivType == "MINOR_CIV_THIMPHU" then
				tLostCities["eLostThimphu"] = eCS
				GameEvents.PlayerDoTurn.Add(DrukTsendhen)
				GameEvents.CityCaptureComplete.Add(DrukTsendhenCapture)
				GameEvents.PlayerCityFounded.Add(DrukTsendhenNewCity)
			elseif sMinorCivType == "MINOR_CIV_RAGUSA" then
				tLostCities["eLostRagusa"] = eCS
				GameEvents.PlayerDoTurn.Add(MaritimeSuzerainty)
				GameEvents.CityCaptureComplete.Add(MaritimeSuzeraintyCapture)
				GameEvents.PlayerCityFounded.Add(MaritimeSuzeraintyNewCity)
			elseif sMinorCivType == "MINOR_CIV_RISHIKESH" then
				tLostCities["eLostRishikesh"] = eCS
				GameEvents.PlayerDoTurn.Add(HimalayanYogi)
				GameEvents.CityCaptureComplete.Add(HimalayanYogiCapture)
				GameEvents.PlayerCityFounded.Add(HimalayanYogiNewCity)
			elseif sMinorCivType == "MINOR_CIV_ANDORRA" then
				tLostCities["eLostAndorra"] = eCS
				GameEvents.PlayerDoTurn.Add(PyreneanPareage)
				GameEvents.CityCaptureComplete.Add(PyreneanPareageCapture)
				GameEvents.PlayerCityFounded.Add(PyreneanPareageNewCity)
			elseif sMinorCivType == "MINOR_CIV_CANOSSA" then
				tLostCities["eLostCanossa"] = eCS
				GameEvents.PlayerDoTurn.Add(ArdentFlameInPiousHeart)
				GameEvents.CityCaptureComplete.Add(ArdentFlameInPiousHeartCapture)
				GameEvents.PlayerCityFounded.Add(ArdentFlameInPiousHeartNewCity)
				GameEvents.CityConstructed.Add(ArdentFlameInPiousHeartBuildingConstruction)
			
			
			-- new/exclusive units
			elseif sMinorCivType == "MINOR_CIV_DALI" then
				tLostCities["eLostDali"] = eCS
			elseif sMinorCivType == "MINOR_CIV_VATICAN_CITY" then
				tLostCities["eLostVaticanCity"] = eCS
				GameEvents.CombatEnded.Add(SwissGuardHealingAttack)
				GameEvents.CombatEnded.Add(SwissGuardHealingDefend)
				GameEvents.PlayerDoTurn.Add(SwissGuardYields)
				GameEvents.CityTrained.Add(SwissGuardYieldsNotification)
			elseif sMinorCivType == "MINOR_CIV_KATHMANDU" then
				tLostCities["eLostKathmandu"] = eCS
			
			
			-- promotions effects
			elseif sMinorCivType == "MINOR_CIV_ISKANWAYA" then
				tLostCities["eLostIskanwaya"] = eCS
				GameEvents.PlayerDoTurn.Add(HealersFromIskanwaya)
			elseif sMinorCivType == "MINOR_CIV_KABUL" then
				tLostCities["eLostKabul"] = eCS
				GameEvents.UnitSetXY.Add(MujahideensFromKabulOnMove)
				GameEvents.EventChoiceActivated.Add(MujahideensFromKabulOnEventOn)
				GameEvents.EventChoiceEnded.Add(MujahideensFromKabulOnEventOff)
			

			-- citizen migration
			elseif sMinorCivType == "MINOR_CIV_HONG_KONG" then
				tLostCities["eLostHongKong"] = eCS
				GameEvents.PlayerDoTurn.Add(MigrationToHongKong)
			

			-- GP spawn
			elseif sMinorCivType == "MINOR_CIV_FLORENCE" then
				tLostCities["eLostFlorence"] = eCS
				GameEvents.PlayerDoTurn.Add(ArtistsInFlorence)


			-- tech researched effects
			elseif sMinorCivType == "MINOR_CIV_KYZYL" then
				tLostCities["eLostKyzyl"] = eCS
				GameEvents.TeamTechResearched.Add(ResearchersFromKyzyl)


			-- building construction effects
			elseif sMinorCivType == "MINOR_CIV_TYRE" then
				tLostCities["eLostTyre"] = eCS
				GameEvents.CityConstructed.Add(TourismFromTyre)
				

			-- multiplication of strategic resources
			elseif sMinorCivType == "MINOR_CIV_WELLINGTON" then
				tLostCities["eLostWellington"] = eCS
				GameEvents.PlayerDoTurn.Add(EvenMoreStrategicResources)


			-- changing feature yields
			elseif sMinorCivType == "MINOR_CIV_QUEBEC_CITY" then
				tLostCities["eLostQuebecCity"] = eCS
				GameEvents.TileFeatureChanged.Add(FeatureCutByQuebec)


			-- prekill effects
			elseif sMinorCivType == "MINOR_CIV_PRAGUE" then
				tLostCities["eLostPrague"] = eCS
				GameEvents.UnitPrekill.Add(SpreadTheFaithInPrussia)
			elseif sMinorCivType == "MINOR_CIV_SINGAPORE" then
				tLostCities["eLostSingapore"] = eCS
				GameEvents.UnitPrekill.Add(WiseDiplomatsFromSingapore)


			-- WLTKD start/end effects
			elseif sMinorCivType == "MINOR_CIV_SYDNEY" then
				tLostCities["eLostSydney"] = eCS
				GameEvents.CityBeginsWLTKD.Add(GenerateGPPBySydney)
			elseif sMinorCivType == "MINOR_CIV_GWYNEDD" then
				tLostCities["eLostGwynedd"] = eCS
				GameEvents.CityBeginsWLTKD.Add(WeLoveGwyneddSoMuch) -- city starts celebrating WLTKD
				GameEvents.CityExtendsWLTKD.Add(WeLoveGwyneddSoMuch) -- city already celebrating WLTKD, which then gets extended	
				GameEvents.EventChoiceActivated.Add(WeLoveGwyneddSoMuchOnEventOn)
				GameEvents.EventChoiceEnded.Add(WeLoveGwyneddSoMuchOnEventOff)


			-- era change yields
			elseif sMinorCivType == "MINOR_CIV_YANGCHENG" then
				tLostCities["eLostYangcheng"] = eCS
				GameEvents.TeamSetEra.Add(YearOfTheAnimal)


			-- trained unit effects
			elseif sMinorCivType == "MINOR_CIV_IFE" then
				tLostCities["eLostIfe"] = eCS
				GameEvents.CityTrained.Add(FaithForDiploFromIfe)
				GameEvents.UnitCreated.Add(FaithForDiploFromIfeSpawn)				
			elseif sMinorCivType == "MINOR_CIV_GENEVA" then
				tLostCities["eLostGeneva"] = eCS
				GameEvents.UnitCreated.Add(FaithForGPFromGeneva)
			elseif sMinorCivType == "MINOR_CIV_GENOA" then
				tLostCities["eLostGenoa"] = eCS
				GameEvents.UnitCreated.Add(GoldForGPFromGenoa)


			-- yield per unit
			elseif sMinorCivType == "MINOR_CIV_SIERRA_LEONE" then
				tLostCities["eLostSierraLeone"] = eCS
				GameEvents.PlayerDoTurn.Add(CulturePerWorker)
			end
		end
	end
end
SettingUpSpecificEvents()
