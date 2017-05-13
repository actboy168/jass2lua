--============================================================================
-- Native types. All native functions take extended handle types when
-- possible to help prevent passing bad values to native functions
--
-- all reference counted objects
-- a reference to an event registration
-- a single player reference
-- an interactive game object with life
-- a single unit reference

























































































ConvertRace = _native_'ConvertRace'
ConvertAllianceType = _native_'ConvertAllianceType'
ConvertRacePref = _native_'ConvertRacePref'
ConvertIGameState = _native_'ConvertIGameState'
ConvertFGameState = _native_'ConvertFGameState'
ConvertPlayerState = _native_'ConvertPlayerState'
ConvertPlayerScore = _native_'ConvertPlayerScore'
ConvertPlayerGameResult = _native_'ConvertPlayerGameResult'
ConvertUnitState = _native_'ConvertUnitState'
ConvertAIDifficulty = _native_'ConvertAIDifficulty'
ConvertGameEvent = _native_'ConvertGameEvent'
ConvertPlayerEvent = _native_'ConvertPlayerEvent'
ConvertPlayerUnitEvent = _native_'ConvertPlayerUnitEvent'
ConvertWidgetEvent = _native_'ConvertWidgetEvent'
ConvertDialogEvent = _native_'ConvertDialogEvent'
ConvertUnitEvent = _native_'ConvertUnitEvent'
ConvertLimitOp = _native_'ConvertLimitOp'
ConvertUnitType = _native_'ConvertUnitType'
ConvertGameSpeed = _native_'ConvertGameSpeed'
ConvertPlacement = _native_'ConvertPlacement'
ConvertStartLocPrio = _native_'ConvertStartLocPrio'
ConvertGameDifficulty = _native_'ConvertGameDifficulty'
ConvertGameType = _native_'ConvertGameType'
ConvertMapFlag = _native_'ConvertMapFlag'
ConvertMapVisibility = _native_'ConvertMapVisibility'
ConvertMapSetting = _native_'ConvertMapSetting'
ConvertMapDensity = _native_'ConvertMapDensity'
ConvertMapControl = _native_'ConvertMapControl'
ConvertPlayerColor = _native_'ConvertPlayerColor'
ConvertPlayerSlotState = _native_'ConvertPlayerSlotState'
ConvertVolumeGroup = _native_'ConvertVolumeGroup'
ConvertCameraField = _native_'ConvertCameraField'
ConvertBlendMode = _native_'ConvertBlendMode'
ConvertRarityControl = _native_'ConvertRarityControl'
ConvertTexMapFlags = _native_'ConvertTexMapFlags'
ConvertFogState = _native_'ConvertFogState'
ConvertEffectType = _native_'ConvertEffectType'
ConvertVersion = _native_'ConvertVersion'
ConvertItemType = _native_'ConvertItemType'
ConvertAttackType = _native_'ConvertAttackType'
ConvertDamageType = _native_'ConvertDamageType'
ConvertWeaponType = _native_'ConvertWeaponType'
ConvertSoundType = _native_'ConvertSoundType'
ConvertPathingType = _native_'ConvertPathingType'

OrderId = _native_'OrderId'
OrderId2String = _native_'OrderId2String'
UnitId = _native_'UnitId'
UnitId2String = _native_'UnitId2String'

-- Not currently working correctly...
AbilityId = _native_'AbilityId'
AbilityId2String = _native_'AbilityId2String'

-- Looks up the "name" field for any object (unit, item, ability)
GetObjectName = _native_'GetObjectName'



--===================================================
-- Game Constants    
--===================================================

-- pfff
FALSE = false
TRUE = true
JASS_MAX_ARRAY_SIZE = 8192

PLAYER_NEUTRAL_PASSIVE = 15
PLAYER_NEUTRAL_AGGRESSIVE = 12

PLAYER_COLOR_RED = ConvertPlayerColor(0)
PLAYER_COLOR_BLUE = ConvertPlayerColor(1)
PLAYER_COLOR_CYAN = ConvertPlayerColor(2)
PLAYER_COLOR_PURPLE = ConvertPlayerColor(3)
PLAYER_COLOR_YELLOW = ConvertPlayerColor(4)
PLAYER_COLOR_ORANGE = ConvertPlayerColor(5)
PLAYER_COLOR_GREEN = ConvertPlayerColor(6)
PLAYER_COLOR_PINK = ConvertPlayerColor(7)
PLAYER_COLOR_LIGHT_GRAY = ConvertPlayerColor(8)
PLAYER_COLOR_LIGHT_BLUE = ConvertPlayerColor(9)
PLAYER_COLOR_AQUA = ConvertPlayerColor(10)
PLAYER_COLOR_BROWN = ConvertPlayerColor(11)

RACE_HUMAN = ConvertRace(1)
RACE_ORC = ConvertRace(2)
RACE_UNDEAD = ConvertRace(3)
RACE_NIGHTELF = ConvertRace(4)
RACE_DEMON = ConvertRace(5)
RACE_OTHER = ConvertRace(7)

PLAYER_GAME_RESULT_VICTORY = ConvertPlayerGameResult(0)
PLAYER_GAME_RESULT_DEFEAT = ConvertPlayerGameResult(1)
PLAYER_GAME_RESULT_TIE = ConvertPlayerGameResult(2)
PLAYER_GAME_RESULT_NEUTRAL = ConvertPlayerGameResult(3)

ALLIANCE_PASSIVE = ConvertAllianceType(0)
ALLIANCE_HELP_REQUEST = ConvertAllianceType(1)
ALLIANCE_HELP_RESPONSE = ConvertAllianceType(2)
ALLIANCE_SHARED_XP = ConvertAllianceType(3)
ALLIANCE_SHARED_SPELLS = ConvertAllianceType(4)
ALLIANCE_SHARED_VISION = ConvertAllianceType(5)
ALLIANCE_SHARED_CONTROL = ConvertAllianceType(6)
ALLIANCE_SHARED_ADVANCED_CONTROL = ConvertAllianceType(7)
ALLIANCE_RESCUABLE = ConvertAllianceType(8)
ALLIANCE_SHARED_VISION_FORCED = ConvertAllianceType(9)

VERSION_REIGN_OF_CHAOS = ConvertVersion(0)
VERSION_FROZEN_THRONE = ConvertVersion(1)

ATTACK_TYPE_NORMAL = ConvertAttackType(0)
ATTACK_TYPE_MELEE = ConvertAttackType(1)
ATTACK_TYPE_PIERCE = ConvertAttackType(2)
ATTACK_TYPE_SIEGE = ConvertAttackType(3)
ATTACK_TYPE_MAGIC = ConvertAttackType(4)
ATTACK_TYPE_CHAOS = ConvertAttackType(5)
ATTACK_TYPE_HERO = ConvertAttackType(6)

DAMAGE_TYPE_UNKNOWN = ConvertDamageType(0)
DAMAGE_TYPE_NORMAL = ConvertDamageType(4)
DAMAGE_TYPE_ENHANCED = ConvertDamageType(5)
DAMAGE_TYPE_FIRE = ConvertDamageType(8)
DAMAGE_TYPE_COLD = ConvertDamageType(9)
DAMAGE_TYPE_LIGHTNING = ConvertDamageType(10)
DAMAGE_TYPE_POISON = ConvertDamageType(11)
DAMAGE_TYPE_DISEASE = ConvertDamageType(12)
DAMAGE_TYPE_DIVINE = ConvertDamageType(13)
DAMAGE_TYPE_MAGIC = ConvertDamageType(14)
DAMAGE_TYPE_SONIC = ConvertDamageType(15)
DAMAGE_TYPE_ACID = ConvertDamageType(16)
DAMAGE_TYPE_FORCE = ConvertDamageType(17)
DAMAGE_TYPE_DEATH = ConvertDamageType(18)
DAMAGE_TYPE_MIND = ConvertDamageType(19)
DAMAGE_TYPE_PLANT = ConvertDamageType(20)
DAMAGE_TYPE_DEFENSIVE = ConvertDamageType(21)
DAMAGE_TYPE_DEMOLITION = ConvertDamageType(22)
DAMAGE_TYPE_SLOW_POISON = ConvertDamageType(23)
DAMAGE_TYPE_SPIRIT_LINK = ConvertDamageType(24)
DAMAGE_TYPE_SHADOW_STRIKE = ConvertDamageType(25)
DAMAGE_TYPE_UNIVERSAL = ConvertDamageType(26)

WEAPON_TYPE_WHOKNOWS = ConvertWeaponType(0)
WEAPON_TYPE_METAL_LIGHT_CHOP = ConvertWeaponType(1)
WEAPON_TYPE_METAL_MEDIUM_CHOP = ConvertWeaponType(2)
WEAPON_TYPE_METAL_HEAVY_CHOP = ConvertWeaponType(3)
WEAPON_TYPE_METAL_LIGHT_SLICE = ConvertWeaponType(4)
WEAPON_TYPE_METAL_MEDIUM_SLICE = ConvertWeaponType(5)
WEAPON_TYPE_METAL_HEAVY_SLICE = ConvertWeaponType(6)
WEAPON_TYPE_METAL_MEDIUM_BASH = ConvertWeaponType(7)
WEAPON_TYPE_METAL_HEAVY_BASH = ConvertWeaponType(8)
WEAPON_TYPE_METAL_MEDIUM_STAB = ConvertWeaponType(9)
WEAPON_TYPE_METAL_HEAVY_STAB = ConvertWeaponType(10)
WEAPON_TYPE_WOOD_LIGHT_SLICE = ConvertWeaponType(11)
WEAPON_TYPE_WOOD_MEDIUM_SLICE = ConvertWeaponType(12)
WEAPON_TYPE_WOOD_HEAVY_SLICE = ConvertWeaponType(13)
WEAPON_TYPE_WOOD_LIGHT_BASH = ConvertWeaponType(14)
WEAPON_TYPE_WOOD_MEDIUM_BASH = ConvertWeaponType(15)
WEAPON_TYPE_WOOD_HEAVY_BASH = ConvertWeaponType(16)
WEAPON_TYPE_WOOD_LIGHT_STAB = ConvertWeaponType(17)
WEAPON_TYPE_WOOD_MEDIUM_STAB = ConvertWeaponType(18)
WEAPON_TYPE_CLAW_LIGHT_SLICE = ConvertWeaponType(19)
WEAPON_TYPE_CLAW_MEDIUM_SLICE = ConvertWeaponType(20)
WEAPON_TYPE_CLAW_HEAVY_SLICE = ConvertWeaponType(21)
WEAPON_TYPE_AXE_MEDIUM_CHOP = ConvertWeaponType(22)
WEAPON_TYPE_ROCK_HEAVY_BASH = ConvertWeaponType(23)

PATHING_TYPE_ANY = ConvertPathingType(0)
PATHING_TYPE_WALKABILITY = ConvertPathingType(1)
PATHING_TYPE_FLYABILITY = ConvertPathingType(2)
PATHING_TYPE_BUILDABILITY = ConvertPathingType(3)
PATHING_TYPE_PEONHARVESTPATHING = ConvertPathingType(4)
PATHING_TYPE_BLIGHTPATHING = ConvertPathingType(5)
PATHING_TYPE_FLOATABILITY = ConvertPathingType(6)
PATHING_TYPE_AMPHIBIOUSPATHING = ConvertPathingType(7)

--===================================================
-- Map Setup Constants    
--===================================================

RACE_PREF_HUMAN = ConvertRacePref(1)
RACE_PREF_ORC = ConvertRacePref(2)
RACE_PREF_NIGHTELF = ConvertRacePref(4)
RACE_PREF_UNDEAD = ConvertRacePref(8)
RACE_PREF_DEMON = ConvertRacePref(16)
RACE_PREF_RANDOM = ConvertRacePref(32)
RACE_PREF_USER_SELECTABLE = ConvertRacePref(64)

MAP_CONTROL_USER = ConvertMapControl(0)
MAP_CONTROL_COMPUTER = ConvertMapControl(1)
MAP_CONTROL_RESCUABLE = ConvertMapControl(2)
MAP_CONTROL_NEUTRAL = ConvertMapControl(3)
MAP_CONTROL_CREEP = ConvertMapControl(4)
MAP_CONTROL_NONE = ConvertMapControl(5)

GAME_TYPE_MELEE = ConvertGameType(1)
GAME_TYPE_FFA = ConvertGameType(2)
GAME_TYPE_USE_MAP_SETTINGS = ConvertGameType(4)
GAME_TYPE_BLIZ = ConvertGameType(8)
GAME_TYPE_ONE_ON_ONE = ConvertGameType(16)
GAME_TYPE_TWO_TEAM_PLAY = ConvertGameType(32)
GAME_TYPE_THREE_TEAM_PLAY = ConvertGameType(64)
GAME_TYPE_FOUR_TEAM_PLAY = ConvertGameType(128)

MAP_FOG_HIDE_TERRAIN = ConvertMapFlag(1)
MAP_FOG_MAP_EXPLORED = ConvertMapFlag(2)
MAP_FOG_ALWAYS_VISIBLE = ConvertMapFlag(4)

MAP_USE_HANDICAPS = ConvertMapFlag(8)
MAP_OBSERVERS = ConvertMapFlag(16)
MAP_OBSERVERS_ON_DEATH = ConvertMapFlag(32)

MAP_FIXED_COLORS = ConvertMapFlag(128)

MAP_LOCK_RESOURCE_TRADING = ConvertMapFlag(256)
MAP_RESOURCE_TRADING_ALLIES_ONLY = ConvertMapFlag(512)

MAP_LOCK_ALLIANCE_CHANGES = ConvertMapFlag(1024)
MAP_ALLIANCE_CHANGES_HIDDEN = ConvertMapFlag(2048)

MAP_CHEATS = ConvertMapFlag(4096)
MAP_CHEATS_HIDDEN = ConvertMapFlag(8192)

MAP_LOCK_SPEED = ConvertMapFlag(8192 * 2)
MAP_LOCK_RANDOM_SEED = ConvertMapFlag(8192 * 4)
MAP_SHARED_ADVANCED_CONTROL = ConvertMapFlag(8192 * 8)
MAP_RANDOM_HERO = ConvertMapFlag(8192 * 16)
MAP_RANDOM_RACES = ConvertMapFlag(8192 * 32)
MAP_RELOADED = ConvertMapFlag(8192 * 64)

MAP_PLACEMENT_RANDOM = ConvertPlacement(0) -- random among all slots
MAP_PLACEMENT_FIXED = ConvertPlacement(1) -- player 0 in start loc 0...
MAP_PLACEMENT_USE_MAP_SETTINGS = ConvertPlacement(2) -- whatever was specified by the script
MAP_PLACEMENT_TEAMS_TOGETHER = ConvertPlacement(3) -- random with allies next to each other    

MAP_LOC_PRIO_LOW = ConvertStartLocPrio(0)
MAP_LOC_PRIO_HIGH = ConvertStartLocPrio(1)
MAP_LOC_PRIO_NOT = ConvertStartLocPrio(2)

