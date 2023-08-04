---------------------------------------------------
-- Base Settings
---------------------------------------------------
INSERT INTO Community	
			(Type,					Value)
VALUES		('UCS-PASSIVES-ON',		1),	-- enables/disables CS passive abilities
			('UCS-PASSIVES-SHOW',	1); -- shows (1)/hides (0) passives in the CS tootlip
---------------------------------------------------
-- Compatibility
---------------------------------------------------
-- Even More Resources by @HungryForFood	
INSERT INTO Community	
		(Type,			Value)
VALUES	('UCS-EMR', 2);

UPDATE Community
SET Value = '1'
WHERE Type = 'UCS-EMR' AND EXISTS (SELECT * FROM Resources WHERE Type='RESOURCE_LAVENDER') AND NOT EXISTS (SELECT * FROM Community WHERE Type='UCS-EMR' AND Value= 0);

-- Enlightenment Era by @Infixo	
INSERT INTO Community	
		(Type,			Value)
VALUES	('UCS-EE', 2);

UPDATE Community
SET Value = '1'
WHERE Type = 'UCS-EE' AND EXISTS (SELECT * FROM Buildings WHERE Type='BUILDING_EE_DRYDOCK') AND NOT EXISTS (SELECT * FROM Community WHERE Type='UCS-EE' AND Value= 0);

-- More Wonders by @adan_eslavo and @Infixo
INSERT INTO Community	
		(Type,			Value)
VALUES	('UCS-MW', 2);

UPDATE Community
SET Value = '1'
WHERE Type = 'UCS-MW' AND EXISTS (SELECT * FROM Resources WHERE Type='RESOURCE_TROPICAL_FISH') AND NOT EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 0);
--==========================================================================================================================
-- UPDATES AND DEFINES
--==========================================================================================================================	
---------------------------------------------------
-- Updates - Units
---------------------------------------------------
UPDATE Units SET NumInfPerEra = 20 WHERE Class = 'UNITCLASS_GREAT_DIPLOMAT';
---------------------------------------------------
-- Updates - Traits
---------------------------------------------------
UPDATE Traits SET InfluenceMeetCS = 45 WHERE Type = 'TRAIT_CITY_STATE_BONUSES';
---------------------------------------------------
-- Updates - Defines
---------------------------------------------------
UPDATE Defines SET Value = 40 WHERE Name = 'FRIENDSHIP_THRESHOLD_FRIENDS';
UPDATE Defines SET Value = 80 WHERE Name = 'FRIENDSHIP_THRESHOLD_ALLIES';

UPDATE Defines SET Value = 10 WHERE Name = 'MINOR_FRIENDSHIP_ANCHOR_MOD_PROTECTED';

UPDATE Defines SET Value = 50 WHERE Name = 'MOD_BALANCE_CORE_MINIMUM_RANKING_PTP';

UPDATE Defines SET Value = 100 WHERE Name = 'ALLIES_CAPITAL_FOOD_BONUS_AMOUNT';
UPDATE Defines SET Value = 100 WHERE Name = 'ALLIES_OTHER_CITIES_FOOD_BONUS_AMOUNT';

-- CS Yield Rewards VP * 0.66
UPDATE Defines SET Value = 3 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 2 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_GOLD_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 4 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 2 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 1 WHERE Name = 'ALLIES_GOLD_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 7 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 4 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 3 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_SCIENCE_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 7 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 5 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 4 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 2 WHERE Name = 'ALLIES_SCIENCE_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 8 WHERE Name = 'ALLIES_CULTURE_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 4 WHERE Name = 'ALLIES_CULTURE_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 1 WHERE Name = 'ALLIES_CULTURE_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 7 WHERE Name = 'FRIENDS_CULTURE_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 3 WHERE Name = 'FRIENDS_CULTURE_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_CULTURE_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 8 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 6 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 5 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 2 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 1 WHERE Name = 'FRIENDS_FAITH_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 8 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_INDUSTRIAL';
UPDATE Defines SET Value = 6 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_RENAISSANCE';
UPDATE Defines SET Value = 5 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_MEDIEVAL';
UPDATE Defines SET Value = 3 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_CLASSICAL';
UPDATE Defines SET Value = 2 WHERE Name = 'ALLIES_FAITH_FLAT_BONUS_AMOUNT_ANCIENT';

UPDATE Defines SET Value = 2 WHERE Name = 'NEED_DIPLOMAT_DESIRE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 1);
UPDATE Defines SET Value = 6 WHERE Name = 'NEED_DIPLOMAT_DISTASTE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 1);
UPDATE Defines SET Value = 3 WHERE Name = 'NEED_DIPLOMAT_DESIRE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 2);
UPDATE Defines SET Value = 5 WHERE Name = 'NEED_DIPLOMAT_DISTASTE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 2);
UPDATE Defines SET Value = 4 WHERE Name = 'NEED_DIPLOMAT_DESIRE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 3);
UPDATE Defines SET Value = 4 WHERE Name = 'NEED_DIPLOMAT_DISTASTE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 3);
UPDATE Defines SET Value = 5 WHERE Name = 'NEED_DIPLOMAT_DESIRE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 4);
UPDATE Defines SET Value = 3 WHERE Name = 'NEED_DIPLOMAT_DISTASTE_MODIFIER' AND EXISTS (SELECT * FROM CSD WHERE Type='CSD_DIFFICULTY' AND Value= 4);
---------------------------------------------------
-- Updates - CustomModOptions - Events
---------------------------------------------------
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_PLOT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_CITY';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_TILE_IMPROVEMENTS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_TRADE_ROUTES';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_FOUNDED';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_CREATED';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_UNIT_PREKILL';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RESOLUTIONS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_MINORS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_MINORS_INTERACTION';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_BARBARIANS';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_LIBERATION';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_NEW_ERA';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_CUSTOM_MISSIONS';

UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_TURN';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_MISSION';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_ABORT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_RESULT';
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'EVENTS_RED_COMBAT_ENDED';
---------------------------------------------------
-- Updates - CustomModOptions - CS Abilities
---------------------------------------------------
-- CS Overseas Territory
-- City States allied to a major act as an "overseas territoriy" of the major - other units may not enter CS territory unless they could enter the allied major's territory
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_OVERSEAS_TERRITORY';
	
-- CS Gift Ships
-- City States will (occasionally) gift ships
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_GIFT_SHIPS';	

-- CS Militaristic upgrade
-- Units in allied militaristic City States can upgrade - requires a (cosmetic) patch to UnitPanel.lua to fix the incorrect message about being in friendly territory
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_UPGRADES';	
	
-- CS Gifts
-- City States give different gifts depending on their type (cultural, religious, maritime, etc)
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'GLOBAL_CS_GIFTS';	
	
-- CS Allied Inquisitors
-- Inquisitors will keep religion out of allied City State cities if positioned adjacent
UPDATE CustomModOptions SET Value = 1 WHERE Name = 'RELIGION_ALLIED_INQUISITORS';
---------------------------------------------------
-- Updates - Language_en_US
---------------------------------------------------
UPDATE Language_en_US SET Text = '[NEWLINE][COLOR_WARNING_TEXT][ICON_BULLET] Must be in the top 50% of the world in terms of Military Power. Yours is ranked at {1_Num}% of world Military Power.[ENDCOLOR]' WHERE Tag = 'TXT_KEY_POP_CSTATE_PLEDGE_NEED_MORE_MILITARY_TT';
UPDATE Language_en_US SET Text = 'You are [COLOR_POSITIVE_TEXT]Allies[ENDCOLOR] with {1_CityStateName:textkey}. Their bonuses will persist for [COLOR_FONT_RED]3[ENDCOLOR] turns if you lose the [COLOR_POSITIVE_TEXT]Allied[ENDCOLOR] status. Each turn, your [ICON_INFLUENCE] Influence with them will change by {2_Num}. If {1_CityStateName:textkey} is damaged and you have a [COLOR_POSITIVE_TEXT]Pledge of Protection[ENDCOLOR] with them, this decay value will triple.' WHERE Tag = 'TXT_KEY_ALLIES_CSTATE_TT';
UPDATE Language_en_US SET Text = '[ICON_INFLUENCE] Influence with [ICON_CITY_STATE] City-States starts at 45. Yields from friendly and allied City-States increased by 75%. +25% to [ICON_STRENGTH] Combat Strength of Allied [ICON_CITY_STATE] City-State [ICON_CAPITAL] Capitals. +10 Experience to Units gifted from City-States.' WHERE Tag = 'TXT_KEY_TRAIT_CITY_STATE_BONUSES';

UPDATE Language_en_US SET Text = REPLACE(Text, 'Available![ENDCOLOR]', '[ENDCOLOR]available!') WHERE Tag = 'TXT_KEY_CSTATE_CAN_EMBASSY';
UPDATE Language_en_US SET Text = REPLACE(Text, 'Available![ENDCOLOR].', '[ENDCOLOR]available!') WHERE Tag = 'TXT_KEY_CSTATE_CAN_PROTECT';
UPDATE Language_en_US SET Text = REPLACE(Text, 'early.[NEWLINE][NEWLINE]', 'early.') WHERE Tag = 'TXT_KEY_CSTATE_JERK_STATUS';	
--==========================================================================================================================
-- ATLASES
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
SELECT 		'UCS_BUILDING_ATLAS', 					'256', 		'UCS_Buildings_256.dds', 			8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'128', 		'UCS_Buildings_128.dds', 			8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'80', 		'UCS_Buildings_080.dds', 			8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'64', 		'UCS_Buildings_064.dds', 			8, 				2 UNION ALL
SELECT 		'UCS_BUILDING_ATLAS', 					'45', 		'UCS_Buildings_045.dds', 			8, 				2 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'256', 		'UCS_Promotions_256.dds', 			5, 				6 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'64', 		'UCS_Promotions_064.dds', 			5, 				6 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'45', 		'UCS_Promotions_045.dds', 			5, 				6 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'32', 		'UCS_Promotions_032.dds', 			5, 				6 UNION ALL
SELECT 		'UCS_PROMOTION_ATLAS', 					'16', 		'UCS_Promotions_016.dds', 			5, 				6 UNION ALL
SELECT 		'UCS_IMPROVEMENT_ATLAS', 				'256', 		'UCS_Improvements_256.dds',			8, 				2 UNION ALL
SELECT 		'UCS_IMPROVEMENT_ATLAS', 				'64', 		'UCS_Improvements_064.dds',			8, 				2 UNION ALL
SELECT 		'UCS_IMPROVEMENT_ATLAS', 				'45', 		'UCS_Improvements_045.dds',			8, 				2 UNION ALL
SELECT 		'UCS_UNIT_ATLAS', 						'256', 		'UCS_Units_256.dds',				3, 				1 UNION ALL
SELECT 		'UCS_UNIT_ATLAS', 						'128', 		'UCS_Units_128.dds',				3, 				1 UNION ALL
SELECT 		'UCS_UNIT_ATLAS', 						'80', 		'UCS_Units_080.dds',				3, 				1 UNION ALL
SELECT 		'UCS_UNIT_ATLAS', 						'64', 		'UCS_Units_064.dds',				3, 				1 UNION ALL
SELECT 		'UCS_UNIT_ATLAS', 						'45', 		'UCS_Units_045.dds',				3, 				1 UNION ALL
SELECT 		'UCS_UNIT_ATLAS', 						'32', 		'UCS_Units_032.dds',				3, 				1 UNION ALL
SELECT 		'UCS_UNIT_FLAG_ATLAS', 					'32', 		'UCS_UnitsFlags_032.dds',			3, 				1 UNION ALL
SELECT 		'UCS_RESOURCE_ATLAS', 					'256', 		'UCS_Resources_256.dds',			1, 				1 UNION ALL
SELECT 		'UCS_RESOURCE_ATLAS', 					'128', 		'UCS_Resources_128.dds',			1, 				1 UNION ALL
SELECT 		'UCS_RESOURCE_ATLAS', 					'80', 		'UCS_Resources_080.dds',			1, 				1 UNION ALL
SELECT 		'UCS_RESOURCE_ATLAS', 					'64', 		'UCS_Resources_064.dds',			1, 				1 UNION ALL
SELECT 		'UCS_RESOURCE_ATLAS', 					'45', 		'UCS_Resources_045.dds',			1, 				1 UNION ALL
SELECT 		'UCS_RESOURCE_ATLAS', 					'32', 		'UCS_Resources_032.dds',			1, 				1;
---------------------------------------------------
INSERT INTO IconFontTextures 
			(IconFontTexture, 				IconFontTextureFile)
VALUES		('UCS_RESOURCE_FONT_ATLAS', 	'UCS_ResourcesFontIcons_022');
--==========================================================================================================================
-- TEXTS
--==========================================================================================================================	
INSERT INTO Language_en_US (Tag, Text)
-- different texts
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV', 					'A Shift in Alliance'  UNION ALL
SELECT 'TXT_KEY_CS_ACTIVE_BONUS_HEADER', 				'[COLOR_LIGHT_GREY]City-State''s bonuses given to Major Player:[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_CS_PASSIVE_BONUS_HEADER', 				'[COLOR_LIGHT_GREY]City-State''s passive abilities:[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_CS_UU_QUICK_INFO', 						'Unique Unit: [COLOR_YIELD_FOOD]{1_Unique_Unit}[ENDCOLOR] available at [COLOR_CYAN]{2_Tech}[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_MARITIME_BONUS', 						'[COLOR:90:205:40:255]Builders (Maritime):[ENDCOLOR][NEWLINE][ICON_BULLET]has a Manufactory and an additional Bonus Resource nearby[NEWLINE][ICON_BULLET]+15% [ICON_FOOD] Growth[NEWLINE][ICON_BULLET]10 [ICON_CULTURE_LOCAL] Border Growth Points on [ICON_CITIZEN] Birth[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]+20% [ICON_SPY] Enemy Spy Effectiveness[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_MARITIME_FRIENDLY_BONUS', 					'[COLOR:200:240:140:255]Harvesters (Maritime Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning a [ICON_WORKER] Worker or a [ICON_WORKER] Fishing Boat inside Friends'' Territory (their Capital must be on a Coast to get a [ICON_WORKER] Fishing Boat)[NEWLINE][ICON_BULLET]+50% [ICON_PRODUCTION] towards [ICON_WORKER] Workers and [ICON_WORKER] Fishing Boats[NEWLINE][ICON_BULLET]+1 [ICON_FOOD] to Bonus Resources'  UNION ALL
SELECT 'TXT_KEY_MARITIME_NEUTRAL_BONUS', 					'[COLOR:110:160:70:255]Secured Warehouse (Maritime Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET]+10 [ICON_FOOD] per 4 [ICON_CITIZEN][NEWLINE][ICON_BULLET]+10 [ICON_STRENGTH] Defense and +50 City HP'  UNION ALL
SELECT 'TXT_KEY_MARITIME_HOSTILE_BONUS', 					'[COLOR:60:125:40:255]Selfish Gatherers (Maritime Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET]+20% [ICON_PRODUCTION] towards all Naval Units[NEWLINE][ICON_BULLET]50 [ICON_FOOD] and 20 [ICON_CULTURE_LOCAL] Border Growth Points on [ICON_PRODUCTION] Unit Production[NEWLINE][ICON_BULLET]+1 [ICON_PRODUCTION] per 2 [ICON_CITIZEN].'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_BONUS', 						'[COLOR:240:215:65:255]Trade Center (Mercantile):[ENDCOLOR][NEWLINE][ICON_BULLET]has a Town and an additional Luxury Resource nearby[NEWLINE][ICON_BULLET]+10% [ICON_GOLD][NEWLINE][ICON_BULLET]5% of [ICON_GOLD] is converted to [ICON_FOOD] and another 5% to [ICON_PRODUCTION][NEWLINE][ICON_BULLET]-20% [ICON_GOLD] Hurry Cost Modifiers[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]-20% [ICON_PRODUCTION] towards all Military Units[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_FRIENDLY_BONUS', 				'[COLOR:240:240:165:255]Golden City (Mercantile Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning a [ICON_CARAVAN] Caravan or a [ICON_CARGO_SHIP] Cargo Ship inside Friends'' Territory (their Capital must be on a Coast to get a [ICON_CARGO_SHIP] Cargo Ship)[NEWLINE][ICON_BULLET]+2 [ICON_GOLD] to Luxury Resources'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_NEUTRAL_BONUS', 					'[COLOR:210:210:70:255]Shadow Council (Mercantile Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET]+2 [ICON_PRODUCTION] and +2 [ICON_CULTURE] to Luxury Resources[NEWLINE][ICON_BULLET]20 [ICON_GOLD] from Border Growth'  UNION ALL
SELECT 'TXT_KEY_MERCANTILE_HOSTILE_BONUS', 					'[COLOR:130:130:20:255]Free City (Mercantile Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET]30 [ICON_GOLD] and 10 [ICON_CULTURE] when unit is produced[NEWLINE][ICON_BULLET][ICON_GOLD] when unit level ups[NEWLINE][ICON_BULLET]25% of [ICON_PRODUCTION] is added on [ICON_CITIZEN] Birth'  UNION ALL
SELECT 'TXT_KEY_CULTURED_BONUS', 						'[COLOR:210:65:200:255]Center of Learning (Cultured):[ENDCOLOR][NEWLINE][ICON_BULLET]has an Academy and an Archaeological Site nearby.[NEWLINE][ICON_BULLET]+1 [ICON_CULTURE] to Forests, Jungles, Marshes, Oasis and Flood Plains.[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]-20% [ICON_PEACE] Religious Pressure[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_CULTURED_FRIENDLY_BONUS', 					'[COLOR:240:180:235:255]Open University (Cultured Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning an [ICON_VP_ARTIFACT] Archaeologist inside Friends'' Territory (after researching Archaeology)'  UNION ALL
SELECT 'TXT_KEY_CULTURED_NEUTRAL_BONUS', 					'[COLOR:210:90:195:255]Patronage (Cultured Neutral):[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_CULTURED_HOSTILE_BONUS', 					'[COLOR:130:30:115:255]Recluse Court (Cultured Hostile):[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_BONUS', 						'[COLOR:25:110:250:255]Center of Faith (Religious):[ENDCOLOR][NEWLINE][ICON_BULLET]has a Holy Site nearby[NEWLINE][ICON_BULLET]+33% [ICON_PEACE] Religious Pressure[NEWLINE][ICON_BULLET]+3 [ICON_FOOD], +3 [ICON_GOLD] and +3 [ICON_CULTURE] from Mountains and Atolls[NEWLINE][ICON_BULLET]+10 [ICON_STRENGTH] Defense and +50 City HP[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]-5 [ICON_WAR] Military Supply Cap[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]-25% [ICON_WAR] Supply Cap from [ICON_CITIZEN][ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_FRIENDLY_BONUS', 					'[COLOR:160:220:250:255]Open Mind (Religious Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET]1% Chance for spawning a [ICON_MISSIONARY] Missionary inside Friends'' Territory[NEWLINE][ICON_BULLET]-25% [ICON_PEACE] Conversion Resistance[NEWLINE][ICON_BULLET]+2 [ICON_CULTURE] per incoming [ICON_INTERNATIONAL_TRADE] Trade Route'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_NEUTRAL_BONUS', 					'[COLOR:105:155:230:255]Medicant Orders (Religious Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET]+10% [ICON_PEACE] Conversion Resistance[NEWLINE][ICON_BULLET]+5 [ICON_PRODUCTION] for every World Religion that has at least one Follower in this City-State[NEWLINE][ICON_BULLET]+1 [ICON_FOOD] to Rivers and +2 [ICON_FOOD] to Lakes'  UNION ALL
SELECT 'TXT_KEY_RELIGIOUS_HOSTILE_BONUS', 					'[COLOR:25:110:170:255]One Truth (Religious Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET]+25% [ICON_PEACE] Conversion Resistance[NEWLINE][ICON_BULLET]+25% [ICON_PEACE] Religious Pressure[NEWLINE][ICON_BULLET]10 [ICON_CULTURE] on Unit''s Death'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_BONUS', 					'[COLOR:245:40:40:255]Fortress (Militaristic):[ENDCOLOR][NEWLINE][ICON_BULLET]has a Fort and an additional Strategic Resource nearby[NEWLINE][ICON_BULLET]can train its Unique Unit[NEWLINE][ICON_BULLET]Player can upgrade his units inside their territory if Allied[NEWLINE][ICON_BULLET]+3 [ICON_WAR] Military Supply Cap[NEWLINE][ICON_BULLET]+10% [ICON_PRODUCTION] towards all Military Units[NEWLINE][ICON_BULLET][COLOR_NEGATIVE_TEXT]-33% [ICON_FOOD] Growth[ENDCOLOR]'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_FRIENDLY_BONUS', 				'[COLOR:255:180:180:255]Mercenary Hub (Militaristic Friendly):[ENDCOLOR][NEWLINE][ICON_BULLET]+1% Rate of Unit Gifts to its Friends[NEWLINE][ICON_BULLET]All Military Units gain 30 XP when trained in this City-State'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_NEUTRAL_BONUS', 				'[COLOR:245:90:90:255]Sellsword Army (Militaristic Neutral):[ENDCOLOR][NEWLINE][ICON_BULLET]+50% [ICON_WAR] Military Supply Cap from [ICON_CITIZEN][NEWLINE][ICON_BULLET]+20% XP gained from Combat for units trained in this City-State[NEWLINE][ICON_BULLET]All Military Units gain 10 XP when trained in this City-State'  UNION ALL
SELECT 'TXT_KEY_MILITARISTIC_HOSTILE_BONUS', 				'[COLOR:170:10:10:255]Hermit Dragon (Militaristic Hostile):[ENDCOLOR][NEWLINE][ICON_BULLET]+100% [ICON_WAR] Military Supply Cap from [ICON_CITIZEN][NEWLINE][ICON_BULLET]+33% [ICON_PRODUCTION] towards all Military Units'  UNION ALL
-- main definitions
SELECT 'TXT_KEY_CITYSTATE_CLERMONT', 					'Clermont' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CLERMONT_ADJ', 					'The Clermont' UNION ALL
SELECT 'TXT_KEY_CIV5_CLERMONT_TEXT', 						'Clermont was the starting point of the First Crusade, in which Christendom sought to free Jerusalem from Muslim domination: Pope Urban II preached the crusade in 1095 at the Second Council of Clermont.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONDURAS', 					'Tegucigalpa' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_HONDURAS_ADJ', 					'Honduran' UNION ALL
SELECT 'TXT_KEY_CIV5_HONDURAS_TEXT', 						'Honduras was home to several Mesoamerican cultures before the Spanish took over in the 16th century. Honduras became independent in 1821 and has since been a republic. However the republic remains a figure of a banana republic where their government encouraged developments from foreign investors which these developments came out with bananas.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AUCKLAND', 					'Parihaka' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AUCKLAND_ADJ', 					'the Maori' UNION ALL
SELECT 'TXT_KEY_CIV5_AUCKLAND_TEXT', 						'When the Maori settled upon an isthmus in what is now northern New Zealand, they found the surrounding landscape full of fertile land, lush jungle, and dormant volcanos. Protected natural harbors on either side of the isthmus offered plentiful fishing and a base for war canoes (''waka taua''). The settlers named it ''Tamaki Makaurau''—roughly translating to "the maiden sought by a hundred lovers."' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ARMAGH', 						'Armagh' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ARMAGH_ADJ', 						'The Armagh' UNION ALL
SELECT 'TXT_KEY_CIV5_ARMAGH_TEXT', 							'The Irish town of Armagh has long known religion. Thought to have been a worship site for ancient pagans, it gained prominence in the 5th Century when Saint Patrick, a Christian missionary, constructed and consecrated a stone church on the summit of a hill. Around that sprang a monastery, and then a town devoted to spreading Christianity throughout Ireland—a beachhead of theology.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUSCAT', 						'Muscat' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUSCAT_ADJ', 						'The Muscat' UNION ALL
SELECT 'TXT_KEY_CIV5_MUSCAT_TEXT', 							'The trade flowing through Muscat has been its lifeblood for at least two millennia. Nestled against the foothillls of the Al Hajar mountains, Ptolemy called it the Hidden Port (''Cryptus Portus'') as early as the 1st Century. Unfortunately the city was not hidden well enough—its prime location at the mouth of the Persian Gulf has long since made it a tempting target for conquest.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GRANADA', 					'Granada' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GRANADA_ADJ', 					'The Granada' UNION ALL
SELECT 'TXT_KEY_CIV5_GRANADA_TEXT', 						'In the 8th Century the Umayyad Caliphate spread through the Iberian Peninsula, rapidly conquering Visigothic Hispania. Granada, a fortified settlement in what is now southern Spain, was swept up in the invasion. In time to come (the late 15th Century, to be exact) its surrender to the Catholic Monarchs (''Los Reyes Católicos'') would end the Reconquista of Andalusia—but for three quarters of a millennium, Granada belonged to the Moors.
Located at the base of the Sierra Nevada range, Granada had the misfortune of being nearly indefensible due to its location on a low-lying plain. Its Moorish rulers quickly realized this and transferred their seat of power to the more defensible foothills overlooking the town. Part of their plans involved the building of alcazars, one of which would in later years be renovated into the beautiful Alhambra.
Granada''s Moorish masters shifted through the centuries. The Almohad replaced the Almoravids, who had themselves succeeded the remnants of the Umayyad. The city''s fortunes changed again in the 13th Century with the Nasrid dynasty, whose alliance with the Catholic kingdom of Castile led to the Emirate of Granada. Direct access to trade centers in sub-Saharan Africa bought Granada freedom from the Reconquista—for a time.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NANMANDOL', 					'Leluh' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NANMANDOL_ADJ', 					'The Leluh' UNION ALL
SELECT 'TXT_KEY_CIV5_NANMANDOL_TEXT', 						'Leluh is a major prehistoric and historic archaeological site. The remains are those of a civilization that peaked around the 14th and 15th centuries, with elements still visible at the time of European contact in the early 19th century. The rulers of Leluh gradually conquered and thus unified the island of Kosrae. From the capital at Leluh, they ruled the island with a monarchy that archaeologists believe was similar to the kingdoms of Tonga or Hawaii.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GWYNEDD', 					'Aberffraw' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_GWYNEDD_ADJ', 					'Welsh' UNION ALL
SELECT 'TXT_KEY_CIV5_GWYNEDD_TEXT', 						'Gwynedd was an independent Welsh kingdom from the end of the Roman period until the 13th century, when it was conquered by England.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUISCA', 						'Suamox' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUISCA_ADJ', 						'Muiscan' UNION ALL
SELECT 'TXT_KEY_CIV5_MUISCA_TEXT', 							'Muisca was home to several Andean cultures such as the Panche in the west, Muzo in the northwest, Guane in the north, Lache in the northeast, Achagua in the east, and Sutagao in the south until the 16th century where Spanish Conquistadors laid ruin to them.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LACONIA', 					'Sparta' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LACONIA_ADJ', 					'Spartans' UNION ALL
SELECT 'TXT_KEY_CIV5_LACONIA_TEXT', 						'Considered a region of its city-state capital, Sparta, Laconia became one of the strongest local powers to contest control in the Peloponnese region.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CHEVAK', 						'Chevak' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CHEVAK_ADJ', 						'The Chevak' UNION ALL
SELECT 'TXT_KEY_CIV5_CHEVAK_TEXT', 							'An area in Alaska native to the Chevak people.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANTO_DOMINGO', 				'Santo Domingo' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SANTO_DOMINGO_ADJ', 				'Dominican' UNION ALL
SELECT 'TXT_KEY_CIV5_SANTO_DOMINGO_TEXT', 					'Santo Domingo became the oldest European city in the Americas continent. Originally named La Nueva Isabela, it was renamed in 1495 to ''Santo Domingo'', in honor of Saint Dominic. Santo Domingo came to be known as the ''Gateway to the Caribbean'' as the city grew bigger and prosperous.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MANAGUA', 					'Managua' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MANAGUA_ADJ', 					'Managuense' UNION ALL
SELECT 'TXT_KEY_CIV5_MANAGUA_TEXT', 						'Managua composed of mestizos and whites of Spanish decent, the city became from a fishing town to a thriving Spanish to now being the most well-known Central American developed city.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ODENSO', 						'Helsinki' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ODENSO_ADJ', 						'Finnish' UNION ALL
SELECT 'TXT_KEY_CIV5_ODENSO_TEXT', 							'Translated literally as Odin''s Island, it was named by the Finnish Kingdom in recognition to a Norse Mythologial God, Odin.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_YANGCHENG', 					'Yangcheng' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_YANGCHENG_ADJ', 					'The Yangcheng' UNION ALL
SELECT 'TXT_KEY_CIV5_YANGCHENG_TEXT', 						'Considered the first capital of the Xia Dynasty, it was built upon the Yin River and held until the fall of their dynasty.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PHANOTEUS', 					'Phanoteus' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_PHANOTEUS_ADJ', 					'Phocisan' UNION ALL
SELECT 'TXT_KEY_CIV5_PHANOTEUS_TEXT', 						'Phanoteus was a very ancient town, originally inhabited by the Phlegyae. It is believed that Promethesus made the human race here. It held until damaged and damaged until destroyed in the passage of time by the Persians under Xerxes, Macedonians under Philip II, and the Romans under Pompey the Great.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DOUALA', 						'Douala' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DOUALA_ADJ', 						'The Douala' UNION ALL
SELECT 'TXT_KEY_CIV5_DOUALA_TEXT', 							'Douala is the largest city in Cameroon along as its city with the strongest economic growth in the region. Cameroon independence in 1960 gave rise to the strong rapid economic growth of Douala as its economic importance became critical to develop and prosper.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AMBRACIA', 					'Ambracia' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_AMBRACIA_ADJ', 					'Ambracian' UNION ALL
SELECT 'TXT_KEY_CIV5_AMBRACIA_TEXT', 						'Ambracia is a city among Ancient Greece history that was gifted by Macedonian ruler Cassander to Pyrrhus, king of Epirus' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DJIBOUTI', 					'Djibouti' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DJIBOUTI_ADJ', 					'Djiboutian' UNION ALL
SELECT 'TXT_KEY_CIV5_DJIBOUTI_TEXT', 						'Djibouti was a region that originally was uninhabited coast until settled as Obock under French control. It was renamed and also became the capital of its respective named country after its independence from France.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DODOMA', 						'Dar es Salaam' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DODOMA_ADJ', 						'Dar es Salaam' UNION ALL
SELECT 'TXT_KEY_CIV5_DODOMA_TEXT', 							'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_FAYA', 						'Faya' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_FAYA_ADJ', 						'The Faya' UNION ALL
SELECT 'TXT_KEY_CIV5_FAYA_TEXT', 							'Faya is a tropical hot region that boast its large population in modern northern Chad.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KIGALI', 						'Kigali' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KIGALI_ADJ', 						'Kigalian' UNION ALL
SELECT 'TXT_KEY_CIV5_KIGALI_TEXT', 							'Kigali is the capital city of Rwanda being initially developed by the Kingdom of Rwanda in the 14th century, and has been its historical capital in modern times.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LEVUKA', 						'Levuka' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_LEVUKA_ADJ', 						'Fijian' UNION ALL
SELECT 'TXT_KEY_CIV5_LEVUKA_TEXT', 							'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_QUELIMANE', 					'Quelimane' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_QUELIMANE_ADJ', 					'Quelimanean' UNION ALL
SELECT 'TXT_KEY_CIV5_QUELIMANE_TEXT', 						'Quelimane is a region extremely vulnerable to flooding. Founded as a Swahili trading post, it developed into a prosperous seaport.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SIERRA_LEONE', 				'Freetown' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SIERRA_LEONE_ADJ', 				'Sierra Leonean' UNION ALL
SELECT 'TXT_KEY_CIV5_SIERRA_LEONE_TEXT', 					'Freetown is a diverse region of deserts and wetlands. Founded under British control, it was given its independence and boast its religious tolerance compared to its neighbor.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SURREY', 						'Brooklands' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SURREY_ADJ', 						'The Surreys' UNION ALL
SELECT 'TXT_KEY_CIV5_SURREY_TEXT', 							'Surrey is a county in the south-east of the United Kingdoms. Known for its first usage as an airfield, the county became critical for its production of airplanes and aero testing.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TAIWAN', 						'Taipei' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TAIWAN_ADJ', 						'Taipei' UNION ALL
SELECT 'TXT_KEY_CIV5_TAIWAN_TEXT', 							'Taipei is the capital city of the Republic of China, and forms the cultural, political, and economic center of Taiwan. Prior to the establishment of the Kuomintang''s Chinese government in exile, Taipei was a minor provincial capital, situated along trade routes between China, Japan, and the Philippines. Much of the surrounding area continues to be inhabited by several Formosan indigenous groups, creating a rich cultural fabric distinct from mainland China''s domination by Han Chinese influence.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OC_EO', 						'Óc Eo' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_OC_EO_ADJ', 						'The Funan' UNION ALL
SELECT 'TXT_KEY_CIV5_OC_EO_TEXT', 							'Funan was an ancient state in Cambodia that arose in the 1st century ad and was incorporated into the state of Chenla in the 6th century. Funan (perhaps a Chinese transcription of pnom, “mountain”) was the first important Hinduized kingdom in southeast Asia. It covered portions of what are now Vietnam, Thailand, and Cambodia. Funan had trade relations with India as well as China, to whose emperor the people of Funan sent tribute between the 3rd and 6th centuries. [NEWLINE]Funan reached the apex of its power under the 3rd-century king Fan Shiman, also known as Srei Meara. Fan Shiman expanded his empire''s navy and improved the Funanese bureaucracy, creating a quasi-feudal pattern that left local customs and identities largely intact, particularly in the empire''s further reaches. Fan Shiman and his successors also sent ambassadors to China and India to regulate sea trade. The kingdom likely accelerated the process of Indianization of Southeast Asia. Later kingdoms of Southeast Asia such as Chenla may have emulated the Funanese court. The Funanese established a strong system of mercantilism and commercial monopolies that would become a pattern for empires in the region. [NEWLINE]Funan''s dependence on maritime trade is seen as a cause for the beginning of Funan''s downfall. Their coastal ports allowed trade with foreign regions that funnelled goods to the north and coastal populations. However, the shift in maritime trade to Sumatra, the rise in the Srivijaya trade empire, and the taking of trade routes all throughout Southeast Asia by China, leads to economic instability in the south, and forces politics and economy northward. Funan was superseded and absorbed in the 6th century by the Khmer polity of the Chenla Kingdom.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_THIMPHU', 					'Thimphu' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_THIMPHU_ADJ', 					'Thimphu' UNION ALL
SELECT 'TXT_KEY_CIV5_THIMPHU_TEXT', 						'Since 1955 Thimphu is the capital of the Kingdom of Bhutan, a landlocked country in South Asia at the eastern end of the Himalayas. It is bordered to the north by Tibet (China), and to the south, east, and west by India. Bhutan existed as a patchwork of minor warring fiefs until the early 17th century. At that time the lama and military leader Ngawang Namgyal, the first Zhabdrung Rinpoche, who was fleeing religious persecution in Tibet, unified the area and cultivated a distinct Bhutanese identity. In the early 20th century, Bhutan came into contact with the British Empire and retained strong bilateral relations with India upon its independence.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANDORRA', 					'Andorra' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ANDORRA_ADJ', 					'Andorran' UNION ALL
SELECT 'TXT_KEY_CIV5_ANDORRA_TEXT', 						'Lying on the southern slopes of the Pyrenees, the Principality of Andorra consists of a cluster of mountain valleys whose streams form the Valira River. Andorra’s independence is traditionally ascribed to Charlemagne, who recovered the region from the Muslims in 803 CE. It was placed under the joint suzerainty of the French counts of Foix and the Spanish bishops of Urgel in 1278, and it was subsequently governed jointly by the Spanish bishop of Urgel and the French head of state. This feudal system of government, the last in Europe, continued until 1993, when a constitution was adopted that transferred most of the coprinces’ powers to the Andorran General Council, which is elected by universal suffrage. Andorra has long had a strong affinity with Catalonia; its institutions are based in Catalonian law, and it is part of the diocese of Urgel (Spain). The traditional economy was based on sheep raising, but tourism grew in importance since the 1950s and became central to Andorra’s economy by the early 21st century.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CANOSSA', 					'Canossa' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_CANOSSA_ADJ', 					'Canossan' UNION ALL
SELECT 'TXT_KEY_CIV5_CANOSSA_TEXT', 						'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BEDULU', 						'Bedulu' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BEDULU_ADJ', 						'Bali' UNION ALL
SELECT 'TXT_KEY_CIV5_BEDULU_TEXT', 							'Known as "the island of a thousand temples", Bali and its history are steeped in culture and religion, being one of the last bastions of Hinduism in Indonesia. Bali was inhabited around 2000 BCE by Austronesian people who migrated originally from Southeast Asia and Oceania through Maritime Southeast Asia. Culturally and linguistically, the Balinese are closely related to the people of the Indonesian archipelago, Malaysia, the Philippines and Oceania. Stone tools dating from this time have been found near the village of Cekik in the island''s west. Inscriptions from 896 and 911 do not mention a king, until 914, when Sri Kesarivarma is mentioned. They also reveal an independent Bali, with a distinct dialect, where Buddhism and Shivaism were practiced simultaneously. Mpu Sindok''s great-granddaughter, Mahendradatta, married the Bali king Udayana Warmadewa around 989, giving birth to Airlangga around 1001. This marriage also brought more Hinduism and Javanese culture to Bali. Princess Sakalendukirana appeared in 1098. Suradhipa reigned from 1115 to 1119, and Jayasakti from 1146 until 1150. Jayapangus appears on inscriptions between 1178 and 1181, while Adikuntiketana and his son Paramesvara in 1204.[NEWLINE][NEWLINE]Balinese culture was strongly influenced by Indian, Chinese, and particularly Hindu culture, beginning around the 1st century AD. The name Bali dwipa ("Bali island") has been discovered from various inscriptions, including the Blanjong pillar inscription written by Sri Kesari Warmadewa in 914 and mentioning Walidwipa. It was during this time that the people developed their complex irrigation system, locally called subak, to grow rice in wet-field cultivation. Some religious and cultural traditions still practiced today can be traced to this period.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DALI', 						'Dali' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DALI_ADJ', 						'Dali' UNION ALL
SELECT 'TXT_KEY_CIV5_DALI_TEXT', 							'The Kingdom of Dali, which meant "the great truth" or "the great administration", was a buddhist kingdom that played a vital role in south-east asia for nearly three centuries, from the 10th to the 13th century. It was a kingdom of piety, of many temples and giant stone pagodas, and was composed not of a homogeneous people but of many people and many tribes, the largest of which being the Bai and Yi. The Dali kingdom was notable for its influence in preserving and spreading Buddhism. The royal Duan clan, like that of their Nanzhao predecessors before them were devout Buddhists, and they constructed large Buddhist temples around Dali and on the Shibaoshan Mountain. These soon became centers for Buddhist teaching. Here the Kings attempted to model themselves on the models of the Buddhist- divine kings of the nearby South East Asian kingdoms.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MULTAN', 						'Multan' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MULTAN_ADJ', 						'Ghaznavid' UNION ALL
SELECT 'TXT_KEY_CIV5_MULTAN_TEXT', 							'Multan is a city in the Punjab Province of Pakistan, and capital of Multan District. It is located in the southern part of the province, and is steeped in history. It has a population of over 3.8 million (according to 1998 census), making it the sixth largest city in Pakistan. It is built just east of the Chenab River, more or less in the geographic center of the country and about 966 km from Karachi. Multan is known as the "City of Pirs and Shrines", and is a prosperous city of bazaars, mosques and superbly designed tombs. The Multan International Airport connects flights to major cities in Pakistan and to cities in the Persian Gulf. The city''s industries include metal working, flour, sugar, oil milling, textiles manufacturing, fertilizer, soap, and glass. Multan is also known for its handicrafts, especially pottery and enamel work. One of the subcontinent''s oldest cities, Multan derives its name from an idol in the temple of the sun god, a shrine of the pre-Muslim period. The city was conquered (c.326 BC) by Alexander the Great , visited (AD 641) by the Chinese Buddhist scholar Hsüan-tsang, taken (8th cent.) by the Arabs, and captured by Muslim Turkish conqueror Mahmud of Ghazna in 1005 and by Timur in 1398. In the 16th and 17th century, Multan enjoyed peace under the rule of Mughal emperors. In 1818, the city was seized by Ranjit Singh, leader of the Sikhs. The British held it from 1848 until Pakistan achieved independence in 1947. Landmarks include an old fort containing the 14th-century tombs of two Muslim saints.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BAGAN', 						'Pagan' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_BAGAN_ADJ', 						'Burmese' UNION ALL
SELECT 'TXT_KEY_CIV5_BAGAN_TEXT', 							'The kingdom grew out of a small 9th-century settlement at Pagan (present-day Bagan) by the Mranma/Burmans, who had recently entered the Irrawaddy valley from the Kingdom of Nanzhao. Over the next two hundred years, the small principality gradually grew to absorb its surrounding regions until the 1050s and 1060s when King Anawrahta founded the Pagan Empire, for the first time unifying under one polity the Irrawaddy valley and its periphery. By the late 12th century, Anawrahta''s successors had extended their influence farther to the south into the upper Malay peninsula, to the east at least to the Salween river, in the farther north to below the current China border, and to the west, in northern Arakan and the Chin Hills. In the 12th and 13th centuries, Pagan, alongside the Khmer Empire, was one of two main empires in mainland Southeast Asia. The kingdom went into decline in the mid-13th century as the continuous growth of tax-free religious wealth by the 1280s had severely affected the crown''s ability to retain the loyalty of courtiers and military servicemen. This ushered in a vicious circle of internal disorders and external challenges by the Arakanese, Mons, Mongols and Shans. Repeated Mongol invasions (1277–1301) toppled the four-century-old kingdom in 1287. The collapse was followed by 250 years of political fragmentation that lasted well into the 16th century.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_RISHIKESH', 					'Rishikesh' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_RISHIKESH_ADJ', 					'Garhwal' UNION ALL
SELECT 'TXT_KEY_CIV5_RISHIKESH_TEXT', 						'Known as the "Gateway to the Garhwal Himalayas" and "Yoga Capital of the World", Rishikesh, also spelt as Hrishikesh, is a city near Dehradun in Dehradun district of the Indian state Uttarakhand. It is situated on the right bank of the Ganges River and is a pilgrimage town for Hindus, with ancient sages and saints meditating here in search of higher knowledge. There are numerous temples and ashrams built along the banks of the river.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUTITJULU', 					'Mutitjulu' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_MUTITJULU_ADJ', 					'Anangu' UNION ALL
SELECT 'TXT_KEY_CIV5_MUTITJULU_TEXT', 						'"Anangu" is an umbrella term that describes several Australian Aboriginal groups who speak Western Desert languages; the term is most prominently used by the Pitjantjatjara and the Yankunytjatjara. The Western Desert languages have been described as covering more of Australia''s area than any other indigenous language. Uluru and Kata Tjuta are sacred sites in the Anangu belief system, with eleven songlines passing through or near them. In 1979, the indigenous Central Land Council began a legal battle to lay claim to the Uluru-Kata Tjuta National Park; in 1985, the resulting settlement plan was implemented, which granted the Anangu a majority of the park''s Board of Management but still allowed tourists to visit the park.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISKANWAYA', 					'Iskanwaya' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ISKANWAYA_ADJ', 					'Kallawaya' UNION ALL
SELECT 'TXT_KEY_CIV5_ISKANWAYA_TEXT', 						'Iskanwaya is a pre-Columbian sacred site, situated on a mountain ridge above the Llica River in Bolivia, 325 km north of La Paz. In its extension and its age Iskanwaya surpasses Machu Picchu in Peru, but it is less well preserved. The Iskanwaya ruins go back to the Mollo culture which predated the Inca civilization and whose people presumably built the constructions as early as 800 BC or in their prime cultural period from 1145 to 1425.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TIWANAKU', 					'Tiwanaku' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_TIWANAKU_ADJ', 					'Tiwanaku' UNION ALL
SELECT 'TXT_KEY_CIV5_TIWANAKU_TEXT', 						'Tiwanaku (Spanish: Tiahuanaco and Tiahuanacu) is a Pre-Columbian archaeological site in western Bolivia, South America. It is the capital of an empire that extended into present-day Peru and Chile, flourishing from AD 300 to AD 1000. Tiwanaku is recognized by Andean scholars as one of the most important civilizations prior to the Inca Empire; it was the ritual and administrative capital of a major state power for approximately five hundred years. The ruins of the ancient city state are near the south-eastern shore of Lake Titicaca in the La Paz Department, Ingavi Province, Tiwanaku Municipality, about 72 km (45 mi) west of La Paz.49 while searching for the Inca capital Qullasuyu.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DANO', 						'Dano' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_DANO_ADJ', 						'Dagara' UNION ALL
SELECT 'TXT_KEY_CIV5_DANO_TEXT', 							'TODO' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARYES', 						'Karyes' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_KARYES_ADJ', 						'Athonite' UNION ALL
SELECT 'TXT_KEY_CIV5_KARYES_TEXT', 							'The monastic community of Mount Athos is an Eastern Orthodox community of monks in Greece who hold the status of an autonomous region as well as the combined rights of a decentralized administration, a region and a municipality, with a territory encompassing the distal part of the Athos peninsula including Mount Athos. The bordering proximal part of the peninsula belongs to the regular Aristotelis community in Central Macedonia. Organized monastic life began there in 963, when St. Athanasius the Athonite founded the first monastery. By 1400 there were 40 monasteries. Long regarded as the holy mountain of the Greek Orthodox Church, it was declared a theocratic republic in 1927. The Athonite monasteries feature a rich collection of well-preserved artifacts, rare books, ancient documents, and artworks of immense historical value, and Mount Athos has been listed as a World Heritage Site since 1988.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SGAANG', 						'SGang Gwaay' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_SGAANG_ADJ', 						'Haida' UNION ALL
SELECT 'TXT_KEY_CIV5_SGAANG_TEXT', 							'One of the many indigenous tribes of North America, the Haida stand apart as an island people. Related to the Tlingit and Tsimshian peoples, Haida society was organised around a clan system with stratified ranks of noble, commoner and slave. There were two major clans, determined through the maternal line. These clans were then subdivided into lineages. The Haida are especially talented woodworkers, weavers and sailors; they have been credited with the first use of the totem pole. While their maritime behaviour lead them to establish many peaceful trade routes with the colonialists, locally they were feared warriors who practised slavery. For this reason they have often been called "the Vikings of North America". Today the Haida reserves on the main island of Haida Gawaii have banded together to create the Council of the Haida Nation. They are experiencing a cultural resurgence.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NYARYANA_MARQ', 				'Nyar''yana Marq' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_NYARYANA_MARQ_ADJ', 				'Nenet' UNION ALL
SELECT 'TXT_KEY_CIV5_NYARYANA_MARQ_TEXT', 					'The Nenets, also known as the Samoyeds, are an indigenous people in northern arctic Russia. According to the latest census in 2010, there are 44,857 Nenets in the Russian Federation, most of them living in the Yamalo-Nenets Autonomous Okrug and Nenets Autonomous Okrug. They speak either the Tundra or Forest varieties of Nenets. The literal morphs samo and yed in Russian convey the meaning "self-eater", which appears as derogatory. Therefore, the name Samoyed quickly went out of usage in the 20th century, and the people bear the name of Nenets, which means "man".' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ADEJE', 						'Adeje' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_ADEJE_ADJ', 						'Guanche' UNION ALL
SELECT 'TXT_KEY_CIV5_ADEJE_TEXT', 							'The Guanches were the indigenous inhabitants of the Canary Islands in the Atlantic Ocean some 100 kilometres (60 mi) west of the North African coast. They spoke the Guanche language, which went extinct in the 17th century and is believed to have been related to Berber languages. It is believed that they may have arrived on the archipelago some time in the first millennium BC. The Guanches were the only native people known to have lived in the Macaronesian archipelago region before the arrival of Europeans, as there is no accepted evidence that the other Macaronesian archipelagos (the Cape Verde Islands, Madeira and the Azores) were inhabited. After the Spanish conquest of the Canaries starting in the early 15th century, many natives were wiped out by the Spanish conquerors while the rest assimilated over time into the settler population and culture, although elements of their original culture survive within Canarian customs and traditions, such as Silbo (the whistled language of La Gomera Island), as well as some lexicon of Canarian Spanish. Some scholars have classified the destruction of the Guanche people and culture as an early example of colonial genocide. In 2017, the first genome-wide data from the Guanches confirmed a North African origin and that they were genetically most similar to ancient North African Berber peoples of the nearby North African mainland.' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_WOOTEI_NIICIE', 				'Wootei-niicie' UNION ALL
SELECT 'TXT_KEY_CITYSTATE_WOOTEI_NIICIE_ADJ', 				'Arapaho' UNION ALL
SELECT 'TXT_KEY_CIV5_WOOTEI_NIICIE_TEXT', 					'Around 3,000 years ago, the ancestral Arapaho-speaking people, the Heeteinono''eino'' lived in the western Great Lakes region along the Red River Valley in what is classified as present-day Manitoba, Canada and Minnesota, United States. There the Arapaho were an agricultural people who grew crops, including maize. Following European colonization in eastern Canada, together with the early Cheyenne people, the Hitesiino'', the Arapaho were forced to migrate westward onto the eastern Great Plains by the Ojibwe. They were numerous and powerful, having obtained guns from their French trading allies. The ancestors of the Arapaho people entered the Great Plains the western Great Lakes region sometime before 1700. During their early history on the plains, the Arapaho lived on the northern plains from the South Saskatchewan River in Canada south to Montana, Wyoming, and western South Dakota. Before the Arapaho acquired horses, they used domestic dogs as pack animals to pull their travois. The Arapaho acquired horses in the early 1700s from other tribes, which changed their way of life. They became a nomadic people, using the horses as pack and riding animals. They could transport greater loads and travel more easily by horseback to hunt more easily and widely, increasing their success in hunting on the Plains. Gradually, the Arapaho moved farther south, split into the closely allied Northern and Southern Arapaho, and established a large joint territory spanning land in southern Montana, most of Wyoming, the Nebraska Panhandle, central and eastern Colorado, western Oklahoma, and extreme western Kansas.' UNION ALL
-- abilities
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ADEJE', 				'[COLOR_MAGENTA]Benesmer:[ENDCOLOR] Player can place a [ICON_RES_DOGO_CANARIO] [COLOR_GREY]Dogo Canario[ENDCOLOR] resource on hills (not adjacent) increasing [ICON_FOOD] Food, [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, [ICON_CULTURE] Culture and [ICON_PEACE] Faith output.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ALMATY', 				'[COLOR_MAGENTA]Almatu:[ENDCOLOR] [ICON_TRADE] City Connections and International [ICON_CARAVAN] Land Trade Routes generate +1 [ICON_RESEARCH] Science. Player gains +1 [ICON_INFLUENCE] Influence per turn with Afraid [ICON_CITY_STATE] City-States.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AMBRACIA', 			'[COLOR_MAGENTA]Pyrrhic War:[ENDCOLOR] +10% [ICON_WAR] Militaristic [ICON_CITY_STATE] City-State Gift Rate. [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Mercenaries of Pyrrhus[ENDCOLOR] promotion (Unit gains +5% [ICON_PRODUCTION], if it [COLOR:255:230:85:255]is Garrisoned on Land[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 			'[COLOR_MAGENTA]Pyrenean Paréage:[ENDCOLOR] +1 [ICON_TOURISM] Tourism for every [COLOR_CITY_BLUE]Mountain[ENDCOLOR] tile within their workable radius. -10% [ICON_HAPPINESS_3] Boredom in Cities with [COLOR_CITY_BLUE]Mountains[ENDCOLOR] nearby.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANTANANARIVO', 		'[COLOR_MAGENTA]Libertalia:[ENDCOLOR] Player can see all Barbarian Encampments. Units gain [COLOR_WATER_TEXT]Pirate Haven[ENDCOLOR] promotion (Unit gains [ICON_GOLD] [COLOR:255:230:85:255]on Kill[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 			'[COLOR_MAGENTA]Economic Prominence:[ENDCOLOR] Merchants gain +1 [ICON_GOLD] Gold. -10% [ICON_GOLD] Gold Purchase Cost.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ARMAGH', 				'[COLOR_MAGENTA]Patron of Saints:[ENDCOLOR] Player can purchase [COLOR_YIELD_FOOD]Irish Saints[ENDCOLOR] (as buildings) with [ICON_PEACE] Faith (requires a Majority Religion). Saints help with [ICON_HAPPINESS_1] Happiness management and provide some yields. You can choose only one Saint out of four possible in each City.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_AUCKLAND', 			'[COLOR_MAGENTA]City of Sails:[ENDCOLOR] Coastal Cities gain +3 [ICON_FOOD] Food. [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Peaceful Resistance[ENDCOLOR] promotion (Unit generates [ICON_FOOD] and [ICON_GOLDEN_AGE], if it [COLOR:255:230:85:255]is Garrisoned on Land[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BAGAN', 				'[COLOR_MAGENTA]Land of Thousand Pagodas:[ENDCOLOR] [COLOR_YIELD_FOOD]Temples[ENDCOLOR] gain +1 [ICON_HAPPINESS_1] Happiness. Building construction grants 10 [ICON_PEACE] Faith.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BEDULU', 				'[COLOR_MAGENTA]Isle of Gods:[ENDCOLOR] [COLOR_GREY]Sea Resources[ENDCOLOR] gain +1 [ICON_PEACE] Faith. Cities gain +1 [ICON_PEACE] Faith for every 2 worked [COLOR_CITY_GREEN]Jungle[ENDCOLOR] tiles.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 			'[COLOR_MAGENTA]Balkan Powder Keg:[ENDCOLOR] Cities gain +10% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Siege Units[ENDCOLOR]. [COLOR_YIELD_GOLD]Siege Units[ENDCOLOR] gain [COLOR_WATER_TEXT]The White Fortress[ENDCOLOR] promotion (+25[ICON_PLUS]Total HP).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BOGOTA', 				'[COLOR_MAGENTA]United Independence:[ENDCOLOR] Capturing a City grants 30 [ICON_CULTURE] Culture, scaling with Era. Liberating a City grants 20-30 [ICON_CULTURE] Culture, scaling with Era and owned Cities (caps at 6 Cities).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BRATISLAVA', 			'[COLOR_MAGENTA]Heart of Slavic Culture:[ENDCOLOR] [COLOR_YIELD_FOOD]Guilds[ENDCOLOR] gain +2 [ICON_CULTURE] Culture and +1 [ICON_TOURISM] Tourism.  When you are Allied with a [ICON_CITY_STATE] City-State, a random [ICON_GREAT_PEOPLE] [COLOR_CITY_GOLD]Great Person[ENDCOLOR] is given every couple of turns.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BRUSSELS', 			'[COLOR_MAGENTA]Home of the Marsh:[ENDCOLOR] [COLOR_CITY_GREEN]Marshes[ENDCOLOR] gain +1 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture. Player can build [COLOR_CITY_GREEN]Marshes[ENDCOLOR] (+1 [ICON_FOOD] Food) on coastal tiles.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUCHAREST', 			'[COLOR_MAGENTA]Curtea Veche:[ENDCOLOR] [ICON_GREAT_WORK] Great Works gain +1 [ICON_CULTURE] Culture. Player gains +25% [ICON_TOURISM] Tourism from Historic Events.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUDAPEST', 			'[COLOR_MAGENTA]Pearl of Danube:[ENDCOLOR] [ICON_RES_HORSE] [COLOR_GREY]Horses[ENDCOLOR] gain +1 [ICON_GOLDEN_AGE] Golden Age Point. Player receives +5 [ICON_RES_HORSE] [COLOR_GREY]Horses[ENDCOLOR] (can be traded and they are counted toward Monopolies).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BUENOS_AIRES', 		'[COLOR_MAGENTA]Vox Populi:[ENDCOLOR] +1 [ICON_HAPPINESS_1] Happiness per each unique owned [COLOR_GREY]Luxury Resource[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 				'[COLOR_MAGENTA]Byblos Cedar:[ENDCOLOR] [COLOR_CITY_BROWN]Fishing Boats[ENDCOLOR] gain +1 [ICON_FOOD] Food. Cities gain +5% [ICON_PRODUCTION] Production towards [ICON_WONDER] World Wonders and all Naval Units.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CAHOKIA', 			'[COLOR_MAGENTA]Monks Mound:[ENDCOLOR] Player can build a [COLOR_CITY_BROWN]Mound[ENDCOLOR] improvement (not adjacent) increasing [ICON_GOLD] Gold, [ICON_RESEARCH] Science, [ICON_PEACE] Faith, [ICON_GOLDEN_AGE] Golden Age Point and [ICON_GREAT_GENERAL] Great General Point output. Units gain +15% [ICON_STRENGTH] Defensive CS, when on a [COLOR_CITY_BROWN]Mound[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 			'[COLOR_MAGENTA]Ardent Flame in Pious Heart:[ENDCOLOR] [COLOR_YIELD_GOLD]Civil Servants[ENDCOLOR] gain +1 [ICON_PEACE] Faith. +1 [ICON_DIPLOMAT] Great Diplomat Point, if City has a [COLOR_YIELD_FOOD]Temple[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 			'[COLOR_MAGENTA]Cape of Good Hope:[ENDCOLOR] +10% [ICON_INTERNATIONAL_TRADE] Trade Route Maximum Range. Finishing a [ICON_INTERNATIONAL_TRADE] Trade Route grants 20-40 [ICON_GOLD] Gold, scaling up with the Destination City''s [ICON_CITIZEN] Population and down with the actual number of active [ICON_INTERNATIONAL_TRADE] Trade Routes.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 				'[COLOR_MAGENTA]Amellrutaq:[ENDCOLOR] +1 [ICON_FOOD] Food for every 3 worked [COLOR_CITY_BLUE]Tundra[ENDCOLOR] tiles, or 3 [COLOR_CITY_BLUE]Snow[ENDCOLOR] tiles within workable radius. Cities gain +10% [ICON_CULTURE_LOCAL] Border Growth Rate. Cities gain -1 [ICON_HAPPINESS_3] Unhappiness from Distress.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 			'[COLOR_MAGENTA]Crusader''s Zeal:[ENDCOLOR] Newly-produced [COLOR_YIELD_GOLD]Melee[ENDCOLOR] and [COLOR_YIELD_GOLD]Gunpowder Units[ENDCOLOR] gain a random promotion after their first combat (out of 6). [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Crusader''s Zeal[ENDCOLOR] promotion (+15% XP [COLOR:255:230:85:255]on Fight[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_COLOMBO', 			'[COLOR_MAGENTA]Home of Cinnamon:[ENDCOLOR] [COLOR_CITY_GREEN]Forests[ENDCOLOR] and [COLOR_CITY_GREEN]Jungles[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Player allied with [COLOR_CYAN]Colombo[ENDCOLOR] heals all his units by 10 HP each time the [ICON_INTERNATIONAL_TRADE] Trade Route originated from a City owned by that Player finishes.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DALI', 				'[COLOR_MAGENTA]Tea Horse Road:[ENDCOLOR] Player can purchase [ICON_CARAVAN] [COLOR_YIELD_GOLD]Caravans[ENDCOLOR] with [ICON_PEACE] Faith. All [ICON_INTERNATIONAL_TRADE] Trade Routes gain +10% [ICON_PEACE] Religious Presure.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DANO', 				'[COLOR_MAGENTA]Tendaalun:[ENDCOLOR] [COLOR_YIELD_FOOD]Shrines[ENDCOLOR] gain +2 [ICON_CULTURE_LOCAL] Border Growth Points. Border expansion grants 3 [ICON_PEACE] Faith, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DJIBOUTI', 			'[COLOR_MAGENTA]Urheimat:[ENDCOLOR] [COLOR_YIELD_FOOD]Granaries[ENDCOLOR] gain +1 [ICON_CULTURE] Culture. Cities gain +100% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Settlers[ENDCOLOR]. New Cities gain free [COLOR_YIELD_FOOD]Granary[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 				'[COLOR_MAGENTA]Abode of Peace:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] International Trade Routes grant +1 [ICON_GOLD] Gold to both: Origin and Destination City. International [ICON_CARGO] Sea Trade Routes generate +1 [ICON_TOURISM] Tourism. [COLOR_YIELD_GOLD]Civilian Naval Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Sail in the Wilderness[ENDCOLOR] promotion (+2[ICON_MOVES]Movement Point).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA', 				'[COLOR_MAGENTA]Minature Continent:[ENDCOLOR] +1 [ICON_INTERNATIONAL_TRADE] Trade Route. +10% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Trade Units[ENDCOLOR][NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_FAYA', 				'[COLOR_MAGENTA]Turbulent Independence:[ENDCOLOR] [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Spoils of War[ENDCOLOR] promotion (Unit gains [ICON_RESEARCH] [COLOR:255:230:85:255]on Kill[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_FLORENCE', 			'[COLOR_MAGENTA]Cradle of the Renaissance:[ENDCOLOR] [COLOR_CITY_BROWN]Quarries[ENDCOLOR] gain +1 [ICON_CULTURE] Culture. Artists gain +1 [ICON_GOLDEN_AGE] Golden Age Points. Player has 1% chance per turn of spawning the [ICON_GREAT_ARTIST] Great Artist or [ICON_GREAT_ENGINEER] Great Engineer in the Capital.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 				'[COLOR_MAGENTA]L''Escalade:[ENDCOLOR] Cities gain +3% [ICON_GREAT_PEOPLE] Great People Points. Birth of a [ICON_GREAT_PEOPLE] [COLOR_YIELD_GOLD]Great Person[ENDCOLOR] grants 25 [ICON_PEACE] Faith, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GENOA', 				'[COLOR_MAGENTA]La Superba:[ENDCOLOR] Birth of a [ICON_GREAT_PEOPLE] [COLOR_YIELD_GOLD]Great Person[ENDCOLOR] grants 50 [ICON_GOLD] Gold and 15 [ICON_GOLDEN_AGE] Golden Age Points, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GRANADA', 			'[COLOR_MAGENTA]Alcázars:[ENDCOLOR] [COLOR_CITY_BROWN]Forts[ENDCOLOR], [COLOR_CITY_BROWN]Citadels[ENDCOLOR] and [COLOR_CITY_BROWN]Pontoon Bridges[ENDCOLOR] gain +1 [ICON_GREAT_GENERAL] Great General Point. Player gains +10% [ICON_WAR] War Score.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_GWYNEDD', 			'[COLOR_MAGENTA]Cyfraith Hywel:[ENDCOLOR] +10% [ICON_CULTURE] Culture during the [ICON_HAPPINESS_1] WLTKD. +33% [ICON_HAPPINESS_1] WLTKD Length.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HANOI', 				'[COLOR_MAGENTA]Nine-tiered Hierarchy:[ENDCOLOR] Civil Servants gain +1 [ICON_GREAT_GENERAL] Great General Point and +1 [ICON_GREAT_ADMIRAL] Great Admiral Point. Military Units gain [COLOR_WATER_TEXT]Patriotism[ENDCOLOR] promotion (+10%[ICON_STRENGTH]CS [COLOR:255:230:85:255]inside Friendly Territory[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONDURAS', 			'[COLOR_MAGENTA]Banana Republic:[ENDCOLOR] Resources granted from [ICON_CITY_STATE] City-States count toward Global Monopolies (doesn''t stack with [COLOR_CYAN]Exchange Markets[ENDCOLOR] policy).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 			'[COLOR_MAGENTA]Prosperous:[ENDCOLOR] Cities gain +5% [ICON_FOOD] Growth and +1 [ICON_GOLD] Gold for every 6 [ICON_CITIZEN] Citizens. Each turn there''s a chance that 1 [ICON_CITIZEN] Citizen from 1 Player''s City will migrate to [COLOR_CYAN]Hong Kong[ENDCOLOR] granting 30 [ICON_INFLUENCE] Influence and 100-150 [ICON_GOLD] Gold, scaling with Era and current [ICON_INFLUENCE] Influence level with [COLOR_CYAN]Hong Kong[ENDCOLOR]. Chance of migration starts from 0%, if the City has equal [ICON_CITIZEN] Citizens to [COLOR_CYAN]Hong Kong[ENDCOLOR], and grows by 1% with each [ICON_CITIZEN] Citizen above that number.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_IFE', 				'[COLOR_MAGENTA]Ogbuni:[ENDCOLOR] Training or spawning a [COLOR_YIELD_GOLD]Diplomatic Unit[ENDCOLOR] grants 30 Faith, scaling with Era (doubled for [COLOR_YIELD_GOLD]Great Diplomat[ENDCOLOR]). [COLOR_YIELD_GOLD]Diplomatic Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Iwarefa[ENDCOLOR] promotion (+20 [ICON_INFLUENCE] Influence [COLOR:255:230:85:255]after Diplomatic Mission[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ISKANWAYA', 			'[COLOR_MAGENTA]Kallawaya Healers:[ENDCOLOR] [COLOR_YIELD_FOOD]Aqueducts[ENDCOLOR] gain +1 [ICON_PEACE] Faith. Units gain [COLOR_WATER_TEXT]Qolla Kapachayuh[ENDCOLOR] promotion (Unit [COLOR:255:230:85:255]Heals every turn[ENDCOLOR], if it [COLOR:255:230:85:255]is next to owned Missionary, Holy Site or Mountain[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_JERUSALEM', 			'[COLOR_MAGENTA]Holy Lands:[ENDCOLOR] [COLOR_CITY_BROWN]Holy Sites[ENDCOLOR] gain +1 [ICON_PEACE] Faith. [COLOR_CYAN]Jerusalem[ENDCOLOR] will adopt the Majority Religion of its Ally and gains at the same time permanent +100% Religious Pressure (stays on Capture). [COLOR_CYAN]Jerusalem[ENDCOLOR] has a religious pressure equal to a Holy City. When there''s a change of alliance, new Ally will gain a [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR] with [COLOR_CYAN]Jerusalem[ENDCOLOR], if the World Congress has been founded.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 				'[COLOR_MAGENTA]Paradise on Earth:[ENDCOLOR] Cities gain +0.66 [ICON_CULTURE] Culture for every [COLOR_CITY_BLUE]Mountain[ENDCOLOR] tile within their workable radius. [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Mujahideen[ENDCOLOR] promotion (+25%[ICON_STRENGTH]Defensive CS, if standing next to a Mountain).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KARYES', 				'[COLOR_MAGENTA]Monastic Republic:[ENDCOLOR] [COLOR_YIELD_GOLD]Land Civilian Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Climber of Mount Athos[ENDCOLOR] promotion (Unit [COLOR:255:230:85:255]can cross Mountains[ENDCOLOR]). Player can build a [COLOR_CITY_BROWN]Monastery[ENDCOLOR] improvement on hill (not adjacent) increasing [ICON_PRODUCTION] Production, [ICON_GOLD] Gold, [ICON_CULTURE] Culture and [ICON_PEACE] Faith output. +1 [ICON_DIPLOMAT] Great Diplomat Point and -10% [ICON_HAPPINESS_3] Religious Unrest in City, if there are at least 3 [COLOR_CITY_BROWN]Monasteries[ENDCOLOR] within their workable radius.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 			'[COLOR_MAGENTA]Gorkha Kingdom:[ENDCOLOR] Each [ICON_CITY_STATE] City-State Friend grants +1 [ICON_PEACE] Faith and each [ICON_CITY_STATE] City-State Ally grants +1 [ICON_GREAT_GENERAL] Great General Point to all Cities. Player can purchase [COLOR_YIELD_GOLD]Gurkha[ENDCOLOR] unit (unique [COLOR_YIELD_GOLD]Fusilier[ENDCOLOR]) with [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 				'[COLOR_MAGENTA]Stories of Old:[ENDCOLOR] Player can construct [COLOR_YIELD_FOOD]Bylina[ENDCOLOR] ([ICON_GREAT_MUSICIAN]). +5% [ICON_GREAT_MUSICIAN] Great Musicians generation.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 				'[COLOR_MAGENTA]Last True Rwabugiri:[ENDCOLOR] Border expansion grants +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold. Killing an Enemy Unit grants 5 [ICON_CULTURE_LOCAL] Border Growth Points in all Cities. -10% [ICON_WAR] War Weariness in the Empire.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 		'[COLOR_MAGENTA]Muddy Confluence:[ENDCOLOR] [COLOR_CITY_GREEN]River[ENDCOLOR] tiles gain +1 [ICON_GOLD] Gold. Building construction grants 20 [ICON_FOOD] Food. Birth of a [ICON_CITIZEN] Citizen grants 10 [ICON_CULTURE] Culture, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_KYZYL', 				'[COLOR_MAGENTA]Center of Asia:[ENDCOLOR] [COLOR_YIELD_FOOD]Palace[ENDCOLOR] and [COLOR_YIELD_FOOD]Monuments[ENDCOLOR] gain +1 [ICON_RESEARCH] Science. Researching a Technology grants 5-20 [ICON_PRODUCTION] Production in all Cities, scaling up with Era and down with the number of Cities (caps at 8 Cities).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LACONIA', 			'[COLOR_MAGENTA]Agoge:[ENDCOLOR] [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Spartan Discipline[ENDCOLOR] promotion (+15%[ICON_STRENGTH]CS if unit [COLOR:255:230:85:255]is adjacent to another Friendly Unit[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LA_VENTA', 			'[COLOR_MAGENTA]Ceremonial Creations:[ENDCOLOR] Player can build a [COLOR_CITY_BROWN]Colossal Head[ENDCOLOR] improvement on [COLOR_CITY_BLUE]Plains[ENDCOLOR] or [COLOR_CITY_BLUE]Grassland[ENDCOLOR] tiles with [COLOR_CITY_GREEN]Forest[ENDCOLOR] or [COLOR_CITY_GREEN]Jungle[ENDCOLOR] by expending the [ICON_GREAT_ARTIST] [COLOR_YIELD_GOLD]G. Artist[ENDCOLOR], [ICON_GREAT_ENGINEER] [COLOR_YIELD_GOLD]G. Engineer[ENDCOLOR], [ICON_GREAT_SCIENTIST] [COLOR_YIELD_GOLD]G. Scientist[ENDCOLOR] or [ICON_PROPHET] [COLOR_YIELD_GOLD]G. Prophet[ENDCOLOR] incresing the [ICON_PRODUCTION] Production, [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, [ICON_GOLDEN_AGE] Golden Age Point, [ICON_GREAT_GENERAL] Great General Point and [ICON_GREAT_ADMIRAL] Great Admiral Point output.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 				'[COLOR_MAGENTA]Lasakau Sea Warriors:[ENDCOLOR] +1 [ICON_GREAT_GENERAL] Great General Point in the Capital per owned conquered City. [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Destroyers of Bau[ENDCOLOR] promotion (Gain [ICON_FOOD], scaling with Era, when killing Barbarians, clearing Barbarian Encampments (30-75 [ICON_FOOD] Food) or conquering enemy Cities (100-200 [ICON_FOOD] Food)).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 				'[COLOR_MAGENTA]A Place Among the Gods:[ENDCOLOR] Cities gain +0.66 [ICON_PEACE] Faith for every [COLOR_CITY_BLUE]Mountain[ENDCOLOR] tile within their workable radius. The [COLOR_YIELD_FOOD]Potala Palace[ENDCOLOR] World Wonder will be available for construction after the foundation of [COLOR_POSITIVE_TEXT]World Congress[ENDCOLOR]. Constructing the [COLOR_CYAN]Potala Palace[ENDCOLOR] grants a [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR] with [COLOR_CYAN]Lhasa[ENDCOLOR].[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MALACCA', 			'[COLOR_MAGENTA]Strait Settlements:[ENDCOLOR] [COLOR_GREY]Luxury Resources[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Cities gain +10% [ICON_GREAT_MERCHANT] Great Merchant Points. [ICON_GREAT_MERCHANT] Great Merchants'' and [ICON_GREAT_ENGINEER] Great Engineers'' instant abilities gain +10% Yields.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 			'[COLOR_MAGENTA]Place of the Big Man:[ENDCOLOR] Each currently applied percentage-based Global Monopoly modifier gains an additional +7% bonus.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MANILA', 				'[COLOR_MAGENTA]Pearl of the Orient:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] International Trade Routes gain +5% Yields. Finishing a [ICON_INTERNATIONAL_TRADE] Trade Route grants 25-50 [ICON_FOOD] Food and [ICON_PRODUCTION] Production in the City, scaling up with the Destination City''s [ICON_CITIZEN] Population and down with the actual number of active [ICON_INTERNATIONAL_TRADE] Trade Routes.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MBANZA_KONGO', 		'[COLOR_MAGENTA]Warrior Queen:[ENDCOLOR] [COLOR_YIELD_GOLD]Land Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Manikongo Glory[ENDCOLOR] promotion (+15%[ICON_STRENGTH]CS [COLOR:255:230:85:255]in Forest, Jungle, Marsh and Flood Plains[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 			'[COLOR_MAGENTA]Gold Rush:[ENDCOLOR] [COLOR_CITY_BROWN]Mines[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Cities convert 10% of [ICON_GOLD] Gold into [ICON_FOOD] Food and 5% of [ICON_GOLD] Gold into [ICON_CULTURE_LOCAL] Border Growth Points.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 				'[COLOR_MAGENTA]House of Visconti:[ENDCOLOR] Player can construct [COLOR_YIELD_FOOD]Visconti Emissaries[ENDCOLOR] ([ICON_GREAT_ARTIST]). +5% [ICON_GREAT_ARTIST] Great Artists generation.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MOGADISHU', 			'[COLOR_MAGENTA]Maritime Growth:[ENDCOLOR] [COLOR_CITY_BLUE]Oceans[ENDCOLOR] and [COLOR_CITY_GREEN]Flood Plains[ENDCOLOR] gain +1 [ICON_FOOD] Food. +5% [ICON_FOOD] Food during the [ICON_GOLDEN_AGE] Golden Ages. -10% [ICON_GOLDEN_AGE] Golden Age Cost.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MOMBASA', 			'[COLOR_MAGENTA]Thenashara Taifa:[ENDCOLOR] [COLOR_GREY]Bonus Resources[ENDCOLOR] gain +1 [ICON_FOOD] Food. Founding a City grants 40 [ICON_PEACE] Faith, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MONACO', 				'[COLOR_MAGENTA]Banking Haven:[ENDCOLOR] [COLOR_YIELD_FOOD]Markets[ENDCOLOR] and [COLOR_YIELD_FOOD]Banks[ENDCOLOR] gain +1 [ICON_CULTURE_LOCAL] Border Growth Point. -33% [ICON_GOLD] Tile Gold Purchase Cost in all Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUISCA', 				'[COLOR_MAGENTA]The Golden One:[ENDCOLOR] Capital gains +1 [ICON_GOLD] Gold for its every 3 [ICON_CITIZEN] Citizens and +1 [ICON_GOLD] Gold for every 20 [ICON_CITIZEN] Citizens in your Empire. Border expansion doubled during [ICON_GOLDEN_AGE] Golden Ages and [ICON_HAPPINESS_1] WLTKDs.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MULTAN', 				'[COLOR_MAGENTA]City of Saints:[ENDCOLOR] Birth of a [ICON_CITIZEN] Citizen grants 10 [ICON_PEACE] Faith, scaling with Era. Owned [ICON_MISSIONARY] [COLOR_YIELD_GOLD]Missionaries[ENDCOLOR] can spread Religion 1 additional time.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUSCAT', 				'[COLOR_MAGENTA]Cryptus Portus:[ENDCOLOR] Player gains +50% Modfier for Catching [ICON_SPY] Enemy Spies. Cities with garrisoned units gain +10% [ICON_STRENGTH] Strength. Garrisoned units have no [ICON_GOLD] Gold Maintenance.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_MUTITJULU', 			'[COLOR_MAGENTA]Tjukurpa:[ENDCOLOR] Cities gain +1 [ICON_GOLDEN_AGE] Golden Age Point for every 2 worked [COLOR_CITY_BLUE]Deserts[ENDCOLOR]. [COLOR_WHITE]Natural Wonders[ENDCOLOR] gain +3 [ICON_PEACE] Faith and [COLOR_CITY_BLUE]Deserts[ENDCOLOR] gain +1 [ICON_PEACE] Faith.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_NANMANDOL', 			'[COLOR_MAGENTA]Reef of Heaven:[ENDCOLOR] [COLOR_CITY_BLUE]Oceans[ENDCOLOR] gain +1 [ICON_FOOD] Food and +1 [ICON_CULTURE] Culture. Unit''s death grants 3 [ICON_CULTURE] Culture in all Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_NYARYANA_MARQ', 		'[COLOR_MAGENTA]Reindeer Herders:[ENDCOLOR] [COLOR_CITY_BLUE]Snow[ENDCOLOR] gain +1 [ICON_CULTURE] Culture. Player can build a [COLOR_CITY_BROWN]Chum[ENDCOLOR] improvement on [COLOR_CITY_BLUE]Tundra[ENDCOLOR] and [COLOR_CITY_BLUE]Snow[ENDCOLOR] tiles (not adjacent) increasing [ICON_FOOD] Food, [ICON_PRODUCTION] Production and [ICON_GOLD] Gold output.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 				'[COLOR_MAGENTA]Lords of the Great Glass River:[ENDCOLOR] +20% [ICON_CARGO_SHIP] Sea Trade Route Maximum Range. Coastal Cities gain +1 [ICON_CULTURE_LOCAL] Border Growth Point. +1 [ICON_HAPPINESS_1] Happiness in Empire for each active International [ICON_CARGO_SHIP] Sea Trade Route.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ODENSO', 				'[COLOR_MAGENTA]Winter War:[ENDCOLOR] [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Lord of the Hunt[ENDCOLOR] promotion (+1[ICON_VIEW_CITY]Sight. +5 HP [COLOR:255:230:85:255]on Heal inside Neutral Territory[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ORMUS', 				'[COLOR_MAGENTA]Jewel of the Ring:[ENDCOLOR] [COLOR_GREY]Luxury Resources[ENDCOLOR] gain +1 [ICON_FOOD] Food. [ICON_INTERNATIONAL_TRADE] International Trade Routes to a [ICON_CITY_STATE] City-State generate +0.4 [ICON_INFLUENCE] Influence per turn (with the target [ICON_CITY_STATE] City-State) per each owned [ICON_INTERNATIONAL_TRADE] Trade Route to a [ICON_CITY_STATE] City-State (caps at +2 [ICON_INFLUENCE] Influence).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 		'[COLOR_MAGENTA]Panama Canal:[ENDCOLOR] [COLOR_CITY_GREEN]Lakes[ENDCOLOR] gain +1 [ICON_GOLD] Gold. +10% [ICON_CARGO_SHIP] Sea Trade Route Maximum Range. International [ICON_CARGO_SHIP] Sea Trade Routes gain +1 [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 			'[COLOR_MAGENTA]Gift of Prometheus:[ENDCOLOR] Adds a flat chance to [COLOR_POSITIVE_TEXT]Rig Elections[ENDCOLOR] or [COLOR_POSITIVE_TEXT]Start a Coup[ENDCOLOR] in [ICON_CITY_STATE] City-States. [ICON_SPY] Security Level and speed to complete Spy Events is increased by +20%.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_PRAGUE', 				'[COLOR_MAGENTA]Vysehrad:[ENDCOLOR] [COLOR_YIELD_FOOD]Walls[ENDCOLOR] and [COLOR_YIELD_FOOD]Castles[ENDCOLOR] gain +1 [ICON_CULTURE] Culture. Killed or expended [COLOR_YIELD_GOLD]Missionaries[ENDCOLOR] grant 10-30 [ICON_CULTURE] Culture and twice as much [ICON_PEACE] Faith, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_QUEBEC_CITY', 		'[COLOR_MAGENTA]Fur and Lumber:[ENDCOLOR] [COLOR_CITY_BROWN]Camps[ENDCOLOR] and [COLOR_CITY_BROWN]Lumbermills[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Cutting a [COLOR_CITY_GREEN]Forest[ENDCOLOR] or [COLOR_CITY_GREEN]Jungle[ENDCOLOR] grants additional 10 [ICON_PRODUCTION] Production and [ICON_GOLD] Gold in the City, scaling with Era.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 			'[COLOR_MAGENTA]River of the Good Signs:[ENDCOLOR] [COLOR_CITY_GREEN]River[ENDCOLOR] tiles gain +1 [ICON_GOLDEN_AGE] Golden Age Point. +25% [ICON_GOLDEN_AGE] Golden Age Length[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 				'[COLOR_MAGENTA]Maritime Suzerainty:[ENDCOLOR] [COLOR_CITY_BROWN]Embassies[ENDCOLOR] gain +1 [ICON_FOOD] Food. Coastal Cities gain +1 [ICON_SILVER_FIST] Military Supply Cap. Each [ICON_CITY_STATE] City-State Alliance grants +1 [ICON_FOOD] Food to all Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 				'[COLOR_MAGENTA]Hanseatic League:[ENDCOLOR] Cities gain +2% [ICON_FOOD] Food. Cities gain +1% [ICON_PRODUCTION] Production with each [ICON_INTERNATIONAL_TRADE] Trade Route to a [ICON_CITY_STATE] City-State .[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_RISHIKESH', 			'[COLOR_MAGENTA]Himalayan Yogi:[ENDCOLOR] Player can construct an [COLOR_YIELD_FOOD]Ashram[ENDCOLOR] ([ICON_RESEARCH], [ICON_PEACE], [ICON_TOURISM], [ICON_HAPPINESS_3]). Cities on [COLOR_CITY_GREEN]River[ENDCOLOR] gain +2 [ICON_PEACE] Faith.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 			'[COLOR_MAGENTA]The Sogd:[ENDCOLOR] [ICON_INTERNATIONAL_TRADE] International Trade Routes grant +4 [ICON_GOLD] Gold to both: Origin and Destination City. [COLOR_YIELD_GOLD]Trade Units[ENDCOLOR] gain +2 [ICON_SIGHT] Sight.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SANTO_DOMINGO', 		'[COLOR_MAGENTA]Caribbean''s Gateway:[ENDCOLOR] Each currently applied Happiness or flat-yield Global Monopoly modifier gains an additional +3 bonus.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SGAANG', 				'[COLOR_MAGENTA]Gyaa''aang Heritage:[ENDCOLOR] [COLOR_YIELD_GOLD]Naval Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Master of Cold Waters[ENDCOLOR] promotion (Unit [COLOR:255:230:85:255]can enter Ice[ENDCOLOR]). Player can build a [COLOR_CITY_BROWN]Totem Pole[ENDCOLOR] improvement on coastal [COLOR_CITY_BLUE]Tundra[ENDCOLOR] tiles increasing [ICON_FOOD] Food, [ICON_PRODUCTION] Production, [ICON_GOLD] Gold and [ICON_CULTURE] Culture output.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SIDON', 				'[COLOR_MAGENTA]City for Conquest:[ENDCOLOR] Player can gain a [COLOR_POSITIVE_TEXT]Sphere of Influence[ENDCOLOR] with [COLOR_CYAN]Sidon[ENDCOLOR] for bullying another [ICON_CITY_STATE] City-State. [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Neighborhood Bully[ENDCOLOR] promotion (+5 HP [COLOR:255:230:85:255]on Heal inside Enemy Territory[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SIERRA_LEONE', 		'[COLOR_MAGENTA]Realm of the Free:[ENDCOLOR] [COLOR_YIELD_GOLD]Workers[ENDCOLOR] gain +20% [ICON_WORKER] Construction Modifier. Cities gain -5% [ICON_HAPPINESS_3] Distress. Each [COLOR_YIELD_GOLD]Worker[ENDCOLOR] generates 1 [ICON_CULTURE] Culture per turn.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 			'[COLOR_MAGENTA]Developed Wealth:[ENDCOLOR] Cities gain +5% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Diplomatic Units[ENDCOLOR]. Expended [COLOR_YIELD_GOLD]Diplomatic Units[ENDCOLOR] grant 30 [ICON_GOLD] Gold, scaling with Era and current [ICON_INFLUENCE] Influence level with with a [ICON_CITY_STATE] City-State, where they were located. [COLOR_YIELD_GOLD]Diplomatic Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Noble[ENDCOLOR] promotion (+15 [ICON_INFLUENCE] Influence to Diplomatic Missions).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 				'[COLOR_MAGENTA]Serdica:[ENDCOLOR] Cities gain +1 [ICON_GREAT_GENERAL] Great General Point and +1 [ICON_GREAT_ADMIRAL] Great Admiral Point per Religion present in this City. [ICON_GREAT_GENERAL] [COLOR_YIELD_GOLD]Great Generals[ENDCOLOR] and [ICON_GREAT_ADMIRAL] [COLOR_YIELD_GOLD]Great Admirals[ENDCOLOR] gain +10% [ICON_STRENGTH] Combat Effectiveness Bonus.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 				'[COLOR_MAGENTA]Center of Aviation:[ENDCOLOR] [COLOR_GREY]Strategic Resources[ENDCOLOR] gain +1 [ICON_GREAT_GENERAL] Great General Point. Cities gain +10% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Air Units[ENDCOLOR]. [COLOR_YIELD_GOLD]Air Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Magnificence in Flying Machines[ENDCOLOR] promotion (+10%[ICON_RANGE_STRENGTH]RCS [COLOR:255:230:85:255]vs Land and Naval Units[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_SYDNEY', 				'[COLOR_MAGENTA]Capital Infrastructure:[ENDCOLOR] [ICON_HAPPINESS_1] WLTKD generate +5% [ICON_FOOD] Food. [ICON_HAPPINESS_1] WLTKD start grants 5-20 [ICON_GREAT_ARTIST] Great Artist Points, [ICON_GREAT_ARTIST] Great Writer Points and [ICON_GREAT_ARTIST] Great Musician Points, scaling with Era [NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 				'[COLOR_MAGENTA]Taiwanese Miracle:[ENDCOLOR] Cities gain +10% [ICON_RESEARCH] Science from the Research Process. Converts 15% of [ICON_RESEARCH] Science into [ICON_FOOD] Food.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 			'[COLOR_MAGENTA]Druk Tsendhen:[ENDCOLOR] Cities on [COLOR_CYAN]Hill[ENDCOLOR] gain +3 [ICON_CULTURE] Culture. Cities gain 0.1 [ICON_STRENGTH] Defense for each 1 [ICON_CULTURE] Culture per turn.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TIWANAKU', 			'[COLOR_MAGENTA]Hana Pacha:[ENDCOLOR] Player can build a [COLOR_CITY_BROWN]Sunken Courtyard[ENDCOLOR] improvement on flat [COLOR_CITY_BLUE]Plains[ENDCOLOR], [COLOR_CITY_BLUE]Tundra[ENDCOLOR] or [COLOR_CITY_BLUE]Desert[ENDCOLOR] tiles by expending a [ICON_MISSIONARY] [COLOR_YIELD_GOLD]Missionary[ENDCOLOR] (not adjacent) increasing your [ICON_RESEARCH] Science, [ICON_CULTURE] Culture, [ICON_PEACE] Faith and [ICON_TOURISM] Tourism output.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 				'[COLOR_MAGENTA]Ruins of the Ancient World:[ENDCOLOR] [ICON_VP_ARTIFACT] [COLOR_CITY_BROWN]Landmarks[ENDCOLOR] gain +2 [ICON_GOLD] Gold. Cities gain +10% Production towards [ICON_VP_ARTIFACT] [COLOR_YIELD_GOLD]Archaeologists[ENDCOLOR]. [ICON_WONDER] World Wonder.[NEWLINE] construction grants 20-40 [ICON_TOURISM] Tourism, scaling with Era and number of [ICON_WONDER] World Wonders in that City.' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_UR', 					'[COLOR_MAGENTA]Cradle of Civilization:[ENDCOLOR] [ICON_TRADE] City Connections generate +2 [ICON_FOOD] Food. Newly founded Cities gain 1 additional [ICON_CITIZEN] Citizen.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VALLETTA', 			'[COLOR_MAGENTA]The Grand Harbor:[ENDCOLOR] Player can construct [COLOR_YIELD_FOOD]The Grand Harbor[ENDCOLOR] ([ICON_FOOD], [ICON_RESEARCH], [ICON_STRENGTH]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 			'[COLOR_MAGENTA]Terminal City:[ENDCOLOR] Each City increases [ICON_GOLD] Gold from [ICON_TRADE] City Connections by 3%. -30% [ICON_GOLD] City Connections Gold Maintenance.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 		'[COLOR_MAGENTA]Conclave:[ENDCOLOR] Expending a [ICON_GREAT_PEOPLE] [COLOR_YIELD_GOLD]Great Person[ENDCOLOR] grants 10 [ICON_INFLUENCE] Influence with all met [ICON_CITY_STATE] City-States. Player can purchase [COLOR_YIELD_GOLD]Swiss Guard[ENDCOLOR] unit (mercenary) with [ICON_GOLD] Gold or [ICON_PEACE] Faith.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_VILNIUS', 			'[COLOR_MAGENTA]Athens of the North:[ENDCOLOR] Player can construct [COLOR_YIELD_FOOD]The Gate of Dawn[ENDCOLOR] ([ICON_GREAT_WRITER]). Writers gain +1 [ICON_GOLD] Gold.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 			'[COLOR_MAGENTA]Te Whanga-nui-a-Tara:[ENDCOLOR] [COLOR_GREY]Strategic Resources[ENDCOLOR] gain +1 [ICON_FOOD] Food. Player gains additional copies of [COLOR_GREY]Strategic Resource[ENDCOLOR]:[NEWLINE][ICON_BULLET] +1, if he has at least 1 copy and no Monopolies[NEWLINE][ICON_BULLET] +2, if he has a Strategic Monopoly[NEWLINE][ICON_BULLET] +3, if he has a Global Monopoly[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 			'[COLOR_MAGENTA]Birth of the Reformation:[ENDCOLOR] Cities gain +1 [ICON_PRODUCTION] Production, +1 [ICON_GOLD] Gold and +1 [ICON_CULTURE] Culture per Religion present in this City. Cities gain -10% [ICON_PEACE] Religious Pressure and -10% [ICON_PEACE] Conversion Resistance. -5% [ICON_HAPPINESS_3] Religious Unrest in all Cities.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 		'[COLOR_MAGENTA]People of the Blue Sky:[ENDCOLOR] Cities gain +10% [ICON_PRODUCTION] Production towards [COLOR_YIELD_GOLD]Mounted and Gunpowder Units[ENDCOLOR]. [COLOR_YIELD_GOLD]Land Units[ENDCOLOR] trained in Cities with a [COLOR_YIELD_FOOD]Caravansary[ENDCOLOR] or [ICON_RES_HORSE] [COLOR_GREY]Horses[ENDCOLOR] nearby gain +15 XP. Levelling up a unit grants 2 [ICON_GREAT_GENERAL] Great General Points, scaling with unit level.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_YANGCHENG', 			'[COLOR_MAGENTA]Year of the Animal:[ENDCOLOR] [COLOR_GREY]Animal Resources[ENDCOLOR] gain +1 [ICON_PEACE] Faith. Each Era change grants 70 [ICON_PEACE] Faith, scaling with Era, increased by 30%, if Player entered that Era first, as well as an additional yield reward depending on the randomly chosen animal patron (out of 12).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_YEREVAN', 			'[COLOR_MAGENTA]Sea to Sea Armenia:[ENDCOLOR] [ICON_RES_HORSE] [COLOR_GREY]Horses[ENDCOLOR] gain +1 [ICON_CULTURE] Culture. [COLOR_YIELD_GOLD]Military Units[ENDCOLOR] gain [COLOR_WATER_TEXT]Art of War[ENDCOLOR] promotion (Unit gains [ICON_CULTURE] and [ICON_GOLDEN_AGE] [COLOR:255:230:85:255]on Kill[ENDCOLOR]).[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ZANZIBAR', 			'[COLOR_MAGENTA]The Spice Islands:[ENDCOLOR] [COLOR_GREY]Luxury Resources[ENDCOLOR] gain +1 [ICON_TOURISM] Tourism. +3 [ICON_HAPPINESS_3] Happiness per 4 [ICON_INTERNATIONAL_TRADE] Trade Routes.[NEWLINE]' UNION ALL
SELECT 'TXT_KEY_CSTRAIT_MINOR_CIV_ZURICH', 				'[COLOR_MAGENTA]Banking Establishments:[ENDCOLOR] [COLOR_YIELD_FOOD]Banks[ENDCOLOR] and [COLOR_YIELD_FOOD]Stock Exchanges[ENDCOLOR] gain +2 [ICON_GOLD] Gold. Treasury generates +2% [ICON_GOLD] Gold as interest (caps at 20 [ICON_GOLD] Gold for each Era) per turn.[NEWLINE]' UNION ALL
-- promotions
SELECT 'TXT_KEY_PROMOTION_AMBRACIA', 					'Mercenaries of Pyrrhus' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AMBRACIA_HELP', 					'Generates +5% [ICON_PRODUCTION] Production when [COLOR_POSITIVE_TEXT]Garrisoned in the City[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ANTANANARIVO', 				'Pirate Haven' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ANTANANARIVO_HELP', 				'Military kills generate [ICON_GOLD] Gold equivalent to the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AUCKLAND', 					'Peaceful Resistance' UNION ALL
SELECT 'TXT_KEY_PROMOTION_AUCKLAND_HELP', 					'+1 [ICON_FOOD] Food and +1 [ICON_GOLDEN_AGE] Golden Age Point in the City when Garrisoned.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BELGRADE', 					'The White Fortress' UNION ALL
SELECT 'TXT_KEY_PROMOTION_BELGRADE_HELP', 					'+25 Max HP.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT', 					'Crusader''s Zeal' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT_HELP', 					'+15% XP gained from Combat.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT1', 					'Blessing of Clermont' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT1_HELP', 					'Receive a random combat bonus upon the first combat.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT2', 					'Onward with Haste!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT2_HELP', 					'+1 [ICON_MOVES] Moves. Can move after attacking.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT3', 					'United We Stand!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT3_HELP', 					'+15% [ICON_STRENGTH] Combat Strength when [COLOR_POSITIVE_TEXT]adjacent to a friendly unit[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT4', 					'Charge!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT4_HELP', 					'+5% [ICON_STRENGTH] Attack. +15% [ICON_STRENGTH] against [COLOR_POSITIVE_TEXT]Fortified Units[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT5', 					'Reinforce!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT5_HELP', 					'+5% [ICON_STRENGTH] Defense. Can heal after attacking.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT6', 					'Glory to God!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT6_HELP', 					'Unit awards combat bonus to nearby units as if it is a Great General. All adjacent units heal 5 additional HP per turn.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT7', 					'Deus Vult!' UNION ALL
SELECT 'TXT_KEY_PROMOTION_CLERMONT7_HELP', 					'+1 Sight. Military kills generate [ICON_PEACE] Faith equivalent to 75% of the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DODOMA', 						'Sail in the Wilderness' UNION ALL
SELECT 'TXT_KEY_PROMOTION_DODOMA_HELP', 					'+2 [ICON_MOVES] Movement Points.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_FAYA', 						'Spoils of War' UNION ALL
SELECT 'TXT_KEY_PROMOTION_FAYA_HELP', 						'Military kills generate [ICON_RESEARCH] Science equivalent to 50% of the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANOI', 						'Patriotism' UNION ALL
SELECT 'TXT_KEY_PROMOTION_HANOI_HELP', 						'+10% [ICON_STRENGTH] Combat Strength [COLOR_POSITIVE_TEXT]inside Friendly Territories[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_IFE', 						'Iwarefa' UNION ALL
SELECT 'TXT_KEY_PROMOTION_IFE_HELP', 						'+20 [ICON_INFLUENCE] Influence from Diplomatic Missions.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ISKANWAYA', 					'Qolla Kapachayuh' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ISKANWAYA_HELP', 					'Unit automatically Heals 10 HP each turn, if next to owned [COLOR_POSITIVE_TEXT]Missionary[ENDCOLOR], [COLOR_POSITIVE_TEXT]Holy Site[ENDCOLOR] or [COLOR_POSITIVE_TEXT]Mountain[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KABUL', 						'Mujahideen' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KABUL_HELP', 						'+25% [ICON_STRENGTH] Defensive CS.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARYES', 						'Master of Cold Waters' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KARYES_HELP', 					'Unit can cross Mountains.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LACONIA', 					'Spartan Discipline' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LACONIA_HELP', 					'+15% [ICON_STRENGTH] Combat Strength when [COLOR_POSITIVE_TEXT]adjacent to a Friendly Unit[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LEVUKA', 						'Destroyers of Bau' UNION ALL
SELECT 'TXT_KEY_PROMOTION_LEVUKA_HELP', 					'Gain [ICON_FOOD] for [COLOR_POSITIVE_TEXT]killing Barbarians[ENDCOLOR], [COLOR_POSITIVE_TEXT]taking Barbarian Encampements[ENDCOLOR] and [COLOR_POSITIVE_TEXT]capturing Cities[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MBANZA_KONGO', 				'Manikongo Glory' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MBANZA_KONGO_HELP', 				'+15% [ICON_STRENGTH] Combat Strength when fighting in [COLOR_POSITIVE_TEXT]Forest[ENDCOLOR], [COLOR_POSITIVE_TEXT]Jungle[ENDCOLOR], [COLOR_POSITIVE_TEXT]Marsh[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Flood Plains[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ODENSO', 						'Lord of the Hunt' UNION ALL
SELECT 'TXT_KEY_PROMOTION_ODENSO_HELP', 					'+1 [ICON_VIEW_CITY] Sight and heal an additional 5 HP per turn inside Neutral Territories.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SGAANG', 						'Master of Cold Waters' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SGAANG_HELP', 					'Unit can cross Ice.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIDON', 						'Neighborhood Bully' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SIDON_HELP', 						'Heal an additional 5 HP per turn [COLOR_POSITIVE_TEXT]inside Enemy Territories[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SURREY', 						'Magnificence in Flying Machines' UNION ALL
SELECT 'TXT_KEY_PROMOTION_SURREY_HELP', 					'+10% [ICON_STRENGTH] Combat Strength against [COLOR_POSITIVE_TEXT]Land[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Naval Units[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_YEREVAN', 					'Art of War' UNION ALL
SELECT 'TXT_KEY_PROMOTION_YEREVAN_HELP', 					'Military kills generate [ICON_CULTURE] Culture equivalent to 50% of the killed''s [ICON_STRENGTH] Combat Strength.' UNION ALL
SELECT 'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA', 			'Guardia Svizzera Pontificia' UNION ALL
SELECT 'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA_HELP', 			'On Kill heals 10 Damage (if in range of owned City), 30 (if in range of owned Capital) or 40 (if in range of owned Holy City).' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KATZBALGER', 					'Katzbalger' UNION ALL
SELECT 'TXT_KEY_PROMOTION_KATZBALGER_HELP', 				'Unit generates +2 [ICON_PEACE] Faith, +2 [ICON_CULTURE] Culture with [COLOR_CYAN]Radio[ENDCOLOR] and +2 [ICON_TOURISM] Tourism with [COLOR_CYAN]Telecommunications[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL', 		'Sellsword Army' UNION ALL
SELECT 'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL_HELP', 		'+20% XP gained from Combat.' UNION ALL
-- units
SELECT 'TXT_KEY_UNIT_SWISS_GUARD', 						'Swiss Guard' UNION ALL
SELECT 'TXT_KEY_UNIT_SWISS_GUARD_STRATEGY', 				'The Swiss Guard is a unique mercenary unit of the Vatican City, located in the tech tree between [COLOR_POSITIVE_TEXT]Free Company[ENDCOLOR] and [COLOR_POSITIVE_TEXT]Foreign Legion[ENDCOLOR]. It can only be purchased (with either [ICON_GOLD] Gold or [ICON_PEACE] Faith) and does move after purchase; though it does not require any policies to do so. The Swiss Guard gains extra [ICON_STRENGTH] Strength each consecutive Era and heals after killing an enemy unit, if it is close to owned City (a little), Capital (more) or Holy City (the most). It also generates yields depending on techs discovered ([COLOR_CYAN]Radio[ENDCOLOR] and [COLOR_CYAN]Telecommunications[ENDCOLOR]). This unit does not obsolete.' UNION ALL
SELECT 'TXT_KEY_UNIT_SWISS_GUARD_HELP', 					'This unit can only be purchased with [ICON_GOLD] Gold or [ICON_PEACE] Faith (requires an access to [COLOR_CYAN]Vatican City[ENDCOLOR]''s ability).[NEWLINE][NEWLINE]Does not obsolete. Gains additional [ICON_STRENGTH] Strength each consecutive Era. May move immediately after purchase.[NEWLINE][NEWLINE]Unit heals itself after killing an Enemy Unit by value depending on the owned City it is in range of (regular, Capital, Holy City). Generates +2 [ICON_PEACE] Faith, +2 [ICON_CULTURE] Culture after [COLOR_CYAN]Radio[ENDCOLOR] and +2 [ICON_TOURISM] Tourism after [COLOR_CYAN]Telecommunications[ENDCOLOR].' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_SWISS_GUARD', 					'Swiss Guards describe, historically, the mercenaries who from Switzerland sought to serve as bodyguards throughout courts of Europe during the Middle Ages and the Renaissance. Lauded for their enduring loyalty and bravery, Swiss Guards served a wide variety of functions: from ceremonial guards to front-line troops, and were in use by the armies of some of Europe''s greatest powers: including France, Spain and Naples. Although in 1874 the recruitment of Swiss Guards by foreign powers was forbidden by the Swiss Constitution, the Pontifical Swiss Guard that served the Holy See was an exception, and today remains the primary force of the Vatican; responsible for the safety of the Pope and the security of the Apostolic Palace.' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA', 							'Gurkha' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA_STRATEGY', 						'The Gurkha is the Kathmandu''s replacement for the Fusilier. In addition to being unlocked earlier than the Rifleman, the Gurkha gains more experience from fights and has huge handicap against blocked enemy units.' UNION ALL
SELECT 'TXT_KEY_UNIT_GURKHA_HELP', 							'This unit can only be purchased with [ICON_GOLD] Gold (requires an access to [COLOR_CYAN]Kathmandu[ENDCOLOR]''s ability).[NEWLINE][NEWLINE]Unique Fusilier Unit that may move immediately after purchase, can be trained earlier and does not require [COLOR_POSITIVE_TEXT]Armory[ENDCOLOR] when buying.[NEWLINE][NEWLINE]Unit starts with additional promotions that crush enemy units ([COLOR_POSITIVE_TEXT]Heavy Charge[ENDCOLOR]) and allow gaining mor XP from fights ([COLOR_POSITIVE_TEXT]Quick Study[ENDCOLOR]).' UNION ALL
SELECT 'TXT_KEY_CIV5_UNIT_GURKHA', 							'The Gurkhas are a people native to mountainous Nepal and Gorkhaland region of India. Famed for their bravery, fearlessness and disregard for death, they impressed British military commanders as early as in 1814, during the Gurkha War waged by the East India Company against Nepal. In 1815, even before the war ended, the first regiment of Gurkhas was formed within the British Indian army. Throughout 19th and well into the 20th century, the Gurkhas remained loyal to the British crown, despite wars and numerous Indian rebellions. They fought in both World Wars as a part of the British Army, where they formed fifteen rifle regiments. They were widely admired for their ability to withstand any hardship and feared of their skill with the deadly khukuri knife. Gurkha regiments remain in service to this day.' UNION ALL
-- improvements
	-- marsh
	SELECT 'TXT_KEY_BUILD_MARSH', 							'Create a Marsh'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MARSH_HELP', 						'Terraforms the landscape here into the [COLOR_CITY_GREEN]Marsh[ENDCOLOR], while installing an improvement that''ll stabilize it. Requires an access to [COLOR_CYAN]Brussels[ENDCOLOR]'' ability..'  UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MARSH', 					'Marsh' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MARSH', 				'To restore the marshlands on any terrain, just allow water to flow to it naturally. It should even work on snow! If the water doesn''t freeze that is.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MARSH_HELP', 				'Only with the Alliance of the Brussel people can a civilization continue a restoration project of marshlands.' UNION ALL
	-- mound
	SELECT 'TXT_KEY_BUILD_MOUND', 							'Construct a Mound'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MOUND_HELP', 						'Cannot be built next to another [COLOR_CITY_BROWN]Mound[ENDCOLOR] or on a [COLOR_GREY]Resource[ENDCOLOR]. +1 [ICON_GOLDEN_AGE] Golden Age Point, if next to a City. +1 [ICON_RESEARCH] Science with [COLOR_CYAN]Architecture[ENDCOLOR] and +1 [ICON_GREAT_GENERAL] Great General Point with [COLOR_CYAN]Military Science[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Villages[ENDCOLOR] and [COLOR_CITY_BROWN]Towns[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Requires an access to [COLOR_CYAN]Cahokia[ENDCOLOR]''s ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MOUND', 					'Mound' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MOUND', 				'It is a pyramid built of transported soil and clay.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MOUND_HELP', 				'Only with the Alliance of the Cahokia people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- sunken courtyard
	SELECT 'TXT_KEY_BUILD_SUNK_COURT', 						'Construct a Sunken Courtyard'  UNION ALL
	SELECT 'TXT_KEY_BUILD_SUNK_COURT_HELP', 				'Cannot be built next to another [COLOR_CITY_BROWN]Sunken Courtyard[ENDCOLOR] or on a [COLOR_GREY]Resource[ENDCOLOR], and can only be built on flat [COLOR_CITY_BLUE]Plains[ENDCOLOR], [COLOR_CITY_BLUE]Tundra[ENDCOLOR] or [COLOR_CITY_BLUE]Desert[ENDCOLOR] tiles. +1 [ICON_RESEARCH] Science, if next to a City, and +1 [ICON_CULTURE] Culture and +1 [ICON_PEACE] Faith, if next to a [COLOR_CITY_BLUE]Mountain[ENDCOLOR]. +1 [ICON_TOURISM] Tourism with [COLOR_CYAN]Archaeology[ENDCOLOR] and +1 [ICON_RESEARCH] Science with [COLOR_CYAN]Radar[ENDCOLOR]. Requires an access to [COLOR_CYAN]Tiwanaku[ENDCOLOR]''s ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_SUNK_COURT', 				'Sunken Courtyard' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_SUNK_COURT', 			'At its height, Tiwanaku was home to up to 40,000 people and was centered around a ceremonial core featuring numerous buildings, platforms, and courtyards, the largest and most important being the Semi-subterranean Court, the Kalasasaya and Putuni Complex (a combination of raised platforms and courtyards), the Akapana (a complicated mound structure believed to be a recreation of the Quimsachata mountains), and a later temple complex, the Pumapunku. [NEWLINE]The sunken court style of building is found in many of the archaeological sites which pre-date the founding of Tiwanaku in the regions surrounding Lake Titicaca such as Pucara and Chiripa, but the Semi-subterranean Court is the largest found to date. Its increased size was likely a statement of growing political power by the emerging Tiwanaku polity. Completed between 300–400 C.E., it is estimated to be the earliest monumental stone building constructed in the central ceremonial area. [NEWLINE]The central stones on three of the walls (north, east, and west) of the Semi-subterranean Court mark viewing points for various astronomical events, such as solstice and equinox sunrises and sunsets, the rising and setting of important stars, and even point the way to the celestial South Pole, the pivot of the southern hemisphere. Those stones were auxiliary for participants of religious rituals to orient themselves for the appropriate celestial event.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_SUNK_COURT_HELP', 			'Only with the Alliance of the Tiwanaku people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- colossal head
	SELECT 'TXT_KEY_BUILD_BIG_HEAD', 						'Construct a Colossal Head'  UNION ALL
	SELECT 'TXT_KEY_BUILD_BIG_HEAD_HELP', 					'Cannot be build on a [COLOR_GREY]Resource[ENDCOLOR] and can only be built on [COLOR_CITY_BLUE]Plains[ENDCOLOR] or [COLOR_CITY_BLUE]Grassland[ENDCOLOR] tiles with [COLOR_CITY_GREEN]Forest[ENDCOLOR] or [COLOR_CITY_GREEN]Jungle[ENDCOLOR]. +1 [ICON_GOLDEN_AGE] Golden Age Point, if next to a City and +1 [ICON_PRODUCTION] Production if next to a [ICON_RES_STONE] [COLOR_GREY]Stone[ENDCOLOR] or [ICON_RES_MARBLE] [COLOR_GREY]Marble[ENDCOLOR]. +2 [ICON_GOLDEN_AGE] Golden Age Points with [COLOR_CYAN]Machinery[ENDCOLOR], +3 [ICON_RESEARCH] Science with [COLOR_CYAN]Architecture[ENDCOLOR] and +2 [ICON_PRODUCTION] Production with [COLOR_CYAN]Scientific Theory[ENDCOLOR]. +3 [ICON_CULTURE] Culture with [COLOR_MAGENTA]New Deal[ENDCOLOR]. +1 [ICON_GOLDEN_AGE] Golden Age Point, +1 [ICON_GREAT_GENERAL] Great General Point and +1 [ICON_GREAT_ADMIRAL] Great Admiral Point, if there are 2 adjacent [COLOR_CITY_BROWN]Colossal Heads[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Farms[ENDCOLOR], [COLOR_CITY_BROWN]Mines[ENDCOLOR] and [COLOR_CITY_BROWN]Quarries[ENDCOLOR] gain +1 [ICON_PRODUCTION] Production. Requires an access to [COLOR_CYAN]La Venta[ENDCOLOR]''s ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BIG_HEAD', 					'Colossal Head' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_BIG_HEAD', 			'The stone head sculptures of the Olmec civilization (1200 BCE - 400 BCE) are amongst the most mysterious and debated artefacts from the ancient world. Seventeen monumental stone representations of human heads sculpted from large basalt boulders have been unearthed in the region to date. The heads date from at least before 900 BCE and are a distinctive feature of the Olmec civilization. They can be nearly 3 metres high, 4.5 metres in circumference (9.8 feet, 14.7 feet) and average around 8 tons in weight. All portray mature men with fleshy cheeks, flat noses, and slightly crossed eyes. However, none of the heads are alike, and each boasts a unique headdress, which suggests they represent specific individuals. [NEWLINE]The Olmec brought these boulders from the Sierra de los Tuxtlas mountains of Veracruz. Given that the extremely large slabs of stone used in their production were transported over large distances, requiring a great deal of human effort and resources, it is thought that the monuments represent portraits of powerful individual Olmec rulers, perhaps carved to commemorate their deaths. The heads were arranged in either lines or groups at major Olmec centers, but the method and logistics used to transport the stone to the sites remain uncertain, presumably using huge balsa river rafts wherever possible and log rollers on land.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_BIG_HEAD_HELP', 			'Only with the Alliance of the La Venta people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- monastery
	SELECT 'TXT_KEY_BUILD_MONASTERY', 						'Construct a Monastery'  UNION ALL
	SELECT 'TXT_KEY_BUILD_MONASTERY_HELP', 					'Cannot be built next to another [COLOR_CITY_BROWN]Monastery[ENDCOLOR], next to a City or on a [COLOR_GREY]Resource[ENDCOLOR]. +1 [ICON_PEACE] Faith, if next to a [COLOR_CITY_BLUE]Mountain[ENDCOLOR]. +1 [ICON_PEACE] Faith with [COLOR_CYAN]Scientific Theory[ENDCOLOR] and +1 [ICON_PEACE] Faith with [COLOR_CYAN]Electricity[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Villages[ENDCOLOR] and [COLOR_CITY_BROWN]Towns[ENDCOLOR] gain +1 [ICON_PRODUCTION] Production. Requires an access to [COLOR_CYAN]Karyes[ENDCOLOR]'' ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MONASTERY', 				'Monastery' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_MONASTERY', 			'TODO' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_MONASTERY_HELP', 			'Only with the Alliance of the Karyes people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- totem pole
	SELECT 'TXT_KEY_BUILD_TOTEM_POLE', 						'Construct a Totem Pole'  UNION ALL
	SELECT 'TXT_KEY_BUILD_TOTEM_POLE_HELP', 				'Cannot be built on a [COLOR_GREY]Resource[ENDCOLOR]. +1 [ICON_PRODUCTION] Production with [COLOR_CYAN]Compass[ENDCOLOR] and +1 [ICON_GOLD] Gold with [COLOR_CYAN]Navigation[ENDCOLOR]. +2 [ICON_PRODUCTION] Production, if there are 2 adjacent [COLOR_CITY_BROWN]Totem Poles[ENDCOLOR]. Adjacent [COLOR_CITY_BLUE]Coast[ENDCOLOR] tiles gain +1 [ICON_CULTURE] Culture. Requires an access to [COLOR_CYAN]SGaang Gwaay[ENDCOLOR]''s ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TOTEM_POLE', 				'Totem Pole' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_TOTEM_POLE', 			'TODO' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_TOTEM_POLE_HELP', 			'Only with the Alliance of the SGaang Gwaay people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- chum
	SELECT 'TXT_KEY_BUILD_CHUM', 							'Construct a Chum'  UNION ALL
	SELECT 'TXT_KEY_BUILD_CHUM_HELP', 						'Cannot be built next to another [COLOR_CITY_BROWN]Chum[ENDCOLOR] or on a [COLOR_GREY]Resource[ENDCOLOR]. +1 [ICON_FOOD] Food, if next to a [COLOR_GREY]Bonus Resource[ENDCOLOR] and +1 [ICON_PRODUCTION] Production, if next to a [COLOR_CITY_BROWN]Camp[ENDCOLOR] or [COLOR_CITY_BROWN]Pasture[ENDCOLOR]. +1 [ICON_FOOD] Food with [COLOR_CYAN]Education[ENDCOLOR], +1 [ICON_FOOD] Food with [COLOR_CYAN]Fertilizer[ENDCOLOR] and +1 [ICON_PRODUCTION] Faith with [COLOR_CYAN]Refrigeration[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Camps[ENDCOLOR] and [COLOR_CITY_BROWN]Pastures[ENDCOLOR] gain +1 [ICON_GOLD] Gold. Requires an access to [COLOR_CYAN]Nyar''yana Marq[ENDCOLOR]''s ability to be finished.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_CHUM', 						'Chum' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_CHUM', 				'TODO' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_CHUM_HELP', 				'Only with the Alliance of the Nyar''ana Marq people allow a civilization enjoy such a beauty of a structure.' UNION ALL
	-- dogo canario
	SELECT 'TXT_KEY_BUILD_DOGO_CANARIO', 					'Place a [ICON_RES_DOGO_CANARIO] Dogo Canario'  UNION ALL
	SELECT 'TXT_KEY_BUILD_DOGO_CANARIO_HELP', 				'Helps in breeding the [ICON_RES_DOGO_CANARIO] Dogo Canarios, that can be improved with a [COLOR_CITY_BROWN]Camp[ENDCOLOR]. Adjacent [COLOR_CITY_BROWN]Pastures[ENDCOLOR] gain +1 [ICON_FOOD] Food and +1 [ICON_GOLD] Gold.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DOGO_CANARIO', 				'Dogo Canario' UNION ALL
	SELECT 'TXT_KEY_CIV5_IMPROVEMENTS_DOGO_CANARIO', 		'Dogo Canario are a breed of dog native to the canary islands, a rare dog with a broad head and muscular body. They played a role in the myth, funeral customs and even diet of the guanches. Some were even mummified along with their owners.' UNION ALL
	SELECT 'TXT_KEY_IMPROVEMENT_DOGO_CANARIO_HELP', 		'Only with the Alliance of the Adeje people allow a civilization enjoy such a beauty of a structure.' UNION ALL
-- resources
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO',					'Dogo Canario' UNION ALL
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO_TEXT',			'Dogo Canario are a breed of dog native to the canary islands, a rare dog with a broad head and muscular body. They played a role in the myth, funeral customs and even diet of the guanches. Some were even mummified along with their owners.' UNION ALL
SELECT 'TXT_KEY_RESOURCE_DOGO_CANARIO_MONOPOLY',		'Requires an access to [COLOR_CYAN]Adeje[ENDCOLOR]''s ability to be finished.[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Monopoly Bonus:[ENDCOLOR] +5% [ICON_PRODUCTION] Production and +5% [ICON_GOLD] Gold in all owned Cities.' UNION ALL
-- cs buildings/policies
/*SELECT 'TXT_KEY_BUILDING_MARITIME', 					'(Mar) Builders' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_HELP', 				'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_FRIENDLY', 			'(Mar-F) Harvesters' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_FRIENDLY_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_NEUTRAL', 			'(Mar-N) Secured Warehouse' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_NEUTRAL_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_HOSTILE', 			'(Mar-H) Selfish Gatherers' UNION ALL
SELECT 'TXT_KEY_BUILDING_MARITIME_HOSTILE_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE', 					'(Mer) Trade Center' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_HELP', 				'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_FRIENDLY', 			'(Mer-F) Golden City' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_FRIENDLY_HELP', 	'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_NEUTRAL', 			'(Mer-N) Shadow Council' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_NEUTRAL_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_HOSTILE', 			'(Mer-H) Free City' UNION ALL
SELECT 'TXT_KEY_BUILDING_MERCANTILE_HOSTILE_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED', 					'(Cul) Center of Learning' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_HELP', 				'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_FRIENDLY', 			'(Cul-F) Open University' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_FRIENDLY_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_NEUTRAL', 			'(Cul-N) Patronage' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_NEUTRAL_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_HOSTILE', 			'(Cul-H) Recluse Court' UNION ALL
SELECT 'TXT_KEY_BUILDING_CULTURED_HOSTILE_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS', 					'(Rel) Center of Faith' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_HELP', 				'' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY', 			'(Rel-F) Open Mind' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_NEUTRAL', 			'(Rel-N) Medicant Orders' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_NEUTRAL_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_HOSTILE', 			'(Rel-H) One Truth' UNION ALL
SELECT 'TXT_KEY_BUILDING_RELIGIOUS_HOSTILE_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC', 				'(Mil) Fortress' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_HELP', 			'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY', 		'(Mil-F) Mercenary Hub' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY_HELP', 	'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_NEUTRAL', 		'(Mil-N) Sellsword Army' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_NEUTRAL_HELP', 	'' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_HOSTILE', 		'(Mil-H) Hermit Dragon' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILITARISTIC_HOSTILE_HELP', 	'' UNION ALL*/
SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_FIRENDLY', 		'Small defense boost' UNION ALL
SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_FIRENDLY_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL', 			'Medium defense boost' UNION ALL
SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL_HELP', 			'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE', 			'Huge defense boost' UNION ALL
SELECT 'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE_HELP', 			'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CS_RELIGION_FIRENDLY', 		'Small pressure boost' UNION ALL
SELECT 'TXT_KEY_BUILDING_CS_RELIGION_FIRENDLY_HELP', 		'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL', 			'Medium pressure boost' UNION ALL
SELECT 'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL_HELP', 			'' UNION ALL
SELECT 'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE', 			'Huge pressure boost' UNION ALL
SELECT 'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE_HELP', 			'' UNION ALL
SELECT 'TXT_KEY_POLICY_CS_MARITIME', 					'Builders' UNION ALL
SELECT 'TXT_KEY_POLICY_CS_MERCANTILE', 					'Trade Center' UNION ALL
SELECT 'TXT_KEY_POLICY_CS_MILITARISTIC', 				'Fortress' UNION ALL
SELECT 'TXT_KEY_POLICY_CS_CULTURED', 					'Center of Learning' UNION ALL
SELECT 'TXT_KEY_POLICY_CS_RELIGIOUS', 					'Center of Faith' UNION ALL
-- regular buildings
SELECT 'TXT_KEY_BUILDING_ARMAGH1', 						'Naomh Gaelach' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH1_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability. Grants [ICON_CULTURE] Culture bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Boredom.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH2', 						'Naomh Breandán' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH2_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability. Grants [ICON_RESEARCH] Science bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Illiteracy.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH3', 						'Naomh Pádraig' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH3_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability. Grants [ICON_GOLD] Gold bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Poverty.' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH4', 						'Naomh Bríd' UNION ALL
SELECT 'TXT_KEY_BUILDING_ARMAGH4_HELP', 				'Requires an access to [COLOR_CYAN]Armagh[ENDCOLOR]''s ability. Grants [ICON_FOOD] Food and [ICON_PRODUCTION] Production bonus based on number of Active Events (lost without the Alliance). Reduces [ICON_HAPPINESS_3] Distress.' UNION ALL
SELECT 'TXT_KEY_BUILDING_JERUSALEM', 					'Holy City' UNION ALL
SELECT 'TXT_KEY_BUILDING_JERUSALEM_HELP', 				'Built after adopting Majority Religion of its Ally.[NEWLINE][NEWLINE]This city becomes a Holy City. Too many have made the pilgrimage to this city for their religion.[NEWLINE][NEWLINE]+100% [ICON_PEACE] Religious Pressure.' UNION ALL
SELECT 'TXT_KEY_BUILDING_KIEV', 						'Bylina' UNION ALL
SELECT 'TXT_KEY_BUILDING_KIEV_HELP', 					'Requires an access to [COLOR_CYAN]Kyiv[ENDCOLOR]''s ability. +2 [ICON_GREAT_MUSICIAN]; +1 Musician Slot.' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN', 						'Visconti Emissary' UNION ALL
SELECT 'TXT_KEY_BUILDING_MILAN_HELP', 					'Requires an access to [COLOR_CYAN]Milan[ENDCOLOR]''s ability. +2 [ICON_GREAT_ARTIST]; +1 Artist Slot.' UNION ALL
SELECT 'TXT_KEY_BUILDING_VILNIUS', 						'The Gate of Dawn' UNION ALL
SELECT 'TXT_KEY_BUILDING_VILNIUS_HELP', 				'Requires an access to [COLOR_CYAN]Vilnius[ENDCOLOR]''s ability. +2 [ICON_GREAT_WRITER]; +1 Writer Slot.' UNION ALL
SELECT 'TXT_KEY_BUILDING_RISHIKESH', 					'Ashram' UNION ALL
SELECT 'TXT_KEY_BUILDING_RISHIKESH_HELP', 				'Requires an access to [COLOR_CYAN]Rishikesh[ENDCOLOR]''s ability. +1 [ICON_PEACE] Faith and +1 [ICON_TOURISM] for every Mountain tile within their workable radius. -1 [ICON_HAPPINESS_3] Unhappiness from Religious Unrest, Urbanization and Boredom.' UNION ALL
SELECT 'TXT_KEY_BUILDING_VALLETTA', 					'The Grand Harbor' UNION ALL
SELECT 'TXT_KEY_BUILDING_VALLETTA_HELP', 				'City must have a Fishing Boat resource improved and Player must have an access to [COLOR_CYAN]Valletta[ENDCOLOR]''s ability. +2 [ICON_FOOD] Food and +2 [ICON_RESEARCH] Science (lost without the Alliance). +15 XP to all newly trained Naval Units. +25 City HP.' UNION ALL
-- world wonders
SELECT 'TXT_KEY_BUILDING_LHASA', 						'Potala Palace' UNION ALL
SELECT 'TXT_KEY_BUILDING_LHASA_HELP', 					'+1 and +10% [ICON_CULTURE] Culture and [ICON_FOOD] Food. Grants 1 additional delegate in the World Congress. Requires an access to [COLOR_CYAN]Lhasa[ENDCOLOR]''s ability and an active session of the [COLOR_POSITIVE_TEXT]World Congress[ENDCOLOR]. Yield modifiers halved without the Alliance. Can never be destroyed.' UNION ALL
SELECT 'TXT_KEY_BUILDING_LHASA_QUOTE', 					'[NEWLINE]"The first time I stepped onto the rooftop of the Potala Palace, I felt, as never before or since, as if I were stepping onto the rooftop of my being; onto some dimension of consciousness that I''d never visited before."[NEWLINE] – Pico Iyer[NEWLINE]';
---------------------------------------------------
---------------------------------------------------
--==========================================================================================================================
-- DEFINITIONS
--==========================================================================================================================	
---------------------------------------------------
-- Definitions - Minor Civilizations
---------------------------------------------------
INSERT INTO MinorCivilizations 
			(Type, 						ShortDescription, 					Civilopedia, 						Description, 						Adjective, 								ArtDefineTag, 					DefaultPlayerColor, 				ArtStyleType, 				ArtStyleSuffix, 	ArtStylePrefix, 	MinorCivTrait,					BullyUnitClass)
SELECT 		'MINOR_CIV_ADEJE', 			'TXT_KEY_CITYSTATE_ADEJE', 			'TXT_KEY_CIV5_ADEJE_TEXT', 			'TXT_KEY_CITYSTATE_ADEJE', 			'TXT_KEY_CITYSTATE_ADEJE_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MARITIME',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'TXT_KEY_CITYSTATE_AMBRACIA', 		'TXT_KEY_CIV5_AMBRACIA_TEXT', 		'TXT_KEY_CITYSTATE_AMBRACIA', 		'TXT_KEY_CITYSTATE_AMBRACIA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'TXT_KEY_CITYSTATE_ANDORRA', 		'TXT_KEY_CIV5_ANDORRA_TEXT', 		'TXT_KEY_CITYSTATE_ANDORRA', 		'TXT_KEY_CITYSTATE_ANDORRA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_CULTURED',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ARMAGH', 		'TXT_KEY_CITYSTATE_ARMAGH', 		'TXT_KEY_CIV5_ARMAGH_TEXT', 		'TXT_KEY_CITYSTATE_ARMAGH', 		'TXT_KEY_CITYSTATE_ARMAGH_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'TXT_KEY_CITYSTATE_AUCKLAND', 		'TXT_KEY_CIV5_AUCKLAND_TEXT', 		'TXT_KEY_CITYSTATE_AUCKLAND', 		'TXT_KEY_CITYSTATE_AUCKLAND_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_BLUE', 			'ARTSTYLE_POLYNESIAN', 		'_POLYNESIA', 		'ASIAN', 			'MINOR_TRAIT_MARITIME',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_BAGAN', 			'TXT_KEY_CITYSTATE_BAGAN', 			'TXT_KEY_CIV5_BAGAN_TEXT', 			'TXT_KEY_CITYSTATE_BAGAN', 			'TXT_KEY_CITYSTATE_BAGAN_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_BEDULU', 		'TXT_KEY_CITYSTATE_BEDULU', 		'TXT_KEY_CIV5_BEDULU_TEXT', 		'TXT_KEY_CITYSTATE_BEDULU', 		'TXT_KEY_CITYSTATE_BEDULU_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'TXT_KEY_CITYSTATE_CANOSSA', 		'TXT_KEY_CIV5_CANOSSA_TEXT', 		'TXT_KEY_CITYSTATE_CANOSSA', 		'TXT_KEY_CITYSTATE_CANOSSA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'TXT_KEY_CITYSTATE_CHEVAK', 		'TXT_KEY_CIV5_CHEVAK_TEXT', 		'TXT_KEY_CITYSTATE_CHEVAK', 		'TXT_KEY_CITYSTATE_CHEVAK_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MARITIME',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_CLERMONT', 		'TXT_KEY_CITYSTATE_CLERMONT', 		'TXT_KEY_CIV5_CLERMONT_TEXT', 		'TXT_KEY_CITYSTATE_CLERMONT', 		'TXT_KEY_CITYSTATE_CLERMONT_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'TXT_KEY_CITYSTATE_DALI', 			'TXT_KEY_CIV5_DALI_TEXT', 			'TXT_KEY_CITYSTATE_DALI', 			'TXT_KEY_CITYSTATE_DALI_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DANO', 			'TXT_KEY_CITYSTATE_DANO', 			'TXT_KEY_CIV5_DANO_TEXT', 			'TXT_KEY_CITYSTATE_DANO', 			'TXT_KEY_CITYSTATE_DANO_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_BLUE', 	'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CITYSTATE_DJIBOUTI', 		'TXT_KEY_CIV5_DJIBOUTI_TEXT', 		'TXT_KEY_CITYSTATE_DJIBOUTI', 		'TXT_KEY_CITYSTATE_DJIBOUTI_ADJ', 		'ART_DEF_CIVILIZATION_MINOR',	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MARITIME',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'TXT_KEY_CITYSTATE_DODOMA', 		'TXT_KEY_CIV5_DODOMA_TEXT', 		'TXT_KEY_CITYSTATE_DODOMA', 		'TXT_KEY_CITYSTATE_DODOMA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_YELLOW', 		'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_DOUALA', 		'TXT_KEY_CITYSTATE_DOUALA', 		'TXT_KEY_CIV5_DOUALA_TEXT', 		'TXT_KEY_CITYSTATE_DOUALA', 		'TXT_KEY_CITYSTATE_DOUALA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_BLUE', 	'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'TXT_KEY_CITYSTATE_FAYA', 			'TXT_KEY_CIV5_FAYA_TEXT', 			'TXT_KEY_CITYSTATE_FAYA', 			'TXT_KEY_CITYSTATE_FAYA_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'TXT_KEY_CITYSTATE_GRANADA', 		'TXT_KEY_CIV5_GRANADA_TEXT', 		'TXT_KEY_CITYSTATE_GRANADA', 		'TXT_KEY_CITYSTATE_GRANADA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_YELLOW', 		'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'TXT_KEY_CITYSTATE_GWYNEDD', 		'TXT_KEY_CIV5_GWYNEDD_TEXT', 		'TXT_KEY_CITYSTATE_GWYNEDD', 		'TXT_KEY_CITYSTATE_GWYNEDD_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_PURPLE', 	'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_CULTURED',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'TXT_KEY_CITYSTATE_HONDURAS', 		'TXT_KEY_CIV5_HONDURAS_TEXT', 		'TXT_KEY_CITYSTATE_HONDURAS', 		'TXT_KEY_CITYSTATE_HONDURAS_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ISKANWAYA', 		'TXT_KEY_CITYSTATE_ISKANWAYA', 		'TXT_KEY_CIV5_ISKANWAYA_TEXT', 		'TXT_KEY_CITYSTATE_ISKANWAYA', 		'TXT_KEY_CITYSTATE_ISKANWAYA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_BLUE', 			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_KARYES', 		'TXT_KEY_CITYSTATE_KARYES', 		'TXT_KEY_CIV5_KARYES_TEXT', 		'TXT_KEY_CITYSTATE_KARYES', 		'TXT_KEY_CITYSTATE_KARYES_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_PURPLE', 	'ARTSTYLE_GRECO_ROMAN', 	'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'TXT_KEY_CITYSTATE_KIGALI', 		'TXT_KEY_CIV5_KIGALI_TEXT', 		'TXT_KEY_CITYSTATE_KIGALI', 		'TXT_KEY_CITYSTATE_KIGALI_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'TXT_KEY_CITYSTATE_LACONIA', 		'TXT_KEY_CIV5_LACONIA_TEXT', 		'TXT_KEY_CITYSTATE_LACONIA', 		'TXT_KEY_CITYSTATE_LACONIA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'TXT_KEY_CITYSTATE_LEVUKA', 		'TXT_KEY_CIV5_LEVUKA_TEXT', 		'TXT_KEY_CITYSTATE_LEVUKA', 		'TXT_KEY_CITYSTATE_LEVUKA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_BLUE', 			'ARTSTYLE_POLYNESIAN', 		'_POLYNESIA', 		'ASIAN', 			'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'TXT_KEY_CITYSTATE_MANAGUA', 		'TXT_KEY_CIV5_MANAGUA_TEXT', 		'TXT_KEY_CITYSTATE_MANAGUA', 		'TXT_KEY_CITYSTATE_MANAGUA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MUISCA', 		'TXT_KEY_CITYSTATE_MUISCA', 		'TXT_KEY_CIV5_MUISCA_TEXT', 		'TXT_KEY_CITYSTATE_MUISCA', 		'TXT_KEY_CITYSTATE_MUISCA_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_WHITE', 			'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'TXT_KEY_CITYSTATE_MULTAN', 		'TXT_KEY_CIV5_MULTAN_TEXT', 		'TXT_KEY_CITYSTATE_MULTAN', 		'TXT_KEY_CITYSTATE_MULTAN_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'TXT_KEY_CITYSTATE_MUSCAT', 		'TXT_KEY_CIV5_MUSCAT_TEXT', 		'TXT_KEY_CITYSTATE_MUSCAT', 		'TXT_KEY_CITYSTATE_MUSCAT_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_MUTITJULU', 		'TXT_KEY_CITYSTATE_MUTITJULU', 		'TXT_KEY_CIV5_MUTITJULU_TEXT', 		'TXT_KEY_CITYSTATE_MUTITJULU', 		'TXT_KEY_CITYSTATE_MUTITJULU_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_PURPLE', 	'ARTSTYLE_POLYNESIAN', 		'_POLYNESIA', 		'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_NANMANDOL', 		'TXT_KEY_CITYSTATE_NANMANDOL', 		'TXT_KEY_CIV5_NANMANDOL_TEXT', 		'TXT_KEY_CITYSTATE_NANMANDOL',		'TXT_KEY_CITYSTATE_NANMANDOL_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_POLYNESIAN', 		'_POLYNESIA', 		'ASIAN', 			'MINOR_TRAIT_CULTURED',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_NYARYANA_MARQ', 	'TXT_KEY_CITYSTATE_NYARYANA_MARQ', 	'TXT_KEY_CIV5_NYARYANA_MARQ_TEXT', 	'TXT_KEY_CITYSTATE_NYARYANA_MARQ', 	'TXT_KEY_CITYSTATE_NYARYANA_MARQ_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_CULTURED',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'TXT_KEY_CITYSTATE_OC_EO', 			'TXT_KEY_CIV5_OC_EO_TEXT', 			'TXT_KEY_CITYSTATE_OC_EO', 			'TXT_KEY_CITYSTATE_OC_EO_ADJ', 			'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_CYAN', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'TXT_KEY_CITYSTATE_ODENSO', 		'TXT_KEY_CIV5_ODENSO_TEXT', 		'TXT_KEY_CITYSTATE_ODENSO', 		'TXT_KEY_CITYSTATE_ODENSO_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_PURPLE', 	'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'TXT_KEY_CITYSTATE_PHANOTEUS', 		'TXT_KEY_CIV5_PHANOTEUS_TEXT', 		'TXT_KEY_CITYSTATE_PHANOTEUS', 		'TXT_KEY_CITYSTATE_PHANOTEUS_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_BLUE', 	'ARTSTYLE_GRECO_ROMAN', 	'_MED', 			'MEDITERRANEAN', 	'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'TXT_KEY_CITYSTATE_QUELIMANE', 		'TXT_KEY_CIV5_QUELIMANE_TEXT', 		'TXT_KEY_CITYSTATE_QUELIMANE', 		'TXT_KEY_CITYSTATE_QUELIMANE_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_PEACH', 			'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_RISHIKESH', 		'TXT_KEY_CITYSTATE_RISHIKESH', 		'TXT_KEY_CIV5_RISHIKESH_TEXT', 		'TXT_KEY_CITYSTATE_RISHIKESH', 		'TXT_KEY_CITYSTATE_RISHIKESH_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_MIDDLE_EAST', 	'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO', 	'TXT_KEY_CIV5_SANTO_DOMINGO_TEXT', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_YELLOW', 	'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MERCANTILE',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SGAANG', 		'TXT_KEY_CITYSTATE_SGAANG', 		'TXT_KEY_CIV5_SGAANG_TEXT',			'TXT_KEY_CITYSTATE_SGAANG',			'TXT_KEY_CITYSTATE_SGAANG_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MARITIME',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CITYSTATE_SIERRA_LEONE', 	'TXT_KEY_CIV5_SIERRA_LEONE_TEXT',	'TXT_KEY_CITYSTATE_SIERRA_LEONE',	'TXT_KEY_CITYSTATE_SIERRA_LEONE_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_PURPLE', 	'ARTSTYLE_MIDDLE_EAST', 	'_AFRI', 			'AFRICAN', 			'MINOR_TRAIT_CULTURED',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'TXT_KEY_CITYSTATE_SURREY', 		'TXT_KEY_CIV5_SURREY_TEXT', 		'TXT_KEY_CITYSTATE_SURREY', 		'TXT_KEY_CITYSTATE_SURREY_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_EUROPEAN', 		'_EURO', 			'EUROPEAN', 		'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'TXT_KEY_CITYSTATE_TAIWAN', 		'TXT_KEY_CIV5_TAIWAN_TEXT', 		'TXT_KEY_CITYSTATE_TAIWAN', 		'TXT_KEY_CITYSTATE_TAIWAN_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GREEN', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_MARITIME',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'TXT_KEY_CITYSTATE_THIMPHU', 		'TXT_KEY_CIV5_THIMPHU_TEXT', 		'TXT_KEY_CITYSTATE_THIMPHU', 		'TXT_KEY_CITYSTATE_THIMPHU_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_MIDDLE_BLUE', 	'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_CULTURED',			'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_TIWANAKU', 		'TXT_KEY_CITYSTATE_TIWANAKU', 		'TXT_KEY_CIV5_TIWANAKU_TEXT', 		'TXT_KEY_CITYSTATE_TIWANAKU', 		'TXT_KEY_CITYSTATE_TIWANAKU_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_YELLOW', 	'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_WOOTEI_NIICIE', 	'TXT_KEY_CITYSTATE_WOOTEI_NIICIE', 	'TXT_KEY_CIV5_WOOTEI_NIICIE_TEXT',	'TXT_KEY_CITYSTATE_WOOTEI_NIICIE',	'TXT_KEY_CITYSTATE_WOOTEI_NIICIE_ADJ', 	'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_LIGHT_GREEN', 	'ARTSTYLE_SOUTH_AMERICA', 	'_AMER', 			'AMERICAN', 		'MINOR_TRAIT_MILITARISTIC',		'UNITCLASS_WORKER' UNION ALL
SELECT 		'MINOR_CIV_YANGCHENG', 		'TXT_KEY_CITYSTATE_YANGCHENG', 		'TXT_KEY_CIV5_YANGCHENG_TEXT', 		'TXT_KEY_CITYSTATE_YANGCHENG', 		'TXT_KEY_CITYSTATE_YANGCHENG_ADJ', 		'ART_DEF_CIVILIZATION_MINOR', 	'PLAYERCOLOR_MINOR_GRAY', 			'ARTSTYLE_ASIAN', 			'_ASIA', 			'ASIAN', 			'MINOR_TRAIT_RELIGIOUS',		'UNITCLASS_WORKER';

INSERT INTO MinorCivilization_CityNames 
			(MinorCivType, 				CityName)
SELECT 		'MINOR_CIV_ADEJE', 			'TXT_KEY_CITYSTATE_ADEJE' UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'TXT_KEY_CITYSTATE_AMBRACIA' UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'TXT_KEY_CITYSTATE_ANDORRA' UNION ALL
SELECT 		'MINOR_CIV_ARMAGH', 		'TXT_KEY_CITYSTATE_ARMAGH' UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'TXT_KEY_CITYSTATE_AUCKLAND' UNION ALL
SELECT 		'MINOR_CIV_BAGAN', 			'TXT_KEY_CITYSTATE_BAGAN' UNION ALL
SELECT 		'MINOR_CIV_BEDULU', 		'TXT_KEY_CITYSTATE_BEDULU' UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'TXT_KEY_CITYSTATE_CANOSSA' UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'TXT_KEY_CITYSTATE_CHEVAK' UNION ALL
SELECT 		'MINOR_CIV_CLERMONT', 		'TXT_KEY_CITYSTATE_CLERMONT' UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'TXT_KEY_CITYSTATE_DALI' UNION ALL
SELECT 		'MINOR_CIV_DANO', 			'TXT_KEY_CITYSTATE_DANO' UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CITYSTATE_DJIBOUTI' UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'TXT_KEY_CITYSTATE_DODOMA' UNION ALL
SELECT 		'MINOR_CIV_DOUALA', 		'TXT_KEY_CITYSTATE_DOUALA' UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'TXT_KEY_CITYSTATE_FAYA' UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'TXT_KEY_CITYSTATE_GRANADA' UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'TXT_KEY_CITYSTATE_GWYNEDD' UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'TXT_KEY_CITYSTATE_HONDURAS' UNION ALL
SELECT 		'MINOR_CIV_ISKANWAYA', 		'TXT_KEY_CITYSTATE_ISKANWAYA' UNION ALL
SELECT 		'MINOR_CIV_KARYES', 		'TXT_KEY_CITYSTATE_KARYES' UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'TXT_KEY_CITYSTATE_KIGALI' UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'TXT_KEY_CITYSTATE_LACONIA' UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'TXT_KEY_CITYSTATE_LEVUKA' UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'TXT_KEY_CITYSTATE_MANAGUA' UNION ALL
SELECT 		'MINOR_CIV_MUISCA', 		'TXT_KEY_CITYSTATE_MUISCA' UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'TXT_KEY_CITYSTATE_MULTAN' UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'TXT_KEY_CITYSTATE_MUSCAT' UNION ALL
SELECT 		'MINOR_CIV_MUTITJULU', 		'TXT_KEY_CITYSTATE_MUTITJULU' UNION ALL
SELECT 		'MINOR_CIV_NANMANDOL', 		'TXT_KEY_CITYSTATE_NANMANDOL' UNION ALL
SELECT 		'MINOR_CIV_NYARYANA_MARQ', 	'TXT_KEY_CITYSTATE_NYARYANA_MARQ' UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'TXT_KEY_CITYSTATE_OC_EO' UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'TXT_KEY_CITYSTATE_ODENSO' UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'TXT_KEY_CITYSTATE_PHANOTEUS' UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'TXT_KEY_CITYSTATE_QUELIMANE' UNION ALL
SELECT 		'MINOR_CIV_RISHIKESH', 		'TXT_KEY_CITYSTATE_RISHIKESH' UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'TXT_KEY_CITYSTATE_SANTO_DOMINGO' UNION ALL
SELECT 		'MINOR_CIV_SGAANG', 		'TXT_KEY_CITYSTATE_SGAANG' UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CITYSTATE_SIERRA_LEONE' UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'TXT_KEY_CITYSTATE_SURREY' UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'TXT_KEY_CITYSTATE_TAIWAN' UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'TXT_KEY_CITYSTATE_THIMPHU' UNION ALL
SELECT 		'MINOR_CIV_TIWANAKU', 		'TXT_KEY_CITYSTATE_TIWANAKU' UNION ALL
SELECT 		'MINOR_CIV_WOOTEI_NIICIE', 	'TXT_KEY_CITYSTATE_WOOTEI_NIICIE' UNION ALL
SELECT 		'MINOR_CIV_YANGCHENG', 		'TXT_KEY_CITYSTATE_YANGCHENG';

DELETE FROM MinorCivilization_Flavors;

INSERT INTO MinorCivilization_Flavors
			(MinorCivType, 				FlavorType, 				Flavor)
-- Base
SELECT		'MINOR_CIV_ALMATY', 		'FLAVOR_EXPANSION', 		9 UNION ALL
SELECT		'MINOR_CIV_ALMATY', 		'FLAVOR_OFFENSE', 			4 UNION ALL
SELECT		'MINOR_CIV_ALMATY', 		'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_ANTANANARIVO', 	'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_ANTANANARIVO', 	'FLAVOR_NAVAL', 			5 UNION ALL
SELECT 		'MINOR_CIV_ANTANANARIVO', 	'FLAVOR_OFFENSE', 			3 UNION ALL
SELECT 		'MINOR_CIV_ANTWERP', 		'FLAVOR_GOLD', 				8 UNION ALL
SELECT 		'MINOR_CIV_ANTWERP', 		'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_BELGRADE', 		'FLAVOR_CITY_DEFENSE', 		7 UNION ALL
SELECT 		'MINOR_CIV_BELGRADE', 		'FLAVOR_OFFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_BELGRADE', 		'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_BOGOTA', 		'FLAVOR_CULTURE', 			7 UNION ALL
SELECT 		'MINOR_CIV_BOGOTA', 		'FLAVOR_WONDER', 			6 UNION ALL
SELECT 		'MINOR_CIV_BOGOTA', 		'FLAVOR_GROWTH', 			2 UNION ALL
SELECT 		'MINOR_CIV_BRATISLAVA', 	'FLAVOR_CULTURE', 			9 UNION ALL
SELECT 		'MINOR_CIV_BRATISLAVA', 	'FLAVOR_EXPANSION', 		4 UNION ALL
SELECT 		'MINOR_CIV_BRATISLAVA', 	'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_BRUSSELS', 		'FLAVOR_WONDER', 			7 UNION ALL
SELECT 		'MINOR_CIV_BRUSSELS', 		'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_BRUSSELS', 		'FLAVOR_OFFENSE', 			3 UNION ALL
SELECT 		'MINOR_CIV_BUCHAREST', 		'FLAVOR_CULTURE', 			9 UNION ALL
SELECT 		'MINOR_CIV_BUCHAREST', 		'FLAVOR_DEFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_BUDAPEST', 		'FLAVOR_EXPANSION', 		7 UNION ALL
SELECT 		'MINOR_CIV_BUDAPEST', 		'FLAVOR_RELIGION', 			5 UNION ALL
SELECT 		'MINOR_CIV_BUDAPEST', 		'FLAVOR_WONDER', 			3 UNION ALL
SELECT 		'MINOR_CIV_BUENOS_AIRES', 	'FLAVOR_CULTURE', 			8 UNION ALL
SELECT 		'MINOR_CIV_BUENOS_AIRES', 	'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_BUENOS_AIRES', 	'FLAVOR_WONDER', 			3 UNION ALL
SELECT 		'MINOR_CIV_BYBLOS', 		'FLAVOR_GROWTH', 			10 UNION ALL
SELECT 		'MINOR_CIV_BYBLOS', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_BYBLOS', 		'FLAVOR_WONDER', 			2 UNION ALL
SELECT 		'MINOR_CIV_CAHOKIA', 		'FLAVOR_WONDER', 			9 UNION ALL
SELECT 		'MINOR_CIV_CAHOKIA', 		'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_CAPE_TOWN', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_CAPE_TOWN', 		'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_CAPE_TOWN', 		'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_COLOMBO', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_COLOMBO', 		'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_FLORENCE', 		'FLAVOR_WONDER', 			10 UNION ALL
SELECT 		'MINOR_CIV_FLORENCE', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_GENEVA', 		'FLAVOR_RELIGION', 			8 UNION ALL
SELECT 		'MINOR_CIV_GENEVA', 		'FLAVOR_EXPANSION', 		3 UNION ALL
SELECT 		'MINOR_CIV_GENEVA', 		'FLAVOR_WONDER', 			2 UNION ALL
SELECT 		'MINOR_CIV_GENEVA', 		'FLAVOR_OFFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_GENOA', 			'FLAVOR_NAVAL', 			7 UNION ALL
SELECT 		'MINOR_CIV_GENOA', 			'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_GENOA', 			'FLAVOR_MILITARY_TRAINING', 2 UNION ALL
SELECT 		'MINOR_CIV_HANOI', 			'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_HANOI', 			'FLAVOR_GOLD', 				4 UNION ALL
SELECT 		'MINOR_CIV_HANOI', 			'FLAVOR_CITY_DEFENSE', 		4 UNION ALL
SELECT 		'MINOR_CIV_HANOI', 			'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_HONG_KONG', 		'FLAVOR_GROWTH', 			7 UNION ALL
SELECT 		'MINOR_CIV_HONG_KONG', 		'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_HONG_KONG', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_IFE', 			'FLAVOR_CULTURE', 			6 UNION ALL
SELECT 		'MINOR_CIV_IFE', 			'FLAVOR_RELIGION', 			4 UNION ALL
SELECT 		'MINOR_CIV_IFE', 			'FLAVOR_GOLD', 				3 UNION ALL
SELECT 		'MINOR_CIV_IFE', 			'FLAVOR_GROWTH', 			2 UNION ALL
SELECT 		'MINOR_CIV_JERUSALEM', 		'FLAVOR_RELIGION', 			10 UNION ALL
SELECT 		'MINOR_CIV_JERUSALEM', 		'FLAVOR_EXPANSION', 		3 UNION ALL
SELECT 		'MINOR_CIV_JERUSALEM', 		'FLAVOR_GOLD', 				2 UNION ALL
SELECT 		'MINOR_CIV_KABUL', 			'FLAVOR_CULTURE', 			8 UNION ALL
SELECT 		'MINOR_CIV_KABUL', 			'FLAVOR_OFFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_KABUL', 			'FLAVOR_WONDER', 			3 UNION ALL
SELECT 		'MINOR_CIV_KATHMANDU', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_KATHMANDU', 		'FLAVOR_WONDER', 			5 UNION ALL
SELECT 		'MINOR_CIV_KATHMANDU', 		'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_KIEV', 			'FLAVOR_OFFENSE', 			8 UNION ALL
SELECT 		'MINOR_CIV_KIEV', 			'FLAVOR_CULTURE', 			4 UNION ALL
SELECT 		'MINOR_CIV_KIEV', 			'FLAVOR_RELIGION', 			3 UNION ALL
SELECT 		'MINOR_CIV_KUALA_LUMPUR', 	'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_KUALA_LUMPUR', 	'FLAVOR_GROWTH', 			6 UNION ALL
SELECT 		'MINOR_CIV_KUALA_LUMPUR', 	'FLAVOR_CITY_DEFENSE', 		2 UNION ALL
SELECT 		'MINOR_CIV_KYZYL', 			'FLAVOR_CULTURE', 			9 UNION ALL
SELECT 		'MINOR_CIV_KYZYL', 			'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_KYZYL', 			'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_KYZYL', 			'FLAVOR_OFFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_LA_VENTA', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_LA_VENTA', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_LA_VENTA', 		'FLAVOR_WONDER', 			4 UNION ALL
SELECT 		'MINOR_CIV_LHASA', 			'FLAVOR_RELIGION', 			9 UNION ALL
SELECT 		'MINOR_CIV_LHASA', 			'FLAVOR_CITY_DEFENSE', 		3 UNION ALL
SELECT 		'MINOR_CIV_LHASA', 			'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_LHASA', 			'FLAVOR_WONDER', 			1 UNION ALL
SELECT 		'MINOR_CIV_MALACCA', 		'FLAVOR_GOLD', 				8 UNION ALL
SELECT 		'MINOR_CIV_MALACCA', 		'FLAVOR_EXPANSION', 		4 UNION ALL
SELECT 		'MINOR_CIV_MALACCA', 		'FLAVOR_RELIGION', 			3 UNION ALL
SELECT 		'MINOR_CIV_MANILA', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_MANILA', 		'FLAVOR_CULTURE', 			6 UNION ALL
SELECT 		'MINOR_CIV_MANILA', 		'FLAVOR_WONDER', 			1 UNION ALL
SELECT 		'MINOR_CIV_MBANZA_KONGO', 	'FLAVOR_DEFENSE', 			8 UNION ALL
SELECT 		'MINOR_CIV_MBANZA_KONGO', 	'FLAVOR_OFFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MBANZA_KONGO', 	'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_MELBOURNE', 		'FLAVOR_EXPANSION', 		6 UNION ALL
SELECT 		'MINOR_CIV_MELBOURNE', 		'FLAVOR_OFFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MELBOURNE', 		'FLAVOR_GOLD', 				4 UNION ALL
SELECT 		'MINOR_CIV_MILAN', 			'FLAVOR_CULTURE', 			10 UNION ALL
SELECT 		'MINOR_CIV_MILAN', 			'FLAVOR_GROWTH', 			3 UNION ALL
SELECT 		'MINOR_CIV_MILAN', 			'FLAVOR_WONDER', 			2 UNION ALL
SELECT 		'MINOR_CIV_MOGADISHU', 		'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_MOGADISHU', 		'FLAVOR_DEFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MOGADISHU', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MOMBASA', 		'FLAVOR_GROWTH', 			6 UNION ALL
SELECT 		'MINOR_CIV_MOMBASA', 		'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_MOMBASA', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_MONACO', 		'FLAVOR_EXPANSION', 		8 UNION ALL
SELECT 		'MINOR_CIV_MONACO', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MONACO', 		'FLAVOR_GOLD', 				2 UNION ALL
SELECT 		'MINOR_CIV_ORMUS', 			'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_ORMUS', 			'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_PANAMA_CITY', 	'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_PANAMA_CITY', 	'FLAVOR_NAVAL', 			5 UNION ALL
SELECT 		'MINOR_CIV_PANAMA_CITY', 	'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_PRAGUE', 		'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_PRAGUE', 		'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_PRAGUE', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_QUEBEC_CITY', 	'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_QUEBEC_CITY', 	'FLAVOR_GROWTH', 			7 UNION ALL
SELECT 		'MINOR_CIV_QUEBEC_CITY', 	'FLAVOR_EXPANSION', 		1 UNION ALL
SELECT 		'MINOR_CIV_RAGUSA', 		'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_RAGUSA', 		'FLAVOR_NAVAL', 			5 UNION ALL
SELECT 		'MINOR_CIV_RAGUSA', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_RAGUSA', 		'FLAVOR_EXPANSION', 		2 UNION ALL
SELECT 		'MINOR_CIV_RIGA', 			'FLAVOR_GROWTH', 			9 UNION ALL
SELECT 		'MINOR_CIV_RIGA', 			'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_RIGA', 			'FLAVOR_CULTURE', 			1 UNION ALL
SELECT 		'MINOR_CIV_SAMARKAND', 		'FLAVOR_GOLD', 				10 UNION ALL
SELECT 		'MINOR_CIV_SAMARKAND', 		'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_SIDON', 			'FLAVOR_OFFENSE', 			9 UNION ALL
SELECT 		'MINOR_CIV_SIDON', 			'FLAVOR_EXPANSION', 		3 UNION ALL
SELECT 		'MINOR_CIV_SIDON', 			'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_SINGAPORE', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_SINGAPORE', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_SINGAPORE', 		'FLAVOR_NAVAL', 			3 UNION ALL
SELECT 		'MINOR_CIV_SOFIA', 			'FLAVOR_MILITARY_TRAINING', 7 UNION ALL
SELECT 		'MINOR_CIV_SOFIA', 			'FLAVOR_OFFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_SOFIA', 			'FLAVOR_EXPANSION', 		3 UNION ALL
SELECT 		'MINOR_CIV_SYDNEY', 		'FLAVOR_CULTURE', 			8 UNION ALL
SELECT 		'MINOR_CIV_SYDNEY', 		'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_SYDNEY', 		'FLAVOR_WONDER', 			3 UNION ALL
SELECT 		'MINOR_CIV_TYRE', 			'FLAVOR_CITY_DEFENSE', 		10 UNION ALL
SELECT 		'MINOR_CIV_TYRE', 			'FLAVOR_GROWTH', 			3 UNION ALL
SELECT 		'MINOR_CIV_TYRE', 			'FLAVOR_WONDER', 			2 UNION ALL
SELECT 		'MINOR_CIV_UR', 			'FLAVOR_GROWTH', 			9 UNION ALL
SELECT 		'MINOR_CIV_UR', 			'FLAVOR_DEFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_UR', 			'FLAVOR_CULTURE', 			2 UNION ALL
SELECT 		'MINOR_CIV_VALLETTA', 		'FLAVOR_NAVAL', 			10 UNION ALL
SELECT 		'MINOR_CIV_VALLETTA', 		'FLAVOR_DEFENSE', 			3 UNION ALL
SELECT 		'MINOR_CIV_VALLETTA', 		'FLAVOR_GROWTH', 			2 UNION ALL
SELECT 		'MINOR_CIV_VANCOUVER', 		'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_VANCOUVER', 		'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_VANCOUVER', 		'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_VATICAN_CITY', 	'FLAVOR_RELIGION', 			8 UNION ALL
SELECT 		'MINOR_CIV_VATICAN_CITY', 	'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_VATICAN_CITY', 	'FLAVOR_GOLD', 				2 UNION ALL
SELECT 		'MINOR_CIV_VILNIUS', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_VILNIUS', 		'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_VILNIUS', 		'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_WELLINGTON', 	'FLAVOR_GROWTH', 			9 UNION ALL
SELECT 		'MINOR_CIV_WELLINGTON', 	'FLAVOR_GOLD', 				4 UNION ALL
SELECT 		'MINOR_CIV_WELLINGTON', 	'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_WITTENBERG', 	'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_WITTENBERG', 	'FLAVOR_DEFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_WITTENBERG', 	'FLAVOR_CULTURE', 			4 UNION ALL
SELECT 		'MINOR_CIV_YEREVAN', 		'FLAVOR_CULTURE', 			6 UNION ALL
SELECT 		'MINOR_CIV_YEREVAN', 		'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_YEREVAN', 		'FLAVOR_MILITARY_TRAINING', 4 UNION ALL
SELECT 		'MINOR_CIV_ZANZIBAR', 		'FLAVOR_GOLD', 				8 UNION ALL
SELECT 		'MINOR_CIV_ZANZIBAR', 		'FLAVOR_GROWTH', 			4 UNION ALL
SELECT 		'MINOR_CIV_ZANZIBAR', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_ZURICH', 		'FLAVOR_GOLD', 				10  UNION ALL
SELECT 		'MINOR_CIV_ZURICH', 		'FLAVOR_CITY_DEFENSE', 		2  UNION ALL
SELECT 		'MINOR_CIV_ZURICH', 		'FLAVOR_DEFENSE', 			2  UNION ALL
SELECT 		'MINOR_CIV_ZURICH', 		'FLAVOR_MILITARY_TRAINING', 1  UNION ALL
-- UCS
SELECT 		'MINOR_CIV_CLERMONT', 		'FLAVOR_OFFENSE', 			9 UNION ALL
SELECT 		'MINOR_CIV_CLERMONT', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'FLAVOR_GROWTH', 			5 UNION ALL
SELECT 		'MINOR_CIV_HONDURAS', 		'FLAVOR_NAVAL', 			3 UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'FLAVOR_GROWTH', 			7 UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'FLAVOR_NAVAL', 			6 UNION ALL
SELECT 		'MINOR_CIV_AUCKLAND', 		'FLAVOR_DEFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_ARMAGH', 		'FLAVOR_RELIGION', 			10 UNION ALL
SELECT 		'MINOR_CIV_ARMAGH', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'FLAVOR_NAVAL', 			5 UNION ALL
SELECT 		'MINOR_CIV_MUSCAT', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_DEFENSE', 			8 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_CITY_DEFENSE', 		4 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_MILITARY_TRAINING', 2 UNION ALL
SELECT 		'MINOR_CIV_GRANADA', 		'FLAVOR_OFFENSE', 			1 UNION ALL
SELECT 		'MINOR_CIV_NANMANDOL', 		'FLAVOR_NAVAL', 			9 UNION ALL
SELECT 		'MINOR_CIV_NANMANDOL', 		'FLAVOR_CULTURE', 			4 UNION ALL
SELECT 		'MINOR_CIV_NANMANDOL', 		'FLAVOR_RELIGION', 			2 UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'FLAVOR_OFFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_GWYNEDD', 		'FLAVOR_DEFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_MUISCA', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_MUISCA', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'FLAVOR_MILITARY_TRAINING', 9 UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'FLAVOR_DEFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_LACONIA', 		'FLAVOR_CITY_DEFENSE', 		2 UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'FLAVOR_NAVAL', 			8 UNION ALL
SELECT 		'MINOR_CIV_CHEVAK', 		'FLAVOR_GROWTH', 			7 UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'FLAVOR_EXPANSION', 		5 UNION ALL
SELECT 		'MINOR_CIV_SANTO_DOMINGO', 	'FLAVOR_GROWTH', 			3 UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'FLAVOR_NAVAL', 			6 UNION ALL
SELECT 		'MINOR_CIV_MANAGUA', 		'FLAVOR_GROWTH', 			3 UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'FLAVOR_DEFENSE', 			5 UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'FLAVOR_MILITARY_TRAINING', 5 UNION ALL
SELECT 		'MINOR_CIV_ODENSO', 		'FLAVOR_CITY_DEFENSE', 		5 UNION ALL
SELECT 		'MINOR_CIV_YANGCHENG', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_YANGCHENG', 		'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'FLAVOR_NAVAL', 			7 UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'FLAVOR_OFFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_PHANOTEUS', 		'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_DOUALA', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_DOUALA', 		'FLAVOR_NAVAL', 			6 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_OFFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_AMBRACIA', 		'FLAVOR_NAVAL', 			3 UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'FLAVOR_GOLD', 				8 UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'FLAVOR_MILITARY_TRAINING', 4 UNION ALL
SELECT 		'MINOR_CIV_DJIBOUTI', 		'FLAVOR_RELIGION', 			3 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_EXPANSION', 		3 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_MILITARY_TRAINING', 2 UNION ALL
SELECT 		'MINOR_CIV_DODOMA', 		'FLAVOR_DEFENSE', 			1 UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'FLAVOR_DEFENSE', 			8 UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'FLAVOR_CITY_DEFENSE', 		4 UNION ALL
SELECT 		'MINOR_CIV_FAYA', 			'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'FLAVOR_GOLD', 				9 UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'FLAVOR_DEFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_KIGALI', 		'FLAVOR_CULTURE', 			2 UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'FLAVOR_OFFENSE', 			6 UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'FLAVOR_NAVAL', 			6 UNION ALL
SELECT 		'MINOR_CIV_LEVUKA', 		'FLAVOR_GROWTH', 			3 UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'FLAVOR_GROWTH', 			8 UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_QUELIMANE', 		'FLAVOR_NAVAL', 			2 UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'FLAVOR_GOLD', 				7 UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_SIERRA_LEONE', 	'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_OFFENSE', 			3 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_MILITARY_TRAINING', 3 UNION ALL
SELECT 		'MINOR_CIV_SURREY', 		'FLAVOR_EXPANSION', 		2 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_DEFENSE', 			7 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_CITY_DEFENSE', 		3 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_GOLD', 				3 UNION ALL
SELECT 		'MINOR_CIV_TAIWAN', 		'FLAVOR_WONDER', 			2 UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'FLAVOR_EXPANSION', 		6 UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'FLAVOR_GOLD', 				5 UNION ALL
SELECT 		'MINOR_CIV_OC_EO', 			'FLAVOR_NAVAL', 			4 UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'FLAVOR_CULTURE', 			9 UNION ALL
SELECT 		'MINOR_CIV_THIMPHU', 		'FLAVOR_WONDER', 			6 UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'FLAVOR_CITY_DEFENSE', 		8 UNION ALL
SELECT 		'MINOR_CIV_ANDORRA', 		'FLAVOR_CULTURE', 			7 UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'FLAVOR_RELIGION', 			8 UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'FLAVOR_CITY_DEFENSE', 		5 UNION ALL
SELECT 		'MINOR_CIV_CANOSSA', 		'FLAVOR_MILITARY_TRAINING', 2 UNION ALL
SELECT 		'MINOR_CIV_BEDULU', 		'FLAVOR_RELIGION', 			10 UNION ALL
SELECT 		'MINOR_CIV_BEDULU', 		'FLAVOR_NAVAL', 			2 UNION ALL
SELECT 		'MINOR_CIV_BEDULU', 		'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'FLAVOR_RELIGION', 			4 UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'FLAVOR_GOLD', 				6 UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'FLAVOR_CULTURE', 			4 UNION ALL
SELECT 		'MINOR_CIV_DALI', 			'FLAVOR_MILITARY_TRAINING', 1 UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'FLAVOR_RELIGION', 			3 UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'FLAVOR_EXPANSION', 		8 UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'FLAVOR_OFFENSE', 			2 UNION ALL
SELECT 		'MINOR_CIV_MULTAN', 		'FLAVOR_MILITARY_TRAINING', 2 UNION ALL
SELECT 		'MINOR_CIV_BAGAN', 			'FLAVOR_RELIGION', 			8 UNION ALL
SELECT 		'MINOR_CIV_BAGAN', 			'FLAVOR_EXPANSION', 		7 UNION ALL
SELECT 		'MINOR_CIV_RISHIKESH', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_RISHIKESH', 		'FLAVOR_CITY_DEFENSE', 		6 UNION ALL
SELECT 		'MINOR_CIV_RISHIKESH', 		'FLAVOR_DEFENSE', 			3 UNION ALL
SELECT 		'MINOR_CIV_MUTITJULU', 		'FLAVOR_RELIGION', 			8 UNION ALL
SELECT 		'MINOR_CIV_MUTITJULU', 		'FLAVOR_WONDER', 			7 UNION ALL
SELECT 		'MINOR_CIV_ISKANWAYA', 		'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_ISKANWAYA', 		'FLAVOR_CULTURE', 			7 UNION ALL
SELECT 		'MINOR_CIV_ISKANWAYA', 		'FLAVOR_MILITARY_TRAINING', 1 UNION ALL
SELECT 		'MINOR_CIV_TIWANAKU', 		'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_TIWANAKU', 		'FLAVOR_GOLD', 				4 UNION ALL
SELECT 		'MINOR_CIV_TIWANAKU', 		'FLAVOR_WONDER',			4 UNION ALL
SELECT 		'MINOR_CIV_DANO', 			'FLAVOR_RELIGION', 			7 UNION ALL
SELECT 		'MINOR_CIV_DANO', 			'FLAVOR_EXPANSION', 		6 UNION ALL
SELECT 		'MINOR_CIV_DANO', 			'FLAVOR_CULTURE',			2 UNION ALL
SELECT 		'MINOR_CIV_KARYES', 		'FLAVOR_RELIGION', 			6 UNION ALL
SELECT 		'MINOR_CIV_KARYES', 		'FLAVOR_CITY_DEFENSE', 		5 UNION ALL
SELECT 		'MINOR_CIV_KARYES', 		'FLAVOR_DEFENSE',			4 UNION ALL
SELECT 		'MINOR_CIV_SGAANG', 		'FLAVOR_GROWTH', 			7 UNION ALL
SELECT 		'MINOR_CIV_SGAANG', 		'FLAVOR_NAVAL', 			6 UNION ALL
SELECT 		'MINOR_CIV_SGAANG', 		'FLAVOR_CULTURE',			2 UNION ALL
SELECT 		'MINOR_CIV_ADEJE', 			'FLAVOR_GROWTH', 			6 UNION ALL
SELECT 		'MINOR_CIV_ADEJE', 			'FLAVOR_CULTURE', 			6 UNION ALL
SELECT 		'MINOR_CIV_ADEJE', 			'FLAVOR_RELIGION',			3 UNION ALL
SELECT 		'MINOR_CIV_NYARYANA_MARQ', 	'FLAVOR_GROWTH', 			6 UNION ALL
SELECT 		'MINOR_CIV_NYARYANA_MARQ', 	'FLAVOR_CULTURE', 			5 UNION ALL
SELECT 		'MINOR_CIV_NYARYANA_MARQ', 	'FLAVOR_GOLD',				4 UNION ALL
SELECT 		'MINOR_CIV_WOOTEI_NIICIE', 	'FLAVOR_MILITARY_TRAINING', 9 UNION ALL
SELECT 		'MINOR_CIV_WOOTEI_NIICIE', 	'FLAVOR_OFFENSE', 			4 UNION ALL
SELECT 		'MINOR_CIV_WOOTEI_NIICIE', 	'FLAVOR_DEFENSE',			2;
--Jarcast


---------------------------------------------------
-- Definitions - Technologies
---------------------------------------------------
INSERT INTO Technologies 
			(Type,			Cost,	Description,	Civilopedia,	Help,	Era,	Trade,	GoodyTech,	Disable,	GridX,	GridY,	PortraitIndex,	IconAtlas)
SELECT		Type||'_DUMMY',	-1,		Description,	Civilopedia,	Help,	Era,	0,		0,			1,			0,		50,		PortraitIndex,	IconAtlas
FROM Technologies WHERE Type = 'TECH_HORSEBACK_RIDING';
---------------------------------------------------
-- Definitions - Policies
---------------------------------------------------
INSERT INTO Policies (Type, Description)
SELECT 'POLICY_ALMATY', 				'TXT_KEY_CITYSTATE_ALMATY'UNION ALL
SELECT 'POLICY_AMBRACIA', 				'TXT_KEY_CITYSTATE_AMBRACIA' UNION ALL
SELECT 'POLICY_ANTANANARIVO', 			'TXT_KEY_CITYSTATE_ANTANANARIVO' UNION ALL
SELECT 'POLICY_AUCKLAND', 				'TXT_KEY_CITYSTATE_AUCKLAND' UNION ALL
SELECT 'POLICY_BAGAN', 					'TXT_KEY_CITYSTATE_BAGAN' UNION ALL
SELECT 'POLICY_BOGOTA', 				'TXT_KEY_CITYSTATE_BOGOTA' UNION ALL
SELECT 'POLICY_BRATISLAVA', 			'TXT_KEY_CITYSTATE_BRATISLAVA' UNION ALL
SELECT 'POLICY_BUCHAREST', 				'TXT_KEY_CITYSTATE_BUCHAREST' UNION ALL
SELECT 'POLICY_BUENOS_AIRES', 			'TXT_KEY_CITYSTATE_BUENOS_AIRES' UNION ALL
SELECT 'POLICY_BYBLOS', 				'TXT_KEY_CITYSTATE_BYBLOS' UNION ALL
SELECT 'POLICY_DALI', 					'TXT_KEY_CITYSTATE_DALI' UNION ALL
SELECT 'POLICY_DANO', 					'TXT_KEY_CITYSTATE_DANO' UNION ALL
SELECT 'POLICY_DJIBOUTI', 				'TXT_KEY_CITYSTATE_DJIBOUTI' UNION ALL
SELECT 'POLICY_DODOMA', 				'TXT_KEY_CITYSTATE_DODOMA' UNION ALL
SELECT 'POLICY_DOUALA', 				'TXT_KEY_CITYSTATE_DOUALA' UNION ALL
SELECT 'POLICY_GENEVA', 				'TXT_KEY_CITYSTATE_GENEVA' UNION ALL
SELECT 'POLICY_GENOA', 					'TXT_KEY_CITYSTATE_GENOA' UNION ALL
SELECT 'POLICY_GRANADA', 				'TXT_KEY_CITYSTATE_GRANADA' UNION ALL
SELECT 'POLICY_GWYNEDD', 				'TXT_KEY_CITYSTATE_GWYNEDD' UNION ALL
SELECT 'POLICY_HONDURAS', 				'TXT_KEY_CITYSTATE_HONDURAS' UNION ALL
SELECT 'POLICY_HONG_KONG', 				'TXT_KEY_CITYSTATE_HONG_KONG' UNION ALL
SELECT 'POLICY_KIGALI', 				'TXT_KEY_CITYSTATE_KIGALI' UNION ALL
SELECT 'POLICY_KUALA_LUMPUR', 			'TXT_KEY_CITYSTATE_KUALA_LUMPUR' UNION ALL
SELECT 'POLICY_MANAGUA', 				'TXT_KEY_CITYSTATE_MANAGUA' UNION ALL
SELECT 'POLICY_MALACCA', 				'TXT_KEY_CITYSTATE_MALACCA' UNION ALL
SELECT 'POLICY_MANILA', 				'TXT_KEY_CITYSTATE_MANILA' UNION ALL
SELECT 'POLICY_MOGADISHU', 				'TXT_KEY_CITYSTATE_MOGADISHU' UNION ALL
SELECT 'POLICY_MOMBASA', 				'TXT_KEY_CITYSTATE_MOMBASA' UNION ALL
SELECT 'POLICY_MONACO', 				'TXT_KEY_CITYSTATE_MONACO' UNION ALL
SELECT 'POLICY_MUISCA', 				'TXT_KEY_CITYSTATE_MUISCA' UNION ALL
SELECT 'POLICY_MULTAN', 				'TXT_KEY_CITYSTATE_MULTAN' UNION ALL
SELECT 'POLICY_MUSCAT', 				'TXT_KEY_CITYSTATE_MUSCAT' UNION ALL
SELECT 'POLICY_MUTITJULU', 				'TXT_KEY_CITYSTATE_MUTITJULU' UNION ALL
SELECT 'POLICY_ORMUS', 					'TXT_KEY_CITYSTATE_ORMUS' UNION ALL
SELECT 'POLICY_PHANOTEUS', 				'TXT_KEY_CITYSTATE_PHANOTEUS' UNION ALL
SELECT 'POLICY_QUELIMANE', 				'TXT_KEY_CITYSTATE_QUELIMANE' UNION ALL
SELECT 'POLICY_SAMARKAND', 				'TXT_KEY_CITYSTATE_SAMARKAND' UNION ALL
SELECT 'POLICY_SANTO_DOMINGO', 			'TXT_KEY_CITYSTATE_SANTO_DOMINGO' UNION ALL
SELECT 'POLICY_SIERRA_LEONE', 			'TXT_KEY_CITYSTATE_SIERRA_LEONE' UNION ALL
SELECT 'POLICY_SOFIA', 					'TXT_KEY_CITYSTATE_SOFIA' UNION ALL
SELECT 'POLICY_SYDNEY', 				'TXT_KEY_CITYSTATE_SYDNEY' UNION ALL
SELECT 'POLICY_UR', 					'TXT_KEY_CITYSTATE_UR' UNION ALL
SELECT 'POLICY_VANCOUVER', 				'TXT_KEY_CITYSTATE_VANCOUVER' UNION ALL
SELECT 'POLICY_WOOTEI_NIICIE', 			'TXT_KEY_CITYSTATE_WOOTEI_NIICIE' UNION ALL
--SELECT 'POLICY_VATICAN_CITY', 			'TXT_KEY_CITYSTATE_VATICAN_CITY' UNION ALL
SELECT 'POLICY_ZANZIBAR', 				'TXT_KEY_CITYSTATE_ZANZIBAR' UNION ALL
/*SELECT 'POLICY_MARITIME', 				'TXT_KEY_POLICY_MARITIME' UNION ALL
SELECT 'POLICY_RELIGIOUS', 				'TXT_KEY_BUILDING_RELIGIOUS' UNION ALL
SELECT 'POLICY_RELIGIOUS_FRIENDLY', 	'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY' UNION ALL
SELECT 'POLICY_MILITARISTIC', 			'TXT_KEY_BUILDING_MILITARISTIC' UNION ALL
SELECT 'POLICY_MILITARISTIC_FRIENDLY', 	'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY';*/
SELECT 'POLICY_CS_MARITIME', 			'TXT_KEY_POLICY_CS_MARITIME' UNION ALL
SELECT 'POLICY_CS_MERCANTILE', 			'TXT_KEY_POLICY_CS_MERCANTILE' UNION ALL
SELECT 'POLICY_CS_MILITARISTIC', 		'TXT_KEY_POLICY_CS_MILITARISTIC' UNION ALL
SELECT 'POLICY_CS_CULTURED', 			'TXT_KEY_POLICY_CS_CULTURED' UNION ALL
SELECT 'POLICY_CS_RELIGIOUS', 			'TXT_KEY_POLICY_CS_RELIGIOUS';

UPDATE Policies SET AfraidMinorPerTurnInfluence = 100 WHERE Type = 'POLICY_ALMATY';
UPDATE Policies SET CityStateUnitFrequencyModifier = 10 WHERE Type = 'POLICY_AMBRACIA';
UPDATE Policies SET AlwaysSeeBarbCamps = 1 WHERE Type = 'POLICY_ANTANANARIVO'; 
UPDATE Policies SET EventTourism = 2 WHERE Type = 'POLICY_BUCHAREST'; 
UPDATE Policies SET ExtraHappinessPerLuxury = 1 WHERE Type = 'POLICY_BUENOS_AIRES'; 
UPDATE Policies SET MinorGreatPeopleAllies = 1 WHERE Type = 'POLICY_BRATISLAVA';
UPDATE Policies SET WonderProductionModifier = 5 WHERE Type = 'POLICY_BYBLOS';
UPDATE Policies SET TradeReligionModifier = 10 WHERE Type = 'POLICY_DALI';
UPDATE Policies SET SettlerProductionModifier = 100, NewFoundCityFreeBuilding = 'BUILDINGCLASS_GRANARY' WHERE Type = 'POLICY_DJIBOUTI';
UPDATE Policies SET FreeTradeRoute = 1 WHERE Type = 'POLICY_DOUALA';
UPDATE Policies SET WarScoreModifier = 20 WHERE Type = 'POLICY_GRANADA';
UPDATE Policies SET CSResourcesCountForMonopolies = 1 WHERE Type = 'POLICY_HONDURAS';
UPDATE Policies SET CityGrowthMod = 5 WHERE Type = 'POLICY_HONG_KONG';
UPDATE Policies SET WarWearinessModifier = 10 WHERE Type = 'POLICY_KIGALI';
UPDATE Policies SET MonopolyModPercent = 7 WHERE Type = 'POLICY_MANAGUA';
UPDATE Policies SET TradeMissionGoldModifier = 10, GreatMerchantRateModifier = 10 WHERE Type = 'POLICY_MALACCA'; 
UPDATE Policies SET TradeRouteYieldModifier = 5 WHERE Type = 'POLICY_MANILA'; 
UPDATE Policies SET GoldenAgeMeterMod = -10 WHERE Type = 'POLICY_MOGADISHU';
UPDATE Policies SET PlotGoldCostMod = -33 WHERE Type = 'POLICY_MONACO';
UPDATE Policies SET DoubleBorderGrowthGA = 1, DoubleBorderGrowthWLTKD = 1 WHERE Type = 'POLICY_MUISCA'; 
UPDATE Policies SET ExtraMissionarySpreads = 1 WHERE Type = 'POLICY_MULTAN';
UPDATE Policies SET CatchSpiesModifier = 50, GarrisonedCityRangeStrikeModifier = 10, GarrisonFreeMaintenance = 1 WHERE Type = 'POLICY_MUSCAT';
UPDATE Policies SET ProtectedMinorPerTurnInfluence = 40 WHERE Type = 'POLICY_ORMUS';
UPDATE Policies SET EspionageModifier = -20, StealTechFasterModifier = 20, RiggingElectionModifier = 20 WHERE Type = 'POLICY_PHANOTEUS';
UPDATE Policies SET GoldenAgeDurationMod = 25 WHERE Type = 'POLICY_QUELIMANE';
UPDATE Policies SET TRVisionBoost = 2 WHERE Type = 'POLICY_SAMARKAND';
UPDATE Policies SET MonopolyModFlat = 3 WHERE Type = 'POLICY_SANTO_DOMINGO';
UPDATE Policies SET WorkerSpeedModifier = 20 WHERE Type = 'POLICY_SIERRA_LEONE';
UPDATE Policies SET GreatGeneralExtraBonus = 10 WHERE Type = 'POLICY_SOFIA';
UPDATE Policies SET NewCityExtraPopulation = 1 WHERE Type = 'POLICY_UR';
UPDATE Policies SET RouteGoldMaintenanceMod = -30 WHERE Type = 'POLICY_VANCOUVER';
--UPDATE Policies SET FaithCostModifier = -10 WHERE Type = 'POLICY_VATICAN_CITY';
UPDATE Policies SET HappinessPerTradeRoute = 75 WHERE Type = 'POLICY_ZANZIBAR';

/*UPDATE Policies SET CityGrowthMod = 15 WHERE Type = 'POLICY_MARITIME';
UPDATE Policies SET CityGrowthMod = -33 WHERE Type = 'POLICY_MILITARISTIC';
UPDATE Policies SET CityStateUnitFrequencyModifier = 1 WHERE Type = 'POLICY_MILITARISTIC_FRIENDLY';*/



INSERT INTO Policy_BuildingClassHappiness
    		(PolicyType, 		BuildingClassType, 			Happiness)
SELECT 		'POLICY_BAGAN',		'BUILDINGCLASS_TEMPLE', 	1;

INSERT INTO Policy_YieldChangesNaturalWonder 
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MUTITJULU', 'YIELD_FAITH', 	3;

INSERT INTO Policy_YieldChangeTradeRoute /* City Connections */
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_ALMATY', 	'YIELD_SCIENCE', 	1 UNION ALL
SELECT 		'POLICY_UR', 		'YIELD_FOOD', 		2;

INSERT INTO Policy_TradeRouteYieldChange /* Actual Trade Routes */
			(PolicyType, 					DomainType,			YieldType, 						Yield)
SELECT 		'POLICY_ALMATY', 				'DOMAIN_LAND',		'YIELD_SCIENCE', 				1 UNION ALL
SELECT 		'POLICY_DODOMA', 				'DOMAIN_SEA',		'YIELD_TOURISM', 				1 UNION ALL
SELECT 		'POLICY_RELIGIOUS_FRIENDLY', 	'DOMAIN_LAND',		'YIELD_CULTURE', 				2 UNION ALL
SELECT 		'POLICY_RELIGIOUS_FRIENDLY', 	'DOMAIN_SEA',		'YIELD_CULTURE', 				2;

INSERT INTO Policy_CapitalYieldPerPopChanges
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MUISCA', 	'YIELD_GOLD', 	3;

INSERT INTO Policy_CapitalYieldPerPopChangeEmpire
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MUISCA', 	'YIELD_GOLD', 	20;

INSERT INTO Policy_CoastalCityYieldChanges 
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_AUCKLAND', 	'YIELD_FOOD', 	3;

INSERT INTO Policy_GreatWorkYieldChanges 
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_BUCHAREST', 'YIELD_CULTURE', 	1;

INSERT INTO Policy_WLTKDYieldMod 
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_GWYNEDD', 	'YIELD_CULTURE', 	10;
SELECT 		'POLICY_SYDNEY', 	'YIELD_FOOD', 		5;

INSERT INTO Policy_GoldenAgeYieldMod
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MOGADISHU', 'YIELD_FOOD', 	5;

INSERT INTO Policy_YieldFromBirth
			(PolicyType, 			YieldType, 			Yield)
SELECT 		'POLICY_KUALA_LUMPUR', 	'YIELD_CULTURE',	10 UNION ALL
SELECT 		'POLICY_MULTAN', 		'YIELD_FAITH', 		10;

INSERT INTO Policy_YieldFromConstruction 
			(PolicyType, 			YieldType, 		Yield)
SELECT 		'POLICY_KUALA_LUMPUR', 	'YIELD_FOOD', 	20 UNION ALL
SELECT 		'POLICY_BAGAN',			'YIELD_FAITH', 	10;

INSERT INTO Policy_YieldFromBorderGrowth 
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_DANO',		'YIELD_FAITH', 		3 UNION ALL
SELECT 		'POLICY_KIGALI',	'YIELD_PRODUCTION',	1 UNION ALL
SELECT 		'POLICY_KIGALI',	'YIELD_GOLD',		1;

INSERT INTO Policy_ConquerorYield 
			(PolicyType, 		YieldType, 			Yield)
SELECT 		'POLICY_BOGOTA', 	'YIELD_CULTURE', 	40;

INSERT INTO Policy_FounderYield 
			(PolicyType, 		YieldType, 		Yield)
SELECT 		'POLICY_MOMBASA',	'YIELD_FAITH', 	40;

INSERT INTO Policy_UnitCombatProductionModifiers
			(PolicyType,				UnitCombatType,			ProductionModifier)
SELECT 		'POLICY_WOOTEI_NIICIE', 	'UNITCOMBAT_MOUNTED',	10 UNION ALL
SELECT 		'POLICY_WOOTEI_NIICIE', 	'UNITCOMBAT_GUN',		10;
---------------------------------------------------
-- Definitions - Unit Promotions
---------------------------------------------------
INSERT INTO UnitPromotions 
			(Type, 										Description, 								Help, 											CannotBeChosen, Sound, 				PortraitIndex, 	IconAtlas, 				PediaType, 			PediaEntry)
SELECT 		'PROMOTION_AMBRACIA', 						'TXT_KEY_PROMOTION_AMBRACIA', 				'TXT_KEY_PROMOTION_AMBRACIA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	16, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_AMBRACIA' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 					'TXT_KEY_PROMOTION_ANTANANARIVO', 			'TXT_KEY_PROMOTION_ANTANANARIVO_HELP', 			1, 				'AS2D_IF_LEVELUP', 	7, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_ANTANANARIVO' UNION ALL
SELECT 		'PROMOTION_AUCKLAND', 						'TXT_KEY_PROMOTION_AUCKLAND', 				'TXT_KEY_PROMOTION_AUCKLAND_HELP', 				1, 				'AS2D_IF_LEVELUP', 	25, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_AUCKLAND' UNION ALL
SELECT 		'PROMOTION_BELGRADE', 						'TXT_KEY_PROMOTION_BELGRADE', 				'TXT_KEY_PROMOTION_BELGRADE_HELP', 				1, 				'AS2D_IF_LEVELUP', 	8, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SIEGE', 		'TXT_KEY_PROMOTION_BELGRADE' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 						'TXT_KEY_PROMOTION_CLERMONT', 				'TXT_KEY_PROMOTION_CLERMONT_HELP', 				1, 				'AS2D_IF_LEVELUP', 	0, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 						'TXT_KEY_PROMOTION_CLERMONT1', 				'TXT_KEY_PROMOTION_CLERMONT1_HELP', 			1, 				'AS2D_IF_LEVELUP', 	0, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT1' UNION ALL
SELECT 		'PROMOTION_CLERMONT2', 						'TXT_KEY_PROMOTION_CLERMONT2', 				'TXT_KEY_PROMOTION_CLERMONT2_HELP', 			1, 				'AS2D_IF_LEVELUP', 	2, 				'UCS_PROMOTION_ATLAS',	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT2' UNION ALL
SELECT 		'PROMOTION_CLERMONT3', 						'TXT_KEY_PROMOTION_CLERMONT3', 				'TXT_KEY_PROMOTION_CLERMONT3_HELP', 			1, 				'AS2D_IF_LEVELUP', 	3, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT3' UNION ALL
SELECT 		'PROMOTION_CLERMONT4', 						'TXT_KEY_PROMOTION_CLERMONT4', 				'TXT_KEY_PROMOTION_CLERMONT4_HELP', 			1, 				'AS2D_IF_LEVELUP', 	4, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT4' UNION ALL
SELECT 		'PROMOTION_CLERMONT5', 						'TXT_KEY_PROMOTION_CLERMONT5', 				'TXT_KEY_PROMOTION_CLERMONT5_HELP', 			1, 				'AS2D_IF_LEVELUP', 	5, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT5' UNION ALL
SELECT 		'PROMOTION_CLERMONT6', 						'TXT_KEY_PROMOTION_CLERMONT6', 				'TXT_KEY_PROMOTION_CLERMONT6_HELP', 			1, 				'AS2D_IF_LEVELUP', 	6, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT6' UNION ALL
SELECT 		'PROMOTION_CLERMONT7', 						'TXT_KEY_PROMOTION_CLERMONT7', 				'TXT_KEY_PROMOTION_CLERMONT7_HELP', 			1, 				'AS2D_IF_LEVELUP', 	1, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_CLERMONT7' UNION ALL
SELECT 		'PROMOTION_DODOMA', 						'TXT_KEY_PROMOTION_DODOMA', 				'TXT_KEY_PROMOTION_DODOMA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	15, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_NAVAL', 		'TXT_KEY_PROMOTION_DODOMA' UNION ALL
SELECT 		'PROMOTION_FAYA', 							'TXT_KEY_PROMOTION_FAYA', 					'TXT_KEY_PROMOTION_FAYA_HELP', 					1, 				'AS2D_IF_LEVELUP', 	17, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_FAYA' UNION ALL
SELECT 		'PROMOTION_HANOI', 							'TXT_KEY_PROMOTION_HANOI', 					'TXT_KEY_PROMOTION_HANOI_HELP', 				1, 				'AS2D_IF_LEVELUP', 	9, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_HANOI' UNION ALL
SELECT 		'PROMOTION_IFE', 							'TXT_KEY_PROMOTION_IFE', 					'TXT_KEY_PROMOTION_IFE_HELP', 					1, 				'AS2D_IF_LEVELUP', 	26, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_DIPLO', 		'TXT_KEY_PROMOTION_IFE' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 						'TXT_KEY_PROMOTION_ISKANWAYA', 				'TXT_KEY_PROMOTION_ISKANWAYA_HELP', 			1, 				'AS2D_IF_LEVELUP', 	19, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_HEAL', 		'TXT_KEY_PROMOTION_ISKANWAYA' UNION ALL
SELECT 		'PROMOTION_KABUL', 							'TXT_KEY_PROMOTION_KABUL', 					'TXT_KEY_PROMOTION_KABUL_HELP', 				1, 				'AS2D_IF_LEVELUP', 	22, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_KABUL' UNION ALL
SELECT 		'PROMOTION_KARYES', 						'TXT_KEY_PROMOTION_KARYES', 				'TXT_KEY_PROMOTION_KARYES_HELP', 				1, 				'AS2D_IF_LEVELUP', 	0, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_CIVILIAN', 	'TXT_KEY_PROMOTION_KARYES' UNION ALL
SELECT 		'PROMOTION_LACONIA', 						'TXT_KEY_PROMOTION_LACONIA', 				'TXT_KEY_PROMOTION_LACONIA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	10, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_LACONIA' UNION ALL
SELECT 		'PROMOTION_LEVUKA', 						'TXT_KEY_PROMOTION_LEVUKA', 				'TXT_KEY_PROMOTION_LEVUKA_HELP', 				1, 				'AS2D_IF_LEVELUP', 	20, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_LEVUKA' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 					'TXT_KEY_PROMOTION_MBANZA_KONGO', 			'TXT_KEY_PROMOTION_MBANZA_KONGO_HELP', 			1, 				'AS2D_IF_LEVELUP', 	11, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_MBANZA_KONGO' UNION ALL
SELECT 		'PROMOTION_ODENSO', 						'TXT_KEY_PROMOTION_ODENSO', 				'TXT_KEY_PROMOTION_ODENSO_HELP', 				1, 				'AS2D_IF_LEVELUP', 	12, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_ODENSO' UNION ALL
SELECT 		'PROMOTION_SIDON', 							'TXT_KEY_PROMOTION_SIDON', 					'TXT_KEY_PROMOTION_SIDON_HELP', 				1, 				'AS2D_IF_LEVELUP', 	13, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_SIDON' UNION ALL
SELECT 		'PROMOTION_SGAANG', 						'TXT_KEY_PROMOTION_SGAANG', 				'TXT_KEY_PROMOTION_SGAANG_HELP', 				1, 				'AS2D_IF_LEVELUP', 	0, 				'UCS_PROMOTION_ATLAS', 	'PEDIA_NAVAL', 		'TXT_KEY_PROMOTION_SGAANG' UNION ALL
SELECT 		'PROMOTION_SURREY', 						'TXT_KEY_PROMOTION_SURREY', 				'TXT_KEY_PROMOTION_SURREY_HELP', 				1, 				'AS2D_IF_LEVELUP', 	18, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_AIR', 		'TXT_KEY_PROMOTION_SURREY' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 						'TXT_KEY_PROMOTION_YEREVAN', 				'TXT_KEY_PROMOTION_YEREVAN_HELP', 				1, 				'AS2D_IF_LEVELUP', 	14, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_YEREVAN' UNION ALL
SELECT 		'PROMOTION_GUARDIA_SVIZZERA', 				'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA', 		'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA_HELP', 		1, 				'AS2D_IF_LEVELUP', 	24, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_GUARDIA_SVIZZERA' UNION ALL
SELECT 		'PROMOTION_KATZBALGER', 					'TXT_KEY_PROMOTION_KATZBALGER', 			'TXT_KEY_PROMOTION_KATZBALGER_HELP', 			1, 				'AS2D_IF_LEVELUP', 	23, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_MELEE', 		'TXT_KEY_PROMOTION_KATZBALGER' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 			'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL', 	'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL_HELP', 	1, 				'AS2D_IF_LEVELUP', 	21, 			'UCS_PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_MILITARISTIC_NEUTRAL';

UPDATE UnitPromotions SET MaxHitPointsChange = 25 WHERE Type = 'PROMOTION_BELGRADE';
UPDATE UnitPromotions SET ExperiencePercent = 15 WHERE Type = 'PROMOTION_CLERMONT';
UPDATE UnitPromotions SET HasPostCombatPromotions = 1 WHERE Type = 'PROMOTION_CLERMONT1';
UPDATE UnitPromotions SET MovesChange = 1, CanMoveAfterAttacking = 1 WHERE Type = 'PROMOTION_CLERMONT2';
UPDATE UnitPromotions SET AdjacentMod = 15 WHERE Type = 'PROMOTION_CLERMONT3';
UPDATE UnitPromotions SET AttackMod = 5, AttackFortifiedMod = 15 WHERE Type = 'PROMOTION_CLERMONT4';
UPDATE UnitPromotions SET DefenseMod = 5, AlwaysHeal = 1 WHERE Type = 'PROMOTION_CLERMONT5';
UPDATE UnitPromotions SET GreatGeneral = 1, AdjacentTileHealChange = 5 WHERE Type = 'PROMOTION_CLERMONT6';
UPDATE UnitPromotions SET VisibilityChange = 1 WHERE Type = 'PROMOTION_CLERMONT7';
UPDATE UnitPromotions SET MovesChange = 2 WHERE Type = 'PROMOTION_DODOMA';
UPDATE UnitPromotions SET FriendlyLandsModifier = 10 WHERE Type = 'PROMOTION_HANOI';
UPDATE UnitPromotions SET DiploMissionInfluence = 10, MovesChange = 1, VisibilityChange = 1 WHERE Type = 'PROMOTION_IFE';
UPDATE UnitPromotions SET OpenDefense = 25, RoughDefense = 25 WHERE Type = 'PROMOTION_KABUL';
UPDATE UnitPromotions SET CanCrossMountains = 1 WHERE Type = 'PROMOTION_KARYES';
UPDATE UnitPromotions SET AdjacentMod = 15 WHERE Type = 'PROMOTION_LACONIA';
UPDATE UnitPromotions SET NeutralHealChange = 5, VisibilityChange = 1 WHERE Type = 'PROMOTION_ODENSO';
UPDATE UnitPromotions SET EnemyHealChange = 5 WHERE Type = 'PROMOTION_SIDON';
UPDATE UnitPromotions SET CanMoveImpassable = 1 WHERE Type = 'PROMOTION_SGAANG';
UPDATE UnitPromotions SET ExperiencePercent = 20 WHERE Type = 'PROMOTION_MILITARISTIC_NEUTRAL';

/*UPDATE UnitPromotions SET RankList = 'UCS_CLERMONT', RankNumber = 1 WHERE Type = 'PROMOTION_CLERMONT';
UPDATE UnitPromotions SET RankList = 'UCS_CLERMONT', RankNumber = 2 WHERE Type = 'PROMOTION_CLERMONT1';
UPDATE UnitPromotions SET RankList = 'UCS_CLERMONT', RankNumber = 3 WHERE Type = 'PROMOTION_CLERMONT2';
UPDATE UnitPromotions SET RankList = 'UCS_CLERMONT', RankNumber = 4 WHERE Type = 'PROMOTION_CLERMONT3';
UPDATE UnitPromotions SET RankList = 'UCS_CLERMONT', RankNumber = 5 WHERE Type = 'PROMOTION_CLERMONT4';
UPDATE UnitPromotions SET RankList = 'UCS_CLERMONT', RankNumber = 6 WHERE Type = 'PROMOTION_CLERMONT5';
UPDATE UnitPromotions SET RankList = 'UCS_CLERMONT', RankNumber = 7 WHERE Type = 'PROMOTION_CLERMONT6';
UPDATE UnitPromotions SET RankList = 'UCS_CLERMONT', RankNumber = 8 WHERE Type = 'PROMOTION_CLERMONT7';

UPDATE UnitPromotions SET FlagPromoOrder = 16 WHERE Type IN (
	'PROMOTION_CLERMONT',
	'PROMOTION_CLERMONT1',
	'PROMOTION_CLERMONT2',
	'PROMOTION_CLERMONT3',
	'PROMOTION_CLERMONT4',
	'PROMOTION_CLERMONT5',
	'PROMOTION_CLERMONT6',
	'PROMOTION_CLERMONT7'
);

UPDATE UnitPromotions SET FlagPromoOrder = 72 WHERE Type IN (
	'PROMOTION_ANTANANARIVO',
	'PROMOTION_BELGRADE',
	'PROMOTION_HANOI',
	'PROMOTION_MBANZA_KONGO',
	'PROMOTION_SIDON',
	'PROMOTION_YEREVAN',
	'PROMOTION_LACONIA',
	'PROMOTION_ODENSO',
	'PROMOTION_AMBRACIA',
	'PROMOTION_DODOMA',
	'PROMOTION_FAYA',
	'PROMOTION_SURREY'
);*/

INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType, 					UnitCombatType)
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT  	'PROMOTION_AMBRACIA', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_FIGHTER' UNION ALL
SELECT 		'PROMOTION_ANTANANARIVO', 			'UNITCOMBAT_BOMBER' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_RECON' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_GUN' UNION ALL
SELECT  	'PROMOTION_AUCKLAND', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_BELGRADE', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_FIGHTER' UNION ALL
SELECT 		'PROMOTION_CLERMONT', 				'UNITCOMBAT_BOMBER' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT2', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT2', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT3', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT3', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT4', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT4', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT5', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT5', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT6', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT6', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_CLERMONT7', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_CLERMONT7', 				'UNITCOMBAT_GUN' UNION ALL
SELECT  	'PROMOTION_DODOMA', 				'UNITCOMBAT_WORKBOAT' UNION ALL
SELECT  	'PROMOTION_DODOMA', 				'UNITCOMBAT_CARGO' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_RECON' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_ARCHER' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_MOUNTED' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_MELEE' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_SIEGE' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_GUN' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_ARMOR' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_FIGHTER' UNION ALL
SELECT  	'PROMOTION_FAYA', 					'UNITCOMBAT_BOMBER' UNION ALL
SELECT 		'PROMOTION_FAYA', 					'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_FAYA', 					'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_HANOI', 					'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_IFE', 					'UNITCOMBAT_DIPLOMACY' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_ISKANWAYA', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_KABUL', 					'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_KABUL', 					'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_KABUL', 					'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_KABUL', 					'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_KABUL', 					'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_KABUL', 					'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_KABUL', 					'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_WORKER' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_SETTLER' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_CARAVAN' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_INQUISITOR' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_MISSIONARY' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_DIPLOMACY' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_SPECIAL_PEOPLE' UNION ALL
SELECT 		'PROMOTION_KARYES', 				'UNITCOMBAT_ARCHAEOLOGIST' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_FIGHTER' UNION ALL
SELECT  	'PROMOTION_LEVUKA', 				'UNITCOMBAT_BOMBER' UNION ALL
SELECT 		'PROMOTION_LEVUKA', 				'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_LEVUKA', 				'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_LACONIA', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO',			'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 			'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_ODENSO', 				'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_SIDON', 					'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_SGAANG', 				'UNITCOMBAT_CARGO' UNION ALL
SELECT 		'PROMOTION_SGAANG', 				'UNITCOMBAT_WORKBOAT' UNION ALL
SELECT 		'PROMOTION_SGAANG', 				'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_SGAANG', 				'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_SGAANG', 				'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_SGAANG', 				'UNITCOMBAT_CARRIER' UNION ALL
SELECT  	'PROMOTION_SURREY', 				'UNITCOMBAT_FIGHTER' UNION ALL
SELECT  	'PROMOTION_SURREY', 				'UNITCOMBAT_BOMBER' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_FIGHTER' UNION ALL
SELECT 		'PROMOTION_YEREVAN', 				'UNITCOMBAT_BOMBER' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_RECON' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_ARCHER' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_MOUNTED' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_MELEE' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_SIEGE' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_GUN' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_ARMOR' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_HELICOPTER' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_NAVALMELEE' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_NAVALRANGED' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_SUBMARINE' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_CARRIER' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_FIGHTER' UNION ALL
SELECT 		'PROMOTION_MILITARISTIC_NEUTRAL', 	'UNITCOMBAT_BOMBER';

INSERT INTO UnitPromotions_PostCombatRandomPromotion
			(PromotionType, 		NewPromotion)
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT2' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT3' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT4' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT5' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT6' UNION ALL
SELECT 		'PROMOTION_CLERMONT1', 	'PROMOTION_CLERMONT7';

INSERT INTO UnitPromotions_Features
			(PromotionType, 			FeatureType, 			DoubleMove, Attack, Defense)
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_FOREST', 		0, 			15, 	15 UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_JUNGLE', 		0, 			15, 	15 UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_MARSH', 		0, 			15, 	15 UNION ALL
SELECT 		'PROMOTION_MBANZA_KONGO', 	'FEATURE_FLOOD_PLAINS', 0, 			15, 	15;

INSERT INTO UnitPromotions_YieldFromKills
			(PromotionType, 			YieldType, 			Yield)
SELECT 		'PROMOTION_ANTANANARIVO', 	'YIELD_GOLD', 		100 UNION ALL
SELECT 		'PROMOTION_CLERMONT7', 		'YIELD_FAITH', 		75 UNION ALL
SELECT 		'PROMOTION_FAYA', 			'YIELD_SCIENCE', 	50 UNION ALL
SELECT 		'PROMOTION_YEREVAN', 		'YIELD_CULTURE', 	50;

INSERT INTO UnitPromotions_YieldFromBarbarianKills
			(PromotionType, 		YieldType, 			Yield)
SELECT 		'PROMOTION_LEVUKA', 	'YIELD_FOOD', 		50;

INSERT INTO UnitPromotions_Domains 
			(PromotionType, 		DomainType, 	Modifier)
SELECT 		'PROMOTION_SURREY', 	'DOMAIN_LAND', 	10 UNION ALL
SELECT 		'PROMOTION_SURREY', 	'DOMAIN_SEA', 	10;

INSERT INTO UnitPromotions_YieldModifiers 
			(PromotionType, 		YieldType, 			Yield)
SELECT 		'PROMOTION_AMBRACIA', 	'YIELD_PRODUCTION', 5;

INSERT INTO UnitPromotions_GarrisonYield
			(PromotionType, 		YieldType, 					Yield)
SELECT 		'PROMOTION_AUCKLAND', 	'YIELD_FOOD',				1 UNION ALL
SELECT 		'PROMOTION_AUCKLAND', 	'YIELD_GOLDEN_AGE_POINTS',	1;
---------------------------------------------------
-- Definitions - Buildings
---------------------------------------------------
INSERT INTO BuildingClasses 
			(Type, 									DefaultBuilding, 					Description)
SELECT 		'BUILDINGCLASS_LHASA', 					'BUILDING_LHASA', 					'TXT_KEY_BUILDING_LHASA' UNION ALL
SELECT 		'BUILDINGCLASS_KIEV', 					'BUILDING_KIEV', 					'TXT_KEY_BUILDING_KIEV' UNION ALL
SELECT 		'BUILDINGCLASS_MILAN', 					'BUILDING_MILAN', 					'TXT_KEY_BUILDING_MILAN' UNION ALL
SELECT 		'BUILDINGCLASS_VALLETTA', 				'BUILDING_VALLETTA', 				'TXT_KEY_BUILDING_VALLETTA' UNION ALL
SELECT 		'BUILDINGCLASS_VILNIUS', 				'BUILDING_VILNIUS', 				'TXT_KEY_BUILDING_VILNIUS' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH1', 				'BUILDING_ARMAGH1', 				'TXT_KEY_BUILDING_ARMAGH1' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH2', 				'BUILDING_ARMAGH2', 				'TXT_KEY_BUILDING_ARMAGH2' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH3', 				'BUILDING_ARMAGH3', 				'TXT_KEY_BUILDING_ARMAGH3' UNION ALL
SELECT 		'BUILDINGCLASS_ARMAGH4', 				'BUILDING_ARMAGH4', 				'TXT_KEY_BUILDING_ARMAGH4' UNION ALL
SELECT 		'BUILDINGCLASS_JERUSALEM', 				'BUILDING_JERUSALEM', 				'TXT_KEY_BUILDING_JERUSALEM' UNION ALL
SELECT 		'BUILDINGCLASS_RISHIKESH', 				'BUILDING_RISHIKESH', 				'TXT_KEY_BUILDING_RISHIKESH' UNION ALL
SELECT 		'BUILDINGCLASS_ANDORRA', 				'BUILDING_ANDORRA', 				'TXT_KEY_CITYSTATE_ANDORRA' UNION ALL
SELECT 		'BUILDINGCLASS_ANDORRA_2', 				'BUILDING_ANDORRA_2', 				'TXT_KEY_CITYSTATE_ANDORRA' UNION ALL
SELECT 		'BUILDINGCLASS_ANTWERP', 				'BUILDING_ANTWERP',	 				'TXT_KEY_CITYSTATE_ANTWERP' UNION ALL
SELECT 		'BUILDINGCLASS_BEDULU', 				'BUILDING_BEDULU',	 				'TXT_KEY_CITYSTATE_BEDULU' UNION ALL
SELECT 		'BUILDINGCLASS_BELGRADE', 				'BUILDING_BELGRADE',	 			'TXT_KEY_CITYSTATE_BELGRADE' UNION ALL
SELECT 		'BUILDINGCLASS_BYBLOS', 				'BUILDING_BYBLOS', 					'TXT_KEY_CITYSTATE_BYBLOS' UNION ALL
SELECT 		'BUILDINGCLASS_CANOSSA', 				'BUILDING_CANOSSA', 				'TXT_KEY_CITYSTATE_CANOSSA' UNION ALL
SELECT 		'BUILDINGCLASS_CAPE_TOWN', 				'BUILDING_CAPE_TOWN', 				'TXT_KEY_CITYSTATE_CAPE_TOWN' UNION ALL
SELECT 		'BUILDINGCLASS_CHEVAK', 				'BUILDING_CHEVAK', 					'TXT_KEY_CITYSTATE_CHEVAK' UNION ALL
SELECT 		'BUILDINGCLASS_CLERMONT', 				'BUILDING_CLERMONT', 				'TXT_KEY_CITYSTATE_CLERMONT' UNION ALL
SELECT 		'BUILDINGCLASS_DODOMA', 				'BUILDING_DODOMA', 					'TXT_KEY_CITYSTATE_DODOMA' UNION ALL
SELECT 		'BUILDINGCLASS_DOUALA', 				'BUILDING_DOUALA', 					'TXT_KEY_CITYSTATE_DOUALA' UNION ALL
SELECT 		'BUILDINGCLASS_GENEVA', 				'BUILDING_GENEVA', 					'TXT_KEY_CITYSTATE_GENEVA' UNION ALL
SELECT 		'BUILDINGCLASS_HONG_KONG', 				'BUILDING_HONG_KONG', 				'TXT_KEY_CITYSTATE_HONG_KONG' UNION ALL
SELECT 		'BUILDINGCLASS_KABUL', 					'BUILDING_KABUL', 					'TXT_KEY_CITYSTATE_KABUL' UNION ALL
SELECT 		'BUILDINGCLASS_KARYES', 				'BUILDING_KARYES', 					'TXT_KEY_CITYSTATE_KARYES' UNION ALL
SELECT 		'BUILDINGCLASS_KATHMANDU', 				'BUILDING_KATHMANDU', 				'TXT_KEY_CITYSTATE_KATHMANDU' UNION ALL
SELECT 		'BUILDINGCLASS_KIEV_2', 				'BUILDING_KIEV_2', 					'TXT_KEY_CITYSTATE_KIEV' UNION ALL
SELECT 		'BUILDINGCLASS_KIGALI', 				'BUILDING_KIGALI', 					'TXT_KEY_CITYSTATE_KIGALI' UNION ALL
SELECT 		'BUILDINGCLASS_KUALA_LUMPUR', 			'BUILDING_KUALA_LUMPUR', 			'TXT_KEY_CITYSTATE_KUALA_LUMPUR' UNION ALL
SELECT 		'BUILDINGCLASS_LEVUKA', 				'BUILDING_LEVUKA',	 				'TXT_KEY_CITYSTATE_LEVUKA' UNION ALL
SELECT 		'BUILDINGCLASS_LHASA_2', 				'BUILDING_LHASA_2', 				'TXT_KEY_CITYSTATE_LHASA' UNION ALL
SELECT 		'BUILDINGCLASS_MELBOURNE', 				'BUILDING_MELBOURNE',	 			'TXT_KEY_CITYSTATE_MELBOURNE' UNION ALL
SELECT 		'BUILDINGCLASS_MILAN_2', 				'BUILDING_MILAN_2', 				'TXT_KEY_CITYSTATE_MILAN' UNION ALL
SELECT 		'BUILDINGCLASS_MUTITJULU', 				'BUILDING_MUTITJULU',	 			'TXT_KEY_CITYSTATE_MUTITJULU' UNION ALL
SELECT 		'BUILDINGCLASS_NANMANDOL', 				'BUILDING_NANMANDOL',	 			'TXT_KEY_CITYSTATE_NANMANDOL' UNION ALL
SELECT 		'BUILDINGCLASS_OC_EO', 					'BUILDING_OC_EO', 					'TXT_KEY_CITYSTATE_OC_EO' UNION ALL
SELECT 		'BUILDINGCLASS_OC_EO_2', 				'BUILDING_OC_EO_2', 				'TXT_KEY_CITYSTATE_OC_EO' UNION ALL
SELECT 		'BUILDINGCLASS_OC_EO_3', 				'BUILDING_OC_EO_3', 				'TXT_KEY_CITYSTATE_OC_EO' UNION ALL
SELECT 		'BUILDINGCLASS_PANAMA_CITY', 			'BUILDING_PANAMA_CITY',	 			'TXT_KEY_CITYSTATE_PANAMA_CITY' UNION ALL
SELECT 		'BUILDINGCLASS_QUELIMANE', 				'BUILDING_QUELIMANE', 				'TXT_KEY_CITYSTATE_QUELIMANE' UNION ALL
SELECT 		'BUILDINGCLASS_RAGUSA', 				'BUILDING_RAGUSA', 					'TXT_KEY_CITYSTATE_RAGUSA' UNION ALL
SELECT 		'BUILDINGCLASS_RAGUSA_2', 				'BUILDING_RAGUSA_2', 				'TXT_KEY_CITYSTATE_RAGUSA' UNION ALL
SELECT 		'BUILDINGCLASS_RIGA', 					'BUILDING_RIGA', 					'TXT_KEY_CITYSTATE_RIGA' UNION ALL
SELECT 		'BUILDINGCLASS_RISHIKESH_2', 			'BUILDING_RISHIKESH_2',	 			'TXT_KEY_CITYSTATE_RISHIKESH' UNION ALL
SELECT 		'BUILDINGCLASS_SAMARKAND', 				'BUILDING_SAMARKAND', 				'TXT_KEY_CITYSTATE_SAMARKAND' UNION ALL
SELECT 		'BUILDINGCLASS_SINGAPORE', 				'BUILDING_SINGAPORE', 				'TXT_KEY_CITYSTATE_SINGAPORE' UNION ALL
SELECT 		'BUILDINGCLASS_SOFIA', 					'BUILDING_SOFIA', 					'TXT_KEY_CITYSTATE_SOFIA' UNION ALL
SELECT 		'BUILDINGCLASS_SURREY', 				'BUILDING_SURREY', 					'TXT_KEY_CITYSTATE_SURREY' UNION ALL
SELECT 		'BUILDINGCLASS_TAIWAN', 				'BUILDING_TAIWAN', 					'TXT_KEY_CITYSTATE_TAIWAN' UNION ALL
SELECT 		'BUILDINGCLASS_THIMPHU', 				'BUILDING_THIMPHU', 				'TXT_KEY_CITYSTATE_THIMPHU' UNION ALL
SELECT 		'BUILDINGCLASS_THIMPHU_2', 				'BUILDING_THIMPHU_2', 				'TXT_KEY_CITYSTATE_THIMPHU' UNION ALL
SELECT 		'BUILDINGCLASS_TYRE', 					'BUILDING_TYRE',	 				'TXT_KEY_CITYSTATE_TYRE' UNION ALL
SELECT 		'BUILDINGCLASS_VANCOUVER', 				'BUILDING_VANCOUVER',	 			'TXT_KEY_CITYSTATE_VANCOUVER' UNION ALL
SELECT 		'BUILDINGCLASS_VATICAN_CITY', 			'BUILDING_VATICAN_CITY',	 		'TXT_KEY_CITYSTATE_VATICAN_CITY' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_HORSE', 		'BUILDING_WELLINGTON_HORSE',	 	'TXT_KEY_CITYSTATE_WELLINGTON_HORSE' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_IRON', 		'BUILDING_WELLINGTON_IRON',	 		'TXT_KEY_CITYSTATE_WELLINGTON_IRON' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_COAL', 		'BUILDING_WELLINGTON_COAL',	 		'TXT_KEY_CITYSTATE_WELLINGTON_COAL' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_OIL', 		'BUILDING_WELLINGTON_OIL',	 		'TXT_KEY_CITYSTATE_WELLINGTON_OIL' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_ALUMINUM', 	'BUILDING_WELLINGTON_ALUMINUM',	 	'TXT_KEY_CITYSTATE_WELLINGTON_ALUMINUM' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_URANIUM', 	'BUILDING_WELLINGTON_URANIUM',	 	'TXT_KEY_CITYSTATE_WELLINGTON_URANIUM' UNION ALL
SELECT 		'BUILDINGCLASS_WELLINGTON_PAPER', 		'BUILDING_WELLINGTON_PAPER',	 	'TXT_KEY_CITYSTATE_WELLINGTON_PAPER' UNION ALL
SELECT 		'BUILDINGCLASS_WITTENBERG', 			'BUILDING_WITTENBERG',	 			'TXT_KEY_CITYSTATE_WITTENBERG' UNION ALL
SELECT 		'BUILDINGCLASS_WOOTEI_NIICIE', 			'BUILDING_WOOTEI_NIICIE',	 		'TXT_KEY_CITYSTATE_WOOTEI_NIICIE' UNION ALL
SELECT 		'BUILDINGCLASS_WOOTEI_NIICIE_2', 		'BUILDING_WOOTEI_NIICIE_2',	 		'TXT_KEY_CITYSTATE_WOOTEI_NIICIE' UNION ALL
/*SELECT 		'BUILDINGCLASS_MARITIME', 				'BUILDING_MARITIME', 				'TXT_KEY_BUILDING_MARITIME' UNION ALL
SELECT 		'BUILDINGCLASS_MARITIME_FRIENDLY', 		'BUILDING_MARITIME_FRIENDLY', 		'TXT_KEY_BUILDING_MARITIME_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_MARITIME_NEUTRAL', 		'BUILDING_MARITIME_NEUTRAL', 		'TXT_KEY_BUILDING_MARITIME_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_MARITIME_HOSTILE', 		'BUILDING_MARITIME_HOSTILE', 		'TXT_KEY_BUILDING_MARITIME_HOSTILE' UNION ALL
SELECT 		'BUILDINGCLASS_MERCANTILE', 			'BUILDING_MERCANTILE', 				'TXT_KEY_BUILDING_MERCANTILE' UNION ALL
SELECT 		'BUILDINGCLASS_MERCANTILE_FRIENDLY', 	'BUILDING_MERCANTILE_FRIENDLY', 	'TXT_KEY_BUILDING_MERCANTILE_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_MERCANTILE_NEUTRAL', 	'BUILDING_MERCANTILE_NEUTRAL', 		'TXT_KEY_BUILDING_MERCANTILE_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_MERCANTILE_HOSTILE', 	'BUILDING_MERCANTILE_HOSTILE', 		'TXT_KEY_BUILDING_MERCANTILE_HOSTILE' UNION ALL
SELECT 		'BUILDINGCLASS_CULTURED', 				'BUILDING_CULTURED', 				'TXT_KEY_BUILDING_CULTURED' UNION ALL
SELECT 		'BUILDINGCLASS_CULTURED_FRIENDLY', 		'BUILDING_CULTURED_FRIENDLY', 		'TXT_KEY_BUILDING_CULTURED_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_CULTURED_NEUTRAL', 		'BUILDING_CULTURED_NEUTRAL', 		'TXT_KEY_BUILDING_CULTURED_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_CULTURED_HOSTILE', 		'BUILDING_CULTURED_HOSTILE', 		'TXT_KEY_BUILDING_CULTURED_HOSTILE' UNION ALL
SELECT 		'BUILDINGCLASS_RELIGIOUS', 				'BUILDING_RELIGIOUS', 				'TXT_KEY_BUILDING_RELIGIOUS' UNION ALL
SELECT 		'BUILDINGCLASS_RELIGIOUS_FRIENDLY', 	'BUILDING_RELIGIOUS_FRIENDLY', 		'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_RELIGIOUS_NEUTRAL', 		'BUILDING_RELIGIOUS_NEUTRAL', 		'TXT_KEY_BUILDING_RELIGIOUS_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_RELIGIOUS_HOSTILE', 		'BUILDING_RELIGIOUS_HOSTILE', 		'TXT_KEY_BUILDING_RELIGIOUS_HOSTILE' UNION ALL
SELECT 		'BUILDINGCLASS_MILITARISTIC', 			'BUILDING_MILITARISTIC', 			'TXT_KEY_BUILDING_MILITARISTIC' UNION ALL
SELECT 		'BUILDINGCLASS_MILITARISTIC_FRIENDLY', 	'BUILDING_MILITARISTIC_FRIENDLY', 	'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_MILITARISTIC_NEUTRAL', 	'BUILDING_MILITARISTIC_NEUTRAL', 	'TXT_KEY_BUILDING_MILITARISTIC_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_MILITARISTIC_HOSTILE', 	'BUILDING_MILITARISTIC_HOSTILE', 	'TXT_KEY_BUILDING_MILITARISTIC_HOSTILE';*/
SELECT 		'BUILDINGCLASS_CS_STRENGTH_FRIENDLY', 	'BUILDING_CS_STRENGTH_FRIENDLY', 	'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_CS_STRENGTH_NEUTRAL', 	'BUILDING_CS_STRENGTH_NEUTRAL', 	'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_CS_STRENGTH_HOSTILE', 	'BUILDING_CS_STRENGTH_HOSTILE', 	'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE' UNION ALL
SELECT 		'BUILDINGCLASS_CS_RELIGION_FRIENDLY', 	'BUILDING_CS_RELIGION_FRIENDLY', 	'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY' UNION ALL
SELECT 		'BUILDINGCLASS_CS_RELIGION_NEUTRAL', 	'BUILDING_CS_RELIGION_NEUTRAL', 	'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL' UNION ALL
SELECT 		'BUILDINGCLASS_CS_RELIGION_HOSTILE', 	'BUILDING_CS_RELIGION_HOSTILE', 	'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE';

UPDATE BuildingClasses SET MaxGlobalInstances = 1 WHERE Type = 'BUILDINGCLASS_LHASA';
UPDATE BuildingClasses SET MaxPlayerInstances = 3 WHERE Type = 'BUILDINGCLASS_KIEV';
UPDATE BuildingClasses SET MaxPlayerInstances = 3 WHERE Type = 'BUILDINGCLASS_MILAN';
UPDATE BuildingClasses SET MaxPlayerInstances = 3 WHERE Type = 'BUILDINGCLASS_VILNIUS';

INSERT INTO Audio_Sounds 
			(SoundID, 			Filename, 		LoadType)
SELECT 		'SND_WONDER_LHASA', 'PotalaPalace', 'DynamicResident';

INSERT INTo Audio_2DSounds 
			(ScriptID, 				SoundID, 			SoundType, 				MinVolume, 	MaxVolume, 	IsMusic, 	TaperSoundtrackVolume)
SELECT 		'AS2D_WONDER_LHASA', 	'SND_WONDER_LHASA', 'GAME_MUSIC_STINGS', 	85, 		85, 		1, 			'0.0';

INSERT INTO Buildings 
			(Type, 								BuildingClass, 							Cost, 	GoldMaintenance, 	PrereqTech, Description, 								Help, 											MinAreaSize, 	NukeImmune, ConquestProb, 	NeverCapture, 	HurryCostModifier, 	IconAtlas, 						PortraitIndex, 	IsDummy,	GreatWorkCount)
SELECT 		'BUILDING_LHASA', 					'BUILDINGCLASS_LHASA', 					650, 	0, 					NULL, 		'TXT_KEY_BUILDING_LHASA', 					'TXT_KEY_BUILDING_LHASA_HELP', 					-1, 			1, 			100, 			0, 				-5, 				'UCS_BUILDING_ATLAS', 			0, 				0,			0 UNION ALL
SELECT 		'BUILDING_KIEV', 					'BUILDINGCLASS_KIEV', 					350, 	2, 					NULL, 		'TXT_KEY_BUILDING_KIEV', 					'TXT_KEY_BUILDING_KIEV_HELP', 					-1, 			1, 			80, 			0, 				5, 					'UCS_BUILDING_ATLAS', 			5, 				0,			0 UNION ALL
SELECT 		'BUILDING_MILAN', 					'BUILDINGCLASS_MILAN', 					350, 	2, 					NULL, 		'TXT_KEY_BUILDING_MILAN', 					'TXT_KEY_BUILDING_MILAN_HELP', 					-1, 			1, 			80, 			0, 				5, 					'UCS_BUILDING_ATLAS', 			4, 				0,			0 UNION ALL
SELECT 		'BUILDING_VILNIUS', 				'BUILDINGCLASS_VILNIUS', 				350, 	2, 					NULL, 		'TXT_KEY_BUILDING_VILNIUS', 				'TXT_KEY_BUILDING_VILNIUS_HELP', 				-1, 			1, 			80, 			0, 				5, 					'UCS_BUILDING_ATLAS', 			3, 				0,			0 UNION ALL
SELECT 		'BUILDING_VALLETTA', 				'BUILDINGCLASS_VALLETTA', 				250, 	1, 					NULL, 		'TXT_KEY_BUILDING_VALLETTA', 				'TXT_KEY_BUILDING_VALLETTA_HELP', 				-1, 			1, 			80, 			0, 				5, 					'UCS_BUILDING_ATLAS', 			2, 				0,			0 UNION ALL
SELECT 		'BUILDING_ARMAGH1', 				'BUILDINGCLASS_ARMAGH1', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH1', 				'TXT_KEY_BUILDING_ARMAGH1_HELP', 				-1, 			1, 			100, 			0, 				5, 					'UCS_BUILDING_ATLAS', 			8, 				0,			0 UNION ALL
SELECT 		'BUILDING_ARMAGH2', 				'BUILDINGCLASS_ARMAGH2', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH2', 				'TXT_KEY_BUILDING_ARMAGH2_HELP', 				-1, 			1, 			100, 			0, 				5, 					'UCS_BUILDING_ATLAS', 			9, 				0,			0 UNION ALL
SELECT 		'BUILDING_ARMAGH3', 				'BUILDINGCLASS_ARMAGH3', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH3', 				'TXT_KEY_BUILDING_ARMAGH3_HELP', 				-1, 			1, 			100, 			0, 				5, 					'UCS_BUILDING_ATLAS', 			6, 				0,			0 UNION ALL
SELECT 		'BUILDING_ARMAGH4', 				'BUILDINGCLASS_ARMAGH4', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_ARMAGH4', 				'TXT_KEY_BUILDING_ARMAGH4_HELP', 				-1, 			1, 			100, 			0, 				5, 					'UCS_BUILDING_ATLAS', 			7, 				0,			0 UNION ALL
SELECT 		'BUILDING_JERUSALEM', 				'BUILDINGCLASS_JERUSALEM', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_JERUSALEM', 				'TXT_KEY_BUILDING_JERUSALEM_HELP', 				-1, 			1, 			100, 			0, 				5, 					'UCS_BUILDING_ATLAS', 			10, 			0,			0 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 				'BUILDINGCLASS_RISHIKESH', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RISHIKESH', 				'TXT_KEY_BUILDING_RISHIKESH_HELP', 				-1, 			1, 			100, 			0, 				5, 					'UCS_BUILDING_ATLAS', 			11, 			0,			0 UNION ALL
SELECT 		'BUILDING_ANDORRA', 				'BUILDINGCLASS_ANDORRA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_ANDORRA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_ANDORRA_2', 				'BUILDINGCLASS_ANDORRA_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_ANDORRA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_ANTWERP', 				'BUILDINGCLASS_ANTWERP', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_ANTWERP', 				'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_BEDULU', 					'BUILDINGCLASS_BEDULU', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_BEDULU', 				'TXT_KEY_CSTRAIT_MINOR_CIV_BEDULU', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_BELGRADE', 				'BUILDINGCLASS_BELGRADE', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_BELGRADE', 				'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_BYBLOS', 					'BUILDINGCLASS_BYBLOS', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_BYBLOS', 				'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CANOSSA', 				'BUILDINGCLASS_CANOSSA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_CANOSSA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CAPE_TOWN', 				'BUILDINGCLASS_CAPE_TOWN', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_CAPE_TOWN', 				'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CHEVAK', 					'BUILDINGCLASS_CHEVAK', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_CHEVAK', 				'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CLERMONT', 				'BUILDINGCLASS_CLERMONT', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_CLERMONT', 				'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_DODOMA', 					'BUILDINGCLASS_DODOMA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_DODOMA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_DOUALA', 					'BUILDINGCLASS_DOUALA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_DOUALA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_GENEVA', 					'BUILDINGCLASS_GENEVA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_GENEVA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_HONG_KONG', 				'BUILDINGCLASS_HONG_KONG', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_HONG_KONG', 				'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KABUL', 					'BUILDINGCLASS_KABUL', 					-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KABUL', 					'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KARYES', 					'BUILDINGCLASS_KARYES', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KARYES', 				'TXT_KEY_CSTRAIT_MINOR_CIV_KARYES', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KATHMANDU', 				'BUILDINGCLASS_KATHMANDU', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KATHMANDU', 				'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KIEV_2', 					'BUILDINGCLASS_KIEV_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KIEV', 					'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KIGALI', 					'BUILDINGCLASS_KIGALI', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KIGALI', 				'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_KUALA_LUMPUR', 			'BUILDINGCLASS_KUALA_LUMPUR', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_KUALA_LUMPUR', 			'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_LEVUKA', 					'BUILDINGCLASS_LEVUKA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_LEVUKA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_LHASA_2', 				'BUILDINGCLASS_LHASA_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_LHASA', 					'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MELBOURNE', 				'BUILDINGCLASS_MELBOURNE', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_MELBOURNE', 				'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MILAN_2', 				'BUILDINGCLASS_MILAN_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_MILAN', 					'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MUTITJULU', 				'BUILDINGCLASS_MUTITJULU', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_MUTITJULU', 				'TXT_KEY_CSTRAIT_MINOR_CIV_MUTITJULU', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_NANMANDOL', 				'BUILDINGCLASS_NANMANDOL', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_NANMANDOL', 				'TXT_KEY_CSTRAIT_MINOR_CIV_NANMANDOL', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_OC_EO', 					'BUILDINGCLASS_OC_EO', 					-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_OC_EO', 					'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_OC_EO_2', 				'BUILDINGCLASS_OC_EO_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_OC_EO', 					'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_OC_EO_3', 				'BUILDINGCLASS_OC_EO_3', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_OC_EO', 					'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_PANAMA_CITY', 			'BUILDINGCLASS_PANAMA_CITY', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_PANAMA_CITY', 			'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_QUELIMANE', 				'BUILDINGCLASS_QUELIMANE', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_QUELIMANE', 				'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RAGUSA', 					'BUILDINGCLASS_RAGUSA', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_RAGUSA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RAGUSA_2', 				'BUILDINGCLASS_RAGUSA_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_RAGUSA', 				'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RIGA', 					'BUILDINGCLASS_RIGA', 					-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_RIGA', 					'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RISHIKESH_2', 			'BUILDINGCLASS_RISHIKESH_2', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_RISHIKESH', 				'TXT_KEY_CSTRAIT_MINOR_CIV_RISHIKESH', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_SAMARKAND', 				'BUILDINGCLASS_SAMARKAND', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_SAMARKAND', 				'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_SINGAPORE', 				'BUILDINGCLASS_SINGAPORE', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_SINGAPORE', 				'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_SOFIA', 					'BUILDINGCLASS_SOFIA', 					-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_SOFIA', 					'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_SURREY', 					'BUILDINGCLASS_SURREY', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_SURREY', 				'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_TAIWAN', 					'BUILDINGCLASS_TAIWAN', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_TAIWAN', 				'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_THIMPHU', 				'BUILDINGCLASS_THIMPHU', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_THIMPHU', 				'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_THIMPHU_2', 				'BUILDINGCLASS_THIMPHU_2', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_THIMPHU', 				'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_TYRE', 					'BUILDINGCLASS_TYRE', 					-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_TYRE', 					'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_VANCOUVER', 				'BUILDINGCLASS_VANCOUVER', 				-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_VANCOUVER', 				'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_VATICAN_CITY', 			'BUILDINGCLASS_VATICAN_CITY', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_VATICAN_CITY', 			'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_HORSE', 		'BUILDINGCLASS_WELLINGTON_HORSE', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_IRON', 		'BUILDINGCLASS_WELLINGTON_IRON', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_COAL', 		'BUILDINGCLASS_WELLINGTON_COAL', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_OIL', 			'BUILDINGCLASS_WELLINGTON_OIL', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_ALUMINUM', 	'BUILDINGCLASS_WELLINGTON_ALUMINUM', 	-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_URANIUM', 		'BUILDINGCLASS_WELLINGTON_URANIUM', 	-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_PAPER', 		'BUILDINGCLASS_WELLINGTON_PAPER', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WELLINGTON', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WITTENBERG', 				'BUILDINGCLASS_WITTENBERG', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WITTENBERG', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WOOTEI_NIICIE', 			'BUILDINGCLASS_WOOTEI_NIICIE', 			-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WOOTEI_NIICIE', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_WOOTEI_NIICIE_2', 		'BUILDINGCLASS_WOOTEI_NIICIE_2', 		-1, 	0, 					NULL, 		'TXT_KEY_CITYSTATE_WOOTEI_NIICIE', 			'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
/*SELECT 		'BUILDING_MARITIME', 				'BUILDINGCLASS_MARITIME', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MARITIME', 				'TXT_KEY_BUILDING_MARITIME_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MARITIME_FRIENDLY', 		'BUILDINGCLASS_MARITIME_FRIENDLY', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MARITIME_FRIENDLY', 		'TXT_KEY_BUILDING_MARITIME_FRIENDLY_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MARITIME_NEUTRAL', 		'BUILDINGCLASS_MARITIME_NEUTRAL', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MARITIME_NEUTRAL', 		'TXT_KEY_BUILDING_MARITIME_NEUTRAL_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MARITIME_HOSTILE', 		'BUILDINGCLASS_MARITIME_HOSTILE', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MARITIME_HOSTILE', 		'TXT_KEY_BUILDING_MARITIME_HOSTILE_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MERCANTILE', 				'BUILDINGCLASS_MERCANTILE', 			-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MERCANTILE', 				'TXT_KEY_BUILDING_MERCANTILE_HELP', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MERCANTILE_FRIENDLY', 	'BUILDINGCLASS_MERCANTILE_FRIENDLY', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MERCANTILE_FRIENDLY', 	'TXT_KEY_BUILDING_MERCANTILE_FRIENDLY_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MERCANTILE_NEUTRAL', 		'BUILDINGCLASS_MERCANTILE_NEUTRAL', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MERCANTILE_NEUTRAL', 		'TXT_KEY_BUILDING_MERCANTILE_NEUTRAL_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MERCANTILE_HOSTILE', 		'BUILDINGCLASS_MERCANTILE_HOSTILE', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MERCANTILE_HOSTILE', 		'TXT_KEY_BUILDING_MERCANTILE_HOSTILE_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CULTURED', 				'BUILDINGCLASS_CULTURED', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CULTURED', 				'TXT_KEY_BUILDING_CULTURED_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CULTURED_FRIENDLY', 		'BUILDINGCLASS_CULTURED_FRIENDLY', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CULTURED_FRIENDLY', 		'TXT_KEY_BUILDING_CULTURED_FRIENDLY_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CULTURED_NEUTRAL', 		'BUILDINGCLASS_CULTURED_NEUTRAL', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CULTURED_NEUTRAL', 		'TXT_KEY_BUILDING_CULTURED_NEUTRAL_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CULTURED_HOSTILE', 		'BUILDINGCLASS_CULTURED_HOSTILE', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CULTURED_HOSTILE', 		'TXT_KEY_BUILDING_CULTURED_HOSTILE_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 				'BUILDINGCLASS_RELIGIOUS', 				-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RELIGIOUS', 				'TXT_KEY_BUILDING_RELIGIOUS_HELP', 				-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS_FRIENDLY', 		'BUILDINGCLASS_RELIGIOUS_FRIENDLY', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY', 		'TXT_KEY_BUILDING_RELIGIOUS_FRIENDLY_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS_NEUTRAL', 		'BUILDINGCLASS_RELIGIOUS_NEUTRAL', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RELIGIOUS_NEUTRAL', 		'TXT_KEY_BUILDING_RELIGIOUS_NEUTRAL_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS_HOSTILE', 		'BUILDINGCLASS_RELIGIOUS_HOSTILE', 		-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_RELIGIOUS_HOSTILE', 		'TXT_KEY_BUILDING_RELIGIOUS_HOSTILE_HELP', 		-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MILITARISTIC', 			'BUILDINGCLASS_MILITARISTIC', 			-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MILITARISTIC', 			'TXT_KEY_BUILDING_MILITARISTIC_HELP', 			-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_FRIENDLY', 	'BUILDINGCLASS_MILITARISTIC_FRIENDLY', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY', 	'TXT_KEY_BUILDING_MILITARISTIC_FRIENDLY_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_NEUTRAL', 	'BUILDINGCLASS_MILITARISTIC_NEUTRAL', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MILITARISTIC_NEUTRAL', 	'TXT_KEY_BUILDING_MILITARISTIC_NEUTRAL_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_HOSTILE', 	'BUILDINGCLASS_MILITARISTIC_HOSTILE', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_MILITARISTIC_HOSTILE', 	'TXT_KEY_BUILDING_MILITARISTIC_HOSTILE_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1;*/
SELECT 		'BUILDING_CS_STRENGTH_FRIENDLY', 	'BUILDINGCLASS_CS_STRENGTH_FRIENDLY', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY', 	'TXT_KEY_BUILDING_CS_STRENGTH_FRIENDLY_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_STRENGTH_NEUTRAL', 	'BUILDINGCLASS_CS_STRENGTH_NEUTRAL', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL', 	'TXT_KEY_BUILDING_CS_STRENGTH_NEUTRAL_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_STRENGTH_HOSTILE', 	'BUILDINGCLASS_CS_STRENGTH_HOSTILE', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE', 	'TXT_KEY_BUILDING_CS_STRENGTH_HOSTILE_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_RELIGION_FRIENDLY', 	'BUILDINGCLASS_CS_RELIGION_FRIENDLY', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY', 	'TXT_KEY_BUILDING_CS_RELIGION_FRIENDLY_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_RELIGION_NEUTRAL', 	'BUILDINGCLASS_CS_RELIGION_NEUTRAL', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL', 	'TXT_KEY_BUILDING_CS_RELIGION_NEUTRAL_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1 UNION ALL
SELECT 		'BUILDING_CS_RELIGION_HOSTILE', 	'BUILDINGCLASS_CS_RELIGION_HOSTILE', 	-1, 	0, 					NULL, 		'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE', 	'TXT_KEY_BUILDING_CS_RELIGION_HOSTILE_HELP', 	-1, 			1, 			0, 				1, 				5, 					'UCS_BUILDING_ATLAS', 			1, 				1,			-1;

UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', CultureMedianModifier = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH1';
UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', ScienceMedianModifier = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH2';
UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', GoldMedianModifier = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH3';
UPDATE Buildings SET FaithCost = 250, WLTKDTurns = 10, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', BasicNeedsMedianModifier = -10, MutuallyExclusiveGroup = 113 WHERE Type = 'BUILDING_ARMAGH4';
UPDATE Buildings SET ReligiousPressureModifier = 100 WHERE Type = 'BUILDING_JERUSALEM';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_MUSICIAN', SpecialistCount = 1, GreatPeopleRateChange = 2, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_KIEV' WHERE Type = 'BUILDING_KIEV';
UPDATE Buildings SET WonderSplashImage = 'UCS_Potala_Palace_splash.dds', WonderSplashAudio = 'AS2D_WONDER_LHASA', WonderSplashAnchor = 'L,B', Quote = 'TXT_KEY_BUILDING_LHASA_QUOTE', SingleLeagueVotes = 1, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA' WHERE Type = 'BUILDING_LHASA';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_ARTIST', SpecialistCount = 1, GreatPeopleRateChange = 2, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_MILAN' WHERE Type = 'BUILDING_MILAN';
UPDATE Buildings SET FaithCost = 200, ReligiousUnrestFlatReduction = 1, BoredomFlatReduction = 1, NoUnhappfromXSpecialists = 1,  EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_RISHIKESH' WHERE Type = 'BUILDING_RISHIKESH';
UPDATE Buildings SET ExtraCityHitPoints = 25, Water = 1, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA' WHERE Type = 'BUILDING_VALLETTA';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_WRITER', SpecialistCount = 1, GreatPeopleRateChange = 2, EventChoiceRequiredActive = 'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS' WHERE Type = 'BUILDING_VILNIUS';

UPDATE Buildings SET CultureMedianModifier = -10 WHERE Type = 'BUILDING_ANDORRA_2';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_CIVIL_SERVANT', GreatPeopleRateChange = 1 WHERE Type = 'BUILDING_CANOSSA';
UPDATE Buildings SET TradeRouteSeaDistanceModifier = 10, TradeRouteLandDistanceModifier = 10 WHERE Type = 'BUILDING_CAPE_TOWN';
UPDATE Buildings SET BorderGrowthRateIncrease = 10, DistressFlatReduction = 1 WHERE Type = 'BUILDING_CHEVAK';
UPDATE Buildings SET TrainedFreePromotion = 'PROMOTION_CLERMONT1' WHERE Type = 'BUILDING_CLERMONT';
UPDATE Buildings SET TradeRouteTargetBonus = 1, TradeRouteRecipientBonus = 1 WHERE Type = 'BUILDING_DODOMA';
UPDATE Buildings SET GreatPeopleRateModifier = 3 WHERE Type = 'BUILDING_GENEVA';
UPDATE Buildings SET SpecialistType = 'SPECIALIST_CIVIL_SERVANT', GreatPeopleRateChange = 1, ReligiousUnrestModifier = -10 WHERE Type = 'BUILDING_KARYES';
UPDATE Buildings SET TradeRouteSeaDistanceModifier = 20 WHERE Type = 'BUILDING_OC_EO';
UPDATE Buildings SET Happiness = 1 WHERE Type = 'BUILDING_OC_EO_3';
UPDATE Buildings SET TradeRouteSeaDistanceModifier = 10, TradeRouteSeaGoldBonus = 100 WHERE Type = 'BUILDING_PANAMA_CITY';
UPDATE Buildings SET CitySupplyFlat = 1 WHERE Type = 'BUILDING_RAGUSA_2';
UPDATE Buildings SET CityStateTradeRouteProductionModifier = 1 WHERE Type = 'BUILDING_RIGA';
UPDATE Buildings SET TradeRouteTargetBonus = 4, TradeRouteRecipientBonus = 4 WHERE Type = 'BUILDING_SAMARKAND';
UPDATE Buildings SET Defense = 10 WHERE Type = 'BUILDING_THIMPHU_2';
UPDATE Buildings SET CityConnectionTradeRouteModifier = 3 WHERE Type = 'BUILDING_VANCOUVER';
UPDATE Buildings SET GPExpendInfluence = 10 WHERE Type = 'BUILDING_VATICAN_CITY';
UPDATE Buildings SET ReligiousPressureModifier = -10, ConversionModifier = 10 WHERE Type = 'BUILDING_WITTENBERG';

/*UPDATE Buildings SET ReligiousPressureModifier = 33, Defense = 1000, ExtraCityHitPoints = 50 WHERE Type = 'BUILDING_RELIGIOUS';
UPDATE Buildings SET ReligiousPressureModifier = -20 WHERE Type = 'BUILDING_CULTURED';
UPDATE Buildings SET ConversionModifier = 25 WHERE Type = 'BUILDING_RELIGIOUS_FRIENDLY';
UPDATE Buildings SET ConversionModifier = -10 WHERE Type = 'BUILDING_RELIGIOUS_NEUTRAL';
UPDATE Buildings SET ConversionModifier = -25, ReligiousPressureModifier = 25 WHERE Type = 'BUILDING_RELIGIOUS_HOSTILE';
UPDATE Buildings SET EspionageModifier = 20 WHERE Type = 'BUILDING_MARITIME';
UPDATE Buildings SET Defense = 500, ExtraCityHitPoints = 100 WHERE Type = 'BUILDING_MARITIME_NEUTRAL';
UPDATE Buildings SET CitySupplyFlat = -5 WHERE Type = 'BUILDING_RELIGIOUS';
UPDATE Buildings SET CitySupplyModifier = -25 WHERE Type = 'BUILDING_RELIGIOUS';
UPDATE Buildings SET CitySupplyFlat = 3 WHERE Type = 'BUILDING_MILITARISTIC';
UPDATE Buildings SET CitySupplyModifier = 50, TrainedFreePromotion = 'PROMOTION_MILITARISTIC_NEUTRAL' WHERE Type = 'BUILDING_MILITARISTIC_NEUTRAL';
UPDATE Buildings SET CitySupplyModifier = 100 WHERE Type = 'BUILDING_MILITARISTIC_HOSTILE';*/
UPDATE Buildings SET ExtraCityHitPoints = 1 /*Defense = 20*/ WHERE Type = 'BUILDING_CS_STRENGTH_FRIENDLY';
UPDATE Buildings SET ExtraCityHitPoints = 2 /*Defense = 50*/ WHERE Type = 'BUILDING_CS_STRENGTH_NEUTRAL';
UPDATE Buildings SET ExtraCityHitPoints = 3 /*Defense = 100*/ WHERE Type = 'BUILDING_CS_STRENGTH_HOSTILE';
UPDATE Buildings SET ReligiousPressureModifier = 10, ConversionModifier = 25 WHERE Type = 'BUILDING_CS_STRENGTH_FRIENDLY';
UPDATE Buildings SET ReligiousPressureModifier = 25 WHERE Type = 'BUILDING_CS_STRENGTH_NEUTRAL';
UPDATE Buildings SET ReligiousPressureModifier = 40, ConversionModifier = -25 WHERE Type = 'BUILDING_CS_STRENGTH_HOSTILE';

INSERT INTO Building_ClassesNeededInCity
			(BuildingType, 			BuildingClassType)
SELECT 		'BUILDING_CANOSSA', 	'BUILDINGCLASS_TEMPLE';

INSERT INTO Building_LocalResourceOrs 
			(BuildingType, 			ResourceType)
SELECT 		'BUILDING_VALLETTA', 	'RESOURCE_FISH' UNION ALL
SELECT 		'BUILDING_VALLETTA', 	'RESOURCE_CORAL' UNION ALL 
SELECT 		'BUILDING_VALLETTA', 	'RESOURCE_CRAB' UNION ALL 
SELECT 		'BUILDING_VALLETTA', 	'RESOURCE_PEARLS' UNION ALL 
SELECT 		'BUILDING_VALLETTA', 	'RESOURCE_WHALE';

INSERT INTO Building_YieldPerXTerrainTimes100 	
			(BuildingType, 			TerrainType,		YieldType, 					Yield)
SELECT 		'BUILDING_ANDORRA', 	'TERRAIN_MOUNTAIN', 'YIELD_TOURISM', 			100 UNION ALL
SELECT 		'BUILDING_CHEVAK', 		'TERRAIN_TUNDRA', 	'YIELD_FOOD', 				34 UNION ALL
SELECT 		'BUILDING_CHEVAK', 		'TERRAIN_SNOW', 	'YIELD_FOOD', 				34 UNION ALL
SELECT 		'BUILDING_KABUL', 		'TERRAIN_MOUNTAIN', 'YIELD_CULTURE', 			67 UNION ALL
SELECT 		'BUILDING_LHASA_2', 	'TERRAIN_MOUNTAIN', 'YIELD_FAITH', 				67 UNION ALL
SELECT 		'BUILDING_MUTITJULU', 	'TERRAIN_DESERT',	'YIELD_GOLDEN_AGE_POINTS', 	50 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'TERRAIN_MOUNTAIN', 'YIELD_FAITH', 				50 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 	'TERRAIN_MOUNTAIN', 'YIELD_CULTURE', 			300 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 	'TERRAIN_MOUNTAIN', 'YIELD_FOOD', 				300 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 	'TERRAIN_MOUNTAIN', 'YIELD_GOLD', 				300;

INSERT INTO Building_YieldPerXFeatureTimes100 	
			(BuildingType, 			FeatureType,		YieldType, 			Yield)
SELECT 		'BUILDING_RELIGIOUS', 	'FEATURE_ATOLL', 	'YIELD_CULTURE', 	300 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 	'FEATURE_ATOLL', 	'YIELD_FOOD', 		300 UNION ALL
SELECT 		'BUILDING_RELIGIOUS', 	'FEATURE_ATOLL', 	'YIELD_GOLD', 		300 UNION ALL
SELECT 		'BUILDING_BEDULU', 		'FEATURE_JUNGLE', 	'YIELD_FAITH', 		50;

INSERT INTO Building_YieldChangesPerPop 
			(BuildingType, 					YieldType, 				Yield)
SELECT 		'BUILDING_HONG_KONG', 			'YIELD_GOLD', 			16 UNION ALL
SELECT 		'BUILDING_MARITIME_NEUTRAL', 	'YIELD_FOOD', 			250 UNION ALL
SELECT 		'BUILDING_MARITIME_HOSTILE', 	'YIELD_PRODUCTION', 	50;

INSERT INTO Building_YieldChangesPerReligion
			(BuildingType,					YieldType,						Yield)
SELECT		'BUILDING_SOFIA',				'YIELD_GREAT_GENERAL_POINTS',	100 UNION ALL
SELECT		'BUILDING_SOFIA',				'YIELD_GREAT_ADMIRAL_POINTS',	100 UNION ALL
SELECT		'BUILDING_WITTENBERG',			'YIELD_PRODUCTION',				100 UNION ALL
SELECT		'BUILDING_WITTENBERG',			'YIELD_GOLD',					100 UNION ALL
SELECT		'BUILDING_WITTENBERG',			'YIELD_CULTURE',				100 UNION ALL
SELECT		'BUILDING_RELIGIOUS_NEUTRAL',	'YIELD_PRODUCTION',				500;

INSERT INTO Building_YieldPerFriend 
			(BuildingType, 			YieldType, 		Yield)
SELECT 		'BUILDING_KATHMANDU', 	'YIELD_FAITH', 	1;

INSERT INTO Building_YieldPerAlly 
			(BuildingType, 			YieldType, 						Yield)
SELECT 		'BUILDING_RAGUSA', 		'YIELD_FOOD', 					1 UNION ALL
SELECT 		'BUILDING_KATHMANDU', 	'YIELD_FAITH', 					1 UNION ALL
SELECT 		'BUILDING_KATHMANDU', 	'YIELD_GREAT_GENERAL_POINTS', 	1;

INSERT INTO Building_YieldChanges
			(BuildingType, 			YieldType, 							Yield)
SELECT 		'BUILDING_LHASA', 		'YIELD_FOOD', 						1 UNION ALL
SELECT 		'BUILDING_LHASA', 		'YIELD_CULTURE', 					1 UNION ALL
SELECT 		'BUILDING_OC_EO_2', 	'YIELD_CULTURE_LOCAL',				1 UNION ALL
SELECT 		'BUILDING_THIMPHU', 	'YIELD_CULTURE', 					3 UNION ALL
SELECT 		'BUILDING_LEVUKA', 		'YIELD_GREAT_GENERAL_POINTS', 		1 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'YIELD_SCIENCE', 					1 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'YIELD_FAITH', 						2 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'YIELD_TOURISM', 					1 UNION ALL
SELECT 		'BUILDING_RISHIKESH_2', 'YIELD_FAITH', 						2;

INSERT INTO Building_LakePlotYieldChanges 
			(BuildingType, 					YieldType, 		Yield)
SELECT 		'BUILDING_PANAMA_CITY', 		'YIELD_GOLD', 	1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS_NEUTRAL', 	'YIELD_FOOD', 	2;

INSERT INTO Building_RiverPlotYieldChanges 
			(BuildingType, 					YieldType, 					Yield)
SELECT 		'BUILDING_KUALA_LUMPUR', 		'YIELD_GOLD', 				1 UNION ALL
SELECT 		'BUILDING_QUELIMANE', 			'YIELD_GOLDEN_AGE_POINTS', 	1 UNION ALL
SELECT 		'BUILDING_RELIGIOUS_NEUTRAL', 	'YIELD_FOOD', 				1;

INSERT INTO Building_FeatureYieldChanges
			(BuildingType, 			FeatureType, 			YieldType, 			Yield)
SELECT 		'BUILDING_CULTURED', 	'FEATURE_MARSH', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'BUILDING_CULTURED', 	'FEATURE_FOREST', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'BUILDING_CULTURED', 	'FEATURE_JUNGLE', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'BUILDING_CULTURED', 	'FEATURE_OASIS',		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'BUILDING_CULTURED', 	'FEATURE_FLOOD_PLAINS', 'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'BUILDING_CULTURED', 	'FEATURE_ATOLL', 		'YIELD_CULTURE', 	1;

INSERT INTO Building_YieldModifiers 
			(BuildingType, 				YieldType, 				Yield)
SELECT 		'BUILDING_LHASA', 			'YIELD_CULTURE', 		5 UNION ALL
SELECT 		'BUILDING_LHASA', 			'YIELD_FOOD', 			5 UNION ALL
SELECT 		'BUILDING_RIGA', 			'YIELD_FOOD', 			2 UNION ALL
SELECT 		'BUILDING_MERCANTILE', 		'YIELD_GOLD', 			10;

INSERT INTO Building_GrowthExtraYield
			(BuildingType, 					YieldType, 				Yield)
SELECT 		'BUILDING_MERCANTILE_HOSTILE', 	'YIELD_PRODUCTION', 	25;

INSERT INTO Building_SpecificGreatPersonRateModifier 
			(BuildingType,			SpecialistType,			Modifier)
SELECT		'BUILDING_KIEV_2',		'SPECIALIST_MUSICIAN',	50 UNION ALL
SELECT		'BUILDING_MILAN_2',		'SPECIALIST_ARTIST',	50;

INSERT INTO Building_YieldFromBirth
			(BuildingType,			YieldType,				Yield)
SELECT		'BUILDING_MARITIME',	'YIELD_CULTURE_LOCAL',	10;

INSERT INTO Building_YieldFromDeath
			(BuildingType, 					YieldType, 			Yield)
SELECT 		'BUILDING_NANMANDOL', 			'YIELD_CULTURE', 	5 UNION ALL
SELECT 		'BUILDING_RELIGIOUS_HOSTILE', 	'YIELD_CULTURE', 	10;

INSERT INTO Building_YieldFromVictoryGlobal
			(BuildingType,			YieldType,				Yield)
SELECT		'BUILDING_KIGALI',		'YIELD_CULTURE_LOCAL',	5;

INSERT INTO Building_YieldFromProcessModifier
			(BuildingType, 			YieldType, 			Yield)
SELECT 		'BUILDING_TAIWAN', 		'YIELD_SCIENCE', 	10;

INSERT INTO Building_YieldFromYieldPercent
			(BuildingType,			YieldIn,			YieldOut,				Value) 
SELECT		'BUILDING_TAIWAN',		'YIELD_SCIENCE',	'YIELD_FOOD',			15 UNION ALL
SELECT		'BUILDING_MELBOURNE',	'YIELD_GOLD',		'YIELD_FOOD',			10 UNION ALL
SELECT		'BUILDING_MELBOURNE',	'YIELD_GOLD',		'YIELD_CULTURE_LOCAL',	5 UNION ALL
SELECT		'BUILDING_MERCANTILE',	'YIELD_GOLD',		'YIELD_FOOD',			5 UNION ALL
SELECT		'BUILDING_MERCANTILE',	'YIELD_GOLD',		'YIELD_PRODUCTION',		5;

INSERT INTO Building_YieldFromUnitLevelUp
			(BuildingType, 					YieldType, 						Yield)
SELECT 		'BUILDING_WOOTEI_NIICIE', 		'YIELD_GREAT_GENERAL_POINTS', 	2 UNION ALL
SELECT 		'BUILDING_MERCANTILE_HOSTILE', 	'YIELD_GOLD', 					20;

INSERT INTO Building_YieldFromUnitProduction
			(BuildingType,					YieldType,				Yield)
SELECT		'BUILDING_MARITIME_HOSTILE',	'YIELD_FOOD',			50 UNION ALL
SELECT		'BUILDING_MARITIME_HOSTILE',	'YIELD_CULTURE_LOCAL',	20 UNION ALL
SELECT 		'BUILDING_MERCANTILE_HOSTILE', 	'YIELD_GOLD', 			30 UNION ALL
SELECT		'BUILDING_MERCANTILE_HOSTILE', 	'YIELD_CULTURE', 		10;

INSERT INTO Building_YieldFromBorderGrowth 
			(BuildingType, 					YieldType, 		Yield)
SELECT 		'BUILDING_MERCANTILE_NEUTRAL', 	'YIELD_GOLD', 	20;

INSERT INTO Building_DomainFreeExperiences 
			(BuildingType, 						DomainType,		Experience)
SELECT 		'BUILDING_VALLETTA', 				'DOMAIN_SEA', 	15 UNION ALL
SELECT 		'BUILDING_WOOTEI_NIICIE_2', 		'DOMAIN_LAND', 	15 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_FRIENDLY', 	'DOMAIN_LAND', 	30 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_FRIENDLY', 	'DOMAIN_SEA', 	30 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_FRIENDLY', 	'DOMAIN_AIR', 	30 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_NEUTRAL', 	'DOMAIN_LAND', 	10 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_NEUTRAL', 	'DOMAIN_SEA', 	10 UNION ALL
SELECT 		'BUILDING_MILITARISTIC_NEUTRAL', 	'DOMAIN_AIR', 	10;

INSERT INTO Building_ResourceQuantity
			(BuildingType, 					ResourceType, 			Quantity)
SELECT 		'BUILDING_WELLINGTON_HORSE', 	'RESOURCE_HORSE', 		1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_IRON', 	'RESOURCE_IRON', 		1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_COAL', 	'RESOURCE_COAL', 		1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_OIL', 		'RESOURCE_OIL', 		1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_ALUMINUM', 'RESOURCE_ALUMINUM', 	1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_URANIUM', 	'RESOURCE_URANIUM', 	1 UNION ALL
SELECT 		'BUILDING_WELLINGTON_PAPER', 	'RESOURCE_PAPER', 		1;

INSERT INTO Building_ResourceYieldChanges (BuildingType,  					YieldType, 				Yield, 	ResourceType)
SELECT DISTINCT							  'BUILDING_MARITIME_FRIENDLY', 	'YIELD_FOOD', 			1, 		Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_BONUS';

INSERT INTO Building_ResourceYieldChanges (BuildingType,  					YieldType, 				Yield, 	ResourceType)
SELECT DISTINCT							  'BUILDING_MERCANTILE_FRIENDLY', 	'YIELD_GOLD', 			2, 		Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

INSERT INTO Building_ResourceYieldChanges (BuildingType,  					YieldType, 				Yield, 	ResourceType)
SELECT DISTINCT							  'BUILDING_MERCANTILE_NEUTRAL', 	'YIELD_PRODUCTION', 	2, 		Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

INSERT INTO Building_ResourceYieldChanges (BuildingType,  					YieldType, 				Yield, 	ResourceType)
SELECT DISTINCT							  'BUILDING_MERCANTILE_NEUTRAL', 	'YIELD_CULTURE', 		2, 		Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

INSERT INTO Building_HurryModifiers
			(BuildingType,			HurryType,		HurryCostModifier)
SELECT		'BUILDING_MERCANTILE',	'HURRY_GOLD',	-20;

INSERT INTO Building_HurryModifiersLocal
			(BuildingType,			HurryType,		HurryCostModifier)
SELECT		'BUILDING_ANTWERP',		'HURRY_GOLD',	-10;

INSERT INTO Building_UnitCombatProductionModifiers
			(BuildingType,						UnitCombatType,				Modifier)
SELECT 		'BUILDING_DOUALA', 					'UNITCOMBAT_CARGO', 		10 UNION ALL
SELECT 		'BUILDING_DOUALA', 					'UNITCOMBAT_CARAVAN', 		10 UNION ALL
SELECT 		'BUILDING_BELGRADE', 				'UNITCOMBAT_SIEGE', 		10 UNION ALL
SELECT 		'BUILDING_BYBLOS', 					'UNITCOMBAT_NAVALMELEE', 	5 UNION ALL
SELECT 		'BUILDING_BYBLOS', 					'UNITCOMBAT_NAVALRANGED', 	5 UNION ALL
SELECT 		'BUILDING_BYBLOS', 					'UNITCOMBAT_CARRIER', 		5 UNION ALL
SELECT 		'BUILDING_BYBLOS', 					'UNITCOMBAT_SUBMARINE', 	5 UNION ALL
SELECT 		'BUILDING_BYBLOS', 					'UNITCOMBAT_CARGO', 		5 UNION ALL
SELECT 		'BUILDING_BYBLOS', 					'UNITCOMBAT_WORKBOAT', 		5 UNION ALL
SELECT 		'BUILDING_SINGAPORE', 				'UNITCOMBAT_DIPLOMACY',		5 UNION ALL
SELECT 		'BUILDING_SURREY', 					'UNITCOMBAT_FIGHTER',		10 UNION ALL
SELECT 		'BUILDING_SURREY', 					'UNITCOMBAT_BOMBER',		10 UNION ALL
SELECT 		'BUILDING_TYRE', 					'UNITCOMBAT_ARCHAEOLOGIST', 10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_RECON',			10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_ARCHER',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_MOUNTED',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_MELEE',			10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_SIEGE',			10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_GUN',			10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_ARMOR',			10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_HELICOPTER',	10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_NAVALRANGED',	10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_NAVALMELEE',	10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_SUBMARINE',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_CARRIER',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_FIGHTER',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC',			'UNITCOMBAT_BOMBER',		10 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_RECON',			33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_ARCHER',		33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_MOUNTED',		33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_MELEE',			33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_SIEGE',			33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_GUN',			33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_ARMOR',			33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_HELICOPTER',	33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_NAVALRANGED',	33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_NAVALMELEE',	33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_SUBMARINE',		33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_CARRIER',		33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_FIGHTER',		33 UNION ALL
SELECT		'BUILDING_MILITARISTIC_HOSTILE',	'UNITCOMBAT_BOMBER',		33 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_RECON',			-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_ARCHER',		-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_MOUNTED',		-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_MELEE',			-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_SIEGE',			-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_GUN',			-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_ARMOR',			-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_HELICOPTER',	-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_NAVALRANGED',	-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_NAVALMELEE',	-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_SUBMARINE',		-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_CARRIER',		-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_FIGHTER',		-50 UNION ALL
SELECT		'BUILDING_MERCANTILE',				'UNITCOMBAT_BOMBER',		-50 UNION ALL
SELECT		'BUILDING_MARITIME_HOSTILE',		'UNITCOMBAT_NAVALRANGED',	20 UNION ALL
SELECT		'BUILDING_MARITIME_HOSTILE',		'UNITCOMBAT_NAVALMELEE',	20 UNION ALL
SELECT		'BUILDING_MARITIME_HOSTILE',		'UNITCOMBAT_SUBMARINE',		20 UNION ALL
SELECT		'BUILDING_MARITIME_HOSTILE',		'UNITCOMBAT_CARRIER',		20 UNION ALL
SELECT		'BUILDING_MARITIME_FRIENDLY',		'UNITCOMBAT_WORKER',		50 UNION ALL
SELECT		'BUILDING_MARITIME_FRIENDLY',		'UNITCOMBAT_WORKBOAT',		50;

INSERT INTO Building_Flavors 
			(BuildingType, 			FlavorType, 				Flavor)
SELECT 		'BUILDING_KIEV', 		'FLAVOR_GREAT_PEOPLE', 		3 UNION ALL
SELECT 		'BUILDING_LHASA', 		'FLAVOR_WONDER', 			10 UNION ALL
SELECT 		'BUILDING_MILAN', 		'FLAVOR_GREAT_PEOPLE', 		3 UNION ALL
SELECT 		'BUILDING_VALLETTA', 	'FLAVOR_CITY_DEFENSE', 		10 UNION ALL
SELECT 		'BUILDING_VALLETTA', 	'FLAVOR_MILITARY_TRAINING', 10 UNION ALL
SELECT 		'BUILDING_VILNIUS', 	'FLAVOR_GREAT_PEOPLE', 		3 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'FLAVOR_HAPPINESS', 		10 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'FLAVOR_RELIGION', 			5 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'FLAVOR_CULTURE', 			3 UNION ALL
SELECT 		'BUILDING_RISHIKESH', 	'FLAVOR_SCIENCE', 			1;
---------------------------------------------------
-- Definitions - Events
---------------------------------------------------		
INSERT INTO Events 
			(Type, 									Description, 					Help, 										EventArt, RandomChance, NumChoices, IgnoresGlobalCooldown, EventCooldown)
SELECT  	'PLAYER_EVENT_MINOR_CIV_ADEJE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ADEJE', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ALMATY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ALMATY', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ANTANANARIVO', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANTANANARIVO', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ANTWERP', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BELGRADE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BOGOTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BOGOTA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BRATISLAVA', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BRATISLAVA', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BRUSSELS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BRUSSELS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BUCHAREST', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUCHAREST', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BUDAPEST', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUDAPEST', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BUENOS_AIRES', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUENOS_AIRES', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BYBLOS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CAHOKIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CAHOKIA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CAPE_TOWN', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_COLOMBO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_COLOMBO', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DANO', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DANO', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_FLORENCE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_FLORENCE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GENEVA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GENOA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GENOA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_HANOI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HANOI', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_HONG_KONG', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_IFE', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_IFE', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_JERUSALEM', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_JERUSALEM', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KABUL', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KARYES', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KARYES', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KATHMANDU', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KIEV', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KUALA_LUMPUR', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT 		'PLAYER_EVENT_MINOR_CIV_KYZYL', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KYZYL', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LA_VENTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LA_VENTA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LHASA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MALACCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MALACCA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MANILA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MANILA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MBANZA_KONGO', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MBANZA_KONGO', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MELBOURNE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MILAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MOGADISHU', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MOGADISHU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MOMBASA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MOMBASA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MONACO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MONACO', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_NYARYANA_MARQ', 'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_NYARYANA_MARQ', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ORMUS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ORMUS', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_PANAMA_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_PRAGUE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PRAGUE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_QUEBEC_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_QUEBEC_CITY', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_RAGUSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_RIGA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SAMARKAND', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SGAANG', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SGAANG', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SIDON', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SIDON', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SINGAPORE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SOFIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SYDNEY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SYDNEY', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_TYRE', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_UR', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_UR', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VALLETTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VALLETTA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VANCOUVER', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VATICAN_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_VILNIUS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VILNIUS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_WELLINGTON', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_WITTENBERG', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_WOOTEI_NIICIE', 'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_YEREVAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_YEREVAN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ZANZIBAR', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ZANZIBAR', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ZURICH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ZURICH', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CLERMONT', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_HONDURAS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HONDURAS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_AUCKLAND', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AUCKLAND', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ARMAGH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ARMAGH', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MUSCAT', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUSCAT', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GRANADA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GRANADA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_NANMANDOL', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_NANMANDOL', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_GWYNEDD', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GWYNEDD', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MUISCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUISCA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LACONIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LACONIA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CHEVAK', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SANTO_DOMINGO', 'TXT_KEY_CSTRAIT_MINOR_CIV',	'TXT_KEY_CSTRAIT_MINOR_CIV_SANTO_DOMINGO', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MANAGUA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ODENSO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ODENSO', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_YANGCHENG', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_YANGCHENG', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_PHANOTEUS', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DOUALA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA',			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_AMBRACIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AMBRACIA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DJIBOUTI', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DODOMA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_FAYA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_FAYA', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_KIGALI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_LEVUKA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_QUELIMANE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SIERRA_LEONE', 	'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_SURREY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_TAIWAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_OC_EO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_THIMPHU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ANDORRA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_CANOSSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BEDULU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BEDULU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_DALI', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DALI', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MULTAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MULTAN', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_BAGAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BAGAN', 			'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_RISHIKESH', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RISHIKESH', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_MUTITJULU', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUTITJULU', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_ISKANWAYA', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ISKANWAYA', 		'AllianceShift.dds', -1, 1, 1, 1 UNION ALL
SELECT  	'PLAYER_EVENT_MINOR_CIV_TIWANAKU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TIWANAKU', 		'AllianceShift.dds', -1, 1, 1, 1;

INSERT INTO EventChoices 
			(Type, 											Description, 					Help, 										EventDuration, 	Expires, 	CapitalEffectOnly,	EventPolicy, 			EventPromotion, 			EventBuildingClassGlobal)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ADEJE', 			3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ALMATY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ALMATY', 		3, 				1, 			0,					'POLICY_ALMATY', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AMBRACIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AMBRACIA', 		3, 				1, 			0,					'POLICY_AMBRACIA', 		'PROMOTION_AMBRACIA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANDORRA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANDORRA', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_ANDORRA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTANANARIVO', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANTANANARIVO', 	3, 				1, 			0,					'POLICY_ANTANANARIVO', 	'PROMOTION_ANTANANARIVO', 	NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTWERP', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ANTWERP', 		3, 				1,			0,					NULL, 					NULL, 						'BUILDINGCLASS_ANTWERP' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ARMAGH', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AUCKLAND', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_AUCKLAND', 		3, 				1, 			0,					'POLICY_AUCKLAND', 		'PROMOTION_AUCKLAND', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BAGAN', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BAGAN', 			3, 				1, 			0,					'POLICY_BAGAN', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BEDULU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BEDULU', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_BEDULU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BELGRADE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BELGRADE', 		3, 				1, 			0,					NULL, 					'PROMOTION_BELGRADE', 		'BUILDINGCLASS_BELGRADE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BOGOTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BOGOTA', 		3, 				1, 			0,					'POLICY_BOGOTA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BRATISLAVA', 	3, 				1, 			0,					'POLICY_BRATISLAVA', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BRUSSELS', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUCHAREST', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUCHAREST', 		3, 				1, 			0,					'POLICY_BUCHAREST', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUDAPEST', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUDAPEST', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BUENOS_AIRES', 	3, 				1, 			0,					'POLICY_BUENOS_AIRES', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BYBLOS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_BYBLOS', 		3, 				1, 			0,					'POLICY_BYBLOS', 		NULL, 						'BUILDINGCLASS_BYBLOS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CAHOKIA', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CANOSSA', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAPE_TOWN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CAPE_TOWN', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_CAPE_TOWN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CHEVAK', 		'TXT_KEY_CSTRAIT_MINOR_CIV',	'TXT_KEY_CSTRAIT_MINOR_CIV_CHEVAK', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_CHEVAK' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CLERMONT', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_CLERMONT', 		3, 				1, 			0,					NULL, 					'PROMOTION_CLERMONT', 		'BUILDINGCLASS_CLERMONT' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_COLOMBO', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DALI', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DALI', 			3, 				1, 			0,					'POLICY_DALI', 			NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DANO', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DANO', 			3, 				1, 			0,					'POLICY_DANO', 			NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DJIBOUTI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DJIBOUTI', 		3, 				1, 			0,					'POLICY_DJIBOUTI', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DODOMA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DODOMA', 		3, 				1, 			0,					'POLICY_DODOMA', 		'PROMOTION_DODOMA', 		'BUILDINGCLASS_DODOMA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DOUALA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_DOUALA', 		3, 				1, 			0,					'POLICY_DOUALA', 		NULL, 						'BUILDINGCLASS_DOUALA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FAYA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_FAYA', 			3, 				1, 			0,					NULL, 					'PROMOTION_FAYA', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_FLORENCE', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENEVA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GENEVA', 		3, 				1, 			0,					'POLICY_GENEVA', 		NULL, 						'BUILDINGCLASS_GENEVA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENOA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GENOA', 			3, 				1, 			0,					'POLICY_GENOA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GRANADA', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GWYNEDD', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_GWYNEDD', 		3, 				1, 			0,					'POLICY_GWYNEDD', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANOI', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HANOI', 			3, 				1, 			0,					NULL, 					'PROMOTION_HANOI', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONDURAS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HONDURAS', 		3, 				1, 			0,					'POLICY_HONDURAS', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONG_KONG', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_HONG_KONG', 		3, 				1, 			0,					'POLICY_HONG_KONG', 	NULL, 						'BUILDINGCLASS_HONG_KONG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_IFE', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_IFE', 			3, 				1, 			0,					NULL, 					'PROMOTION_IFE', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ISKANWAYA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ISKANWAYA', 		3, 				1, 			0,					NULL, 					'PROMOTION_ISKANWAYA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JERUSALEM', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_JERUSALEM', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KABUL', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KABUL', 			3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_KABUL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARYES', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KARYES', 		3, 				1, 			0,					NULL, 					'PROMOTION_KARYES', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KATHMANDU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KATHMANDU', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_KATHMANDU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIEV', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KIEV', 			3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIGALI', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KIGALI', 		3, 				1, 			0,					'POLICY_KIGALI', 		NULL, 						'BUILDINGCLASS_KIGALI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KUALA_LUMPUR', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KUALA_LUMPUR', 	3, 				1, 			0,					'POLICY_KUALA_LUMPUR', 	NULL, 						'BUILDINGCLASS_KUALA_LUMPUR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_KYZYL', 			3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LACONIA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LACONIA', 		3, 				1, 			0,					NULL, 					'PROMOTION_LACONIA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LA_VENTA', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LEVUKA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LEVUKA', 		3, 				1, 			0,					NULL,					'PROMOTION_LEVUKA', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_LHASA', 			3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_LHASA_2' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MALACCA', 		3, 				1, 			0,					'POLICY_MALACCA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANAGUA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MANAGUA', 		3, 				1, 			0,					'POLICY_MANAGUA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANILA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MANILA', 		3, 				1, 			0,					'POLICY_MANILA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MBANZA_KONGO', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MBANZA_KONGO', 	3, 				1, 			0,					NULL, 					'PROMOTION_MBANZA_KONGO', 	NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MELBOURNE', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_MELBOURNE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MILAN', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MILAN', 			3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MOGADISHU', 		3, 				1, 			0,					'POLICY_MOGADISHU', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'TXT_KEY_CSTRAIT_MINOR_CIV',	'TXT_KEY_CSTRAIT_MINOR_CIV_MOMBASA', 		3, 				1, 			0,					'POLICY_MOMBASA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MONACO', 		3, 				1, 			0,					'POLICY_MONACO', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUISCA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUISCA', 		3, 				1, 			0,					'POLICY_MUISCA', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MULTAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MULTAN', 		3, 				1, 			0,					'POLICY_MULTAN', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUSCAT', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUSCAT', 		3, 				1, 			0,					'POLICY_MUSCAT', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUTITJULU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_MUTITJULU', 		3, 				1, 			0,					'POLICY_MUTITJULU', 	NULL, 						'BUILDINGCLASS_MUTITJULU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NANMANDOL', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_NANMANDOL', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_NANMANDOL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NYARYANA_MARQ', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_NYARYANA_MARQ', 	3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_OC_EO', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_OC_EO', 			3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_OC_EO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ODENSO', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ODENSO', 		3, 				1, 			0,					NULL, 					'PROMOTION_ODENSO', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ORMUS', 			3, 				1, 			0,					'POLICY_ORMUS', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PANAMA_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PANAMA_CITY', 	3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_PANAMA_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PHANOTEUS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PHANOTEUS', 		3, 				1, 			0,					'POLICY_PHANOTEUS', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_PRAGUE', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_QUEBEC_CITY', 	3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUELIMANE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_QUELIMANE', 		3, 				1, 			0,					'POLICY_QUELIMANE', 	NULL, 						'BUILDINGCLASS_QUELIMANE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RAGUSA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RAGUSA', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_RAGUSA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RIGA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RIGA', 			3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_RIGA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RISHIKESH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_RISHIKESH', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SAMARKAND', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SAMARKAND', 		3, 				1, 			0,					'POLICY_SAMARKAND', 	NULL, 						'BUILDINGCLASS_SAMARKAND' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SANTO_DOMINGO', 	'TXT_KEY_CSTRAIT_MINOR_CIV',	'TXT_KEY_CSTRAIT_MINOR_CIV_SANTO_DOMINGO', 	3, 				1, 			0,					'POLICY_SANTO_DOMINGO', NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SGAANG', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SGAANG', 		3, 				1, 			0,					NULL, 					'PROMOTION_SGAANG', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIDON', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SIDON', 			3, 				1, 			0,					NULL, 					'PROMOTION_SIDON', 			NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIERRA_LEONE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SIERRA_LEONE', 	3, 				1, 			0,					'POLICY_SIERRA_LEONE', 	NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SINGAPORE', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SINGAPORE', 		3, 				1, 			0,					NULL, 					'PROMOTION_NOBILITY', 		'BUILDINGCLASS_SINGAPORE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SOFIA', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SOFIA', 			3, 				1, 			0,					'POLICY_SOFIA', 		NULL, 						'BUILDINGCLASS_SOFIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SURREY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SURREY', 		3, 				1, 			0,					NULL, 					'PROMOTION_SURREY', 		'BUILDINGCLASS_SURREY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SYDNEY', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_SYDNEY', 		3, 				1, 			0,					'POLICY_SYDNEY', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TAIWAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TAIWAN', 		3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_TAIWAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_THIMPHU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_THIMPHU', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TIWANAKU', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TIWANAKU', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TYRE', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_TYRE', 			3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_TYRE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_UR', 			'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_UR', 			3, 				1, 			0,					'POLICY_UR', 			NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VALLETTA', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VANCOUVER', 		3, 				1, 			0,					'POLICY_VANCOUVER', 	NULL, 						'BUILDINGCLASS_VANCOUVER' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VATICAN_CITY', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VATICAN_CITY', 	3, 				1, 			1,					NULL, 					NULL, 						'BUILDINGCLASS_VATICAN_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_VILNIUS', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WELLINGTON', 	3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WITTENBERG', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WITTENBERG', 	3, 				1, 			0,					NULL, 					NULL, 						'BUILDINGCLASS_WITTENBERG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WOOTEI_NIICIE', 	'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_WOOTEI_NIICIE', 	3, 				1, 			1,					'POLICY_WOOTEI_NIICIE', NULL, 						'BUILDINGCLASS_WOOTEI_NIICIE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_YANGCHENG', 		3, 				1, 			0,					NULL, 					NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YEREVAN', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_YEREVAN', 		3, 				1, 			0,					NULL, 					'PROMOTION_YEREVAN', 		NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ZANZIBAR', 		3, 				1, 			0,					'POLICY_ZANZIBAR', 		NULL, 						NULL UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH', 		'TXT_KEY_CSTRAIT_MINOR_CIV', 	'TXT_KEY_CSTRAIT_MINOR_CIV_ZURICH', 		3, 				1, 			0,					NULL, 					NULL, 						NULL;

INSERT INTO Event_ParentEvents 
			(EventChoiceType, 								EventType)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'PLAYER_EVENT_MINOR_CIV_ADEJE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ALMATY', 		'PLAYER_EVENT_MINOR_CIV_ALMATY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTANANARIVO', 	'PLAYER_EVENT_MINOR_CIV_ANTANANARIVO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTWERP', 		'PLAYER_EVENT_MINOR_CIV_ANTWERP' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BELGRADE', 		'PLAYER_EVENT_MINOR_CIV_BELGRADE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BOGOTA', 		'PLAYER_EVENT_MINOR_CIV_BOGOTA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'PLAYER_EVENT_MINOR_CIV_BRATISLAVA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 		'PLAYER_EVENT_MINOR_CIV_BRUSSELS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUCHAREST', 		'PLAYER_EVENT_MINOR_CIV_BUCHAREST' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUDAPEST', 		'PLAYER_EVENT_MINOR_CIV_BUDAPEST' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUENOS_AIRES', 	'PLAYER_EVENT_MINOR_CIV_BUENOS_AIRES' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BYBLOS', 		'PLAYER_EVENT_MINOR_CIV_BYBLOS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'PLAYER_EVENT_MINOR_CIV_CAHOKIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAPE_TOWN', 		'PLAYER_EVENT_MINOR_CIV_CAPE_TOWN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 		'PLAYER_EVENT_MINOR_CIV_COLOMBO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DANO', 			'PLAYER_EVENT_MINOR_CIV_DANO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 		'PLAYER_EVENT_MINOR_CIV_FLORENCE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENEVA', 		'PLAYER_EVENT_MINOR_CIV_GENEVA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GENOA', 			'PLAYER_EVENT_MINOR_CIV_GENOA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANOI', 			'PLAYER_EVENT_MINOR_CIV_HANOI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONG_KONG', 		'PLAYER_EVENT_MINOR_CIV_HONG_KONG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_IFE', 			'PLAYER_EVENT_MINOR_CIV_IFE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JERUSALEM', 		'PLAYER_EVENT_MINOR_CIV_JERUSALEM' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KABUL', 			'PLAYER_EVENT_MINOR_CIV_KABUL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARYES', 		'PLAYER_EVENT_MINOR_CIV_KARYES' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KATHMANDU', 		'PLAYER_EVENT_MINOR_CIV_KATHMANDU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIEV', 			'PLAYER_EVENT_MINOR_CIV_KIEV' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KUALA_LUMPUR', 	'PLAYER_EVENT_MINOR_CIV_KUALA_LUMPUR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'PLAYER_EVENT_MINOR_CIV_KYZYL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'PLAYER_EVENT_MINOR_CIV_LA_VENTA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'PLAYER_EVENT_MINOR_CIV_LHASA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'PLAYER_EVENT_MINOR_CIV_MALACCA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANILA', 		'PLAYER_EVENT_MINOR_CIV_MANILA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MBANZA_KONGO', 	'PLAYER_EVENT_MINOR_CIV_MBANZA_KONGO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'PLAYER_EVENT_MINOR_CIV_MELBOURNE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MILAN', 			'PLAYER_EVENT_MINOR_CIV_MILAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU', 		'PLAYER_EVENT_MINOR_CIV_MOGADISHU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'PLAYER_EVENT_MINOR_CIV_MOMBASA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'PLAYER_EVENT_MINOR_CIV_MONACO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NYARYANA_MARQ', 	'PLAYER_EVENT_MINOR_CIV_NYARYANA_MARQ' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'PLAYER_EVENT_MINOR_CIV_ORMUS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PANAMA_CITY', 	'PLAYER_EVENT_MINOR_CIV_PANAMA_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'PLAYER_EVENT_MINOR_CIV_PRAGUE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'PLAYER_EVENT_MINOR_CIV_QUEBEC_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RAGUSA', 		'PLAYER_EVENT_MINOR_CIV_RAGUSA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RIGA', 			'PLAYER_EVENT_MINOR_CIV_RIGA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SAMARKAND', 		'PLAYER_EVENT_MINOR_CIV_SAMARKAND' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SGAANG', 		'PLAYER_EVENT_MINOR_CIV_SGAANG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIDON', 			'PLAYER_EVENT_MINOR_CIV_SIDON' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SINGAPORE', 		'PLAYER_EVENT_MINOR_CIV_SINGAPORE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SOFIA', 			'PLAYER_EVENT_MINOR_CIV_SOFIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SYDNEY', 		'PLAYER_EVENT_MINOR_CIV_SYDNEY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TYRE', 			'PLAYER_EVENT_MINOR_CIV_TYRE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_UR', 			'PLAYER_EVENT_MINOR_CIV_UR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 		'PLAYER_EVENT_MINOR_CIV_VALLETTA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VANCOUVER', 		'PLAYER_EVENT_MINOR_CIV_VANCOUVER' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VATICAN_CITY', 	'PLAYER_EVENT_MINOR_CIV_VATICAN_CITY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS', 		'PLAYER_EVENT_MINOR_CIV_VILNIUS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'PLAYER_EVENT_MINOR_CIV_WELLINGTON' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WOOTEI_NIICIE', 	'PLAYER_EVENT_MINOR_CIV_WOOTEI_NIICIE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_WITTENBERG', 	'PLAYER_EVENT_MINOR_CIV_WITTENBERG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YEREVAN', 		'PLAYER_EVENT_MINOR_CIV_YEREVAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'PLAYER_EVENT_MINOR_CIV_ZANZIBAR' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH', 		'PLAYER_EVENT_MINOR_CIV_ZURICH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CLERMONT', 		'PLAYER_EVENT_MINOR_CIV_CLERMONT' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONDURAS', 		'PLAYER_EVENT_MINOR_CIV_HONDURAS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AUCKLAND', 		'PLAYER_EVENT_MINOR_CIV_AUCKLAND' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'PLAYER_EVENT_MINOR_CIV_ARMAGH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUSCAT', 		'PLAYER_EVENT_MINOR_CIV_MUSCAT' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'PLAYER_EVENT_MINOR_CIV_GRANADA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NANMANDOL', 		'PLAYER_EVENT_MINOR_CIV_NANMANDOL' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GWYNEDD', 		'PLAYER_EVENT_MINOR_CIV_GWYNEDD' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUISCA', 		'PLAYER_EVENT_MINOR_CIV_MUISCA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LACONIA', 		'PLAYER_EVENT_MINOR_CIV_LACONIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CHEVAK', 		'PLAYER_EVENT_MINOR_CIV_CHEVAK' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SANTO_DOMINGO', 	'PLAYER_EVENT_MINOR_CIV_SANTO_DOMINGO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MANAGUA', 		'PLAYER_EVENT_MINOR_CIV_MANAGUA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ODENSO', 		'PLAYER_EVENT_MINOR_CIV_ODENSO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'PLAYER_EVENT_MINOR_CIV_YANGCHENG' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PHANOTEUS', 		'PLAYER_EVENT_MINOR_CIV_PHANOTEUS' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DOUALA', 		'PLAYER_EVENT_MINOR_CIV_DOUALA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_AMBRACIA', 		'PLAYER_EVENT_MINOR_CIV_AMBRACIA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DJIBOUTI', 		'PLAYER_EVENT_MINOR_CIV_DJIBOUTI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DODOMA', 		'PLAYER_EVENT_MINOR_CIV_DODOMA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FAYA', 			'PLAYER_EVENT_MINOR_CIV_FAYA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KIGALI', 		'PLAYER_EVENT_MINOR_CIV_KIGALI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LEVUKA', 		'PLAYER_EVENT_MINOR_CIV_LEVUKA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUELIMANE', 		'PLAYER_EVENT_MINOR_CIV_QUELIMANE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SIERRA_LEONE', 	'PLAYER_EVENT_MINOR_CIV_SIERRA_LEONE' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SURREY', 		'PLAYER_EVENT_MINOR_CIV_SURREY' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TAIWAN', 		'PLAYER_EVENT_MINOR_CIV_TAIWAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_OC_EO', 			'PLAYER_EVENT_MINOR_CIV_OC_EO' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_THIMPHU', 		'PLAYER_EVENT_MINOR_CIV_THIMPHU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANDORRA', 		'PLAYER_EVENT_MINOR_CIV_ANDORRA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA', 		'PLAYER_EVENT_MINOR_CIV_CANOSSA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BEDULU', 		'PLAYER_EVENT_MINOR_CIV_BEDULU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DALI', 			'PLAYER_EVENT_MINOR_CIV_DALI' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MULTAN', 		'PLAYER_EVENT_MINOR_CIV_MULTAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BAGAN', 			'PLAYER_EVENT_MINOR_CIV_BAGAN' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RISHIKESH', 		'PLAYER_EVENT_MINOR_CIV_RISHIKESH' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUTITJULU', 		'PLAYER_EVENT_MINOR_CIV_MUTITJULU' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ISKANWAYA', 		'PLAYER_EVENT_MINOR_CIV_ISKANWAYA' UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TIWANAKU', 		'PLAYER_EVENT_MINOR_CIV_TIWANAKU';

INSERT INTO EventChoice_ResourceQuantity 
			(EventChoiceType, 							ResourceType, 		Quantity)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUDAPEST', 	'RESOURCE_HORSE', 	5;

INSERT INTO EventChoice_BuildingClassYieldChange 
			(EventChoiceType, 								BuildingClassType, 					YieldType, 				YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 		'BUILDINGCLASS_VALLETTA', 			'YIELD_FOOD', 			2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VALLETTA', 		'BUILDINGCLASS_VALLETTA', 			'YIELD_SCIENCE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_WRITERS_GUILD', 		'YIELD_CULTURE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_ARTISTS_GUILD', 		'YIELD_CULTURE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_MUSICIANS_GUILD', 	'YIELD_CULTURE', 		2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_WRITERS_GUILD', 		'YIELD_TOURISM', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_ARTISTS_GUILD', 		'YIELD_TOURISM', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRATISLAVA', 	'BUILDINGCLASS_MUSICIANS_GUILD', 	'YIELD_TOURISM', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HONDURAS', 		'BUILDINGCLASS_HARBOR', 			'YIELD_GOLD', 			1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DANO', 			'BUILDINGCLASS_SHRINE', 			'YIELD_CULTURE_LOCAL', 	2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_DJIBOUTI', 		'BUILDINGCLASS_GRANARY', 			'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ISKANWAYA', 		'BUILDINGCLASS_AQUEDUCT', 			'YIELD_FAITH', 			1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'BUILDINGCLASS_PALACE', 			'YIELD_SCIENCE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KYZYL', 			'BUILDINGCLASS_MONUMENT', 			'YIELD_SCIENCE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'BUILDINGCLASS_MARKET', 			'YIELD_CULTURE_LOCAL', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MONACO', 		'BUILDINGCLASS_BANK', 				'YIELD_CULTURE_LOCAL', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'BUILDINGCLASS_WALLS', 				'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_PRAGUE', 		'BUILDINGCLASS_CASTLE', 			'YIELD_CULTURE', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH', 		'BUILDINGCLASS_BANK', 				'YIELD_GOLD', 			1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ZURICH', 		'BUILDINGCLASS_STOCK_EXCHANGE',		'YIELD_GOLD', 			1;

INSERT INTO EventChoice_BuildingClassYieldModifier 
			(EventChoiceType, 								BuildingClassType, 				YieldType, 			Modifier)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'BUILDINGCLASS_LHASA', 			'YIELD_FOOD', 		5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LHASA', 			'BUILDINGCLASS_LHASA', 			'YIELD_CULTURE', 	5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'BUILDINGCLASS_ARMAGH1', 		'YIELD_CULTURE', 	5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'BUILDINGCLASS_ARMAGH2', 		'YIELD_SCIENCE', 	5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'BUILDINGCLASS_ARMAGH3', 		'YIELD_GOLD', 		5 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'BUILDINGCLASS_ARMAGH4', 		'YIELD_FOOD', 		3 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ARMAGH', 		'BUILDINGCLASS_ARMAGH4', 		'YIELD_PRODUCTION', 3;

INSERT INTO EventChoice_SpecialistYieldChange 
			(EventChoiceType, 							SpecialistType, 			YieldType, 						YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ANTWERP', 	'SPECIALIST_MERCHANT', 		'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CANOSSA', 	'SPECIALIST_CIVIL_SERVANT', 'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANOI', 		'SPECIALIST_CIVIL_SERVANT', 'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_HANOI', 		'SPECIALIST_CIVIL_SERVANT', 'YIELD_GREAT_ADMIRAL_POINTS', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 	'SPECIALIST_ARTIST', 		'YIELD_GOLDEN_AGE_POINTS',	 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_VILNIUS', 	'SPECIALIST_WRITER', 		'YIELD_GOLD', 					1;

INSERT INTO EventChoice_ImprovementYieldChange 
			(EventChoiceType, 								ImprovementType, 					YieldType, 						YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'IMPROVEMENT_DOGO_CANARIO', 		'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'IMPROVEMENT_DOGO_CANARIO', 		'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 		'IMPROVEMENT_MARSH', 				'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 		'IMPROVEMENT_MARSH', 				'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BYBLOS', 		'IMPROVEMENT_FISHING_BOATS', 		'YIELD_FOOD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'IMPROVEMENT_MOUND', 				'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_CAHOKIA', 		'IMPROVEMENT_MOUND', 				'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_FLORENCE', 		'IMPROVEMENT_QUARRY', 				'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'IMPROVEMENT_FORT', 				'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'IMPROVEMENT_CITADEL', 				'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_GRANADA', 		'IMPROVEMENT_PONTOON_BRIDGE', 		'YIELD_GREAT_GENERAL_POINTS', 	1 WHERE EXISTS (SELECT * FROM Improvements WHERE Type='IMPROVEMENT_PONTOON_BRIDGE') UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_JERUSALEM', 		'IMPROVEMENT_HOLY_SITE', 			'YIELD_FAITH',					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARYES', 		'IMPROVEMENT_MONASTERY', 			'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_KARYES', 		'IMPROVEMENT_MONASTERY', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'IMPROVEMENT_BIG_HEAD', 			'YIELD_SCIENCE', 				2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_LA_VENTA', 		'IMPROVEMENT_BIG_HEAD', 			'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MELBOURNE', 		'IMPROVEMENT_MINE', 				'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NYARYANA_MARQ', 	'IMPROVEMENT_CHUM', 				'YIELD_FOOD', 					2 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'IMPROVEMENT_CAMP', 				'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_QUEBEC_CITY', 	'IMPROVEMENT_LUMBERMILL', 			'YIELD_GOLD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_RAGUSA', 		'IMPROVEMENT_EMBASSY', 				'YIELD_FOOD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SGAANG', 		'IMPROVEMENT_TOTEM_POLE', 			'YIELD_FOOD', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_SGAANG', 		'IMPROVEMENT_TOTEM_POLE', 			'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TIWANAKU', 		'IMPROVEMENT_SUNK_COURT', 			'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TIWANAKU', 		'IMPROVEMENT_SUNK_COURT', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_TYRE', 			'IMPROVEMENT_LANDMARK', 			'YIELD_GOLD', 					2;

INSERT INTO EventChoice_FeatureYieldChange 
			(EventChoiceType, 							FeatureType, 			YieldType, 			YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 	'FEATURE_MARSH', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BRUSSELS', 	'FEATURE_MARSH', 		'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 	'FEATURE_FOREST', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_COLOMBO', 	'FEATURE_JUNGLE', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU', 	'FEATURE_FLOOD_PLAINS', 'YIELD_FOOD', 		1;

INSERT INTO EventChoice_TerrainYieldChange 
			(EventChoiceType, 								TerrainType, 		YieldType, 			YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MOGADISHU',		'TERRAIN_OCEAN', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NANMANDOL', 		'TERRAIN_OCEAN', 	'YIELD_FOOD', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NANMANDOL', 		'TERRAIN_OCEAN', 	'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_NYARYANA_MARQ', 	'TERRAIN_SNOW', 	'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_MUTITJULU', 		'TERRAIN_DESERT', 	'YIELD_FAITH', 		1;

INSERT INTO EventChoice_ResourceYieldChange 
			(EventChoiceType, 								ResourceType, 				YieldType, 						YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'RESOURCE_DOGO_CANARIO', 	'YIELD_CULTURE', 				1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_ADEJE', 			'RESOURCE_DOGO_CANARIO', 	'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BEDULU', 		'RESOURCE_FISH', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BEDULU', 		'RESOURCE_CRAB', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BEDULU', 		'RESOURCE_PEARLS', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BEDULU', 		'RESOURCE_CORAL', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BEDULU', 		'RESOURCE_WHALE', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BUDAPEST', 		'RESOURCE_HORSE', 			'YIELD_GOLDEN_AGE_POINTS', 		1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_COW', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_SHEEP', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_DEER', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_FISH', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_BISON', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_WHALE', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_PEARLS', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_IVORY', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_FUR', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_CRAB', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_TRUFFLES', 		'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_CORAL', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 		'RESOURCE_HORSE', 			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YEREVAN', 		'RESOURCE_HORSE', 			'YIELD_CULTURE', 				1;

-- bonus
INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_MOMBASA', 		'YIELD_FOOD', 						1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_BONUS';

-- luxury
INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_MALACCA', 		'YIELD_GOLD', 						1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_ORMUS', 			'YIELD_FOOD', 						1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_ZANZIBAR', 		'YIELD_TOURISM', 					1, 				Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

-- strategic
INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_SURREY',			'YIELD_GREAT_GENERAL_POINTS', 		1, 				Type
FROM Resources WHERE ResourceUsage = 1;

INSERT INTO EventChoice_ResourceYieldChange (EventChoiceType,  								YieldType, 							YieldChange, 	ResourceType)
SELECT DISTINCT								'PLAYER_EVENT_CHOICE_MINOR_CIV_WELLINGTON', 	'YIELD_FOOD', 						1, 				Type
FROM Resources WHERE ResourceUsage = 1;

--animals
INSERT INTO EventChoice_ResourceYieldChange 
			(EventChoiceType, 							ResourceType, 				YieldType, 		YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 	'RESOURCE_BIRDS_NEST', 		'YIELD_FAITH', 	1
WHERE EXISTS (SELECT * FROM Community WHERE Type='UCS-EMR' AND Value = 1);

INSERT INTO EventChoice_ResourceYieldChange 
			(EventChoiceType, 							ResourceType, 				YieldType, 		YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 	'RESOURCE_TROPICAL_FISH', 	'YIELD_FAITH', 	1 WHERE EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value = 1) UNION ALL
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_YANGCHENG', 	'RESOURCE_TORTOISE', 		'YIELD_FAITH', 	1 WHERE EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value = 1);

--sea
INSERT INTO EventChoice_ResourceYieldChange 
			(EventChoiceType, 							ResourceType, 				YieldType, 		YieldChange)
SELECT 		'PLAYER_EVENT_CHOICE_MINOR_CIV_BEDULU', 	'RESOURCE_TROPICAL_FISH', 	'YIELD_FAITH', 	1
WHERE EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value = 1);



UPDATE EventChoices SET ReligiousUnrestModifierGlobal = -5 WHERE Type = 'PLAYER_EVENT_CHOICE_MINOR_CIV_WITTENBERG';
--UPDATE EventChoices SET GoldMedianModifierGlobal = -5 WHERE Type = 'PLAYER_EVENT_CHOICE_MINOR_CIV_DJIBOUTI';
--UPDATE EventChoices SET ScienceMedianModifierGlobal = -5 WHERE Type = 'PLAYER_EVENT_CHOICE_MINOR_CIV_KIGALI';
UPDATE EventChoices SET BasicNeedsMedianModifierGlobal = -5 WHERE Type = 'PLAYER_EVENT_CHOICE_MINOR_CIV_SIERRA_LEONE';
---------------------------------------------------
-- Definitions - Improvements and Resources
---------------------------------------------------	
INSERT INTO ArtDefine_LandmarkTypes
			(Type, 									LandmarkType, 	FriendlyName)
VALUES 		('ART_DEF_IMPROVEMENT_MARSH', 			'Improvement', 	'Brussels'' Marsh'),
			('ART_DEF_IMPROVEMENT_SUNK_COURT', 		'Improvement', 	'Sunken Courtyard'),
			('ART_DEF_IMPROVEMENT_BIG_HEAD', 		'Improvement', 	'Colossal Head'),
			('ART_DEF_IMPROVEMENT_MONASTERY', 		'Improvement', 	'Monastery'),
			('ART_DEF_IMPROVEMENT_TOTEM_POLE', 		'Improvement', 	'Totem Pole'),
			('ART_DEF_IMPROVEMENT_CHUM', 			'Improvement', 	'Chum'),
			('ART_DEF_IMPROVEMENT_DOGO_CANARIO',	'Improvement', 	'Dogo Canario'),
			('ART_DEF_RESOURCE_DOGO_CANARIO',		'Resource', 	'Dogo Canario');

INSERT INTO ArtDefine_Landmarks
			(Era, State, 	Scale, 	ImprovementType, 				LayoutHandler, 	ResourceType, Model, TerrainContour)
SELECT 		Era, State, 	Scale, 	'ART_DEF_IMPROVEMENT_MARSH', 	LayoutHandler, 	ResourceType, Model, TerrainContour
FROM ArtDefine_Landmarks WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_POLDER';
			
INSERT INTO ArtDefine_Landmarks
			(Era,	State, 					Scale, 	ImprovementType, 					LayoutHandler, 	ResourceType,						Model,								TerrainContour)
VALUES 		('Any', 'Constructed', 			0.65, 	'ART_DEF_IMPROVEMENT_SUNK_COURT', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'chatallata_6.fxsxml',				1),
			('Any', 'Pillaged', 			0.65, 	'ART_DEF_IMPROVEMENT_SUNK_COURT', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'chatallata_pl.fxsxml',				1),
			('Any', 'Constructed', 			1, 		'ART_DEF_IMPROVEMENT_BIG_HEAD', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'olmec_colossalheads.fxsxml',		1),
			('Any', 'Pillaged', 			1, 		'ART_DEF_IMPROVEMENT_BIG_HEAD', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'olmec_colossalheads_pl.fxsxml',	1),
			('Any', 'UnderConstruction', 	0.9, 	'ART_DEF_IMPROVEMENT_MONASTERY', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'sistineTI_HB.fxsxml',				1),
			('Any', 'Constructed', 			0.9, 	'ART_DEF_IMPROVEMENT_MONASTERY', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'sistineTI_B.fxsxml',				1),
			('Any', 'Pillaged', 			0.9, 	'ART_DEF_IMPROVEMENT_MONASTERY', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'WTI_PL.fxsxml',					1),
			('Any', 'UnderConstruction', 	0.8, 	'ART_DEF_IMPROVEMENT_TOTEM_POLE', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'monolith_amer_er_hb.fxsxml',		1),
			('Any', 'Constructed', 			0.8, 	'ART_DEF_IMPROVEMENT_TOTEM_POLE', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'monolith_amer_er_hb.fxsxml',		1),
			('Any', 'Pillaged', 			0.8, 	'ART_DEF_IMPROVEMENT_TOTEM_POLE', 	'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'monolith_amer_er_hb.fxsxml',		1),
			('Any', 'UnderConstruction', 	1, 		'ART_DEF_IMPROVEMENT_CHUM', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'WoodenTent_HB.fxsxml',				1),
			('Any', 'Constructed', 			1, 		'ART_DEF_IMPROVEMENT_CHUM', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'WoodenTent_B.fxsxml',				1),
			('Any', 'Pillaged', 			1, 		'ART_DEF_IMPROVEMENT_CHUM', 		'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'WoodenTent_PL.fxsxml',				1),
			('Any', 'UnderConstruction', 	0.7, 	'ART_DEF_IMPROVEMENT_DOGO_CANARIO', 'RANDOM', 		'ART_DEF_RESOURCE_NONE',			'dogocanario_camp_hb.fxsxml',		1),
			('Any', 'Any', 					0.7, 	'ART_DEF_IMPROVEMENT_NONE', 		'RANDOM', 		'ART_DEF_RESOURCE_DOGO_CANARIO',	'dogocanario.fxsxml',				1),
			('Any', 'UnderConstruction', 	0.7, 	'ART_DEF_IMPROVEMENT_CAMP', 		'RANDOM', 		'ART_DEF_RESOURCE_DOGO_CANARIO',	'dogocanario_camp_hb.fxsxml',		1),
			('Any', 'Constructed', 			0.7, 	'ART_DEF_IMPROVEMENT_CAMP', 		'RANDOM', 		'ART_DEF_RESOURCE_DOGO_CANARIO',	'dogocanario_camp_cn.fxsxml',		1),
			('Any', 'Pillaged', 			0.7, 	'ART_DEF_IMPROVEMENT_CAMP', 		'RANDOM', 		'ART_DEF_RESOURCE_DOGO_CANARIO',	'DogoCanario_Camp_pl.fxsxml',		1);
			
INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 					TileType, 		Asset)
VALUES 		('ART_DEF_IMPROVEMENT_MARSH', 			'Improvement', 	'sv_BuildMarsh.dds'),
			('ART_DEF_IMPROVEMENT_SUNK_COURT', 		'Improvement', 	'sv_BuildSunkenCourtyard.dds'),
			('ART_DEF_IMPROVEMENT_BIG_HEAD', 		'Improvement', 	'sv_BuildColossalHead.dds'),
			('ART_DEF_IMPROVEMENT_MONASTERY', 		'Improvement', 	'sv_BuildMonastery.dds'),
			('ART_DEF_IMPROVEMENT_TOTEM_POLE', 		'Improvement', 	'sv_BuildTotemPole.dds'),
			('ART_DEF_IMPROVEMENT_CHUM', 			'Improvement', 	'sv_BuildChum.dds'),
			('ART_DEF_IMPROVEMENT_DOGO_CANARIO',	'Improvement', 	'sv_ResourceDogoCanario.dds'),
			('ART_DEF_RESOURCE_DOGO_CANARIO', 		'Resource', 	'sv_ResourceDogoCanario.dds');

INSERT INTO IconFontMapping 
			(IconName, 					IconFontTexture,			IconMapping)
VALUES		('ICON_RES_DOGO_CANARIO', 	'UCS_RESOURCE_FONT_ATLAS',	1);
---------------------------------------------------
-- Definitions - Improvements
---------------------------------------------------	
INSERT INTO Builds 
			(Type, 					Time, 	ImprovementType, 			Description, 					Help, 								EntityEvent, 				Kill,	HotKey, 	OrderPriority, 	IconIndex, 	IconAtlas)
SELECT 		'BUILD_MARSH', 			600, 	'IMPROVEMENT_MARSH', 		'TXT_KEY_BUILD_MARSH',			'TXT_KEY_BUILD_MARSH_HELP',			'ENTITY_EVENT_IRRIGATE', 	0,		'KB_M', 	97, 			1, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_MOUND',			800, 	'IMPROVEMENT_MOUND', 		'TXT_KEY_BUILD_MOUND',			'TXT_KEY_BUILD_MOUND_HELP',			'ENTITY_EVENT_BUILD', 		0,		'KB_N', 	1, 				0, 			'UNIT_ACTION_KUNA' UNION ALL
SELECT 		'BUILD_SUNK_COURT', 	1, 		'IMPROVEMENT_SUNK_COURT', 	'TXT_KEY_BUILD_SUNK_COURT', 	'TXT_KEY_BUILD_SUNK_COURT_HELP',	'ENTITY_EVENT_BUILD', 		1,		'KB_S', 	1, 				3, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_BIG_HEAD', 		1, 		'IMPROVEMENT_BIG_HEAD', 	'TXT_KEY_BUILD_BIG_HEAD', 		'TXT_KEY_BUILD_BIG_HEAD_HELP',		'ENTITY_EVENT_BUILD', 		1,		'KB_H', 	1, 				5, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_MONASTERY',		800, 	'IMPROVEMENT_MONASTERY', 	'TXT_KEY_BUILD_MONASTERY',		'TXT_KEY_BUILD_MONASTERY_HELP',		'ENTITY_EVENT_BUILD', 		0,		'KB_O', 	1, 				11, 		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_TOTEM_POLE',		500, 	'IMPROVEMENT_TOTEM_POLE', 	'TXT_KEY_BUILD_TOTEM_POLE',		'TXT_KEY_BUILD_TOTEM_POLE_HELP',	'ENTITY_EVENT_BUILD', 		0,		'KB_T', 	1, 				9, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_CHUM',			300, 	'IMPROVEMENT_CHUM', 		'TXT_KEY_BUILD_CHUM',			'TXT_KEY_BUILD_CHUM_HELP',			'ENTITY_EVENT_BUILD', 		0,		'KB_C', 	1, 				13, 		'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'BUILD_DOGO_CANARIO',	700, 	'IMPROVEMENT_DOGO_CANARIO', 'TXT_KEY_BUILD_DOGO_CANARIO',	'TXT_KEY_BUILD_DOGO_CANARIO_HELP',	'ENTITY_EVENT_BUILD', 		0,		'KB_D', 	1, 				1, 		'UCS_IMPROVEMENT_ATLAS';

INSERT INTO Unit_Builds 
			(UnitType, 			BuildType)
SELECT 		'UNIT_WORKER', 		'BUILD_MARSH' UNION ALL
SELECT 		'UNIT_WORKER', 		'BUILD_MOUND' UNION ALL
SELECT 		'UNIT_MISSIONARY', 	'BUILD_SUNK_COURT' UNION ALL
SELECT 		'UNIT_ENGINEER', 	'BUILD_BIG_HEAD' UNION ALL
SELECT 		'UNIT_SCIENTIST', 	'BUILD_BIG_HEAD' UNION ALL
SELECT 		'UNIT_ARTIST', 		'BUILD_BIG_HEAD' UNION ALL
SELECT 		'UNIT_PROPHET', 	'BUILD_BIG_HEAD' UNION ALL
SELECT 		'UNIT_WORKER', 		'BUILD_MONASTERY' UNION ALL
SELECT 		'UNIT_WORKER', 		'BUILD_TOTEM_POLE' UNION ALL
SELECT 		'UNIT_WORKER', 		'BUILD_CHUM' UNION ALL
SELECT 		'UNIT_WORKER', 		'BUILD_DOGO_CANARIO';

INSERT INTO BuildFeatures 
			(BuildType, 			FeatureType, 		PrereqTech, 			Time, 	Production, 	Remove)
SELECT 		'BUILD_MARSH', 			'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40,			 	1 UNION ALL
SELECT 		'BUILD_MARSH', 			'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_MOUND', 			'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_MOUND', 			'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_MOUND', 			'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1 UNION ALL
SELECT 		'BUILD_SUNK_COURT', 	'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		NULL, 	0, 				1 UNION ALL
SELECT 		'BUILD_SUNK_COURT', 	'FEATURE_FOREST', 	'TECH_MINING', 			NULL, 	0, 				1 UNION ALL
SELECT 		'BUILD_SUNK_COURT', 	'FEATURE_MARSH',	'TECH_MASONRY', 		NULL, 	0, 				1 UNION ALL
SELECT 		'BUILD_MONASTERY', 		'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_MONASTERY', 		'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_MONASTERY', 		'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1 UNION ALL
SELECT 		'BUILD_TOTEM_POLE', 	'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_TOTEM_POLE', 	'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_TOTEM_POLE', 	'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1 UNION ALL
SELECT 		'BUILD_DOGO_CANARIO', 	'FEATURE_JUNGLE', 	'TECH_TRAPPING', 		400, 	40, 			1 UNION ALL
SELECT 		'BUILD_DOGO_CANARIO', 	'FEATURE_FOREST', 	'TECH_MINING', 			300, 	40, 			1 UNION ALL
SELECT 		'BUILD_DOGO_CANARIO', 	'FEATURE_MARSH',	'TECH_MASONRY', 		600, 	0, 				1;
------------------------------
INSERT INTO Improvements 
			(Type, 						Description, 						Civilopedia, 								Help, 										ArtDefineTag, 							PortraitIndex, 	IconAtlas)
SELECT 		'IMPROVEMENT_MARSH', 		'TXT_KEY_IMPROVEMENT_MARSH', 		'TXT_KEY_CIV5_IMPROVEMENTS_MARSH', 			'TXT_KEY_IMPROVEMENT_MARSH_HELP', 			'ART_DEF_IMPROVEMENT_MARSH', 			0, 				'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 		'TXT_KEY_IMPROVEMENT_MOUND', 		'TXT_KEY_CIV5_IMPROVEMENTS_MOUND', 			'TXT_KEY_IMPROVEMENT_MOUND_HELP', 			'ART_DEF_IMPROVEMENT_MOTTE_BAILEY', 	0, 				'TERRAIN_IMPROVEMENT_KUNA' UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'TXT_KEY_IMPROVEMENT_SUNK_COURT', 	'TXT_KEY_CIV5_IMPROVEMENTS_SUNK_COURT', 	'TXT_KEY_IMPROVEMENT_SUNK_COURT_HELP', 		'ART_DEF_IMPROVEMENT_SUNK_COURT', 		2, 				'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'TXT_KEY_IMPROVEMENT_BIG_HEAD', 	'TXT_KEY_CIV5_IMPROVEMENTS_BIG_HEAD', 		'TXT_KEY_IMPROVEMENT_BIG_HEAD_HELP', 		'ART_DEF_IMPROVEMENT_BIG_HEAD', 		4, 				'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 	'TXT_KEY_IMPROVEMENT_MONASTERY', 	'TXT_KEY_CIV5_IMPROVEMENTS_MONASTERY', 		'TXT_KEY_IMPROVEMENT_MONASTERY_HELP', 		'ART_DEF_IMPROVEMENT_MONASTERY', 		10, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 	'TXT_KEY_IMPROVEMENT_TOTEM_POLE', 	'TXT_KEY_CIV5_IMPROVEMENTS_TOTEM_POLE', 	'TXT_KEY_IMPROVEMENT_TOTEM_POLE_HELP', 		'ART_DEF_IMPROVEMENT_TOTEM_POLE', 		8, 				'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 		'TXT_KEY_IMPROVEMENT_CHUM', 		'TXT_KEY_CIV5_IMPROVEMENTS_CHUM', 			'TXT_KEY_IMPROVEMENT_CHUM_HELP', 			'ART_DEF_IMPROVEMENT_CHUM', 			12, 			'UCS_IMPROVEMENT_ATLAS' UNION ALL
SELECT 		'IMPROVEMENT_DOGO_CANARIO', 'TXT_KEY_IMPROVEMENT_DOGO_CANARIO', 'TXT_KEY_CIV5_IMPROVEMENTS_DOGO_CANARIO', 	'TXT_KEY_IMPROVEMENT_DOGO_CANARIO_HELP',	'ART_DEF_IMPROVEMENT_DOGO_CANARIO', 	0, 			'UCS_IMPROVEMENT_ATLAS';

UPDATE Improvements SET Coastal = 1, RemoveWhenComplete = 1, CreatesFeature = 'FEATURE_MARSH' WHERE Type = 'IMPROVEMENT_MARSH';
UPDATE Improvements SET NoTwoAdjacent = 1, DefenseModifier = 15, PillageGold = 17 WHERE Type = 'IMPROVEMENT_MOUND';
UPDATE Improvements SET NoTwoAdjacent = 1, RequiresFlatlands = 1, PillageGold = 15 WHERE Type = 'IMPROVEMENT_SUNK_COURT';
UPDATE Improvements SET PillageGold = 12, CreatedByGreatPerson = 1 WHERE Type = 'IMPROVEMENT_BIG_HEAD';
UPDATE Improvements SET NoTwoAdjacent = 1, HillsMakesValid = 1, PillageGold = 18 WHERE Type = 'IMPROVEMENT_MONASTERY';
UPDATE Improvements SET Coastal = 1, PillageGold = 9 WHERE Type = 'IMPROVEMENT_TOTEM_POLE';
UPDATE Improvements SET NoTwoAdjacent = 1, PillageGold = 15 WHERE Type = 'IMPROVEMENT_CHUM';
UPDATE Improvements SET NoTwoAdjacent = 1, HillsMakesValid = 1 WHERE Type = 'IMPROVEMENT_DOGO_CANARIO';

UPDATE ArtDefine_Landmarks SET Scale = 0.75 WHERE ImprovementType = 'ART_DEF_IMPROVEMENT_MOTTE_BAILEY';
UPDATE Units SET WorkRate = 100 WHERE Type = 'UNIT_MISSIONARY';

INSERT INTO Improvement_ValidTerrains 
			(ImprovementType, 			TerrainType)
SELECT 		'IMPROVEMENT_MARSH', 		'TERRAIN_PLAINS' UNION ALL
SELECT 		'IMPROVEMENT_MARSH', 		'TERRAIN_GRASS' UNION ALL
SELECT 		'IMPROVEMENT_MARSH', 		'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_MARSH', 		'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_MARSH', 		'TERRAIN_SNOW' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 		'TERRAIN_GRASS' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 		'TERRAIN_PLAINS' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 		'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 		'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'TERRAIN_PLAINS' UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'TERRAIN_DESERT' UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'TERRAIN_GRASS' UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 	'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 		'TERRAIN_TUNDRA' UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 		'TERRAIN_SNOW';

INSERT INTO Improvement_ValidFeatures
			(ImprovementType, 			FeatureType)
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'FEATURE_FOREST' UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'FEATURE_JUNGLE';

INSERT INTO Improvement_Yields 
			(ImprovementType, 			YieldType, 			Yield)
SELECT 		'IMPROVEMENT_MARSH', 		'YIELD_FOOD', 		1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 		'YIELD_GOLD', 		1 UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'YIELD_FAITH', 		2 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'YIELD_SCIENCE', 	1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'YIELD_CULTURE', 	2 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 	'YIELD_GOLD', 		1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 	'YIELD_FAITH', 		1 UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 	'YIELD_PRODUCTION', 1 UNION ALL
SELECT 		'IMPROVEMENT_DOGO_CANARIO', 'YIELD_FOOD',		2;

INSERT INTO Improvement_AdjacentImprovementYieldChanges
			(ImprovementType, 			OtherImprovementType, 			YieldType, 				Yield)
SELECT 		'IMPROVEMENT_MOUND', 		'IMPROVEMENT_TRADING_POST',		'YIELD_GOLD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 		'IMPROVEMENT_CUSTOMS_HOUSE',	'YIELD_GOLD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'IMPROVEMENT_FARM',				'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'IMPROVEMENT_MINE',				'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'IMPROVEMENT_QUARRY',			'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 	'IMPROVEMENT_TRADING_POST',		'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 	'IMPROVEMENT_CUSTOMS_HOUSE',	'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 		'IMPROVEMENT_CAMP',				'YIELD_GOLD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 		'IMPROVEMENT_PASTURE',			'YIELD_GOLD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_CAMP', 		'IMPROVEMENT_CHUM',				'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_PASTURE', 		'IMPROVEMENT_CHUM',				'YIELD_PRODUCTION', 	1;

INSERT INTO Improvement_AdjacentResourceYieldChanges
			(ImprovementType, 			ResourceType, 				YieldType, 				Yield)
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'RESOURCE_STONE',			'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'RESOURCE_MARBLE',			'YIELD_PRODUCTION', 	1 UNION ALL
SELECT 		'IMPROVEMENT_PASTURE', 		'RESOURCE_DOGO_CANARIO',	'YIELD_FOOD', 			1 UNION ALL
SELECT 		'IMPROVEMENT_PASTURE', 		'RESOURCE_DOGO_CANARIO',	'YIELD_GOLD', 			1;

INSERT INTO Improvement_AdjacentResourceYieldChanges	(ImprovementType, 	ResourceType, 	YieldType, 		Yield)
SELECT DISTINCT											'IMPROVEMENT_CHUM', Type,			'YIELD_FOOD', 	1
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_BONUS';

INSERT INTO Improvement_AdjacentTerrainYieldChanges
			(ImprovementType, 			TerrainType, 		YieldType, 			Yield)
SELECT 		'IMPROVEMENT_TOTEM_POLE', 	'TERRAIN_COAST',	'YIELD_CULTURE', 	1;

INSERT INTO Improvement_AdjacentCityYields
			(ImprovementType, 			YieldType, 					Yield)
SELECT 		'IMPROVEMENT_MOUND', 		'YIELD_GOLDEN_AGE_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'YIELD_SCIENCE', 			1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'YIELD_GOLDEN_AGE_POINTS', 	1;

INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType, 				ImprovementType, 			YieldType, 			Yield)
SELECT 		'POLICY_NEW_DEAL', 			'IMPROVEMENT_BIG_HEAD', 	'YIELD_CULTURE', 	3 UNION ALL
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_MOUND', 		'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_MOUND', 		'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_MOUND', 		'YIELD_SCIENCE', 	3 UNION ALL
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_SUNK_COURT', 	'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_SUNK_COURT', 	'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_SUNK_COURT', 	'YIELD_SCIENCE', 	3 UNION ALL
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_MONASTERY', 	'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_MONASTERY', 	'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_MONASTERY', 	'YIELD_SCIENCE', 	3 UNION ALL
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_TOTEM_POLE', 	'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_TOTEM_POLE', 	'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_TOTEM_POLE', 	'YIELD_SCIENCE', 	3 UNION ALL
SELECT 		'POLICY_CIVIL_SOCIETY', 	'IMPROVEMENT_CHUM', 		'YIELD_FOOD', 		4 UNION ALL
SELECT 		'POLICY_FIVE_YEAR_PLAN', 	'IMPROVEMENT_CHUM', 		'YIELD_PRODUCTION', 3 UNION ALL
SELECT 		'POLICY_MOBILIZATION', 		'IMPROVEMENT_CHUM', 		'YIELD_SCIENCE', 	3;

INSERT INTO Improvement_AdjacentMountainYieldChanges
			(ImprovementType, 			YieldType, 			Yield)
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'YIELD_SCIENCE', 	1 UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'YIELD_CULTURE', 	1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 	'YIELD_FAITH', 		1;

INSERT INTO Improvement_YieldAdjacentTwoSameType
			(ImprovementType, 			YieldType, 						Yield)
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'YIELD_GOLDEN_AGE_POINTS', 		1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'YIELD_GREAT_ADMIRAL_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 	'YIELD_PRODUCTION', 			2;

INSERT INTO Improvement_TechYieldChanges
			(ImprovementType, 			TechType, 					YieldType, 						Yield)
SELECT 		'IMPROVEMENT_MOUND', 		'TECH_ARCHITECTURE',		'YIELD_SCIENCE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_MOUND', 		'TECH_MILITARY_SCIENCE',	'YIELD_GREAT_GENERAL_POINTS', 	1 UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'TECH_ARCHAEOLOGY',			'YIELD_TOURISM', 				1 UNION ALL
SELECT 		'IMPROVEMENT_SUNK_COURT', 	'TECH_RADAR',				'YIELD_SCIENCE', 				1 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'TECH_MACHINERY',			'YIELD_GOLDEN_AGE_POINTS', 		2 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'TECH_ARCHITECTURE',		'YIELD_SCIENCE', 				3 UNION ALL
SELECT 		'IMPROVEMENT_BIG_HEAD', 	'TECH_SCIENTIFIC_THEORY',	'YIELD_PRODUCTION', 			2 UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 	'TECH_COMPASS',				'YIELD_PRODUCTION', 			1 UNION ALL
SELECT 		'IMPROVEMENT_TOTEM_POLE', 	'TECH_NAVIGATION',			'YIELD_GOLD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 	'TECH_SCIENTIFIC_THEORY',	'YIELD_FAITH', 					1 UNION ALL
SELECT 		'IMPROVEMENT_MONASTERY', 	'TECH_ELECTRICITY',			'YIELD_FAITH', 					1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 		'TECH_EDUCATION',			'YIELD_FOOD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 		'TECH_FERTILIZER',			'YIELD_FOOD', 					1 UNION ALL
SELECT 		'IMPROVEMENT_CHUM', 		'TECH_REFRIGERATION',		'YIELD_PRODUCTION', 			1;

/*INSERT INTO Improvement_ResourceTypes
			(ImprovementType, 		ResourceType, 		ResourceMakesValid, ResourceTrade,	DiscoveryRand,	QuantityRequirement)
SELECT 		'IMPROVEMENT_MOUND', 	'RESOURCE_STONE',	1, 					1,				0,				0;*/

INSERT INTO Improvement_ResourceTypes	(ImprovementType, 		ResourceType, 	ResourceMakesValid, ResourceTrade,	DiscoveryRand,	QuantityRequirement)
SELECT DISTINCT							'IMPROVEMENT_BIG_HEAD', Type,			1,					1,				0,				0
FROM Resources WHERE ResourceUsage = 1;

INSERT INTO Improvement_Flavors 	
			(ImprovementType, 				FlavorType, 			Flavor)
VALUES		('IMPROVEMENT_MARSH',			'FLAVOR_GROWTH',		30),
			('IMPROVEMENT_MARSH',			'FLAVOR_CULTURE',		30),
			('IMPROVEMENT_MARSH',			'FLAVOR_GOLD',			30),
			('IMPROVEMENT_BIG_HEAD',		'FLAVOR_SCIENCE',		100),
			('IMPROVEMENT_BIG_HEAD',		'FLAVOR_PRODUCTION',	90),
			('IMPROVEMENT_BIG_HEAD',		'FLAVOR_CULTURE',		80),
			('IMPROVEMENT_BIG_HEAD',		'FLAVOR_OFFENSE',		30),
			('IMPROVEMENT_MOUND',			'FLAVOR_GOLD',			100),
			('IMPROVEMENT_MOUND',			'FLAVOR_DEFENSE',		30),
			('IMPROVEMENT_MOUND',			'FLAVOR_PRODUCTION',	20),
			('IMPROVEMENT_MOUND',			'FLAVOR_CULTURE',		20),
			('IMPROVEMENT_MOUND',			'FLAVOR_OFFENSE',		10),
			('IMPROVEMENT_MOUND',			'FLAVOR_SCIENCE',		10),
			('IMPROVEMENT_MOUND',			'FLAVOR_RELIGION',		10),
			('IMPROVEMENT_SUNK_COURT',		'FLAVOR_RELIGION',		100),
			('IMPROVEMENT_SUNK_COURT',		'FLAVOR_CULTURE',		80),
			('IMPROVEMENT_SUNK_COURT',		'FLAVOR_SCIENCE',		20),
			('IMPROVEMENT_TOTEM_POLE',		'FLAVOR_PRODUCTION',	80),
			('IMPROVEMENT_TOTEM_POLE',		'FLAVOR_CULTURE',		70),
			('IMPROVEMENT_TOTEM_POLE',		'FLAVOR_GOLD',			20),
			('IMPROVEMENT_TOTEM_POLE',		'FLAVOR_GROWTH',		20),
			('IMPROVEMENT_TOTEM_POLE',		'FLAVOR_NAVAL',			10),
			('IMPROVEMENT_MONASTERY',		'FLAVOR_RELIGION',		100),
			('IMPROVEMENT_MONASTERY',		'FLAVOR_PRODUCTION',	70),
			('IMPROVEMENT_MONASTERY',		'FLAVOR_CULTURE',		10),
			('IMPROVEMENT_MONASTERY',		'FLAVOR_GOLD',			10),
			('IMPROVEMENT_MONASTERY',		'FLAVOR_DIPLOMACY',		10),
			('IMPROVEMENT_CHUM',			'FLAVOR_GROWTH',		100),
			('IMPROVEMENT_CHUM',			'FLAVOR_PRODUCTION',	70),
			('IMPROVEMENT_CHUM',			'FLAVOR_GOLD',			30),
			('IMPROVEMENT_DOGO_CANARIO',	'FLAVOR_GROWTH',		100),
			('IMPROVEMENT_DOGO_CANARIO',	'FLAVOR_PRODUCTION',	70),
			('IMPROVEMENT_DOGO_CANARIO',	'FLAVOR_GOLD',			30),
			('IMPROVEMENT_DOGO_CANARIO',	'FLAVOR_CULTURE',		10),
			('IMPROVEMENT_DOGO_CANARIO',	'FLAVOR_RELIGION',		10);
---------------------------------------------------
-- Definitions - Resources
---------------------------------------------------	
INSERT INTO Resources 
			(Type,						TechReveal,			TechCityTrade, 		Description,						Civilopedia, 							Help,										ResourceClassType, 			IsMonopoly, 	ArtDefineTag, 						CivilizationType,		OnlyMinorCivs,  Happiness,  ResourceUsage,	IconString, 				PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_DOGO_CANARIO',	null,				'TECH_TRAPPING',	'TXT_KEY_RESOURCE_DOGO_CANARIO',	'TXT_KEY_RESOURCE_DOGO_CANARIO_TEXT',	'TXT_KEY_RESOURCE_DOGO_CANARIO_MONOPOLY',	'RESOURCECLASS_LUXURY',		1,				'ART_DEF_RESOURCE_DOGO_CANARIO',	null,					0,				2,			2,				'[ICON_RES_DOGO_CANARIO]',	0, 				'UCS_RESOURCE_ATLAS');
---------------------------------------------------------
INSERT INTO Resource_YieldChanges
			(ResourceType, 				YieldType, 			Yield)
VALUES		('RESOURCE_DOGO_CANARIO',	'YIELD_FOOD',		2);

INSERT INTO Resource_CityYieldModFromMonopoly
			(ResourceType, 				YieldType, 				Yield)
VALUES		('RESOURCE_DOGO_CANARIO',	'YIELD_FOOD',			5),
			('RESOURCE_DOGO_CANARIO',	'YIELD_PRODUCTION',		5);

INSERT INTO Improvement_ResourceTypes
			(ImprovementType,		ResourceType, 				ResourceMakesValid, ResourceTrade)
VALUES		('IMPROVEMENT_CAMP',	'RESOURCE_DOGO_CANARIO',	1,					1);

INSERT INTO Improvement_ResourceType_Yields
			(ImprovementType,		ResourceType, 				YieldType, 				Yield)
VALUES		('IMPROVEMENT_CAMP',	'RESOURCE_DOGO_CANARIO',	'YIELD_FOOD',			1),
			('IMPROVEMENT_CAMP',	'RESOURCE_DOGO_CANARIO',	'YIELD_PRODUCTION',		1);
---------------------------------------------------------
INSERT INTO Resource_Flavors 	
			(ResourceType, 				FlavorType, 			Flavor)
VALUES		('RESOURCE_DOGO_CANARIO',	'FLAVOR_PRODUCTION',	30),
			('RESOURCE_DOGO_CANARIO',	'FLAVOR_GROWTH',		30),
			('RESOURCE_DOGO_CANARIO',	'FLAVOR_CULTURE',		10),
			('RESOURCE_DOGO_CANARIO',	'FLAVOR_RELIGION',		10);
---------------------------------------------------
-- Definitions - Trade Units
---------------------------------------------------	
INSERT INTO UnitClasses
					(Type,				Description, MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
SELECT DISTINCT 	Type||'_OF_DALI',	Description, MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit||'_OF_DALI'
FROM UnitClasses WHERE Type IN ('UNITCLASS_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);

INSERT INTO Units
					(Type,				Class,				FaithCost,	Cost,	AdvancedStartCost,	RequiresFaithPurchaseEnabled, Description, Civilopedia, Strategy, Help, Moves, Immobile, BaseSightRange, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI, MilitarySupport, MilitaryProduction, Mechanized, PrereqTech,			ObsoleteTech, GoodyHutUpgradeUnitClass, MinAreaSize, NukeDamageLevel, CombatLimit, Trade, XPValueAttack, XPValueDefense, NoMaintenance, UnitArtInfo, UnitArtInfoEraVariation, ShowInPedia, MoveRate, UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, MaxHitPoints, PurchaseCooldown, ProductionCostAddedPerEra)
SELECT DISTINCT 	Type||'_OF_DALI',	Class||'_OF_DALI',	200,		-1,		-1,					RequiresFaithPurchaseEnabled, Description, Civilopedia, Strategy, Help, Moves, Immobile, BaseSightRange, CombatClass, Domain, CivilianAttackPriority, DefaultUnitAI, MilitarySupport, MilitaryProduction, Mechanized, PrereqTech||'_DUMMY', ObsoleteTech, GoodyHutUpgradeUnitClass, MinAreaSize, NukeDamageLevel, CombatLimit, Trade, XPValueAttack, XPValueDefense, NoMaintenance, UnitArtInfo, UnitArtInfoEraVariation, ShowInPedia, MoveRate, UnitFlagIconOffset, PortraitIndex, IconAtlas, UnitFlagAtlas, MaxHitPoints, PurchaseCooldown, ProductionCostAddedPerEra
FROM Units WHERE Type IN ('UNIT_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);

INSERT INTO Unit_AITypes
					(UnitType,				UnitAIType)
SELECT DISTINCT 	UnitType||'_OF_DALI',	UnitAIType
FROM Unit_AITypes WHERE UnitType IN ('UNIT_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);

INSERT INTO Unit_Flavors
					(UnitType,				FlavorType,	Flavor)
SELECT DISTINCT 	UnitType||'_OF_DALI',	FlavorType,	Flavor
FROM Unit_Flavors WHERE UnitType IN ('UNIT_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);

INSERT INTO Unit_FreePromotions
					(UnitType,				PromotionType)
SELECT DISTINCT 	UnitType||'_OF_DALI',	PromotionType
FROM Unit_FreePromotions WHERE UnitType IN ('UNIT_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		UnitType||'_OF_DALI', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType IN ('UNIT_CARAVAN'/*, 'UNIT_CARGO_SHIP'*/);
---------------------------------------------------
-- Definitions - Mercenary and Unique Units
---------------------------------------------------	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_SWISS_GUARD', 	'Unit', 	'sv_UnitSwissGuard.dds'),
			('ART_DEF_UNIT_GURKHA', 		'Unit', 	'sv_UnitGurkha.dds');
------------------------------
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_SWISS_GUARD', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PIKEMAN';

INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		'ART_DEF_UNIT_GURKHA', 			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		'ART_DEF_UNIT_SWISS_GUARD', 	'ART_DEF_UNIT_MEMBER_SWISS_GUARD', 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PIKEMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		'ART_DEF_UNIT_GURKHA', 			'ART_DEF_UNIT_MEMBER_GURKHA', 		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_SWISS_GUARD',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		'ART_DEF_UNIT_MEMBER_GURKHA',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_SWISS_GUARD',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_GURKHA',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale,  ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_SWISS_GUARD',	Scale,	ZOffset, Domain, 'reislaufer.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale,  ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		'ART_DEF_UNIT_MEMBER_GURKHA',		Scale,	ZOffset, Domain, 'gurkha.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_SWISS_GUARD', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		'UNIT_GURKHA',			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';
------------------------------
INSERT INTO UnitClasses
					(Type,						Description,				MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
SELECT DISTINCT 	'UNITCLASS_SWISS_GUARD',	'TXT_KEY_UNIT_SWISS_GUARD', MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, 'UNIT_SWISS_GUARD'
FROM UnitClasses WHERE Type = 'UNITCLASS_FCOMPANY';

INSERT INTO UnitClasses
					(Type,						Description,				MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, DefaultUnit)
SELECT DISTINCT 	'UNITCLASS_GURKHA',			'TXT_KEY_UNIT_GURKHA',		MaxGlobalInstances, MaxTeamInstances, MaxPlayerInstances, InstanceCostModifier, 'UNIT_GURKHA'
FROM UnitClasses WHERE Type = 'UNITCLASS_RIFLEMAN';
------------------------------
INSERT INTO Units
					(Type,				Class,						Description,				Civilopedia,						Strategy,								Help,								NoMinorGifts,	UnitEraUpgrade,	Cost,	FaithCost,	Combat,	Moves,	BaseSightRange, PurchaseOnly,	MoveAfterPurchase,	Class,						CombatClass, Domain, DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, PrereqTech,		ObsoleteTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize, NukeDamageLevel,	CombatLimit, XPValueAttack, XPValueDefense, Conscription,	NoMaintenance, UnitArtInfo,					UnitArtInfoEraVariation, ShowInPedia, MoveRate, UnitFlagIconOffset, PortraitIndex,	IconAtlas,			UnitFlagAtlas,			MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown)
SELECT DISTINCT 	'UNIT_SWISS_GUARD',	'UNITCLASS_SWISS_GUARD',	'TXT_KEY_UNIT_SWISS_GUARD',	'TXT_KEY_CIV5_UNIT_SWISS_GUARD',	'TXT_KEY_UNIT_SWISS_GUARD_STRATEGY',	'TXT_KEY_UNIT_SWISS_GUARD_HELP',	1,				1,				220,	500,		28,		Moves,	BaseSightRange, PurchaseOnly,	MoveAfterPurchase,	'UNITCLASS_SWISS_GUARD',	CombatClass, Domain, 'UNITAI_DEFENSE',	MilitarySupport, MilitaryProduction, Pillage, Mechanized, 'TECH_BANKING',	NULL,			NULL,						-1,					MinAreaSize, NukeDamageLevel,	CombatLimit, XPValueAttack,	XPValueDefense, 4,				NoMaintenance, 'ART_DEF_UNIT_SWISS_GUARD',	UnitArtInfoEraVariation, ShowInPedia, MoveRate, 0,					0,				'UCS_UNIT_ATLAS',	'UCS_UNIT_FLAG_ATLAS',	MaxHitPoints, 1,					PurchaseCooldown
FROM Units WHERE Type = 'UNIT_FCOMPANY';

INSERT INTO Units
					(Type,				Class,						Description,				Civilopedia,						Strategy,								Help,								NoMinorGifts,	Cost,	FaithCost,	Combat,	Moves,	BaseSightRange, PurchaseOnly,	MoveAfterPurchase,	RequiresFaithPurchaseEnabled,	Class,				CombatClass, Domain, DefaultUnitAI,		MilitarySupport, MilitaryProduction, Pillage, Mechanized, IgnoreBuildingDefense,	PrereqTech,			ObsoleteTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize, NukeDamageLevel,	CombatLimit, XPValueAttack, XPValueDefense, Conscription,	NoMaintenance, UnitArtInfo,				UnitArtInfoEraVariation, ShowInPedia, MoveRate, UnitFlagIconOffset, PortraitIndex,	IconAtlas,			UnitFlagAtlas,			MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown)
SELECT DISTINCT 	'UNIT_GURKHA',		'UNITCLASS_GURKHA',			'TXT_KEY_UNIT_GURKHA',		'TXT_KEY_CIV5_UNIT_GURKHA',			'TXT_KEY_UNIT_GURKHA_STRATEGY',			'TXT_KEY_UNIT_GURKHA_HELP',			1,				575,	NULL,		42,		Moves,	BaseSightRange, 1,				1,					0,								'UNITCLASS_GURKHA',	CombatClass, Domain, 'UNITAI_DEFENSE',	MilitarySupport, MilitaryProduction, Pillage, Mechanized, IgnoreBuildingDefense,	'TECH_METALLURGY',	ObsoleteTech,	GoodyHutUpgradeUnitClass,	-1,					MinAreaSize, NukeDamageLevel,	CombatLimit, XPValueAttack,	XPValueDefense, Conscription,	NoMaintenance, 'ART_DEF_UNIT_GURKHA',	UnitArtInfoEraVariation, ShowInPedia, MoveRate, 1,					1,				'UCS_UNIT_ATLAS',	'UCS_UNIT_FLAG_ATLAS',	MaxHitPoints, BaseLandAirDefense,	PurchaseCooldown
FROM Units WHERE Type = 'UNIT_RIFLEMAN';
------------------------------
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_SWISS_GUARD', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SPANISH_TERCIO';

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		'UNIT_GURKHA', 			UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';
------------------------------
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		'UNIT_SWISS_GUARD', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SPANISH_TERCIO';

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		'UNIT_GURKHA', 			FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_Flavors 
			(UnitType, 				FlavorType, 		Flavor)
VALUES		('UNIT_SWISS_GUARD', 	'FLAVOR_CULTURE', 	3),
			('UNIT_SWISS_GUARD', 	'FLAVOR_RELIGION', 	3);
------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_SWISS_GUARD', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SPANISH_TERCIO';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		'UNIT_GURKHA', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_SWISS_GUARD', 	'PROMOTION_GUARDIA_SVIZZERA'),
			('UNIT_SWISS_GUARD', 	'PROMOTION_KATZBALGER'),
			('UNIT_GURKHA', 		'PROMOTION_HEAVY_CHARGE'),
			('UNIT_GURKHA', 		'PROMOTION_GAIN_EXPERIENCE');
------------------------------
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		'UNIT_GURKHA', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';
------------------------------
INSERT INTO Unit_EraCombatStrength
			(UnitType, 				EraType,			CombatStrength)
VALUES		('UNIT_SWISS_GUARD', 	'ERA_RENAISSANCE',	28), -- +3 from Tercio (25)
			('UNIT_SWISS_GUARD', 	'ERA_INDUSTRIAL',	37), -- -1 from Fusilier (38)
			('UNIT_SWISS_GUARD', 	'ERA_MODERN',		45), -- -5 from Rifleman (50)
			('UNIT_SWISS_GUARD', 	'ERA_POSTMODERN',	53), -- -9 from Great War Infantry (62)
			('UNIT_SWISS_GUARD', 	'ERA_FUTURE',		67); -- -13 from Infantry (80)
--==========================================================================================================================
-- COMPATIBLITY
--==========================================================================================================================
-- POTALA PALACE - More Wonders
UPDATE Language_en_US
SET Text = '[COLOR_YIELD_FOOD]Potala Palace[ENDCOLOR] depends strongly on alliance with [COLOR_CYAN]Lhasa[ENDCOLOR] (+10%[ICON_FOOD]; +10%[ICON_CULTURE]; halved when not allied with [COLOR_CYAN]Lhasa[ENDCOLOR]). Ties bonds between these two countries ([COLOR_YIELD_GOLD]Sphere of Influence[ENDCOLOR] over [COLOR_CYAN]Lhasa[ENDCOLOR]) using special diplomatic techniques (+1[ICON_DIPLOMAT] League Vote).'
WHERE Tag = 'TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-HELP' AND Value= 1) AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);

UPDATE Language_en_US SET Text = REPLACE(Text, 'Requires and alliance with [COLOR_POSITIVE_TEXT]Lhasa[ENDCOLOR] and an active session of the [COLOR_POSITIVE_TEXT]World Congress[ENDCOLOR]. ', '') WHERE Tag ='TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='MW-SETTING-HELP' AND Value= 0) AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);

INSERT INTO Language_en_US 
			(Tag,										Text) 
SELECT		'TXT_KEY_BUILDING_LHASA_HELP_CUT',			Text
FROM Language_en_US WHERE Tag = 'TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);
				
UPDATE Language_en_US SET Text = 'Special: [COLOR_CYAN]Lhasa CS Ally[ENDCOLOR] and an [COLOR_CYAN]active session of WC[ENDCOLOR].[NEWLINE][NEWLINE]'||Text WHERE Tag ='TXT_KEY_BUILDING_LHASA_HELP' AND EXISTS (SELECT * FROM Community WHERE Type='UCS-MW' AND Value= 1);
--============================================--
-- VP FIXES (copy from MW)
--============================================--
-- additional combat classes for promotions
INSERT OR REPLACE INTO Language_en_US 
			(Tag,										Text) 
VALUES		('TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE',		'Great People'),
			('TXT_KEY_UNITCOMBAT_SPACESHIP_PART',		'Space Parts'),
			('TXT_KEY_UNITCOMBAT_MISSILE',				'Missiles'),
			('TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST',		'Archaeologists');

INSERT OR REPLACE INTO UnitCombatInfos 
			(Type,							Description) 
VALUES		('UNITCOMBAT_SPECIAL_PEOPLE',	'TXT_KEY_UNITCOMBAT_SPECIAL_PEOPLE'),
			('UNITCOMBAT_SPACESHIP_PART',	'TXT_KEY_UNITCOMBAT_SPACESHIP_PART'),
			('UNITCOMBAT_MISSILE',			'TXT_KEY_UNITCOMBAT_MISSILE'),
			('UNITCOMBAT_ARCHAEOLOGIST',	'TXT_KEY_UNITCOMBAT_ARCHAEOLOGIST');

UPDATE Units SET CombatClass = 'UNITCOMBAT_ARCHAEOLOGIST'	WHERE Type ='UNIT_ARCHAEOLOGIST';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SIEGE'			WHERE Type ='UNIT_ASSYRIAN_SIEGE_TOWER';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SPECIAL_PEOPLE'	WHERE Special ='SPECIALUNIT_PEOPLE';
UPDATE Units SET CombatClass = 'UNITCOMBAT_MISSILE'			WHERE Special ='SPECIALUNIT_MISSILE';
UPDATE Units SET CombatClass = 'UNITCOMBAT_MISSILE'			WHERE Type ='UNIT_ATOMIC_BOMB';
UPDATE Units SET CombatClass = 'UNITCOMBAT_SPACESHIP_PART' WHERE DefaultUnitAI ='UNITAI_SPACESHIP_PART';
---------------------------------------------------