MAP_DENSITY_NONE = ConvertMapDensity(0)
MAP_DENSITY_LIGHT = ConvertMapDensity(1)
MAP_DENSITY_MEDIUM = ConvertMapDensity(2)
MAP_DENSITY_HEAVY = ConvertMapDensity(3)

MAP_DIFFICULTY_EASY = ConvertGameDifficulty(0)
MAP_DIFFICULTY_NORMAL = ConvertGameDifficulty(1)
MAP_DIFFICULTY_HARD = ConvertGameDifficulty(2)
MAP_DIFFICULTY_INSANE = ConvertGameDifficulty(3)

MAP_SPEED_SLOWEST = ConvertGameSpeed(0)
MAP_SPEED_SLOW = ConvertGameSpeed(1)
MAP_SPEED_NORMAL = ConvertGameSpeed(2)
MAP_SPEED_FAST = ConvertGameSpeed(3)
MAP_SPEED_FASTEST = ConvertGameSpeed(4)

PLAYER_SLOT_STATE_EMPTY = ConvertPlayerSlotState(0)
PLAYER_SLOT_STATE_PLAYING = ConvertPlayerSlotState(1)
PLAYER_SLOT_STATE_LEFT = ConvertPlayerSlotState(2)

--===================================================
-- Sound Constants
--===================================================
SOUND_VOLUMEGROUP_UNITMOVEMENT = ConvertVolumeGroup(0)
SOUND_VOLUMEGROUP_UNITSOUNDS = ConvertVolumeGroup(1)
SOUND_VOLUMEGROUP_COMBAT = ConvertVolumeGroup(2)
SOUND_VOLUMEGROUP_SPELLS = ConvertVolumeGroup(3)
SOUND_VOLUMEGROUP_UI = ConvertVolumeGroup(4)
SOUND_VOLUMEGROUP_MUSIC = ConvertVolumeGroup(5)
SOUND_VOLUMEGROUP_AMBIENTSOUNDS = ConvertVolumeGroup(6)
SOUND_VOLUMEGROUP_FIRE = ConvertVolumeGroup(7)


--===================================================
-- Game, Player, and Unit States
--
-- For use with TriggerRegister<X>StateEvent
--
--===================================================

GAME_STATE_DIVINE_INTERVENTION = ConvertIGameState(0)
GAME_STATE_DISCONNECTED = ConvertIGameState(1)
GAME_STATE_TIME_OF_DAY = ConvertFGameState(2)

PLAYER_STATE_GAME_RESULT = ConvertPlayerState(0)

-- current resource levels
--
PLAYER_STATE_RESOURCE_GOLD = ConvertPlayerState(1)
PLAYER_STATE_RESOURCE_LUMBER = ConvertPlayerState(2)
PLAYER_STATE_RESOURCE_HERO_TOKENS = ConvertPlayerState(3)
PLAYER_STATE_RESOURCE_FOOD_CAP = ConvertPlayerState(4)
PLAYER_STATE_RESOURCE_FOOD_USED = ConvertPlayerState(5)
PLAYER_STATE_FOOD_CAP_CEILING = ConvertPlayerState(6)

PLAYER_STATE_GIVES_BOUNTY = ConvertPlayerState(7)
PLAYER_STATE_ALLIED_VICTORY = ConvertPlayerState(8)
PLAYER_STATE_PLACED = ConvertPlayerState(9)
PLAYER_STATE_OBSERVER_ON_DEATH = ConvertPlayerState(10)
PLAYER_STATE_OBSERVER = ConvertPlayerState(11)
PLAYER_STATE_UNFOLLOWABLE = ConvertPlayerState(12)

-- taxation rate for each resource
--
PLAYER_STATE_GOLD_UPKEEP_RATE = ConvertPlayerState(13)
PLAYER_STATE_LUMBER_UPKEEP_RATE = ConvertPlayerState(14)

-- cumulative resources collected by the player during the mission
--
PLAYER_STATE_GOLD_GATHERED = ConvertPlayerState(15)
PLAYER_STATE_LUMBER_GATHERED = ConvertPlayerState(16)

PLAYER_STATE_NO_CREEP_SLEEP = ConvertPlayerState(25)

UNIT_STATE_LIFE = ConvertUnitState(0)
UNIT_STATE_MAX_LIFE = ConvertUnitState(1)
UNIT_STATE_MANA = ConvertUnitState(2)
UNIT_STATE_MAX_MANA = ConvertUnitState(3)

AI_DIFFICULTY_NEWBIE = ConvertAIDifficulty(0)
AI_DIFFICULTY_NORMAL = ConvertAIDifficulty(1)
AI_DIFFICULTY_INSANE = ConvertAIDifficulty(2)

-- player score values
PLAYER_SCORE_UNITS_TRAINED = ConvertPlayerScore(0)
PLAYER_SCORE_UNITS_KILLED = ConvertPlayerScore(1)
PLAYER_SCORE_STRUCT_BUILT = ConvertPlayerScore(2)
PLAYER_SCORE_STRUCT_RAZED = ConvertPlayerScore(3)
PLAYER_SCORE_TECH_PERCENT = ConvertPlayerScore(4)
PLAYER_SCORE_FOOD_MAXPROD = ConvertPlayerScore(5)
PLAYER_SCORE_FOOD_MAXUSED = ConvertPlayerScore(6)
PLAYER_SCORE_HEROES_KILLED = ConvertPlayerScore(7)
PLAYER_SCORE_ITEMS_GAINED = ConvertPlayerScore(8)
PLAYER_SCORE_MERCS_HIRED = ConvertPlayerScore(9)
PLAYER_SCORE_GOLD_MINED_TOTAL = ConvertPlayerScore(10)
PLAYER_SCORE_GOLD_MINED_UPKEEP = ConvertPlayerScore(11)
PLAYER_SCORE_GOLD_LOST_UPKEEP = ConvertPlayerScore(12)
PLAYER_SCORE_GOLD_LOST_TAX = ConvertPlayerScore(13)
PLAYER_SCORE_GOLD_GIVEN = ConvertPlayerScore(14)
PLAYER_SCORE_GOLD_RECEIVED = ConvertPlayerScore(15)
PLAYER_SCORE_LUMBER_TOTAL = ConvertPlayerScore(16)
PLAYER_SCORE_LUMBER_LOST_UPKEEP = ConvertPlayerScore(17)
PLAYER_SCORE_LUMBER_LOST_TAX = ConvertPlayerScore(18)
PLAYER_SCORE_LUMBER_GIVEN = ConvertPlayerScore(19)
PLAYER_SCORE_LUMBER_RECEIVED = ConvertPlayerScore(20)
PLAYER_SCORE_UNIT_TOTAL = ConvertPlayerScore(21)
PLAYER_SCORE_HERO_TOTAL = ConvertPlayerScore(22)
PLAYER_SCORE_RESOURCE_TOTAL = ConvertPlayerScore(23)
PLAYER_SCORE_TOTAL = ConvertPlayerScore(24)

--===================================================
-- Game, Player and Unit Events
--
--  When an event causes a trigger to fire these
--  values allow the action code to determine which
--  event was dispatched and therefore which set of
--  native functions should be used to get information
--  about the event.
--
-- Do NOT change the order or value of these constants
-- without insuring that the JASS_GAME_EVENTS_WAR3 enum
-- is changed to match.
--
--===================================================

--===================================================
-- For use with TriggerRegisterGameEvent    
--===================================================    

EVENT_GAME_VICTORY = ConvertGameEvent(0)
EVENT_GAME_END_LEVEL = ConvertGameEvent(1)

EVENT_GAME_VARIABLE_LIMIT = ConvertGameEvent(2)
EVENT_GAME_STATE_LIMIT = ConvertGameEvent(3)

EVENT_GAME_TIMER_EXPIRED = ConvertGameEvent(4)

EVENT_GAME_ENTER_REGION = ConvertGameEvent(5)
EVENT_GAME_LEAVE_REGION = ConvertGameEvent(6)

EVENT_GAME_TRACKABLE_HIT = ConvertGameEvent(7)
EVENT_GAME_TRACKABLE_TRACK = ConvertGameEvent(8)

EVENT_GAME_SHOW_SKILL = ConvertGameEvent(9)
EVENT_GAME_BUILD_SUBMENU = ConvertGameEvent(10)

--===================================================
-- For use with TriggerRegisterPlayerEvent
--===================================================
EVENT_PLAYER_STATE_LIMIT = ConvertPlayerEvent(11)
EVENT_PLAYER_ALLIANCE_CHANGED = ConvertPlayerEvent(12)

EVENT_PLAYER_DEFEAT = ConvertPlayerEvent(13)
EVENT_PLAYER_VICTORY = ConvertPlayerEvent(14)
EVENT_PLAYER_LEAVE = ConvertPlayerEvent(15)
EVENT_PLAYER_CHAT = ConvertPlayerEvent(16)
EVENT_PLAYER_END_CINEMATIC = ConvertPlayerEvent(17)

--===================================================
-- For use with TriggerRegisterPlayerUnitEvent
--===================================================

EVENT_PLAYER_UNIT_ATTACKED = ConvertPlayerUnitEvent(18)
EVENT_PLAYER_UNIT_RESCUED = ConvertPlayerUnitEvent(19)

EVENT_PLAYER_UNIT_DEATH = ConvertPlayerUnitEvent(20)
EVENT_PLAYER_UNIT_DECAY = ConvertPlayerUnitEvent(21)

EVENT_PLAYER_UNIT_DETECTED = ConvertPlayerUnitEvent(22)
EVENT_PLAYER_UNIT_HIDDEN = ConvertPlayerUnitEvent(23)

EVENT_PLAYER_UNIT_SELECTED = ConvertPlayerUnitEvent(24)
EVENT_PLAYER_UNIT_DESELECTED = ConvertPlayerUnitEvent(25)

EVENT_PLAYER_UNIT_CONSTRUCT_START = ConvertPlayerUnitEvent(26)
EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL = ConvertPlayerUnitEvent(27)
EVENT_PLAYER_UNIT_CONSTRUCT_FINISH = ConvertPlayerUnitEvent(28)

EVENT_PLAYER_UNIT_UPGRADE_START = ConvertPlayerUnitEvent(29)
EVENT_PLAYER_UNIT_UPGRADE_CANCEL = ConvertPlayerUnitEvent(30)
EVENT_PLAYER_UNIT_UPGRADE_FINISH = ConvertPlayerUnitEvent(31)

EVENT_PLAYER_UNIT_TRAIN_START = ConvertPlayerUnitEvent(32)
EVENT_PLAYER_UNIT_TRAIN_CANCEL = ConvertPlayerUnitEvent(33)
EVENT_PLAYER_UNIT_TRAIN_FINISH = ConvertPlayerUnitEvent(34)

EVENT_PLAYER_UNIT_RESEARCH_START = ConvertPlayerUnitEvent(35)
EVENT_PLAYER_UNIT_RESEARCH_CANCEL = ConvertPlayerUnitEvent(36)
EVENT_PLAYER_UNIT_RESEARCH_FINISH = ConvertPlayerUnitEvent(37)
EVENT_PLAYER_UNIT_ISSUED_ORDER = ConvertPlayerUnitEvent(38)
EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER = ConvertPlayerUnitEvent(39)
EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER = ConvertPlayerUnitEvent(40)
EVENT_PLAYER_UNIT_ISSUED_UNIT_ORDER = ConvertPlayerUnitEvent(40) -- for compat

EVENT_PLAYER_HERO_LEVEL = ConvertPlayerUnitEvent(41)
EVENT_PLAYER_HERO_SKILL = ConvertPlayerUnitEvent(42)

EVENT_PLAYER_HERO_REVIVABLE = ConvertPlayerUnitEvent(43)

EVENT_PLAYER_HERO_REVIVE_START = ConvertPlayerUnitEvent(44)
EVENT_PLAYER_HERO_REVIVE_CANCEL = ConvertPlayerUnitEvent(45)
EVENT_PLAYER_HERO_REVIVE_FINISH = ConvertPlayerUnitEvent(46)
EVENT_PLAYER_UNIT_SUMMON = ConvertPlayerUnitEvent(47)
EVENT_PLAYER_UNIT_DROP_ITEM = ConvertPlayerUnitEvent(48)
EVENT_PLAYER_UNIT_PICKUP_ITEM = ConvertPlayerUnitEvent(49)
EVENT_PLAYER_UNIT_USE_ITEM = ConvertPlayerUnitEvent(50)

EVENT_PLAYER_UNIT_LOADED = ConvertPlayerUnitEvent(51)

--===================================================
-- For use with TriggerRegisterUnitEvent
--===================================================

EVENT_UNIT_DAMAGED = ConvertUnitEvent(52)
EVENT_UNIT_DEATH = ConvertUnitEvent(53)
EVENT_UNIT_DECAY = ConvertUnitEvent(54)
EVENT_UNIT_DETECTED = ConvertUnitEvent(55)
EVENT_UNIT_HIDDEN = ConvertUnitEvent(56)
EVENT_UNIT_SELECTED = ConvertUnitEvent(57)
EVENT_UNIT_DESELECTED = ConvertUnitEvent(58)

EVENT_UNIT_STATE_LIMIT = ConvertUnitEvent(59)

-- Events which may have a filter for the "other unit"              
--                                                                  
EVENT_UNIT_ACQUIRED_TARGET = ConvertUnitEvent(60)
EVENT_UNIT_TARGET_IN_RANGE = ConvertUnitEvent(61)
EVENT_UNIT_ATTACKED = ConvertUnitEvent(62)
EVENT_UNIT_RESCUED = ConvertUnitEvent(63)

EVENT_UNIT_CONSTRUCT_CANCEL = ConvertUnitEvent(64)
EVENT_UNIT_CONSTRUCT_FINISH = ConvertUnitEvent(65)

EVENT_UNIT_UPGRADE_START = ConvertUnitEvent(66)
EVENT_UNIT_UPGRADE_CANCEL = ConvertUnitEvent(67)
EVENT_UNIT_UPGRADE_FINISH = ConvertUnitEvent(68)

-- Events which involve the specified unit performing               
-- training of other units                                          
--                                                                  
EVENT_UNIT_TRAIN_START = ConvertUnitEvent(69)
EVENT_UNIT_TRAIN_CANCEL = ConvertUnitEvent(70)
EVENT_UNIT_TRAIN_FINISH = ConvertUnitEvent(71)

EVENT_UNIT_RESEARCH_START = ConvertUnitEvent(72)
EVENT_UNIT_RESEARCH_CANCEL = ConvertUnitEvent(73)
EVENT_UNIT_RESEARCH_FINISH = ConvertUnitEvent(74)

EVENT_UNIT_ISSUED_ORDER = ConvertUnitEvent(75)
EVENT_UNIT_ISSUED_POINT_ORDER = ConvertUnitEvent(76)
EVENT_UNIT_ISSUED_TARGET_ORDER = ConvertUnitEvent(77)

EVENT_UNIT_HERO_LEVEL = ConvertUnitEvent(78)
EVENT_UNIT_HERO_SKILL = ConvertUnitEvent(79)

EVENT_UNIT_HERO_REVIVABLE = ConvertUnitEvent(80)
EVENT_UNIT_HERO_REVIVE_START = ConvertUnitEvent(81)
EVENT_UNIT_HERO_REVIVE_CANCEL = ConvertUnitEvent(82)
EVENT_UNIT_HERO_REVIVE_FINISH = ConvertUnitEvent(83)

EVENT_UNIT_SUMMON = ConvertUnitEvent(84)

EVENT_UNIT_DROP_ITEM = ConvertUnitEvent(85)
EVENT_UNIT_PICKUP_ITEM = ConvertUnitEvent(86)
EVENT_UNIT_USE_ITEM = ConvertUnitEvent(87)

EVENT_UNIT_LOADED = ConvertUnitEvent(88)

EVENT_WIDGET_DEATH = ConvertWidgetEvent(89)

EVENT_DIALOG_BUTTON_CLICK = ConvertDialogEvent(90)
EVENT_DIALOG_CLICK = ConvertDialogEvent(91)

--===================================================
-- Frozen Throne Expansion Events
-- Need to be added here to preserve compat
--===================================================

--===================================================
-- For use with TriggerRegisterGameEvent    
--===================================================    

EVENT_GAME_LOADED = ConvertGameEvent(256)
EVENT_GAME_TOURNAMENT_FINISH_SOON = ConvertGameEvent(257)
EVENT_GAME_TOURNAMENT_FINISH_NOW = ConvertGameEvent(258)
EVENT_GAME_SAVE = ConvertGameEvent(259)

--===================================================
-- For use with TriggerRegisterPlayerEvent
--===================================================

EVENT_PLAYER_ARROW_LEFT_DOWN = ConvertPlayerEvent(261)
EVENT_PLAYER_ARROW_LEFT_UP = ConvertPlayerEvent(262)
EVENT_PLAYER_ARROW_RIGHT_DOWN = ConvertPlayerEvent(263)
EVENT_PLAYER_ARROW_RIGHT_UP = ConvertPlayerEvent(264)
EVENT_PLAYER_ARROW_DOWN_DOWN = ConvertPlayerEvent(265)
EVENT_PLAYER_ARROW_DOWN_UP = ConvertPlayerEvent(266)
EVENT_PLAYER_ARROW_UP_DOWN = ConvertPlayerEvent(267)
EVENT_PLAYER_ARROW_UP_UP = ConvertPlayerEvent(268)

--===================================================
-- For use with TriggerRegisterPlayerUnitEvent
--===================================================

EVENT_PLAYER_UNIT_SELL = ConvertPlayerUnitEvent(269)
EVENT_PLAYER_UNIT_CHANGE_OWNER = ConvertPlayerUnitEvent(270)
EVENT_PLAYER_UNIT_SELL_ITEM = ConvertPlayerUnitEvent(271)
EVENT_PLAYER_UNIT_SPELL_CHANNEL = ConvertPlayerUnitEvent(272)
EVENT_PLAYER_UNIT_SPELL_CAST = ConvertPlayerUnitEvent(273)
EVENT_PLAYER_UNIT_SPELL_EFFECT = ConvertPlayerUnitEvent(274)
EVENT_PLAYER_UNIT_SPELL_FINISH = ConvertPlayerUnitEvent(275)
EVENT_PLAYER_UNIT_SPELL_ENDCAST = ConvertPlayerUnitEvent(276)
EVENT_PLAYER_UNIT_PAWN_ITEM = ConvertPlayerUnitEvent(277)

--===================================================
-- For use with TriggerRegisterUnitEvent
--===================================================

EVENT_UNIT_SELL = ConvertUnitEvent(286)
EVENT_UNIT_CHANGE_OWNER = ConvertUnitEvent(287)
EVENT_UNIT_SELL_ITEM = ConvertUnitEvent(288)
EVENT_UNIT_SPELL_CHANNEL = ConvertUnitEvent(289)
EVENT_UNIT_SPELL_CAST = ConvertUnitEvent(290)
EVENT_UNIT_SPELL_EFFECT = ConvertUnitEvent(291)
EVENT_UNIT_SPELL_FINISH = ConvertUnitEvent(292)
EVENT_UNIT_SPELL_ENDCAST = ConvertUnitEvent(293)
EVENT_UNIT_PAWN_ITEM = ConvertUnitEvent(294)

--===================================================
-- Limit Event API constants    
-- variable, player state, game state, and unit state events
-- ( do NOT change the order of these... )
--===================================================
LESS_THAN = ConvertLimitOp(0)
LESS_THAN_OR_EQUAL = ConvertLimitOp(1)
EQUAL = ConvertLimitOp(2)
GREATER_THAN_OR_EQUAL = ConvertLimitOp(3)
GREATER_THAN = ConvertLimitOp(4)
NOT_EQUAL = ConvertLimitOp(5)

--===================================================
-- Unit Type Constants for use with IsUnitType()
--===================================================

UNIT_TYPE_HERO = ConvertUnitType(0)
UNIT_TYPE_DEAD = ConvertUnitType(1)
UNIT_TYPE_STRUCTURE = ConvertUnitType(2)

UNIT_TYPE_FLYING = ConvertUnitType(3)
UNIT_TYPE_GROUND = ConvertUnitType(4)

UNIT_TYPE_ATTACKS_FLYING = ConvertUnitType(5)
UNIT_TYPE_ATTACKS_GROUND = ConvertUnitType(6)

UNIT_TYPE_MELEE_ATTACKER = ConvertUnitType(7)
UNIT_TYPE_RANGED_ATTACKER = ConvertUnitType(8)

UNIT_TYPE_GIANT = ConvertUnitType(9)
UNIT_TYPE_SUMMONED = ConvertUnitType(10)
UNIT_TYPE_STUNNED = ConvertUnitType(11)
UNIT_TYPE_PLAGUED = ConvertUnitType(12)
UNIT_TYPE_SNARED = ConvertUnitType(13)

UNIT_TYPE_UNDEAD = ConvertUnitType(14)
UNIT_TYPE_MECHANICAL = ConvertUnitType(15)
UNIT_TYPE_PEON = ConvertUnitType(16)
UNIT_TYPE_SAPPER = ConvertUnitType(17)
UNIT_TYPE_TOWNHALL = ConvertUnitType(18)
UNIT_TYPE_ANCIENT = ConvertUnitType(19)

UNIT_TYPE_TAUREN = ConvertUnitType(20)
UNIT_TYPE_POISONED = ConvertUnitType(21)
UNIT_TYPE_POLYMORPHED = ConvertUnitType(22)
UNIT_TYPE_SLEEPING = ConvertUnitType(23)
UNIT_TYPE_RESISTANT = ConvertUnitType(24)
UNIT_TYPE_ETHEREAL = ConvertUnitType(25)
UNIT_TYPE_MAGIC_IMMUNE = ConvertUnitType(26)

--===================================================
-- Unit Type Constants for use with ChooseRandomItemEx()
--===================================================

ITEM_TYPE_PERMANENT = ConvertItemType(0)
ITEM_TYPE_CHARGED = ConvertItemType(1)
ITEM_TYPE_POWERUP = ConvertItemType(2)
ITEM_TYPE_ARTIFACT = ConvertItemType(3)
ITEM_TYPE_PURCHASABLE = ConvertItemType(4)
ITEM_TYPE_CAMPAIGN = ConvertItemType(5)
ITEM_TYPE_MISCELLANEOUS = ConvertItemType(6)
ITEM_TYPE_UNKNOWN = ConvertItemType(7)
ITEM_TYPE_ANY = ConvertItemType(8)

-- Deprecated, should use ITEM_TYPE_POWERUP
ITEM_TYPE_TOME = ConvertItemType(2)

--===================================================
-- Animatable Camera Fields
--===================================================

CAMERA_FIELD_TARGET_DISTANCE = ConvertCameraField(0)
CAMERA_FIELD_FARZ = ConvertCameraField(1)
CAMERA_FIELD_ANGLE_OF_ATTACK = ConvertCameraField(2)
CAMERA_FIELD_FIELD_OF_VIEW = ConvertCameraField(3)
CAMERA_FIELD_ROLL = ConvertCameraField(4)
CAMERA_FIELD_ROTATION = ConvertCameraField(5)
CAMERA_FIELD_ZOFFSET = ConvertCameraField(6)

BLEND_MODE_NONE = ConvertBlendMode(0)
BLEND_MODE_DONT_CARE = ConvertBlendMode(0)
BLEND_MODE_KEYALPHA = ConvertBlendMode(1)
BLEND_MODE_BLEND = ConvertBlendMode(2)
BLEND_MODE_ADDITIVE = ConvertBlendMode(3)
BLEND_MODE_MODULATE = ConvertBlendMode(4)
BLEND_MODE_MODULATE_2X = ConvertBlendMode(5)

RARITY_FREQUENT = ConvertRarityControl(0)
RARITY_RARE = ConvertRarityControl(1)

TEXMAP_FLAG_NONE = ConvertTexMapFlags(0)
TEXMAP_FLAG_WRAP_U = ConvertTexMapFlags(1)
TEXMAP_FLAG_WRAP_V = ConvertTexMapFlags(2)
TEXMAP_FLAG_WRAP_UV = ConvertTexMapFlags(3)

FOG_OF_WAR_MASKED = ConvertFogState(1)
FOG_OF_WAR_FOGGED = ConvertFogState(2)
FOG_OF_WAR_VISIBLE = ConvertFogState(4)

--===================================================
-- Camera Margin constants for use with GetCameraMargin
--===================================================

CAMERA_MARGIN_LEFT = 0
CAMERA_MARGIN_RIGHT = 1
CAMERA_MARGIN_TOP = 2
CAMERA_MARGIN_BOTTOM = 3

--===================================================
-- Effect API constants
--===================================================

EFFECT_TYPE_EFFECT = ConvertEffectType(0)
EFFECT_TYPE_TARGET = ConvertEffectType(1)
EFFECT_TYPE_CASTER = ConvertEffectType(2)
EFFECT_TYPE_SPECIAL = ConvertEffectType(3)
EFFECT_TYPE_AREA_EFFECT = ConvertEffectType(4)
EFFECT_TYPE_MISSILE = ConvertEffectType(5)
EFFECT_TYPE_LIGHTNING = ConvertEffectType(6)

SOUND_TYPE_EFFECT = ConvertSoundType(0)
SOUND_TYPE_EFFECT_LOOPED = ConvertSoundType(1)



--============================================================================
-- MathAPI
Deg2Rad = _native_'Deg2Rad'
Rad2Deg = _native_'Rad2Deg'

Sin = _native_'Sin'
Cos = _native_'Cos'
Tan = _native_'Tan'

-- Expect values between -1 and 1...returns 0 for invalid input
Asin = _native_'Asin'
Acos = _native_'Acos'

Atan = _native_'Atan'

-- Returns 0 if x and y are both 0
Atan2 = _native_'Atan2'

-- Returns 0 if x <= 0
SquareRoot = _native_'SquareRoot'

-- computes x to the y power
-- y == 0.0             => 1
-- x ==0.0 and y < 0    => 0
--
Pow = _native_'Pow'

--============================================================================
-- String Utility API
I2R = _native_'I2R'
R2I = _native_'R2I'
I2S = _native_'I2S'
R2S = _native_'R2S'
R2SW = _native_'R2SW'
S2I = _native_'S2I'
S2R = _native_'S2R'
GetHandleId = _native_'GetHandleId'
SubString = _native_'SubString'
StringLength = _native_'StringLength'
StringCase = _native_'StringCase'
StringHash = _native_'StringHash'

GetLocalizedString = _native_'GetLocalizedString'
GetLocalizedHotkey = _native_'GetLocalizedHotkey'

--============================================================================
-- Map Setup API
--
--  These are native functions for describing the map configuration
--  these funcs should only be used in the "config" function of
--  a map script. The functions should also be called in this order
--  ( i.e. call SetPlayers before SetPlayerColor...
--

SetMapName = _native_'SetMapName'
SetMapDescription = _native_'SetMapDescription'

SetTeams = _native_'SetTeams'
SetPlayers = _native_'SetPlayers'

DefineStartLocation = _native_'DefineStartLocation'
DefineStartLocationLoc = _native_'DefineStartLocationLoc'
SetStartLocPrioCount = _native_'SetStartLocPrioCount'
SetStartLocPrio = _native_'SetStartLocPrio'
GetStartLocPrioSlot = _native_'GetStartLocPrioSlot'
GetStartLocPrio = _native_'GetStartLocPrio'

SetGameTypeSupported = _native_'SetGameTypeSupported'
SetMapFlag = _native_'SetMapFlag'
SetGamePlacement = _native_'SetGamePlacement'
SetGameSpeed = _native_'SetGameSpeed'
SetGameDifficulty = _native_'SetGameDifficulty'
SetResourceDensity = _native_'SetResourceDensity'
SetCreatureDensity = _native_'SetCreatureDensity'

GetTeams = _native_'GetTeams'
GetPlayers = _native_'GetPlayers'

IsGameTypeSupported = _native_'IsGameTypeSupported'
GetGameTypeSelected = _native_'GetGameTypeSelected'
IsMapFlagSet = _native_'IsMapFlagSet'

GetGamePlacement = _native_'GetGamePlacement'
GetGameSpeed = _native_'GetGameSpeed'
GetGameDifficulty = _native_'GetGameDifficulty'
GetResourceDensity = _native_'GetResourceDensity'
GetCreatureDensity = _native_'GetCreatureDensity'
GetStartLocationX = _native_'GetStartLocationX'
GetStartLocationY = _native_'GetStartLocationY'
GetStartLocationLoc = _native_'GetStartLocationLoc'


SetPlayerTeam = _native_'SetPlayerTeam'
SetPlayerStartLocation = _native_'SetPlayerStartLocation'
-- forces player to have the specified start loc and marks the start loc as occupied
-- which removes it from consideration for subsequently placed players
-- ( i.e. you can use this to put people in a fixed loc and then
--   use random placement for any unplaced players etc )
ForcePlayerStartLocation = _native_'ForcePlayerStartLocation'
SetPlayerColor = _native_'SetPlayerColor'
SetPlayerAlliance = _native_'SetPlayerAlliance'
SetPlayerTaxRate = _native_'SetPlayerTaxRate'
SetPlayerRacePreference = _native_'SetPlayerRacePreference'
SetPlayerRaceSelectable = _native_'SetPlayerRaceSelectable'
SetPlayerController = _native_'SetPlayerController'
SetPlayerName = _native_'SetPlayerName'

SetPlayerOnScoreScreen = _native_'SetPlayerOnScoreScreen'

GetPlayerTeam = _native_'GetPlayerTeam'
GetPlayerStartLocation = _native_'GetPlayerStartLocation'
GetPlayerColor = _native_'GetPlayerColor'
GetPlayerSelectable = _native_'GetPlayerSelectable'
GetPlayerController = _native_'GetPlayerController'
GetPlayerSlotState = _native_'GetPlayerSlotState'
GetPlayerTaxRate = _native_'GetPlayerTaxRate'
IsPlayerRacePrefSet = _native_'IsPlayerRacePrefSet'
GetPlayerName = _native_'GetPlayerName'

--============================================================================
-- Timer API
--
CreateTimer = _native_'CreateTimer'
DestroyTimer = _native_'DestroyTimer'
TimerStart = _native_'TimerStart'
TimerGetElapsed = _native_'TimerGetElapsed'
TimerGetRemaining = _native_'TimerGetRemaining'
TimerGetTimeout = _native_'TimerGetTimeout'
PauseTimer = _native_'PauseTimer'
ResumeTimer = _native_'ResumeTimer'
GetExpiredTimer = _native_'GetExpiredTimer'

--============================================================================
-- Group API
--
CreateGroup = _native_'CreateGroup'
DestroyGroup = _native_'DestroyGroup'
GroupAddUnit = _native_'GroupAddUnit'
GroupRemoveUnit = _native_'GroupRemoveUnit'
GroupClear = _native_'GroupClear'
GroupEnumUnitsOfType = _native_'GroupEnumUnitsOfType'
GroupEnumUnitsOfPlayer = _native_'GroupEnumUnitsOfPlayer'
GroupEnumUnitsOfTypeCounted = _native_'GroupEnumUnitsOfTypeCounted'
GroupEnumUnitsInRect = _native_'GroupEnumUnitsInRect'
GroupEnumUnitsInRectCounted = _native_'GroupEnumUnitsInRectCounted'
GroupEnumUnitsInRange = _native_'GroupEnumUnitsInRange'
GroupEnumUnitsInRangeOfLoc = _native_'GroupEnumUnitsInRangeOfLoc'
GroupEnumUnitsInRangeCounted = _native_'GroupEnumUnitsInRangeCounted'
GroupEnumUnitsInRangeOfLocCounted = _native_'GroupEnumUnitsInRangeOfLocCounted'
GroupEnumUnitsSelected = _native_'GroupEnumUnitsSelected'

GroupImmediateOrder = _native_'GroupImmediateOrder'
GroupImmediateOrderById = _native_'GroupImmediateOrderById'
GroupPointOrder = _native_'GroupPointOrder'
GroupPointOrderLoc = _native_'GroupPointOrderLoc'
GroupPointOrderById = _native_'GroupPointOrderById'
GroupPointOrderByIdLoc = _native_'GroupPointOrderByIdLoc'
GroupTargetOrder = _native_'GroupTargetOrder'
GroupTargetOrderById = _native_'GroupTargetOrderById'

-- This will be difficult to support with potentially disjoint, cell-based regions
-- as it would involve enumerating all the cells that are covered by a particularregion
-- a better implementation would be a trigger that adds relevant units as they enter
-- and removes them if they leave...
ForGroup = _native_'ForGroup'
FirstOfGroup = _native_'FirstOfGroup'

--============================================================================
-- Force API
--
CreateForce = _native_'CreateForce'
DestroyForce = _native_'DestroyForce'
ForceAddPlayer = _native_'ForceAddPlayer'
ForceRemovePlayer = _native_'ForceRemovePlayer'
ForceClear = _native_'ForceClear'
ForceEnumPlayers = _native_'ForceEnumPlayers'
ForceEnumPlayersCounted = _native_'ForceEnumPlayersCounted'
ForceEnumAllies = _native_'ForceEnumAllies'
ForceEnumEnemies = _native_'ForceEnumEnemies'
ForForce = _native_'ForForce'

--============================================================================
-- Region and Location API
--
Rect = _native_'Rect'
RectFromLoc = _native_'RectFromLoc'
RemoveRect = _native_'RemoveRect'
SetRect = _native_'SetRect'
SetRectFromLoc = _native_'SetRectFromLoc'
MoveRectTo = _native_'MoveRectTo'
MoveRectToLoc = _native_'MoveRectToLoc'

GetRectCenterX = _native_'GetRectCenterX'
GetRectCenterY = _native_'GetRectCenterY'
GetRectMinX = _native_'GetRectMinX'
GetRectMinY = _native_'GetRectMinY'
GetRectMaxX = _native_'GetRectMaxX'
GetRectMaxY = _native_'GetRectMaxY'

CreateRegion = _native_'CreateRegion'
RemoveRegion = _native_'RemoveRegion'

RegionAddRect = _native_'RegionAddRect'
RegionClearRect = _native_'RegionClearRect'

RegionAddCell = _native_'RegionAddCell'
RegionAddCellAtLoc = _native_'RegionAddCellAtLoc'
RegionClearCell = _native_'RegionClearCell'
RegionClearCellAtLoc = _native_'RegionClearCellAtLoc'

Location = _native_'Location'
RemoveLocation = _native_'RemoveLocation'
MoveLocation = _native_'MoveLocation'
GetLocationX = _native_'GetLocationX'
GetLocationY = _native_'GetLocationY'

-- This function is asynchronous. The values it returns are not guaranteed synchronous between each player.
--  If you attempt to use it in a synchronous manner, it may cause a desync.
GetLocationZ = _native_'GetLocationZ'

IsUnitInRegion = _native_'IsUnitInRegion'
IsPointInRegion = _native_'IsPointInRegion'
IsLocationInRegion = _native_'IsLocationInRegion'

-- Returns full map bounds, including unplayable borders, in world coordinates
GetWorldBounds = _native_'GetWorldBounds'

--============================================================================
-- Native trigger interface
--
CreateTrigger = _native_'CreateTrigger'
DestroyTrigger = _native_'DestroyTrigger'
ResetTrigger = _native_'ResetTrigger'
EnableTrigger = _native_'EnableTrigger'
DisableTrigger = _native_'DisableTrigger'
IsTriggerEnabled = _native_'IsTriggerEnabled'

TriggerWaitOnSleeps = _native_'TriggerWaitOnSleeps'
IsTriggerWaitOnSleeps = _native_'IsTriggerWaitOnSleeps'

GetFilterUnit = _native_'GetFilterUnit'
GetEnumUnit = _native_'GetEnumUnit'

GetFilterDestructable = _native_'GetFilterDestructable'
GetEnumDestructable = _native_'GetEnumDestructable'

GetFilterItem = _native_'GetFilterItem'
GetEnumItem = _native_'GetEnumItem'

GetFilterPlayer = _native_'GetFilterPlayer'
GetEnumPlayer = _native_'GetEnumPlayer'

GetTriggeringTrigger = _native_'GetTriggeringTrigger'
GetTriggerEventId = _native_'GetTriggerEventId'
GetTriggerEvalCount = _native_'GetTriggerEvalCount'
GetTriggerExecCount = _native_'GetTriggerExecCount'

ExecuteFunc = _native_'ExecuteFunc'

--============================================================================
-- Boolean Expr API ( for compositing trigger conditions and unit filter funcs...)
--============================================================================
And = _native_'And'
Or = _native_'Or'
Not = _native_'Not'
Condition = _native_'Condition'
DestroyCondition = _native_'DestroyCondition'
Filter = _native_'Filter'
DestroyFilter = _native_'DestroyFilter'
DestroyBoolExpr = _native_'DestroyBoolExpr'

--============================================================================
-- Trigger Game Event API
--============================================================================

TriggerRegisterVariableEvent = _native_'TriggerRegisterVariableEvent'

-- EVENT_GAME_VARIABLE_LIMIT
--constant native string GetTriggeringVariableName takes nothing returns string

-- Creates it's own timer and triggers when it expires
TriggerRegisterTimerEvent = _native_'TriggerRegisterTimerEvent'

-- Triggers when the timer you tell it about expires
TriggerRegisterTimerExpireEvent = _native_'TriggerRegisterTimerExpireEvent'

TriggerRegisterGameStateEvent = _native_'TriggerRegisterGameStateEvent'

TriggerRegisterDialogEvent = _native_'TriggerRegisterDialogEvent'
TriggerRegisterDialogButtonEvent = _native_'TriggerRegisterDialogButtonEvent'

--  EVENT_GAME_STATE_LIMIT
GetEventGameState = _native_'GetEventGameState'

TriggerRegisterGameEvent = _native_'TriggerRegisterGameEvent'

-- EVENT_GAME_VICTORY
GetWinningPlayer = _native_'GetWinningPlayer'


TriggerRegisterEnterRegion = _native_'TriggerRegisterEnterRegion'

-- EVENT_GAME_ENTER_REGION
GetTriggeringRegion = _native_'GetTriggeringRegion'
GetEnteringUnit = _native_'GetEnteringUnit'

-- EVENT_GAME_LEAVE_REGION

TriggerRegisterLeaveRegion = _native_'TriggerRegisterLeaveRegion'
GetLeavingUnit = _native_'GetLeavingUnit'

TriggerRegisterTrackableHitEvent = _native_'TriggerRegisterTrackableHitEvent'
TriggerRegisterTrackableTrackEvent = _native_'TriggerRegisterTrackableTrackEvent'

-- EVENT_GAME_TRACKABLE_HIT
-- EVENT_GAME_TRACKABLE_TRACK
GetTriggeringTrackable = _native_'GetTriggeringTrackable'

-- EVENT_DIALOG_BUTTON_CLICK
GetClickedButton = _native_'GetClickedButton'
GetClickedDialog = _native_'GetClickedDialog'

-- EVENT_GAME_TOURNAMENT_FINISH_SOON
GetTournamentFinishSoonTimeRemaining = _native_'GetTournamentFinishSoonTimeRemaining'
GetTournamentFinishNowRule = _native_'GetTournamentFinishNowRule'
GetTournamentFinishNowPlayer = _native_'GetTournamentFinishNowPlayer'
GetTournamentScore = _native_'GetTournamentScore'

-- EVENT_GAME_SAVE
GetSaveBasicFilename = _native_'GetSaveBasicFilename'

--============================================================================
-- Trigger Player Based Event API
--============================================================================

TriggerRegisterPlayerEvent = _native_'TriggerRegisterPlayerEvent'

-- EVENT_PLAYER_DEFEAT
-- EVENT_PLAYER_VICTORY
GetTriggerPlayer = _native_'GetTriggerPlayer'

TriggerRegisterPlayerUnitEvent = _native_'TriggerRegisterPlayerUnitEvent'

-- EVENT_PLAYER_HERO_LEVEL
-- EVENT_UNIT_HERO_LEVEL
GetLevelingUnit = _native_'GetLevelingUnit'

-- EVENT_PLAYER_HERO_SKILL
-- EVENT_UNIT_HERO_SKILL
GetLearningUnit = _native_'GetLearningUnit'
GetLearnedSkill = _native_'GetLearnedSkill'
GetLearnedSkillLevel = _native_'GetLearnedSkillLevel'

-- EVENT_PLAYER_HERO_REVIVABLE
GetRevivableUnit = _native_'GetRevivableUnit'

-- EVENT_PLAYER_HERO_REVIVE_START
-- EVENT_PLAYER_HERO_REVIVE_CANCEL
-- EVENT_PLAYER_HERO_REVIVE_FINISH
-- EVENT_UNIT_HERO_REVIVE_START
-- EVENT_UNIT_HERO_REVIVE_CANCEL
-- EVENT_UNIT_HERO_REVIVE_FINISH
GetRevivingUnit = _native_'GetRevivingUnit'

-- EVENT_PLAYER_UNIT_ATTACKED
GetAttacker = _native_'GetAttacker'

-- EVENT_PLAYER_UNIT_RESCUED
GetRescuer = _native_'GetRescuer'

-- EVENT_PLAYER_UNIT_DEATH
GetDyingUnit = _native_'GetDyingUnit'
GetKillingUnit = _native_'GetKillingUnit'

-- EVENT_PLAYER_UNIT_DECAY
GetDecayingUnit = _native_'GetDecayingUnit'

-- EVENT_PLAYER_UNIT_SELECTED
--constant native GetSelectedUnit takes nothing returns unit

-- EVENT_PLAYER_UNIT_CONSTRUCT_START
GetConstructingStructure = _native_'GetConstructingStructure'

-- EVENT_PLAYER_UNIT_CONSTRUCT_FINISH
-- EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL
GetCancelledStructure = _native_'GetCancelledStructure'
GetConstructedStructure = _native_'GetConstructedStructure'

-- EVENT_PLAYER_UNIT_RESEARCH_START
-- EVENT_PLAYER_UNIT_RESEARCH_CANCEL
-- EVENT_PLAYER_UNIT_RESEARCH_FINISH
GetResearchingUnit = _native_'GetResearchingUnit'
GetResearched = _native_'GetResearched'

-- EVENT_PLAYER_UNIT_TRAIN_START
-- EVENT_PLAYER_UNIT_TRAIN_CANCEL
GetTrainedUnitType = _native_'GetTrainedUnitType'

-- EVENT_PLAYER_UNIT_TRAIN_FINISH
GetTrainedUnit = _native_'GetTrainedUnit'

-- EVENT_PLAYER_UNIT_DETECTED
GetDetectedUnit = _native_'GetDetectedUnit'

-- EVENT_PLAYER_UNIT_SUMMONED
GetSummoningUnit = _native_'GetSummoningUnit'
GetSummonedUnit = _native_'GetSummonedUnit'

-- EVENT_PLAYER_UNIT_LOADED
GetTransportUnit = _native_'GetTransportUnit'
GetLoadedUnit = _native_'GetLoadedUnit'

-- EVENT_PLAYER_UNIT_SELL
GetSellingUnit = _native_'GetSellingUnit'
GetSoldUnit = _native_'GetSoldUnit'
GetBuyingUnit = _native_'GetBuyingUnit'

-- EVENT_PLAYER_UNIT_SELL_ITEM
GetSoldItem = _native_'GetSoldItem'

-- EVENT_PLAYER_UNIT_CHANGE_OWNER
GetChangingUnit = _native_'GetChangingUnit'
GetChangingUnitPrevOwner = _native_'GetChangingUnitPrevOwner'

-- EVENT_PLAYER_UNIT_DROP_ITEM
-- EVENT_PLAYER_UNIT_PICKUP_ITEM
-- EVENT_PLAYER_UNIT_USE_ITEM
GetManipulatingUnit = _native_'GetManipulatingUnit'
GetManipulatedItem = _native_'GetManipulatedItem'

-- EVENT_PLAYER_UNIT_ISSUED_ORDER
GetOrderedUnit = _native_'GetOrderedUnit'
GetIssuedOrderId = _native_'GetIssuedOrderId'

-- EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER
GetOrderPointX = _native_'GetOrderPointX'
GetOrderPointY = _native_'GetOrderPointY'
GetOrderPointLoc = _native_'GetOrderPointLoc'

-- EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER
GetOrderTarget = _native_'GetOrderTarget'
GetOrderTargetDestructable = _native_'GetOrderTargetDestructable'
GetOrderTargetItem = _native_'GetOrderTargetItem'
GetOrderTargetUnit = _native_'GetOrderTargetUnit'

-- EVENT_UNIT_SPELL_CHANNEL
-- EVENT_UNIT_SPELL_CAST
-- EVENT_UNIT_SPELL_EFFECT
-- EVENT_UNIT_SPELL_FINISH
-- EVENT_UNIT_SPELL_ENDCAST
-- EVENT_PLAYER_UNIT_SPELL_CHANNEL
-- EVENT_PLAYER_UNIT_SPELL_CAST
-- EVENT_PLAYER_UNIT_SPELL_EFFECT
-- EVENT_PLAYER_UNIT_SPELL_FINISH
-- EVENT_PLAYER_UNIT_SPELL_ENDCAST
GetSpellAbilityUnit = _native_'GetSpellAbilityUnit'
GetSpellAbilityId = _native_'GetSpellAbilityId'
GetSpellAbility = _native_'GetSpellAbility'
GetSpellTargetLoc = _native_'GetSpellTargetLoc'
GetSpellTargetX = _native_'GetSpellTargetX'
GetSpellTargetY = _native_'GetSpellTargetY'
GetSpellTargetDestructable = _native_'GetSpellTargetDestructable'
GetSpellTargetItem = _native_'GetSpellTargetItem'
GetSpellTargetUnit = _native_'GetSpellTargetUnit'

TriggerRegisterPlayerAllianceChange = _native_'TriggerRegisterPlayerAllianceChange'
TriggerRegisterPlayerStateEvent = _native_'TriggerRegisterPlayerStateEvent'

-- EVENT_PLAYER_STATE_LIMIT
GetEventPlayerState = _native_'GetEventPlayerState'

TriggerRegisterPlayerChatEvent = _native_'TriggerRegisterPlayerChatEvent'

-- EVENT_PLAYER_CHAT

-- returns the actual string they typed in ( same as what you registered for
-- if you required exact match )
GetEventPlayerChatString = _native_'GetEventPlayerChatString'

-- returns the string that you registered for
GetEventPlayerChatStringMatched = _native_'GetEventPlayerChatStringMatched'

TriggerRegisterDeathEvent = _native_'TriggerRegisterDeathEvent'

--============================================================================
-- Trigger Unit Based Event API
--============================================================================

-- returns handle to unit which triggered the most recent event when called from
-- within a trigger action function...returns null handle when used incorrectly

GetTriggerUnit = _native_'GetTriggerUnit'

TriggerRegisterUnitStateEvent = _native_'TriggerRegisterUnitStateEvent'

-- EVENT_UNIT_STATE_LIMIT
GetEventUnitState = _native_'GetEventUnitState'

TriggerRegisterUnitEvent = _native_'TriggerRegisterUnitEvent'

-- EVENT_UNIT_DAMAGED
GetEventDamage = _native_'GetEventDamage'
GetEventDamageSource = _native_'GetEventDamageSource'

-- EVENT_UNIT_DEATH
-- EVENT_UNIT_DECAY
-- Use the GetDyingUnit and GetDecayingUnit funcs above

-- EVENT_UNIT_DETECTED 
GetEventDetectingPlayer = _native_'GetEventDetectingPlayer'

TriggerRegisterFilterUnitEvent = _native_'TriggerRegisterFilterUnitEvent'

-- EVENT_UNIT_ACQUIRED_TARGET
-- EVENT_UNIT_TARGET_IN_RANGE
GetEventTargetUnit = _native_'GetEventTargetUnit'

-- EVENT_UNIT_ATTACKED
-- Use GetAttacker from the Player Unit Event API Below...

-- EVENT_UNIT_RESCUEDED
-- Use GetRescuer from the Player Unit Event API Below...

-- EVENT_UNIT_CONSTRUCT_CANCEL
-- EVENT_UNIT_CONSTRUCT_FINISH

-- See the Player Unit Construction Event API above for event info funcs

-- EVENT_UNIT_TRAIN_START
-- EVENT_UNIT_TRAIN_CANCELLED
-- EVENT_UNIT_TRAIN_FINISH

-- See the Player Unit Training Event API above for event info funcs

-- EVENT_UNIT_SELL

-- See the Player Unit Sell Event API above for event info funcs

-- EVENT_UNIT_DROP_ITEM
-- EVENT_UNIT_PICKUP_ITEM
-- EVENT_UNIT_USE_ITEM
-- See the Player Unit/Item manipulation Event API above for event info funcs

-- EVENT_UNIT_ISSUED_ORDER
-- EVENT_UNIT_ISSUED_POINT_ORDER
-- EVENT_UNIT_ISSUED_TARGET_ORDER

-- See the Player Unit Order Event API above for event info funcs

TriggerRegisterUnitInRange = _native_'TriggerRegisterUnitInRange'

TriggerAddCondition = _native_'TriggerAddCondition'
TriggerRemoveCondition = _native_'TriggerRemoveCondition'
TriggerClearConditions = _native_'TriggerClearConditions'

TriggerAddAction = _native_'TriggerAddAction'
TriggerRemoveAction = _native_'TriggerRemoveAction'
TriggerClearActions = _native_'TriggerClearActions'
TriggerSleepAction = _native_'TriggerSleepAction'
TriggerWaitForSound = _native_'TriggerWaitForSound'
TriggerEvaluate = _native_'TriggerEvaluate'
TriggerExecute = _native_'TriggerExecute'
TriggerExecuteWait = _native_'TriggerExecuteWait'
TriggerSyncStart = _native_'TriggerSyncStart'
TriggerSyncReady = _native_'TriggerSyncReady'

--============================================================================
-- Widget API
GetWidgetLife = _native_'GetWidgetLife'
SetWidgetLife = _native_'SetWidgetLife'
GetWidgetX = _native_'GetWidgetX'
GetWidgetY = _native_'GetWidgetY'
GetTriggerWidget = _native_'GetTriggerWidget'

--============================================================================
-- Destructable Object API
-- Facing arguments are specified in degrees
CreateDestructable = _native_'CreateDestructable'
CreateDestructableZ = _native_'CreateDestructableZ'
CreateDeadDestructable = _native_'CreateDeadDestructable'
CreateDeadDestructableZ = _native_'CreateDeadDestructableZ'
RemoveDestructable = _native_'RemoveDestructable'
KillDestructable = _native_'KillDestructable'
SetDestructableInvulnerable = _native_'SetDestructableInvulnerable'
IsDestructableInvulnerable = _native_'IsDestructableInvulnerable'
EnumDestructablesInRect = _native_'EnumDestructablesInRect'
GetDestructableTypeId = _native_'GetDestructableTypeId'
GetDestructableX = _native_'GetDestructableX'
GetDestructableY = _native_'GetDestructableY'
SetDestructableLife = _native_'SetDestructableLife'
GetDestructableLife = _native_'GetDestructableLife'
SetDestructableMaxLife = _native_'SetDestructableMaxLife'
GetDestructableMaxLife = _native_'GetDestructableMaxLife'
DestructableRestoreLife = _native_'DestructableRestoreLife'
QueueDestructableAnimation = _native_'QueueDestructableAnimation'
SetDestructableAnimation = _native_'SetDestructableAnimation'
SetDestructableAnimationSpeed = _native_'SetDestructableAnimationSpeed'
ShowDestructable = _native_'ShowDestructable'
GetDestructableOccluderHeight = _native_'GetDestructableOccluderHeight'
SetDestructableOccluderHeight = _native_'SetDestructableOccluderHeight'
GetDestructableName = _native_'GetDestructableName'
GetTriggerDestructable = _native_'GetTriggerDestructable'

--============================================================================
-- Item API
CreateItem = _native_'CreateItem'
RemoveItem = _native_'RemoveItem'
GetItemPlayer = _native_'GetItemPlayer'
GetItemTypeId = _native_'GetItemTypeId'
GetItemX = _native_'GetItemX'
GetItemY = _native_'GetItemY'
SetItemPosition = _native_'SetItemPosition'
SetItemDropOnDeath = _native_'SetItemDropOnDeath'
SetItemDroppable = _native_'SetItemDroppable'
SetItemPawnable = _native_'SetItemPawnable'
SetItemPlayer = _native_'SetItemPlayer'
SetItemInvulnerable = _native_'SetItemInvulnerable'
IsItemInvulnerable = _native_'IsItemInvulnerable'
SetItemVisible = _native_'SetItemVisible'
IsItemVisible = _native_'IsItemVisible'
IsItemOwned = _native_'IsItemOwned'
IsItemPowerup = _native_'IsItemPowerup'
IsItemSellable = _native_'IsItemSellable'
IsItemPawnable = _native_'IsItemPawnable'
IsItemIdPowerup = _native_'IsItemIdPowerup'
IsItemIdSellable = _native_'IsItemIdSellable'
IsItemIdPawnable = _native_'IsItemIdPawnable'
EnumItemsInRect = _native_'EnumItemsInRect'
GetItemLevel = _native_'GetItemLevel'
GetItemType = _native_'GetItemType'
SetItemDropID = _native_'SetItemDropID'
GetItemName = _native_'GetItemName'
GetItemCharges = _native_'GetItemCharges'
SetItemCharges = _native_'SetItemCharges'
GetItemUserData = _native_'GetItemUserData'
SetItemUserData = _native_'SetItemUserData'

--============================================================================
-- Unit API
-- Facing arguments are specified in degrees
CreateUnit = _native_'CreateUnit'
CreateUnitByName = _native_'CreateUnitByName'
CreateUnitAtLoc = _native_'CreateUnitAtLoc'
CreateUnitAtLocByName = _native_'CreateUnitAtLocByName'
CreateCorpse = _native_'CreateCorpse'

KillUnit = _native_'KillUnit'
RemoveUnit = _native_'RemoveUnit'
ShowUnit = _native_'ShowUnit'

SetUnitState = _native_'SetUnitState'
SetUnitX = _native_'SetUnitX'
SetUnitY = _native_'SetUnitY'
SetUnitPosition = _native_'SetUnitPosition'
SetUnitPositionLoc = _native_'SetUnitPositionLoc'
SetUnitFacing = _native_'SetUnitFacing'
SetUnitFacingTimed = _native_'SetUnitFacingTimed'
SetUnitMoveSpeed = _native_'SetUnitMoveSpeed'
SetUnitFlyHeight = _native_'SetUnitFlyHeight'
SetUnitTurnSpeed = _native_'SetUnitTurnSpeed'
SetUnitPropWindow = _native_'SetUnitPropWindow'
SetUnitAcquireRange = _native_'SetUnitAcquireRange'
SetUnitCreepGuard = _native_'SetUnitCreepGuard'

GetUnitAcquireRange = _native_'GetUnitAcquireRange'
GetUnitTurnSpeed = _native_'GetUnitTurnSpeed'
GetUnitPropWindow = _native_'GetUnitPropWindow'
GetUnitFlyHeight = _native_'GetUnitFlyHeight'

GetUnitDefaultAcquireRange = _native_'GetUnitDefaultAcquireRange'
GetUnitDefaultTurnSpeed = _native_'GetUnitDefaultTurnSpeed'
GetUnitDefaultPropWindow = _native_'GetUnitDefaultPropWindow'
GetUnitDefaultFlyHeight = _native_'GetUnitDefaultFlyHeight'

SetUnitOwner = _native_'SetUnitOwner'
SetUnitColor = _native_'SetUnitColor'

SetUnitScale = _native_'SetUnitScale'
SetUnitTimeScale = _native_'SetUnitTimeScale'
SetUnitBlendTime = _native_'SetUnitBlendTime'
SetUnitVertexColor = _native_'SetUnitVertexColor'

QueueUnitAnimation = _native_'QueueUnitAnimation'
SetUnitAnimation = _native_'SetUnitAnimation'
SetUnitAnimationByIndex = _native_'SetUnitAnimationByIndex'
SetUnitAnimationWithRarity = _native_'SetUnitAnimationWithRarity'
AddUnitAnimationProperties = _native_'AddUnitAnimationProperties'

SetUnitLookAt = _native_'SetUnitLookAt'
ResetUnitLookAt = _native_'ResetUnitLookAt'

SetUnitRescuable = _native_'SetUnitRescuable'
SetUnitRescueRange = _native_'SetUnitRescueRange'

SetHeroStr = _native_'SetHeroStr'
SetHeroAgi = _native_'SetHeroAgi'
SetHeroInt = _native_'SetHeroInt'

GetHeroStr = _native_'GetHeroStr'
GetHeroAgi = _native_'GetHeroAgi'
GetHeroInt = _native_'GetHeroInt'

UnitStripHeroLevel = _native_'UnitStripHeroLevel'

GetHeroXP = _native_'GetHeroXP'
SetHeroXP = _native_'SetHeroXP'

GetHeroSkillPoints = _native_'GetHeroSkillPoints'
UnitModifySkillPoints = _native_'UnitModifySkillPoints'

AddHeroXP = _native_'AddHeroXP'
SetHeroLevel = _native_'SetHeroLevel'
GetHeroLevel = _native_'GetHeroLevel'
GetUnitLevel = _native_'GetUnitLevel'
GetHeroProperName = _native_'GetHeroProperName'
SuspendHeroXP = _native_'SuspendHeroXP'
IsSuspendedXP = _native_'IsSuspendedXP'
SelectHeroSkill = _native_'SelectHeroSkill'
GetUnitAbilityLevel = _native_'GetUnitAbilityLevel'
DecUnitAbilityLevel = _native_'DecUnitAbilityLevel'
IncUnitAbilityLevel = _native_'IncUnitAbilityLevel'
SetUnitAbilityLevel = _native_'SetUnitAbilityLevel'
ReviveHero = _native_'ReviveHero'
ReviveHeroLoc = _native_'ReviveHeroLoc'
SetUnitExploded = _native_'SetUnitExploded'
SetUnitInvulnerable = _native_'SetUnitInvulnerable'
PauseUnit = _native_'PauseUnit'
IsUnitPaused = _native_'IsUnitPaused'
SetUnitPathing = _native_'SetUnitPathing'

ClearSelection = _native_'ClearSelection'
SelectUnit = _native_'SelectUnit'

GetUnitPointValue = _native_'GetUnitPointValue'
GetUnitPointValueByType = _native_'GetUnitPointValueByType'
--native        SetUnitPointValueByType takes integer unitType, integer newPointValue returns nothing

UnitAddItem = _native_'UnitAddItem'
UnitAddItemById = _native_'UnitAddItemById'
UnitAddItemToSlotById = _native_'UnitAddItemToSlotById'
UnitRemoveItem = _native_'UnitRemoveItem'
UnitRemoveItemFromSlot = _native_'UnitRemoveItemFromSlot'
UnitHasItem = _native_'UnitHasItem'
UnitItemInSlot = _native_'UnitItemInSlot'
UnitInventorySize = _native_'UnitInventorySize'

UnitDropItemPoint = _native_'UnitDropItemPoint'
UnitDropItemSlot = _native_'UnitDropItemSlot'
UnitDropItemTarget = _native_'UnitDropItemTarget'

UnitUseItem = _native_'UnitUseItem'
UnitUseItemPoint = _native_'UnitUseItemPoint'
UnitUseItemTarget = _native_'UnitUseItemTarget'

GetUnitX = _native_'GetUnitX'
GetUnitY = _native_'GetUnitY'
GetUnitLoc = _native_'GetUnitLoc'
GetUnitFacing = _native_'GetUnitFacing'
GetUnitMoveSpeed = _native_'GetUnitMoveSpeed'
GetUnitDefaultMoveSpeed = _native_'GetUnitDefaultMoveSpeed'
GetUnitState = _native_'GetUnitState'
GetOwningPlayer = _native_'GetOwningPlayer'
GetUnitTypeId = _native_'GetUnitTypeId'
GetUnitRace = _native_'GetUnitRace'
GetUnitName = _native_'GetUnitName'
GetUnitFoodUsed = _native_'GetUnitFoodUsed'
GetUnitFoodMade = _native_'GetUnitFoodMade'
GetFoodMade = _native_'GetFoodMade'
GetFoodUsed = _native_'GetFoodUsed'
SetUnitUseFood = _native_'SetUnitUseFood'

GetUnitRallyPoint = _native_'GetUnitRallyPoint'
GetUnitRallyUnit = _native_'GetUnitRallyUnit'
GetUnitRallyDestructable = _native_'GetUnitRallyDestructable'

IsUnitInGroup = _native_'IsUnitInGroup'
IsUnitInForce = _native_'IsUnitInForce'
IsUnitOwnedByPlayer = _native_'IsUnitOwnedByPlayer'
IsUnitAlly = _native_'IsUnitAlly'
IsUnitEnemy = _native_'IsUnitEnemy'
IsUnitVisible = _native_'IsUnitVisible'
IsUnitDetected = _native_'IsUnitDetected'
IsUnitInvisible = _native_'IsUnitInvisible'
IsUnitFogged = _native_'IsUnitFogged'
IsUnitMasked = _native_'IsUnitMasked'
IsUnitSelected = _native_'IsUnitSelected'
IsUnitRace = _native_'IsUnitRace'
IsUnitType = _native_'IsUnitType'
IsUnit = _native_'IsUnit'
IsUnitInRange = _native_'IsUnitInRange'
IsUnitInRangeXY = _native_'IsUnitInRangeXY'
IsUnitInRangeLoc = _native_'IsUnitInRangeLoc'
IsUnitHidden = _native_'IsUnitHidden'
IsUnitIllusion = _native_'IsUnitIllusion'

IsUnitInTransport = _native_'IsUnitInTransport'
IsUnitLoaded = _native_'IsUnitLoaded'

IsHeroUnitId = _native_'IsHeroUnitId'
IsUnitIdType = _native_'IsUnitIdType'

UnitShareVision = _native_'UnitShareVision'
UnitSuspendDecay = _native_'UnitSuspendDecay'
UnitAddType = _native_'UnitAddType'
UnitRemoveType = _native_'UnitRemoveType'

UnitAddAbility = _native_'UnitAddAbility'
UnitRemoveAbility = _native_'UnitRemoveAbility'
UnitMakeAbilityPermanent = _native_'UnitMakeAbilityPermanent'
UnitRemoveBuffs = _native_'UnitRemoveBuffs'
UnitRemoveBuffsEx = _native_'UnitRemoveBuffsEx'
UnitHasBuffsEx = _native_'UnitHasBuffsEx'
UnitCountBuffsEx = _native_'UnitCountBuffsEx'
UnitAddSleep = _native_'UnitAddSleep'
UnitCanSleep = _native_'UnitCanSleep'
UnitAddSleepPerm = _native_'UnitAddSleepPerm'
UnitCanSleepPerm = _native_'UnitCanSleepPerm'
UnitIsSleeping = _native_'UnitIsSleeping'
UnitWakeUp = _native_'UnitWakeUp'
UnitApplyTimedLife = _native_'UnitApplyTimedLife'
UnitIgnoreAlarm = _native_'UnitIgnoreAlarm'
UnitIgnoreAlarmToggled = _native_'UnitIgnoreAlarmToggled'
UnitResetCooldown = _native_'UnitResetCooldown'
UnitSetConstructionProgress = _native_'UnitSetConstructionProgress'
UnitSetUpgradeProgress = _native_'UnitSetUpgradeProgress'
UnitPauseTimedLife = _native_'UnitPauseTimedLife'
UnitSetUsesAltIcon = _native_'UnitSetUsesAltIcon'

UnitDamagePoint = _native_'UnitDamagePoint'
UnitDamageTarget = _native_'UnitDamageTarget'

IssueImmediateOrder = _native_'IssueImmediateOrder'
IssueImmediateOrderById = _native_'IssueImmediateOrderById'
IssuePointOrder = _native_'IssuePointOrder'
IssuePointOrderLoc = _native_'IssuePointOrderLoc'
IssuePointOrderById = _native_'IssuePointOrderById'
IssuePointOrderByIdLoc = _native_'IssuePointOrderByIdLoc'
IssueTargetOrder = _native_'IssueTargetOrder'
IssueTargetOrderById = _native_'IssueTargetOrderById'
IssueInstantPointOrder = _native_'IssueInstantPointOrder'
IssueInstantPointOrderById = _native_'IssueInstantPointOrderById'
IssueInstantTargetOrder = _native_'IssueInstantTargetOrder'
IssueInstantTargetOrderById = _native_'IssueInstantTargetOrderById'
IssueBuildOrder = _native_'IssueBuildOrder'
IssueBuildOrderById = _native_'IssueBuildOrderById'

IssueNeutralImmediateOrder = _native_'IssueNeutralImmediateOrder'
IssueNeutralImmediateOrderById = _native_'IssueNeutralImmediateOrderById'
IssueNeutralPointOrder = _native_'IssueNeutralPointOrder'
IssueNeutralPointOrderById = _native_'IssueNeutralPointOrderById'
IssueNeutralTargetOrder = _native_'IssueNeutralTargetOrder'
IssueNeutralTargetOrderById = _native_'IssueNeutralTargetOrderById'

GetUnitCurrentOrder = _native_'GetUnitCurrentOrder'

SetResourceAmount = _native_'SetResourceAmount'
AddResourceAmount = _native_'AddResourceAmount'
GetResourceAmount = _native_'GetResourceAmount'

WaygateGetDestinationX = _native_'WaygateGetDestinationX'
WaygateGetDestinationY = _native_'WaygateGetDestinationY'
WaygateSetDestination = _native_'WaygateSetDestination'
WaygateActivate = _native_'WaygateActivate'
WaygateIsActive = _native_'WaygateIsActive'

AddItemToAllStock = _native_'AddItemToAllStock'
AddItemToStock = _native_'AddItemToStock'
AddUnitToAllStock = _native_'AddUnitToAllStock'
AddUnitToStock = _native_'AddUnitToStock'

RemoveItemFromAllStock = _native_'RemoveItemFromAllStock'
RemoveItemFromStock = _native_'RemoveItemFromStock'
RemoveUnitFromAllStock = _native_'RemoveUnitFromAllStock'
RemoveUnitFromStock = _native_'RemoveUnitFromStock'

SetAllItemTypeSlots = _native_'SetAllItemTypeSlots'
SetAllUnitTypeSlots = _native_'SetAllUnitTypeSlots'
SetItemTypeSlots = _native_'SetItemTypeSlots'
SetUnitTypeSlots = _native_'SetUnitTypeSlots'

GetUnitUserData = _native_'GetUnitUserData'
SetUnitUserData = _native_'SetUnitUserData'

--============================================================================
-- Player API
Player = _native_'Player'
GetLocalPlayer = _native_'GetLocalPlayer'
IsPlayerAlly = _native_'IsPlayerAlly'
IsPlayerEnemy = _native_'IsPlayerEnemy'
IsPlayerInForce = _native_'IsPlayerInForce'
IsPlayerObserver = _native_'IsPlayerObserver'
IsVisibleToPlayer = _native_'IsVisibleToPlayer'
IsLocationVisibleToPlayer = _native_'IsLocationVisibleToPlayer'
IsFoggedToPlayer = _native_'IsFoggedToPlayer'
IsLocationFoggedToPlayer = _native_'IsLocationFoggedToPlayer'
IsMaskedToPlayer = _native_'IsMaskedToPlayer'
IsLocationMaskedToPlayer = _native_'IsLocationMaskedToPlayer'

GetPlayerRace = _native_'GetPlayerRace'
GetPlayerId = _native_'GetPlayerId'
GetPlayerUnitCount = _native_'GetPlayerUnitCount'
GetPlayerTypedUnitCount = _native_'GetPlayerTypedUnitCount'
GetPlayerStructureCount = _native_'GetPlayerStructureCount'
GetPlayerState = _native_'GetPlayerState'
GetPlayerScore = _native_'GetPlayerScore'
GetPlayerAlliance = _native_'GetPlayerAlliance'

GetPlayerHandicap = _native_'GetPlayerHandicap'
GetPlayerHandicapXP = _native_'GetPlayerHandicapXP'
SetPlayerHandicap = _native_'SetPlayerHandicap'
SetPlayerHandicapXP = _native_'SetPlayerHandicapXP'

SetPlayerTechMaxAllowed = _native_'SetPlayerTechMaxAllowed'
GetPlayerTechMaxAllowed = _native_'GetPlayerTechMaxAllowed'
AddPlayerTechResearched = _native_'AddPlayerTechResearched'
SetPlayerTechResearched = _native_'SetPlayerTechResearched'
GetPlayerTechResearched = _native_'GetPlayerTechResearched'
GetPlayerTechCount = _native_'GetPlayerTechCount'

SetPlayerUnitsOwner = _native_'SetPlayerUnitsOwner'
CripplePlayer = _native_'CripplePlayer'

SetPlayerAbilityAvailable = _native_'SetPlayerAbilityAvailable'

SetPlayerState = _native_'SetPlayerState'
RemovePlayer = _native_'RemovePlayer'

-- Used to store hero level data for the scorescreen
-- before units are moved to neutral passive in melee games
--
CachePlayerHeroData = _native_'CachePlayerHeroData'

--============================================================================
-- Fog of War API
SetFogStateRect = _native_'SetFogStateRect'
SetFogStateRadius = _native_'SetFogStateRadius'
SetFogStateRadiusLoc = _native_'SetFogStateRadiusLoc'
FogMaskEnable = _native_'FogMaskEnable'
IsFogMaskEnabled = _native_'IsFogMaskEnabled'
FogEnable = _native_'FogEnable'
IsFogEnabled = _native_'IsFogEnabled'

CreateFogModifierRect = _native_'CreateFogModifierRect'
CreateFogModifierRadius = _native_'CreateFogModifierRadius'
CreateFogModifierRadiusLoc = _native_'CreateFogModifierRadiusLoc'
DestroyFogModifier = _native_'DestroyFogModifier'
FogModifierStart = _native_'FogModifierStart'
FogModifierStop = _native_'FogModifierStop'

--============================================================================
-- Game API
VersionGet = _native_'VersionGet'
VersionCompatible = _native_'VersionCompatible'
VersionSupported = _native_'VersionSupported'

EndGame = _native_'EndGame'

-- Async only!
ChangeLevel = _native_'ChangeLevel'
RestartGame = _native_'RestartGame'
ReloadGame = _native_'ReloadGame'
-- %%% SetCampaignMenuRace is deprecated.  It must remain to support
-- old maps which use it, but all new maps should use SetCampaignMenuRaceEx
SetCampaignMenuRace = _native_'SetCampaignMenuRace'
SetCampaignMenuRaceEx = _native_'SetCampaignMenuRaceEx'
ForceCampaignSelectScreen = _native_'ForceCampaignSelectScreen'

LoadGame = _native_'LoadGame'
SaveGame = _native_'SaveGame'
RenameSaveDirectory = _native_'RenameSaveDirectory'
RemoveSaveDirectory = _native_'RemoveSaveDirectory'
CopySaveGame = _native_'CopySaveGame'
SaveGameExists = _native_'SaveGameExists'
SyncSelections = _native_'SyncSelections'
SetFloatGameState = _native_'SetFloatGameState'
GetFloatGameState = _native_'GetFloatGameState'
SetIntegerGameState = _native_'SetIntegerGameState'
GetIntegerGameState = _native_'GetIntegerGameState'


--============================================================================
-- Campaign API
SetTutorialCleared = _native_'SetTutorialCleared'
SetMissionAvailable = _native_'SetMissionAvailable'
SetCampaignAvailable = _native_'SetCampaignAvailable'
SetOpCinematicAvailable = _native_'SetOpCinematicAvailable'
SetEdCinematicAvailable = _native_'SetEdCinematicAvailable'
GetDefaultDifficulty = _native_'GetDefaultDifficulty'
SetDefaultDifficulty = _native_'SetDefaultDifficulty'
SetCustomCampaignButtonVisible = _native_'SetCustomCampaignButtonVisible'
GetCustomCampaignButtonVisible = _native_'GetCustomCampaignButtonVisible'
DoNotSaveReplay = _native_'DoNotSaveReplay'

--============================================================================
-- Dialog API
DialogCreate = _native_'DialogCreate'
DialogDestroy = _native_'DialogDestroy'
DialogClear = _native_'DialogClear'
DialogSetMessage = _native_'DialogSetMessage'
DialogAddButton = _native_'DialogAddButton'
DialogAddQuitButton = _native_'DialogAddQuitButton'
DialogDisplay = _native_'DialogDisplay'

-- Creates a new or reads in an existing game cache file stored
-- in the current campaign profile dir
--
ReloadGameCachesFromDisk = _native_'ReloadGameCachesFromDisk'

InitGameCache = _native_'InitGameCache'
SaveGameCache = _native_'SaveGameCache'

StoreInteger = _native_'StoreInteger'
StoreReal = _native_'StoreReal'
StoreBoolean = _native_'StoreBoolean'
StoreUnit = _native_'StoreUnit'
StoreString = _native_'StoreString'

SyncStoredInteger = _native_'SyncStoredInteger'
SyncStoredReal = _native_'SyncStoredReal'
SyncStoredBoolean = _native_'SyncStoredBoolean'
SyncStoredUnit = _native_'SyncStoredUnit'
SyncStoredString = _native_'SyncStoredString'

HaveStoredInteger = _native_'HaveStoredInteger'
HaveStoredReal = _native_'HaveStoredReal'
HaveStoredBoolean = _native_'HaveStoredBoolean'
HaveStoredUnit = _native_'HaveStoredUnit'
HaveStoredString = _native_'HaveStoredString'

FlushGameCache = _native_'FlushGameCache'
FlushStoredMission = _native_'FlushStoredMission'
FlushStoredInteger = _native_'FlushStoredInteger'
FlushStoredReal = _native_'FlushStoredReal'
FlushStoredBoolean = _native_'FlushStoredBoolean'
FlushStoredUnit = _native_'FlushStoredUnit'
FlushStoredString = _native_'FlushStoredString'

-- Will return 0 if the specified value's data is not found in the cache
GetStoredInteger = _native_'GetStoredInteger'
GetStoredReal = _native_'GetStoredReal'
GetStoredBoolean = _native_'GetStoredBoolean'
GetStoredString = _native_'GetStoredString'
RestoreUnit = _native_'RestoreUnit'


InitHashtable = _native_'InitHashtable'

SaveInteger = _native_'SaveInteger'
SaveReal = _native_'SaveReal'
SaveBoolean = _native_'SaveBoolean'
SaveStr = _native_'SaveStr'
SavePlayerHandle = _native_'SavePlayerHandle'
SaveWidgetHandle = _native_'SaveWidgetHandle'
SaveDestructableHandle = _native_'SaveDestructableHandle'
SaveItemHandle = _native_'SaveItemHandle'
SaveUnitHandle = _native_'SaveUnitHandle'
SaveAbilityHandle = _native_'SaveAbilityHandle'
SaveTimerHandle = _native_'SaveTimerHandle'
SaveTriggerHandle = _native_'SaveTriggerHandle'
SaveTriggerConditionHandle = _native_'SaveTriggerConditionHandle'
SaveTriggerActionHandle = _native_'SaveTriggerActionHandle'
SaveTriggerEventHandle = _native_'SaveTriggerEventHandle'
SaveForceHandle = _native_'SaveForceHandle'
SaveGroupHandle = _native_'SaveGroupHandle'
SaveLocationHandle = _native_'SaveLocationHandle'
SaveRectHandle = _native_'SaveRectHandle'
SaveBooleanExprHandle = _native_'SaveBooleanExprHandle'
SaveSoundHandle = _native_'SaveSoundHandle'
SaveEffectHandle = _native_'SaveEffectHandle'
SaveUnitPoolHandle = _native_'SaveUnitPoolHandle'
SaveItemPoolHandle = _native_'SaveItemPoolHandle'
SaveQuestHandle = _native_'SaveQuestHandle'
SaveQuestItemHandle = _native_'SaveQuestItemHandle'
SaveDefeatConditionHandle = _native_'SaveDefeatConditionHandle'
SaveTimerDialogHandle = _native_'SaveTimerDialogHandle'
SaveLeaderboardHandle = _native_'SaveLeaderboardHandle'
SaveMultiboardHandle = _native_'SaveMultiboardHandle'
SaveMultiboardItemHandle = _native_'SaveMultiboardItemHandle'
SaveTrackableHandle = _native_'SaveTrackableHandle'
SaveDialogHandle = _native_'SaveDialogHandle'
SaveButtonHandle = _native_'SaveButtonHandle'
SaveTextTagHandle = _native_'SaveTextTagHandle'
SaveLightningHandle = _native_'SaveLightningHandle'
SaveImageHandle = _native_'SaveImageHandle'
SaveUbersplatHandle = _native_'SaveUbersplatHandle'
SaveRegionHandle = _native_'SaveRegionHandle'
SaveFogStateHandle = _native_'SaveFogStateHandle'
SaveFogModifierHandle = _native_'SaveFogModifierHandle'
SaveAgentHandle = _native_'SaveAgentHandle'
SaveHashtableHandle = _native_'SaveHashtableHandle'


LoadInteger = _native_'LoadInteger'
LoadReal = _native_'LoadReal'
LoadBoolean = _native_'LoadBoolean'
LoadStr = _native_'LoadStr'
LoadPlayerHandle = _native_'LoadPlayerHandle'
LoadWidgetHandle = _native_'LoadWidgetHandle'
LoadDestructableHandle = _native_'LoadDestructableHandle'
LoadItemHandle = _native_'LoadItemHandle'
LoadUnitHandle = _native_'LoadUnitHandle'
LoadAbilityHandle = _native_'LoadAbilityHandle'
LoadTimerHandle = _native_'LoadTimerHandle'
LoadTriggerHandle = _native_'LoadTriggerHandle'
LoadTriggerConditionHandle = _native_'LoadTriggerConditionHandle'
LoadTriggerActionHandle = _native_'LoadTriggerActionHandle'
LoadTriggerEventHandle = _native_'LoadTriggerEventHandle'
LoadForceHandle = _native_'LoadForceHandle'
LoadGroupHandle = _native_'LoadGroupHandle'
LoadLocationHandle = _native_'LoadLocationHandle'
LoadRectHandle = _native_'LoadRectHandle'
LoadBooleanExprHandle = _native_'LoadBooleanExprHandle'
LoadSoundHandle = _native_'LoadSoundHandle'
LoadEffectHandle = _native_'LoadEffectHandle'
LoadUnitPoolHandle = _native_'LoadUnitPoolHandle'
LoadItemPoolHandle = _native_'LoadItemPoolHandle'
LoadQuestHandle = _native_'LoadQuestHandle'
LoadQuestItemHandle = _native_'LoadQuestItemHandle'
LoadDefeatConditionHandle = _native_'LoadDefeatConditionHandle'
LoadTimerDialogHandle = _native_'LoadTimerDialogHandle'
LoadLeaderboardHandle = _native_'LoadLeaderboardHandle'
LoadMultiboardHandle = _native_'LoadMultiboardHandle'
LoadMultiboardItemHandle = _native_'LoadMultiboardItemHandle'
LoadTrackableHandle = _native_'LoadTrackableHandle'
LoadDialogHandle = _native_'LoadDialogHandle'
LoadButtonHandle = _native_'LoadButtonHandle'
LoadTextTagHandle = _native_'LoadTextTagHandle'
LoadLightningHandle = _native_'LoadLightningHandle'
LoadImageHandle = _native_'LoadImageHandle'
LoadUbersplatHandle = _native_'LoadUbersplatHandle'
LoadRegionHandle = _native_'LoadRegionHandle'
LoadFogStateHandle = _native_'LoadFogStateHandle'
LoadFogModifierHandle = _native_'LoadFogModifierHandle'
LoadHashtableHandle = _native_'LoadHashtableHandle'

HaveSavedInteger = _native_'HaveSavedInteger'
HaveSavedReal = _native_'HaveSavedReal'
HaveSavedBoolean = _native_'HaveSavedBoolean'
HaveSavedString = _native_'HaveSavedString'
HaveSavedHandle = _native_'HaveSavedHandle'

RemoveSavedInteger = _native_'RemoveSavedInteger'
RemoveSavedReal = _native_'RemoveSavedReal'
RemoveSavedBoolean = _native_'RemoveSavedBoolean'
RemoveSavedString = _native_'RemoveSavedString'
RemoveSavedHandle = _native_'RemoveSavedHandle'

FlushParentHashtable = _native_'FlushParentHashtable'
FlushChildHashtable = _native_'FlushChildHashtable'


--============================================================================
-- Randomization API
GetRandomInt = _native_'GetRandomInt'
GetRandomReal = _native_'GetRandomReal'

CreateUnitPool = _native_'CreateUnitPool'
DestroyUnitPool = _native_'DestroyUnitPool'
UnitPoolAddUnitType = _native_'UnitPoolAddUnitType'
UnitPoolRemoveUnitType = _native_'UnitPoolRemoveUnitType'
PlaceRandomUnit = _native_'PlaceRandomUnit'

CreateItemPool = _native_'CreateItemPool'
DestroyItemPool = _native_'DestroyItemPool'
ItemPoolAddItemType = _native_'ItemPoolAddItemType'
ItemPoolRemoveItemType = _native_'ItemPoolRemoveItemType'
PlaceRandomItem = _native_'PlaceRandomItem'

-- Choose any random unit/item. (NP means Neutral Passive)
ChooseRandomCreep = _native_'ChooseRandomCreep'
ChooseRandomNPBuilding = _native_'ChooseRandomNPBuilding'
ChooseRandomItem = _native_'ChooseRandomItem'
ChooseRandomItemEx = _native_'ChooseRandomItemEx'
SetRandomSeed = _native_'SetRandomSeed'

--============================================================================
-- Visual API
SetTerrainFog = _native_'SetTerrainFog'
ResetTerrainFog = _native_'ResetTerrainFog'

SetUnitFog = _native_'SetUnitFog'
SetTerrainFogEx = _native_'SetTerrainFogEx'
DisplayTextToPlayer = _native_'DisplayTextToPlayer'
DisplayTimedTextToPlayer = _native_'DisplayTimedTextToPlayer'
DisplayTimedTextFromPlayer = _native_'DisplayTimedTextFromPlayer'
ClearTextMessages = _native_'ClearTextMessages'
SetDayNightModels = _native_'SetDayNightModels'
SetSkyModel = _native_'SetSkyModel'
EnableUserControl = _native_'EnableUserControl'
EnableUserUI = _native_'EnableUserUI'
SuspendTimeOfDay = _native_'SuspendTimeOfDay'
SetTimeOfDayScale = _native_'SetTimeOfDayScale'
GetTimeOfDayScale = _native_'GetTimeOfDayScale'
ShowInterface = _native_'ShowInterface'
PauseGame = _native_'PauseGame'
UnitAddIndicator = _native_'UnitAddIndicator'
AddIndicator = _native_'AddIndicator'
PingMinimap = _native_'PingMinimap'
PingMinimapEx = _native_'PingMinimapEx'
EnableOcclusion = _native_'EnableOcclusion'
SetIntroShotText = _native_'SetIntroShotText'
SetIntroShotModel = _native_'SetIntroShotModel'
EnableWorldFogBoundary = _native_'EnableWorldFogBoundary'
PlayModelCinematic = _native_'PlayModelCinematic'
PlayCinematic = _native_'PlayCinematic'
ForceUIKey = _native_'ForceUIKey'
ForceUICancel = _native_'ForceUICancel'
DisplayLoadDialog = _native_'DisplayLoadDialog'
SetAltMinimapIcon = _native_'SetAltMinimapIcon'
DisableRestartMission = _native_'DisableRestartMission'

CreateTextTag = _native_'CreateTextTag'
DestroyTextTag = _native_'DestroyTextTag'
SetTextTagText = _native_'SetTextTagText'
SetTextTagPos = _native_'SetTextTagPos'
SetTextTagPosUnit = _native_'SetTextTagPosUnit'
SetTextTagColor = _native_'SetTextTagColor'
SetTextTagVelocity = _native_'SetTextTagVelocity'
SetTextTagVisibility = _native_'SetTextTagVisibility'
SetTextTagSuspended = _native_'SetTextTagSuspended'
SetTextTagPermanent = _native_'SetTextTagPermanent'
SetTextTagAge = _native_'SetTextTagAge'
SetTextTagLifespan = _native_'SetTextTagLifespan'
SetTextTagFadepoint = _native_'SetTextTagFadepoint'

SetReservedLocalHeroButtons = _native_'SetReservedLocalHeroButtons'
GetAllyColorFilterState = _native_'GetAllyColorFilterState'
SetAllyColorFilterState = _native_'SetAllyColorFilterState'
GetCreepCampFilterState = _native_'GetCreepCampFilterState'
SetCreepCampFilterState = _native_'SetCreepCampFilterState'
EnableMinimapFilterButtons = _native_'EnableMinimapFilterButtons'
EnableDragSelect = _native_'EnableDragSelect'
EnablePreSelect = _native_'EnablePreSelect'
EnableSelect = _native_'EnableSelect'

--============================================================================
-- Trackable API
CreateTrackable = _native_'CreateTrackable'

--============================================================================
-- Quest API
CreateQuest = _native_'CreateQuest'
DestroyQuest = _native_'DestroyQuest'
QuestSetTitle = _native_'QuestSetTitle'
QuestSetDescription = _native_'QuestSetDescription'
QuestSetIconPath = _native_'QuestSetIconPath'

QuestSetRequired = _native_'QuestSetRequired'
QuestSetCompleted = _native_'QuestSetCompleted'
QuestSetDiscovered = _native_'QuestSetDiscovered'
QuestSetFailed = _native_'QuestSetFailed'
QuestSetEnabled = _native_'QuestSetEnabled'

IsQuestRequired = _native_'IsQuestRequired'
IsQuestCompleted = _native_'IsQuestCompleted'
IsQuestDiscovered = _native_'IsQuestDiscovered'
IsQuestFailed = _native_'IsQuestFailed'
IsQuestEnabled = _native_'IsQuestEnabled'

QuestCreateItem = _native_'QuestCreateItem'
QuestItemSetDescription = _native_'QuestItemSetDescription'
QuestItemSetCompleted = _native_'QuestItemSetCompleted'

IsQuestItemCompleted = _native_'IsQuestItemCompleted'

CreateDefeatCondition = _native_'CreateDefeatCondition'
DestroyDefeatCondition = _native_'DestroyDefeatCondition'
DefeatConditionSetDescription = _native_'DefeatConditionSetDescription'

FlashQuestDialogButton = _native_'FlashQuestDialogButton'
ForceQuestDialogUpdate = _native_'ForceQuestDialogUpdate'

--============================================================================
-- Timer Dialog API
CreateTimerDialog = _native_'CreateTimerDialog'
DestroyTimerDialog = _native_'DestroyTimerDialog'
TimerDialogSetTitle = _native_'TimerDialogSetTitle'
TimerDialogSetTitleColor = _native_'TimerDialogSetTitleColor'
TimerDialogSetTimeColor = _native_'TimerDialogSetTimeColor'
TimerDialogSetSpeed = _native_'TimerDialogSetSpeed'
TimerDialogDisplay = _native_'TimerDialogDisplay'
IsTimerDialogDisplayed = _native_'IsTimerDialogDisplayed'
TimerDialogSetRealTimeRemaining = _native_'TimerDialogSetRealTimeRemaining'

--============================================================================
-- Leaderboard API

-- Create a leaderboard object
CreateLeaderboard = _native_'CreateLeaderboard'
DestroyLeaderboard = _native_'DestroyLeaderboard'

LeaderboardDisplay = _native_'LeaderboardDisplay'
IsLeaderboardDisplayed = _native_'IsLeaderboardDisplayed'

LeaderboardGetItemCount = _native_'LeaderboardGetItemCount'

LeaderboardSetSizeByItemCount = _native_'LeaderboardSetSizeByItemCount'
LeaderboardAddItem = _native_'LeaderboardAddItem'
LeaderboardRemoveItem = _native_'LeaderboardRemoveItem'
LeaderboardRemovePlayerItem = _native_'LeaderboardRemovePlayerItem'
LeaderboardClear = _native_'LeaderboardClear'

LeaderboardSortItemsByValue = _native_'LeaderboardSortItemsByValue'
LeaderboardSortItemsByPlayer = _native_'LeaderboardSortItemsByPlayer'
LeaderboardSortItemsByLabel = _native_'LeaderboardSortItemsByLabel'

LeaderboardHasPlayerItem = _native_'LeaderboardHasPlayerItem'
LeaderboardGetPlayerIndex = _native_'LeaderboardGetPlayerIndex'
LeaderboardSetLabel = _native_'LeaderboardSetLabel'
LeaderboardGetLabelText = _native_'LeaderboardGetLabelText'

PlayerSetLeaderboard = _native_'PlayerSetLeaderboard'
PlayerGetLeaderboard = _native_'PlayerGetLeaderboard'

LeaderboardSetLabelColor = _native_'LeaderboardSetLabelColor'
LeaderboardSetValueColor = _native_'LeaderboardSetValueColor'
LeaderboardSetStyle = _native_'LeaderboardSetStyle'

LeaderboardSetItemValue = _native_'LeaderboardSetItemValue'
LeaderboardSetItemLabel = _native_'LeaderboardSetItemLabel'
LeaderboardSetItemStyle = _native_'LeaderboardSetItemStyle'
LeaderboardSetItemLabelColor = _native_'LeaderboardSetItemLabelColor'
LeaderboardSetItemValueColor = _native_'LeaderboardSetItemValueColor'

--============================================================================
-- Multiboard API
--============================================================================

-- Create a multiboard object
CreateMultiboard = _native_'CreateMultiboard'
DestroyMultiboard = _native_'DestroyMultiboard'

MultiboardDisplay = _native_'MultiboardDisplay'
IsMultiboardDisplayed = _native_'IsMultiboardDisplayed'

MultiboardMinimize = _native_'MultiboardMinimize'
IsMultiboardMinimized = _native_'IsMultiboardMinimized'
MultiboardClear = _native_'MultiboardClear'

MultiboardSetTitleText = _native_'MultiboardSetTitleText'
MultiboardGetTitleText = _native_'MultiboardGetTitleText'
MultiboardSetTitleTextColor = _native_'MultiboardSetTitleTextColor'

MultiboardGetRowCount = _native_'MultiboardGetRowCount'
MultiboardGetColumnCount = _native_'MultiboardGetColumnCount'

MultiboardSetColumnCount = _native_'MultiboardSetColumnCount'
MultiboardSetRowCount = _native_'MultiboardSetRowCount'

-- broadcast settings to all items
MultiboardSetItemsStyle = _native_'MultiboardSetItemsStyle'
MultiboardSetItemsValue = _native_'MultiboardSetItemsValue'
MultiboardSetItemsValueColor = _native_'MultiboardSetItemsValueColor'
MultiboardSetItemsWidth = _native_'MultiboardSetItemsWidth'
MultiboardSetItemsIcon = _native_'MultiboardSetItemsIcon'


-- funcs for modifying individual items
MultiboardGetItem = _native_'MultiboardGetItem'
MultiboardReleaseItem = _native_'MultiboardReleaseItem'

MultiboardSetItemStyle = _native_'MultiboardSetItemStyle'
MultiboardSetItemValue = _native_'MultiboardSetItemValue'
MultiboardSetItemValueColor = _native_'MultiboardSetItemValueColor'
MultiboardSetItemWidth = _native_'MultiboardSetItemWidth'
MultiboardSetItemIcon = _native_'MultiboardSetItemIcon'

-- meant to unequivocally suspend display of existing and
-- subsequently displayed multiboards
--
MultiboardSuppressDisplay = _native_'MultiboardSuppressDisplay'

--============================================================================
-- Camera API
SetCameraPosition = _native_'SetCameraPosition'
SetCameraQuickPosition = _native_'SetCameraQuickPosition'
SetCameraBounds = _native_'SetCameraBounds'
StopCamera = _native_'StopCamera'
ResetToGameCamera = _native_'ResetToGameCamera'
PanCameraTo = _native_'PanCameraTo'
PanCameraToTimed = _native_'PanCameraToTimed'
PanCameraToWithZ = _native_'PanCameraToWithZ'
PanCameraToTimedWithZ = _native_'PanCameraToTimedWithZ'
SetCinematicCamera = _native_'SetCinematicCamera'
SetCameraRotateMode = _native_'SetCameraRotateMode'
SetCameraField = _native_'SetCameraField'
AdjustCameraField = _native_'AdjustCameraField'
SetCameraTargetController = _native_'SetCameraTargetController'
SetCameraOrientController = _native_'SetCameraOrientController'

CreateCameraSetup = _native_'CreateCameraSetup'
CameraSetupSetField = _native_'CameraSetupSetField'
CameraSetupGetField = _native_'CameraSetupGetField'
CameraSetupSetDestPosition = _native_'CameraSetupSetDestPosition'
CameraSetupGetDestPositionLoc = _native_'CameraSetupGetDestPositionLoc'
CameraSetupGetDestPositionX = _native_'CameraSetupGetDestPositionX'
CameraSetupGetDestPositionY = _native_'CameraSetupGetDestPositionY'
CameraSetupApply = _native_'CameraSetupApply'
CameraSetupApplyWithZ = _native_'CameraSetupApplyWithZ'
CameraSetupApplyForceDuration = _native_'CameraSetupApplyForceDuration'
CameraSetupApplyForceDurationWithZ = _native_'CameraSetupApplyForceDurationWithZ'

CameraSetTargetNoise = _native_'CameraSetTargetNoise'
CameraSetSourceNoise = _native_'CameraSetSourceNoise'

CameraSetTargetNoiseEx = _native_'CameraSetTargetNoiseEx'
CameraSetSourceNoiseEx = _native_'CameraSetSourceNoiseEx'

CameraSetSmoothingFactor = _native_'CameraSetSmoothingFactor'

SetCineFilterTexture = _native_'SetCineFilterTexture'
SetCineFilterBlendMode = _native_'SetCineFilterBlendMode'
SetCineFilterTexMapFlags = _native_'SetCineFilterTexMapFlags'
SetCineFilterStartUV = _native_'SetCineFilterStartUV'
SetCineFilterEndUV = _native_'SetCineFilterEndUV'
SetCineFilterStartColor = _native_'SetCineFilterStartColor'
SetCineFilterEndColor = _native_'SetCineFilterEndColor'
SetCineFilterDuration = _native_'SetCineFilterDuration'
DisplayCineFilter = _native_'DisplayCineFilter'
IsCineFilterDisplayed = _native_'IsCineFilterDisplayed'

SetCinematicScene = _native_'SetCinematicScene'
EndCinematicScene = _native_'EndCinematicScene'
ForceCinematicSubtitles = _native_'ForceCinematicSubtitles'

GetCameraMargin = _native_'GetCameraMargin'

-- These return values for the local players camera only...
GetCameraBoundMinX = _native_'GetCameraBoundMinX'
GetCameraBoundMinY = _native_'GetCameraBoundMinY'
GetCameraBoundMaxX = _native_'GetCameraBoundMaxX'
GetCameraBoundMaxY = _native_'GetCameraBoundMaxY'
GetCameraField = _native_'GetCameraField'
GetCameraTargetPositionX = _native_'GetCameraTargetPositionX'
GetCameraTargetPositionY = _native_'GetCameraTargetPositionY'
GetCameraTargetPositionZ = _native_'GetCameraTargetPositionZ'
GetCameraTargetPositionLoc = _native_'GetCameraTargetPositionLoc'
GetCameraEyePositionX = _native_'GetCameraEyePositionX'
GetCameraEyePositionY = _native_'GetCameraEyePositionY'
GetCameraEyePositionZ = _native_'GetCameraEyePositionZ'
GetCameraEyePositionLoc = _native_'GetCameraEyePositionLoc'

--============================================================================
-- Sound API
--
NewSoundEnvironment = _native_'NewSoundEnvironment'

CreateSound = _native_'CreateSound'
CreateSoundFilenameWithLabel = _native_'CreateSoundFilenameWithLabel'
CreateSoundFromLabel = _native_'CreateSoundFromLabel'
CreateMIDISound = _native_'CreateMIDISound'

SetSoundParamsFromLabel = _native_'SetSoundParamsFromLabel'
SetSoundDistanceCutoff = _native_'SetSoundDistanceCutoff'
SetSoundChannel = _native_'SetSoundChannel'
SetSoundVolume = _native_'SetSoundVolume'
SetSoundPitch = _native_'SetSoundPitch'

-- the following method must be called immediately after calling "StartSound" 
SetSoundPlayPosition = _native_'SetSoundPlayPosition'

-- these calls are only valid if the sound was created with 3d enabled
SetSoundDistances = _native_'SetSoundDistances'
SetSoundConeAngles = _native_'SetSoundConeAngles'
SetSoundConeOrientation = _native_'SetSoundConeOrientation'
SetSoundPosition = _native_'SetSoundPosition'
SetSoundVelocity = _native_'SetSoundVelocity'
AttachSoundToUnit = _native_'AttachSoundToUnit'

StartSound = _native_'StartSound'
StopSound = _native_'StopSound'
KillSoundWhenDone = _native_'KillSoundWhenDone'

-- Music Interface. Note that if music is disabled, these calls do nothing
SetMapMusic = _native_'SetMapMusic'
ClearMapMusic = _native_'ClearMapMusic'

PlayMusic = _native_'PlayMusic'
PlayMusicEx = _native_'PlayMusicEx'
StopMusic = _native_'StopMusic'
ResumeMusic = _native_'ResumeMusic'

PlayThematicMusic = _native_'PlayThematicMusic'
PlayThematicMusicEx = _native_'PlayThematicMusicEx'
EndThematicMusic = _native_'EndThematicMusic'

SetMusicVolume = _native_'SetMusicVolume'
SetMusicPlayPosition = _native_'SetMusicPlayPosition'
SetThematicMusicPlayPosition = _native_'SetThematicMusicPlayPosition'

-- other music and sound calls
SetSoundDuration = _native_'SetSoundDuration'
GetSoundDuration = _native_'GetSoundDuration'
GetSoundFileDuration = _native_'GetSoundFileDuration'

VolumeGroupSetVolume = _native_'VolumeGroupSetVolume'
VolumeGroupReset = _native_'VolumeGroupReset'

GetSoundIsPlaying = _native_'GetSoundIsPlaying'
GetSoundIsLoading = _native_'GetSoundIsLoading'

RegisterStackedSound = _native_'RegisterStackedSound'
UnregisterStackedSound = _native_'UnregisterStackedSound'

--============================================================================
-- Effects API
--
AddWeatherEffect = _native_'AddWeatherEffect'
RemoveWeatherEffect = _native_'RemoveWeatherEffect'
EnableWeatherEffect = _native_'EnableWeatherEffect'

TerrainDeformCrater = _native_'TerrainDeformCrater'
TerrainDeformRipple = _native_'TerrainDeformRipple'
TerrainDeformWave = _native_'TerrainDeformWave'
TerrainDeformRandom = _native_'TerrainDeformRandom'
TerrainDeformStop = _native_'TerrainDeformStop'
TerrainDeformStopAll = _native_'TerrainDeformStopAll'

AddSpecialEffect = _native_'AddSpecialEffect'
AddSpecialEffectLoc = _native_'AddSpecialEffectLoc'
AddSpecialEffectTarget = _native_'AddSpecialEffectTarget'
DestroyEffect = _native_'DestroyEffect'

AddSpellEffect = _native_'AddSpellEffect'
AddSpellEffectLoc = _native_'AddSpellEffectLoc'
AddSpellEffectById = _native_'AddSpellEffectById'
AddSpellEffectByIdLoc = _native_'AddSpellEffectByIdLoc'
AddSpellEffectTarget = _native_'AddSpellEffectTarget'
AddSpellEffectTargetById = _native_'AddSpellEffectTargetById'

AddLightning = _native_'AddLightning'
AddLightningEx = _native_'AddLightningEx'
DestroyLightning = _native_'DestroyLightning'
MoveLightning = _native_'MoveLightning'
MoveLightningEx = _native_'MoveLightningEx'
GetLightningColorA = _native_'GetLightningColorA'
GetLightningColorR = _native_'GetLightningColorR'
GetLightningColorG = _native_'GetLightningColorG'
GetLightningColorB = _native_'GetLightningColorB'
SetLightningColor = _native_'SetLightningColor'

GetAbilityEffect = _native_'GetAbilityEffect'
GetAbilityEffectById = _native_'GetAbilityEffectById'
GetAbilitySound = _native_'GetAbilitySound'
GetAbilitySoundById = _native_'GetAbilitySoundById'

--============================================================================
-- Terrain API
--
GetTerrainCliffLevel = _native_'GetTerrainCliffLevel'
SetWaterBaseColor = _native_'SetWaterBaseColor'
SetWaterDeforms = _native_'SetWaterDeforms'
GetTerrainType = _native_'GetTerrainType'
GetTerrainVariance = _native_'GetTerrainVariance'
SetTerrainType = _native_'SetTerrainType'
IsTerrainPathable = _native_'IsTerrainPathable'
SetTerrainPathable = _native_'SetTerrainPathable'

--============================================================================
-- Image API
--
CreateImage = _native_'CreateImage'
DestroyImage = _native_'DestroyImage'
ShowImage = _native_'ShowImage'
SetImageConstantHeight = _native_'SetImageConstantHeight'
SetImagePosition = _native_'SetImagePosition'
SetImageColor = _native_'SetImageColor'
SetImageRender = _native_'SetImageRender'
SetImageRenderAlways = _native_'SetImageRenderAlways'
SetImageAboveWater = _native_'SetImageAboveWater'
SetImageType = _native_'SetImageType'

--============================================================================
-- Ubersplat API
--
CreateUbersplat = _native_'CreateUbersplat'
DestroyUbersplat = _native_'DestroyUbersplat'
ResetUbersplat = _native_'ResetUbersplat'
FinishUbersplat = _native_'FinishUbersplat'
ShowUbersplat = _native_'ShowUbersplat'
SetUbersplatRender = _native_'SetUbersplatRender'
SetUbersplatRenderAlways = _native_'SetUbersplatRenderAlways'

--============================================================================
-- Blight API
--
SetBlight = _native_'SetBlight'
SetBlightRect = _native_'SetBlightRect'
SetBlightPoint = _native_'SetBlightPoint'
SetBlightLoc = _native_'SetBlightLoc'
CreateBlightedGoldmine = _native_'CreateBlightedGoldmine'
IsPointBlighted = _native_'IsPointBlighted'

--============================================================================
-- Doodad API
--
SetDoodadAnimation = _native_'SetDoodadAnimation'
SetDoodadAnimationRect = _native_'SetDoodadAnimationRect'

--============================================================================
-- Computer AI interface
--
StartMeleeAI = _native_'StartMeleeAI'
StartCampaignAI = _native_'StartCampaignAI'
CommandAI = _native_'CommandAI'
PauseCompAI = _native_'PauseCompAI'
GetAIDifficulty = _native_'GetAIDifficulty'

RemoveGuardPosition = _native_'RemoveGuardPosition'
RecycleGuardPosition = _native_'RecycleGuardPosition'
RemoveAllGuardPositions = _native_'RemoveAllGuardPositions'

--============================================================================
Cheat = _native_'Cheat'
IsNoVictoryCheat = _native_'IsNoVictoryCheat'
IsNoDefeatCheat = _native_'IsNoDefeatCheat'

Preload = _native_'Preload'
PreloadEnd = _native_'PreloadEnd'

PreloadStart = _native_'PreloadStart'
PreloadRefresh = _native_'PreloadRefresh'
PreloadEndEx = _native_'PreloadEndEx'

PreloadGenClear = _native_'PreloadGenClear'
PreloadGenStart = _native_'PreloadGenStart'
PreloadGenEnd = _native_'PreloadGenEnd'
Preloader = _native_'Preloader'
