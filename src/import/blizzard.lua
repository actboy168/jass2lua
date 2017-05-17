--===========================================================================
-- Blizzard.j ( define Jass2 functions that need to be in every map script )
--===========================================================================



-------------------------------------------------------------------------
-- Constants
--

-- Misc constants
bj_PI = 3.14159
bj_E = 2.71828
bj_CELLWIDTH = 128.0
bj_CLIFFHEIGHT = 128.0
bj_UNIT_FACING = 270.0
bj_RADTODEG = 180.0 / bj_PI
bj_DEGTORAD = bj_PI / 180.0
bj_TEXT_DELAY_QUEST = 20.0
bj_TEXT_DELAY_QUESTUPDATE = 20.0
bj_TEXT_DELAY_QUESTDONE = 20.0
bj_TEXT_DELAY_QUESTFAILED = 20.0
bj_TEXT_DELAY_QUESTREQUIREMENT = 20.0
bj_TEXT_DELAY_MISSIONFAILED = 20.0
bj_TEXT_DELAY_ALWAYSHINT = 12.0
bj_TEXT_DELAY_HINT = 12.0
bj_TEXT_DELAY_SECRET = 10.0
bj_TEXT_DELAY_UNITACQUIRED = 15.0
bj_TEXT_DELAY_UNITAVAILABLE = 10.0
bj_TEXT_DELAY_ITEMACQUIRED = 10.0
bj_TEXT_DELAY_WARNING = 12.0
bj_QUEUE_DELAY_QUEST = 5.0
bj_QUEUE_DELAY_HINT = 5.0
bj_QUEUE_DELAY_SECRET = 3.0
bj_HANDICAP_EASY = 60.0
bj_GAME_STARTED_THRESHOLD = 0.01
bj_WAIT_FOR_COND_MIN_INTERVAL = 0.1
bj_POLLED_WAIT_INTERVAL = 0.1
bj_POLLED_WAIT_SKIP_THRESHOLD = 2.0

-- Game constants
bj_MAX_INVENTORY = 6
bj_MAX_PLAYERS = 12
bj_PLAYER_NEUTRAL_VICTIM = 13
bj_PLAYER_NEUTRAL_EXTRA = 14
bj_MAX_PLAYER_SLOTS = 16
bj_MAX_SKELETONS = 25
bj_MAX_STOCK_ITEM_SLOTS = 11
bj_MAX_STOCK_UNIT_SLOTS = 11
bj_MAX_ITEM_LEVEL = 10

-- Ideally these would be looked up from Units/MiscData.txt,
-- but there is currently no script functionality exposed to do that
bj_TOD_DAWN = 6.0
bj_TOD_DUSK = 18.0

-- Melee game settings:
--   - Starting Time of Day (TOD)
--   - Starting Gold
--   - Starting Lumber
--   - Starting Hero Tokens (free heroes)
--   - Max heroes allowed per player
--   - Max heroes allowed per hero type
--   - Distance from start loc to search for nearby mines
--
bj_MELEE_STARTING_TOD = 8.0
bj_MELEE_STARTING_GOLD_V0 = 750
bj_MELEE_STARTING_GOLD_V1 = 500
bj_MELEE_STARTING_LUMBER_V0 = 200
bj_MELEE_STARTING_LUMBER_V1 = 150
bj_MELEE_STARTING_HERO_TOKENS = 1
bj_MELEE_HERO_LIMIT = 3
bj_MELEE_HERO_TYPE_LIMIT = 1
bj_MELEE_MINE_SEARCH_RADIUS = 2000
bj_MELEE_CLEAR_UNITS_RADIUS = 1500
bj_MELEE_CRIPPLE_TIMEOUT = 120.0
bj_MELEE_CRIPPLE_MSG_DURATION = 20.0
bj_MELEE_MAX_TWINKED_HEROES_V0 = 3
bj_MELEE_MAX_TWINKED_HEROES_V1 = 1

-- Delay between a creep's death and the time it may drop an item.
bj_CREEP_ITEM_DELAY = 0.5

-- Timing settings for Marketplace inventories.
bj_STOCK_RESTOCK_INITIAL_DELAY = 120
bj_STOCK_RESTOCK_INTERVAL = 30
bj_STOCK_MAX_ITERATIONS = 20

-- Max events registered by a single "dest dies in region" event.
bj_MAX_DEST_IN_REGION_EVENTS = 64

-- Camera settings
bj_CAMERA_MIN_FARZ = 100
bj_CAMERA_DEFAULT_DISTANCE = 1650
bj_CAMERA_DEFAULT_FARZ = 5000
bj_CAMERA_DEFAULT_AOA = 304
bj_CAMERA_DEFAULT_FOV = 70
bj_CAMERA_DEFAULT_ROLL = 0
bj_CAMERA_DEFAULT_ROTATION = 90

-- Rescue
bj_RESCUE_PING_TIME = 2.0

-- Transmission behavior settings
bj_NOTHING_SOUND_DURATION = 5.0
bj_TRANSMISSION_PING_TIME = 1.0
bj_TRANSMISSION_IND_RED = 255
bj_TRANSMISSION_IND_BLUE = 255
bj_TRANSMISSION_IND_GREEN = 255
bj_TRANSMISSION_IND_ALPHA = 255
bj_TRANSMISSION_PORT_HANGTIME = 1.5

-- Cinematic mode settings
bj_CINEMODE_INTERFACEFADE = 0.5
bj_CINEMODE_GAMESPEED = MAP_SPEED_NORMAL

-- Cinematic mode volume levels
bj_CINEMODE_VOLUME_UNITMOVEMENT = 0.4
bj_CINEMODE_VOLUME_UNITSOUNDS = 0.0
bj_CINEMODE_VOLUME_COMBAT = 0.4
bj_CINEMODE_VOLUME_SPELLS = 0.4
bj_CINEMODE_VOLUME_UI = 0.0
bj_CINEMODE_VOLUME_MUSIC = 0.55
bj_CINEMODE_VOLUME_AMBIENTSOUNDS = 1.0
bj_CINEMODE_VOLUME_FIRE = 0.6

-- Speech mode volume levels
bj_SPEECH_VOLUME_UNITMOVEMENT = 0.25
bj_SPEECH_VOLUME_UNITSOUNDS = 0.0
bj_SPEECH_VOLUME_COMBAT = 0.25
bj_SPEECH_VOLUME_SPELLS = 0.25
bj_SPEECH_VOLUME_UI = 0.0
bj_SPEECH_VOLUME_MUSIC = 0.55
bj_SPEECH_VOLUME_AMBIENTSOUNDS = 1.0
bj_SPEECH_VOLUME_FIRE = 0.6

-- Smart pan settings
bj_SMARTPAN_TRESHOLD_PAN = 500
bj_SMARTPAN_TRESHOLD_SNAP = 3500

-- QueuedTriggerExecute settings
bj_MAX_QUEUED_TRIGGERS = 100
bj_QUEUED_TRIGGER_TIMEOUT = 180.0

-- Campaign indexing constants
bj_CAMPAIGN_INDEX_T = 0
bj_CAMPAIGN_INDEX_H = 1
bj_CAMPAIGN_INDEX_U = 2
bj_CAMPAIGN_INDEX_O = 3
bj_CAMPAIGN_INDEX_N = 4
bj_CAMPAIGN_INDEX_XN = 5
bj_CAMPAIGN_INDEX_XH = 6
bj_CAMPAIGN_INDEX_XU = 7
bj_CAMPAIGN_INDEX_XO = 8

-- Campaign offset constants (for mission indexing)
bj_CAMPAIGN_OFFSET_T = 0
bj_CAMPAIGN_OFFSET_H = 1
bj_CAMPAIGN_OFFSET_U = 2
bj_CAMPAIGN_OFFSET_O = 3
bj_CAMPAIGN_OFFSET_N = 4
bj_CAMPAIGN_OFFSET_XN = 0
bj_CAMPAIGN_OFFSET_XH = 1
bj_CAMPAIGN_OFFSET_XU = 2
bj_CAMPAIGN_OFFSET_XO = 3

-- Mission indexing constants
-- Tutorial
bj_MISSION_INDEX_T00 = bj_CAMPAIGN_OFFSET_T * 1000 + 0
bj_MISSION_INDEX_T01 = bj_CAMPAIGN_OFFSET_T * 1000 + 1
-- Human
bj_MISSION_INDEX_H00 = bj_CAMPAIGN_OFFSET_H * 1000 + 0
bj_MISSION_INDEX_H01 = bj_CAMPAIGN_OFFSET_H * 1000 + 1
bj_MISSION_INDEX_H02 = bj_CAMPAIGN_OFFSET_H * 1000 + 2
bj_MISSION_INDEX_H03 = bj_CAMPAIGN_OFFSET_H * 1000 + 3
bj_MISSION_INDEX_H04 = bj_CAMPAIGN_OFFSET_H * 1000 + 4
bj_MISSION_INDEX_H05 = bj_CAMPAIGN_OFFSET_H * 1000 + 5
bj_MISSION_INDEX_H06 = bj_CAMPAIGN_OFFSET_H * 1000 + 6
bj_MISSION_INDEX_H07 = bj_CAMPAIGN_OFFSET_H * 1000 + 7
bj_MISSION_INDEX_H08 = bj_CAMPAIGN_OFFSET_H * 1000 + 8
bj_MISSION_INDEX_H09 = bj_CAMPAIGN_OFFSET_H * 1000 + 9
bj_MISSION_INDEX_H10 = bj_CAMPAIGN_OFFSET_H * 1000 + 10
bj_MISSION_INDEX_H11 = bj_CAMPAIGN_OFFSET_H * 1000 + 11
-- Undead
bj_MISSION_INDEX_U00 = bj_CAMPAIGN_OFFSET_U * 1000 + 0
bj_MISSION_INDEX_U01 = bj_CAMPAIGN_OFFSET_U * 1000 + 1
bj_MISSION_INDEX_U02 = bj_CAMPAIGN_OFFSET_U * 1000 + 2
bj_MISSION_INDEX_U03 = bj_CAMPAIGN_OFFSET_U * 1000 + 3
bj_MISSION_INDEX_U05 = bj_CAMPAIGN_OFFSET_U * 1000 + 4
bj_MISSION_INDEX_U07 = bj_CAMPAIGN_OFFSET_U * 1000 + 5
bj_MISSION_INDEX_U08 = bj_CAMPAIGN_OFFSET_U * 1000 + 6
bj_MISSION_INDEX_U09 = bj_CAMPAIGN_OFFSET_U * 1000 + 7
bj_MISSION_INDEX_U10 = bj_CAMPAIGN_OFFSET_U * 1000 + 8
bj_MISSION_INDEX_U11 = bj_CAMPAIGN_OFFSET_U * 1000 + 9
-- Orc
bj_MISSION_INDEX_O00 = bj_CAMPAIGN_OFFSET_O * 1000 + 0
bj_MISSION_INDEX_O01 = bj_CAMPAIGN_OFFSET_O * 1000 + 1
bj_MISSION_INDEX_O02 = bj_CAMPAIGN_OFFSET_O * 1000 + 2
bj_MISSION_INDEX_O03 = bj_CAMPAIGN_OFFSET_O * 1000 + 3
bj_MISSION_INDEX_O04 = bj_CAMPAIGN_OFFSET_O * 1000 + 4
bj_MISSION_INDEX_O05 = bj_CAMPAIGN_OFFSET_O * 1000 + 5
bj_MISSION_INDEX_O06 = bj_CAMPAIGN_OFFSET_O * 1000 + 6
bj_MISSION_INDEX_O07 = bj_CAMPAIGN_OFFSET_O * 1000 + 7
bj_MISSION_INDEX_O08 = bj_CAMPAIGN_OFFSET_O * 1000 + 8
bj_MISSION_INDEX_O09 = bj_CAMPAIGN_OFFSET_O * 1000 + 9
bj_MISSION_INDEX_O10 = bj_CAMPAIGN_OFFSET_O * 1000 + 10
-- Night Elf
bj_MISSION_INDEX_N00 = bj_CAMPAIGN_OFFSET_N * 1000 + 0
bj_MISSION_INDEX_N01 = bj_CAMPAIGN_OFFSET_N * 1000 + 1
bj_MISSION_INDEX_N02 = bj_CAMPAIGN_OFFSET_N * 1000 + 2
bj_MISSION_INDEX_N03 = bj_CAMPAIGN_OFFSET_N * 1000 + 3
bj_MISSION_INDEX_N04 = bj_CAMPAIGN_OFFSET_N * 1000 + 4
bj_MISSION_INDEX_N05 = bj_CAMPAIGN_OFFSET_N * 1000 + 5
bj_MISSION_INDEX_N06 = bj_CAMPAIGN_OFFSET_N * 1000 + 6
bj_MISSION_INDEX_N07 = bj_CAMPAIGN_OFFSET_N * 1000 + 7
bj_MISSION_INDEX_N08 = bj_CAMPAIGN_OFFSET_N * 1000 + 8
bj_MISSION_INDEX_N09 = bj_CAMPAIGN_OFFSET_N * 1000 + 9
-- Expansion Night Elf
bj_MISSION_INDEX_XN00 = bj_CAMPAIGN_OFFSET_XN * 1000 + 0
bj_MISSION_INDEX_XN01 = bj_CAMPAIGN_OFFSET_XN * 1000 + 1
bj_MISSION_INDEX_XN02 = bj_CAMPAIGN_OFFSET_XN * 1000 + 2
bj_MISSION_INDEX_XN03 = bj_CAMPAIGN_OFFSET_XN * 1000 + 3
bj_MISSION_INDEX_XN04 = bj_CAMPAIGN_OFFSET_XN * 1000 + 4
bj_MISSION_INDEX_XN05 = bj_CAMPAIGN_OFFSET_XN * 1000 + 5
bj_MISSION_INDEX_XN06 = bj_CAMPAIGN_OFFSET_XN * 1000 + 6
bj_MISSION_INDEX_XN07 = bj_CAMPAIGN_OFFSET_XN * 1000 + 7
bj_MISSION_INDEX_XN08 = bj_CAMPAIGN_OFFSET_XN * 1000 + 8
bj_MISSION_INDEX_XN09 = bj_CAMPAIGN_OFFSET_XN * 1000 + 9
bj_MISSION_INDEX_XN10 = bj_CAMPAIGN_OFFSET_XN * 1000 + 10
-- Expansion Human
bj_MISSION_INDEX_XH00 = bj_CAMPAIGN_OFFSET_XH * 1000 + 0
bj_MISSION_INDEX_XH01 = bj_CAMPAIGN_OFFSET_XH * 1000 + 1
bj_MISSION_INDEX_XH02 = bj_CAMPAIGN_OFFSET_XH * 1000 + 2
bj_MISSION_INDEX_XH03 = bj_CAMPAIGN_OFFSET_XH * 1000 + 3
bj_MISSION_INDEX_XH04 = bj_CAMPAIGN_OFFSET_XH * 1000 + 4
bj_MISSION_INDEX_XH05 = bj_CAMPAIGN_OFFSET_XH * 1000 + 5
bj_MISSION_INDEX_XH06 = bj_CAMPAIGN_OFFSET_XH * 1000 + 6
bj_MISSION_INDEX_XH07 = bj_CAMPAIGN_OFFSET_XH * 1000 + 7
bj_MISSION_INDEX_XH08 = bj_CAMPAIGN_OFFSET_XH * 1000 + 8
bj_MISSION_INDEX_XH09 = bj_CAMPAIGN_OFFSET_XH * 1000 + 9
-- Expansion Undead
bj_MISSION_INDEX_XU00 = bj_CAMPAIGN_OFFSET_XU * 1000 + 0
bj_MISSION_INDEX_XU01 = bj_CAMPAIGN_OFFSET_XU * 1000 + 1
bj_MISSION_INDEX_XU02 = bj_CAMPAIGN_OFFSET_XU * 1000 + 2
bj_MISSION_INDEX_XU03 = bj_CAMPAIGN_OFFSET_XU * 1000 + 3
bj_MISSION_INDEX_XU04 = bj_CAMPAIGN_OFFSET_XU * 1000 + 4
bj_MISSION_INDEX_XU05 = bj_CAMPAIGN_OFFSET_XU * 1000 + 5
bj_MISSION_INDEX_XU06 = bj_CAMPAIGN_OFFSET_XU * 1000 + 6
bj_MISSION_INDEX_XU07 = bj_CAMPAIGN_OFFSET_XU * 1000 + 7
bj_MISSION_INDEX_XU08 = bj_CAMPAIGN_OFFSET_XU * 1000 + 8
bj_MISSION_INDEX_XU09 = bj_CAMPAIGN_OFFSET_XU * 1000 + 9
bj_MISSION_INDEX_XU10 = bj_CAMPAIGN_OFFSET_XU * 1000 + 10
bj_MISSION_INDEX_XU11 = bj_CAMPAIGN_OFFSET_XU * 1000 + 11
bj_MISSION_INDEX_XU12 = bj_CAMPAIGN_OFFSET_XU * 1000 + 12
bj_MISSION_INDEX_XU13 = bj_CAMPAIGN_OFFSET_XU * 1000 + 13

-- Expansion Orc
bj_MISSION_INDEX_XO00 = bj_CAMPAIGN_OFFSET_XO * 1000 + 0

-- Cinematic indexing constants
bj_CINEMATICINDEX_TOP = 0
bj_CINEMATICINDEX_HOP = 1
bj_CINEMATICINDEX_HED = 2
bj_CINEMATICINDEX_OOP = 3
bj_CINEMATICINDEX_OED = 4
bj_CINEMATICINDEX_UOP = 5
bj_CINEMATICINDEX_UED = 6
bj_CINEMATICINDEX_NOP = 7
bj_CINEMATICINDEX_NED = 8
bj_CINEMATICINDEX_XOP = 9
bj_CINEMATICINDEX_XED = 10

-- Alliance settings
bj_ALLIANCE_UNALLIED = 0
bj_ALLIANCE_UNALLIED_VISION = 1
bj_ALLIANCE_ALLIED = 2
bj_ALLIANCE_ALLIED_VISION = 3
bj_ALLIANCE_ALLIED_UNITS = 4
bj_ALLIANCE_ALLIED_ADVUNITS = 5
bj_ALLIANCE_NEUTRAL = 6
bj_ALLIANCE_NEUTRAL_VISION = 7

-- Keyboard Event Types
bj_KEYEVENTTYPE_DEPRESS = 0
bj_KEYEVENTTYPE_RELEASE = 1

-- Keyboard Event Keys
bj_KEYEVENTKEY_LEFT = 0
bj_KEYEVENTKEY_RIGHT = 1
bj_KEYEVENTKEY_DOWN = 2
bj_KEYEVENTKEY_UP = 3

-- Transmission timing methods
bj_TIMETYPE_ADD = 0
bj_TIMETYPE_SET = 1
bj_TIMETYPE_SUB = 2

-- Camera bounds adjustment methods
bj_CAMERABOUNDS_ADJUST_ADD = 0
bj_CAMERABOUNDS_ADJUST_SUB = 1

-- Quest creation states
bj_QUESTTYPE_REQ_DISCOVERED = 0
bj_QUESTTYPE_REQ_UNDISCOVERED = 1
bj_QUESTTYPE_OPT_DISCOVERED = 2
bj_QUESTTYPE_OPT_UNDISCOVERED = 3

-- Quest message types
bj_QUESTMESSAGE_DISCOVERED = 0
bj_QUESTMESSAGE_UPDATED = 1
bj_QUESTMESSAGE_COMPLETED = 2
bj_QUESTMESSAGE_FAILED = 3
bj_QUESTMESSAGE_REQUIREMENT = 4
bj_QUESTMESSAGE_MISSIONFAILED = 5
bj_QUESTMESSAGE_ALWAYSHINT = 6
bj_QUESTMESSAGE_HINT = 7
bj_QUESTMESSAGE_SECRET = 8
bj_QUESTMESSAGE_UNITACQUIRED = 9
bj_QUESTMESSAGE_UNITAVAILABLE = 10
bj_QUESTMESSAGE_ITEMACQUIRED = 11
bj_QUESTMESSAGE_WARNING = 12

-- Leaderboard sorting methods
bj_SORTTYPE_SORTBYVALUE = 0
bj_SORTTYPE_SORTBYPLAYER = 1
bj_SORTTYPE_SORTBYLABEL = 2

-- Cinematic fade filter methods
bj_CINEFADETYPE_FADEIN = 0
bj_CINEFADETYPE_FADEOUT = 1
bj_CINEFADETYPE_FADEOUTIN = 2

-- Buff removal methods
bj_REMOVEBUFFS_POSITIVE = 0
bj_REMOVEBUFFS_NEGATIVE = 1
bj_REMOVEBUFFS_ALL = 2
bj_REMOVEBUFFS_NONTLIFE = 3

-- Buff properties - polarity
bj_BUFF_POLARITY_POSITIVE = 0
bj_BUFF_POLARITY_NEGATIVE = 1
bj_BUFF_POLARITY_EITHER = 2

-- Buff properties - resist type
bj_BUFF_RESIST_MAGIC = 0
bj_BUFF_RESIST_PHYSICAL = 1
bj_BUFF_RESIST_EITHER = 2
bj_BUFF_RESIST_BOTH = 3

-- Hero stats
bj_HEROSTAT_STR = 0
bj_HEROSTAT_AGI = 1
bj_HEROSTAT_INT = 2

-- Hero skill point modification methods
bj_MODIFYMETHOD_ADD = 0
bj_MODIFYMETHOD_SUB = 1
bj_MODIFYMETHOD_SET = 2

-- Unit state adjustment methods (for replaced units)
bj_UNIT_STATE_METHOD_ABSOLUTE = 0
bj_UNIT_STATE_METHOD_RELATIVE = 1
bj_UNIT_STATE_METHOD_DEFAULTS = 2
bj_UNIT_STATE_METHOD_MAXIMUM = 3

-- Gate operations
bj_GATEOPERATION_CLOSE = 0
bj_GATEOPERATION_OPEN = 1
bj_GATEOPERATION_DESTROY = 2

-- Game cache value types
bj_GAMECACHE_BOOLEAN = 0
bj_GAMECACHE_INTEGER = 1
bj_GAMECACHE_REAL = 2
bj_GAMECACHE_UNIT = 3
bj_GAMECACHE_STRING = 4

-- Hashtable value types
bj_HASHTABLE_BOOLEAN = 0
bj_HASHTABLE_INTEGER = 1
bj_HASHTABLE_REAL = 2
bj_HASHTABLE_STRING = 3
bj_HASHTABLE_HANDLE = 4

-- Item status types
bj_ITEM_STATUS_HIDDEN = 0
bj_ITEM_STATUS_OWNED = 1
bj_ITEM_STATUS_INVULNERABLE = 2
bj_ITEM_STATUS_POWERUP = 3
bj_ITEM_STATUS_SELLABLE = 4
bj_ITEM_STATUS_PAWNABLE = 5

-- Itemcode status types
bj_ITEMCODE_STATUS_POWERUP = 0
bj_ITEMCODE_STATUS_SELLABLE = 1
bj_ITEMCODE_STATUS_PAWNABLE = 2

-- Minimap ping styles
bj_MINIMAPPINGSTYLE_SIMPLE = 0
bj_MINIMAPPINGSTYLE_FLASHY = 1
bj_MINIMAPPINGSTYLE_ATTACK = 2

-- Corpse creation settings
bj_CORPSE_MAX_DEATH_TIME = 8.0

-- Corpse creation styles
bj_CORPSETYPE_FLESH = 0
bj_CORPSETYPE_BONE = 1

-- Elevator pathing-blocker destructable code
bj_ELEVATOR_BLOCKER_CODE = 1146381680
bj_ELEVATOR_CODE01 = 1146384998
bj_ELEVATOR_CODE02 = 1146385016

-- Elevator wall codes
bj_ELEVATOR_WALL_TYPE_ALL = 0
bj_ELEVATOR_WALL_TYPE_EAST = 1
bj_ELEVATOR_WALL_TYPE_NORTH = 2
bj_ELEVATOR_WALL_TYPE_SOUTH = 3
bj_ELEVATOR_WALL_TYPE_WEST = 4

-------------------------------------------------------------------------
-- Variables
--

-- Force predefs
bj_FORCE_ALL_PLAYERS = nil
bj_FORCE_PLAYER = _array_()

bj_MELEE_MAX_TWINKED_HEROES = 0

-- Map area rects
bj_mapInitialPlayableArea = nil
bj_mapInitialCameraBounds = nil

-- Utility function vars
bj_forLoopAIndex = 0
bj_forLoopBIndex = 0
bj_forLoopAIndexEnd = 0
bj_forLoopBIndexEnd = 0

bj_slotControlReady = false
bj_slotControlUsed = _array_(false)
bj_slotControl = _array_()

-- Game started detection vars
bj_gameStartedTimer = nil
bj_gameStarted = false
bj_volumeGroupsTimer = CreateTimer()

-- Singleplayer check
bj_isSinglePlayer = false

-- Day/Night Cycle vars
bj_dncSoundsDay = nil
bj_dncSoundsNight = nil
bj_dayAmbientSound = nil
bj_nightAmbientSound = nil
bj_dncSoundsDawn = nil
bj_dncSoundsDusk = nil
bj_dawnSound = nil
bj_duskSound = nil
bj_useDawnDuskSounds = true
bj_dncIsDaytime = false

-- Triggered sounds
--sound              bj_pingMinimapSound         = null
bj_rescueSound = nil
bj_questDiscoveredSound = nil
bj_questUpdatedSound = nil
bj_questCompletedSound = nil
bj_questFailedSound = nil
bj_questHintSound = nil
bj_questSecretSound = nil
bj_questItemAcquiredSound = nil
bj_questWarningSound = nil
bj_victoryDialogSound = nil
bj_defeatDialogSound = nil

-- Marketplace vars
bj_stockItemPurchased = nil
bj_stockUpdateTimer = nil
bj_stockAllowedPermanent = _array_(false)
bj_stockAllowedCharged = _array_(false)
bj_stockAllowedArtifact = _array_(false)
bj_stockPickedItemLevel = 0
bj_stockPickedItemType = nil

-- Melee vars
bj_meleeVisibilityTrained = nil
bj_meleeVisibilityIsDay = true
bj_meleeGrantHeroItems = false
bj_meleeNearestMineToLoc = nil
bj_meleeNearestMine = nil
bj_meleeNearestMineDist = 0.0
bj_meleeGameOver = false
bj_meleeDefeated = _array_(false)
bj_meleeVictoried = _array_(false)
bj_ghoul = _array_()
bj_crippledTimer = _array_()
bj_crippledTimerWindows = _array_()
bj_playerIsCrippled = _array_(false)
bj_playerIsExposed = _array_(false)
bj_finishSoonAllExposed = false
bj_finishSoonTimerDialog = nil
bj_meleeTwinkedHeroes = _array_(0)

-- Rescue behavior vars
bj_rescueUnitBehavior = nil
bj_rescueChangeColorUnit = true
bj_rescueChangeColorBldg = true

-- Transmission vars
bj_cineSceneEndingTimer = nil
bj_cineSceneLastSound = nil
bj_cineSceneBeingSkipped = nil

-- Cinematic mode vars
bj_cineModePriorSpeed = MAP_SPEED_NORMAL
bj_cineModePriorFogSetting = false
bj_cineModePriorMaskSetting = false
bj_cineModeAlreadyIn = false
bj_cineModePriorDawnDusk = false
bj_cineModeSavedSeed = 0

-- Cinematic fade vars
bj_cineFadeFinishTimer = nil
bj_cineFadeContinueTimer = nil
bj_cineFadeContinueRed = 0
bj_cineFadeContinueGreen = 0
bj_cineFadeContinueBlue = 0
bj_cineFadeContinueTrans = 0
bj_cineFadeContinueDuration = 0
bj_cineFadeContinueTex = ""

-- QueuedTriggerExecute vars
bj_queuedExecTotal = 0
bj_queuedExecTriggers = _array_()
bj_queuedExecUseConds = _array_(false)
bj_queuedExecTimeoutTimer = CreateTimer()
bj_queuedExecTimeout = nil

-- Helper vars (for Filter and Enum funcs)
bj_destInRegionDiesCount = 0
bj_destInRegionDiesTrig = nil
bj_groupCountUnits = 0
bj_forceCountPlayers = 0
bj_groupEnumTypeId = 0
bj_groupEnumOwningPlayer = nil
bj_groupAddGroupDest = nil
bj_groupRemoveGroupDest = nil
bj_groupRandomConsidered = 0
bj_groupRandomCurrentPick = nil
bj_groupLastCreatedDest = nil
bj_randomSubGroupGroup = nil
bj_randomSubGroupWant = 0
bj_randomSubGroupTotal = 0
bj_randomSubGroupChance = 0
bj_destRandomConsidered = 0
bj_destRandomCurrentPick = nil
bj_elevatorWallBlocker = nil
bj_elevatorNeighbor = nil
bj_itemRandomConsidered = 0
bj_itemRandomCurrentPick = nil
bj_forceRandomConsidered = 0
bj_forceRandomCurrentPick = nil
bj_makeUnitRescuableUnit = nil
bj_makeUnitRescuableFlag = true
bj_pauseAllUnitsFlag = true
bj_enumDestructableCenter = nil
bj_enumDestructableRadius = 0
bj_setPlayerTargetColor = nil
bj_isUnitGroupDeadResult = true
bj_isUnitGroupEmptyResult = true
bj_isUnitGroupInRectResult = true
bj_isUnitGroupInRectRect = nil
bj_changeLevelShowScores = false
bj_changeLevelMapName = nil
bj_suspendDecayFleshGroup = CreateGroup()
bj_suspendDecayBoneGroup = CreateGroup()
bj_delayedSuspendDecayTimer = CreateTimer()
bj_delayedSuspendDecayTrig = nil
bj_livingPlayerUnitsTypeId = 0
bj_lastDyingWidget = nil

-- Random distribution vars
bj_randDistCount = 0
bj_randDistID = _array_(0)
bj_randDistChance = _array_(0)

-- Last X'd vars
bj_lastCreatedUnit = nil
bj_lastCreatedItem = nil
bj_lastRemovedItem = nil
bj_lastHauntedGoldMine = nil
bj_lastCreatedDestructable = nil
bj_lastCreatedGroup = CreateGroup()
bj_lastCreatedFogModifier = nil
bj_lastCreatedEffect = nil
bj_lastCreatedWeatherEffect = nil
bj_lastCreatedTerrainDeformation = nil
bj_lastCreatedQuest = nil
bj_lastCreatedQuestItem = nil
bj_lastCreatedDefeatCondition = nil
bj_lastStartedTimer = CreateTimer()
bj_lastCreatedTimerDialog = nil
bj_lastCreatedLeaderboard = nil
bj_lastCreatedMultiboard = nil
bj_lastPlayedSound = nil
bj_lastPlayedMusic = ""
bj_lastTransmissionDuration = 0
bj_lastCreatedGameCache = nil
bj_lastCreatedHashtable = nil
bj_lastLoadedUnit = nil
bj_lastCreatedButton = nil
bj_lastReplacedUnit = nil
bj_lastCreatedTextTag = nil
bj_lastCreatedLightning = nil
bj_lastCreatedImage = nil
bj_lastCreatedUbersplat = nil

-- Filter function vars
filterIssueHauntOrderAtLocBJ = nil
filterEnumDestructablesInCircleBJ = nil
filterGetUnitsInRectOfPlayer = nil
filterGetUnitsOfTypeIdAll = nil
filterGetUnitsOfPlayerAndTypeId = nil
filterMeleeTrainedUnitIsHeroBJ = nil
filterLivingPlayerUnitsOfTypeId = nil

-- Memory cleanup vars
bj_wantDestroyGroup = false




--***************************************************************************
--*
--*  Debugging Functions
--*
--***************************************************************************

--===========================================================================
function BJDebugMsg(msg)
	local i = 0
	for _ in _loop_() do
		DisplayTimedTextToPlayer(Player(i), 0, 0, 60, msg)
		i = i + 1
		if i == bj_MAX_PLAYERS then break end
	end
end



--***************************************************************************
--*
--*  Math Utility Functions
--*
--***************************************************************************

--===========================================================================
function RMinBJ(a, b)
	if a < b then
		return a
	else
		return b
	end
end

--===========================================================================
function RMaxBJ(a, b)
	if a < b then
		return b
	else
		return a
	end
end

--===========================================================================
function RAbsBJ(a)
	if a >= 0 then
		return a
	else
		return  - a
	end
end

--===========================================================================
function RSignBJ(a)
	if a >= 0.0 then
		return 1.0
	else
		return -1.0
	end
end

--===========================================================================
function IMinBJ(a, b)
	if a < b then
		return a
	else
		return b
	end
end

--===========================================================================
function IMaxBJ(a, b)
	if a < b then
		return b
	else
		return a
	end
end

--===========================================================================
function IAbsBJ(a)
	if a >= 0 then
		return a
	else
		return  - a
	end
end

--===========================================================================
function ISignBJ(a)
	if a >= 0 then
		return 1
	else
		return -1
	end
end

--===========================================================================
function SinBJ(degrees)
	return Sin(degrees * bj_DEGTORAD)
end

--===========================================================================
function CosBJ(degrees)
	return Cos(degrees * bj_DEGTORAD)
end

--===========================================================================
function TanBJ(degrees)
	return Tan(degrees * bj_DEGTORAD)
end

--===========================================================================
function AsinBJ(degrees)
	return Asin(degrees) * bj_RADTODEG
end

--===========================================================================
function AcosBJ(degrees)
	return Acos(degrees) * bj_RADTODEG
end

--===========================================================================
function AtanBJ(degrees)
	return Atan(degrees) * bj_RADTODEG
end

--===========================================================================
function Atan2BJ(y, x)
	return Atan2(y, x) * bj_RADTODEG
end

--===========================================================================
function AngleBetweenPoints(locA, locB)
	return bj_RADTODEG * Atan2(GetLocationY(locB) - GetLocationY(locA), GetLocationX(locB) - GetLocationX(locA))
end

--===========================================================================
function DistanceBetweenPoints(locA, locB)
	local dx = GetLocationX(locB) - GetLocationX(locA)
	local dy = GetLocationY(locB) - GetLocationY(locA)
	return SquareRoot(dx * dx + dy * dy)
end

--===========================================================================
function PolarProjectionBJ(source, dist, angle)
	local x = GetLocationX(source) + dist * Cos(angle * bj_DEGTORAD)
	local y = GetLocationY(source) + dist * Sin(angle * bj_DEGTORAD)
	return Location(x, y)
end

--===========================================================================
function GetRandomDirectionDeg()
	return GetRandomReal(0, 360)
end

--===========================================================================
function GetRandomPercentageBJ()
	return GetRandomReal(0, 100)
end

--===========================================================================
function GetRandomLocInRect(whichRect)
	return Location(GetRandomReal(GetRectMinX(whichRect), GetRectMaxX(whichRect)), GetRandomReal(GetRectMinY(whichRect), GetRectMaxY(whichRect)))
end

--===========================================================================
-- Calculate the modulus/remainder of (dividend) divided by (divisor).
-- Examples:  18 mod 5 = 3.  15 mod 5 = 0.  -8 mod 5 = 2.
--
function ModuloInteger(dividend, divisor)
	local modulus = dividend - dividend // divisor * divisor

	-- If the dividend was negative, the above modulus calculation will
	-- be negative, but within (-divisor..0).  We can add (divisor) to
	-- shift this result into the desired range of (0..divisor).
	if modulus < 0 then
		modulus = modulus + divisor
	end

	return modulus
end

--===========================================================================
-- Calculate the modulus/remainder of (dividend) divided by (divisor).
-- Examples:  13.000 mod 2.500 = 0.500.  -6.000 mod 2.500 = 1.500.
--
function ModuloReal(dividend, divisor)
	local modulus = dividend - I2R(R2I(dividend / divisor)) * divisor

	-- If the dividend was negative, the above modulus calculation will
	-- be negative, but within (-divisor..0).  We can add (divisor) to
	-- shift this result into the desired range of (0..divisor).
	if modulus < 0 then
		modulus = modulus + divisor
	end

	return modulus
end

--===========================================================================
function OffsetLocation(loc, dx, dy)
	return Location(GetLocationX(loc) + dx, GetLocationY(loc) + dy)
end

--===========================================================================
function OffsetRectBJ(r, dx, dy)
	return Rect(GetRectMinX(r) + dx, GetRectMinY(r) + dy, GetRectMaxX(r) + dx, GetRectMaxY(r) + dy)
end

--===========================================================================
function RectFromCenterSizeBJ(center, width, height)
	local x = GetLocationX(center)
	local y = GetLocationY(center)
	return Rect(x - width * 0.5, y - height * 0.5, x + width * 0.5, y + height * 0.5)
end

--===========================================================================
function RectContainsCoords(r, x, y)
	return GetRectMinX(r) <= x and x <= GetRectMaxX(r) and GetRectMinY(r) <= y and y <= GetRectMaxY(r)
end

--===========================================================================
function RectContainsLoc(r, loc)
	return RectContainsCoords(r, GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
function RectContainsUnit(r, whichUnit)
	return RectContainsCoords(r, GetUnitX(whichUnit), GetUnitY(whichUnit))
end

--===========================================================================
function RectContainsItem(whichItem, r)
	if whichItem == nil then
		return false
	end

	if IsItemOwned(whichItem) then
		return false
	end

	return RectContainsCoords(r, GetItemX(whichItem), GetItemY(whichItem))
end



--***************************************************************************
--*
--*  Utility Constructs
--*
--***************************************************************************

--===========================================================================
-- Runs the trigger's actions if the trigger's conditions evaluate to true.
--
function ConditionalTriggerExecute(trig)
	if TriggerEvaluate(trig) then
		TriggerExecute(trig)
	end
end

--===========================================================================
-- Runs the trigger's actions if the trigger's conditions evaluate to true.
--
function TriggerExecuteBJ(trig, checkConditions)
	if checkConditions then
		if not TriggerEvaluate(trig) then
			return false
		end
	end
	TriggerExecute(trig)
	return true
end

--===========================================================================
-- Arranges for a trigger to fire almost immediately, except that the calling
-- trigger is not interrupted as is the case with a TriggerExecute call.
-- Since the trigger executes normally, its conditions are still evaluated.
--
function PostTriggerExecuteBJ(trig, checkConditions)
	if checkConditions then
		if not TriggerEvaluate(trig) then
			return false
		end
	end
	TriggerRegisterTimerEvent(trig, 0, false)
	return true
end

--===========================================================================
-- Debug - Display the contents of the trigger queue (as either null or "x"
-- for each entry).
function QueuedTriggerCheck()
	local s = "TrigQueue Check "
	local i

	i = 0
	for _ in _loop_() do
		if i >= bj_queuedExecTotal then break end
		s = (s or "") .. "q[" .. (I2S(i) or "") .. "]="
		if bj_queuedExecTriggers[i] == nil then
			s = (s or "") .. "null "
		else
			s = (s or "") .. "x "
		end
		i = i + 1
	end
	s = (s or "") .. "(" .. (I2S(bj_queuedExecTotal) or "") .. " total)"
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 600, s)
end

--===========================================================================
-- Searches the queue for a given trigger, returning the index of the
-- trigger within the queue if it is found, or -1 if it is not found.
--
function QueuedTriggerGetIndex(trig)
	-- Determine which, if any, of the queued triggers is being removed.
	local index = 0
	for _ in _loop_() do
		if index >= bj_queuedExecTotal then break end
		if bj_queuedExecTriggers[index] == trig then
			return index
		end
		index = index + 1
	end
	return -1
end

--===========================================================================
-- Removes a trigger from the trigger queue, shifting other triggers down
-- to fill the unused space.  If the currently running trigger is removed
-- in this manner, this function does NOT attempt to run the next trigger.
--
function QueuedTriggerRemoveByIndex(trigIndex)
	local index

	-- If the to-be-removed index is out of range, fail.
	if trigIndex >= bj_queuedExecTotal then
		return false
	end

	-- Shift all queue entries down to fill in the gap.
	bj_queuedExecTotal = bj_queuedExecTotal - 1
	index = trigIndex
	for _ in _loop_() do
		if index >= bj_queuedExecTotal then break end
		bj_queuedExecTriggers[index] = bj_queuedExecTriggers[index + 1]
		bj_queuedExecUseConds[index] = bj_queuedExecUseConds[index + 1]
		index = index + 1
	end
	return true
end

--===========================================================================
-- Attempt to execute the first trigger in the queue.  If it fails, remove
-- it and execute the next one.  Continue this cycle until a trigger runs,
-- or until the queue is empty.
--
function QueuedTriggerAttemptExec()
	for _ in _loop_() do
		if bj_queuedExecTotal == 0 then break end

		if TriggerExecuteBJ(bj_queuedExecTriggers[0], bj_queuedExecUseConds[0]) then
			-- Timeout the queue if it sits at the front of the queue for too long.
			TimerStart(bj_queuedExecTimeoutTimer, bj_QUEUED_TRIGGER_TIMEOUT, false, nil)
			return true
		end

		QueuedTriggerRemoveByIndex(0)
	end
	return false
end

--===========================================================================
-- Queues a trigger to be executed, assuring that such triggers are not
-- executed at the same time.
--
function QueuedTriggerAddBJ(trig, checkConditions)
	-- Make sure our queue isn't full.  If it is, return failure.
	if bj_queuedExecTotal >= bj_MAX_QUEUED_TRIGGERS then
		return false
	end

	-- Add the trigger to an array of to-be-executed triggers.
	bj_queuedExecTriggers[bj_queuedExecTotal] = trig
	bj_queuedExecUseConds[bj_queuedExecTotal] = checkConditions
	bj_queuedExecTotal = bj_queuedExecTotal + 1

	-- If this is the only trigger in the queue, run it.
	if bj_queuedExecTotal == 1 then
		QueuedTriggerAttemptExec()
	end
	return true
end

--===========================================================================
-- Denotes the end of a queued trigger. Be sure to call this only once per
-- queued trigger, or risk stepping on the toes of other queued triggers.
--
function QueuedTriggerRemoveBJ(trig)
	local index
	local trigIndex
	local trigExecuted

	-- Find the trigger's index.
	trigIndex = QueuedTriggerGetIndex(trig)
	if trigIndex == -1 then
		return
	end

	-- Shuffle the other trigger entries down to fill in the gap.
	QueuedTriggerRemoveByIndex(trigIndex)

	-- If we just axed the currently running trigger, run the next one.
	if trigIndex == 0 then
		PauseTimer(bj_queuedExecTimeoutTimer)
		QueuedTriggerAttemptExec()
	end
end

--===========================================================================
-- Denotes the end of a queued trigger. Be sure to call this only once per
-- queued trigger, lest you step on the toes of other queued triggers.
--
function QueuedTriggerDoneBJ()
	local index

	-- Make sure there's something on the queue to remove.
	if bj_queuedExecTotal <= 0 then
		return
	end

	-- Remove the currently running trigger from the array.
	QueuedTriggerRemoveByIndex(0)

	-- If other triggers are waiting to run, run one of them.
	PauseTimer(bj_queuedExecTimeoutTimer)
	QueuedTriggerAttemptExec()
end

--===========================================================================
-- Empty the trigger queue.
--
function QueuedTriggerClearBJ()
	PauseTimer(bj_queuedExecTimeoutTimer)
	bj_queuedExecTotal = 0
end

--===========================================================================
-- Remove all but the currently executing trigger from the trigger queue.
--
function QueuedTriggerClearInactiveBJ()
	bj_queuedExecTotal = IMinBJ(bj_queuedExecTotal, 1)
end

--===========================================================================
function QueuedTriggerCountBJ()
	return bj_queuedExecTotal
end

--===========================================================================
function IsTriggerQueueEmptyBJ()
	return bj_queuedExecTotal <= 0
end

--===========================================================================
function IsTriggerQueuedBJ(trig)
	return QueuedTriggerGetIndex(trig) ~= -1
end

--===========================================================================
function GetForLoopIndexA()
	return bj_forLoopAIndex
end

--===========================================================================
function SetForLoopIndexA(newIndex)
	bj_forLoopAIndex = newIndex
end

--===========================================================================
function GetForLoopIndexB()
	return bj_forLoopBIndex
end

--===========================================================================
function SetForLoopIndexB(newIndex)
	bj_forLoopBIndex = newIndex
end

--===========================================================================
-- We can't do game-time waits, so this simulates one by starting a timer
-- and polling until the timer expires.
function PolledWait(duration)
	local t
	local timeRemaining

	if duration > 0 then
		t = CreateTimer()
		TimerStart(t, duration, false, nil)
		for _ in _loop_() do
			timeRemaining = TimerGetRemaining(t)
			if timeRemaining <= 0 then break end

			-- If we have a bit of time left, skip past 10% of the remaining
			-- duration instead of checking every interval, to minimize the
			-- polling on long waits.
			if timeRemaining > bj_POLLED_WAIT_SKIP_THRESHOLD then
				TriggerSleepAction(0.1 * timeRemaining)
			else
				TriggerSleepAction(bj_POLLED_WAIT_INTERVAL)
			end
		end
		DestroyTimer(t)
	end
end

--===========================================================================
function IntegerTertiaryOp(flag, valueA, valueB)
	if flag then
		return valueA
	else
		return valueB
	end
end


--***************************************************************************
--*
--*  General Utility Functions
--*  These functions exist purely to make the trigger dialogs cleaner and
--*  more comprehensible.
--*
--***************************************************************************

--===========================================================================
function DoNothing()
end

--===========================================================================
-- This function does nothing.  WorldEdit should should eventually ignore
-- CommentString triggers during script generation, but until such a time,
-- this function will serve as a stub.
--
function CommentString(commentString)
end

--===========================================================================
-- This function returns the input string, converting it from the localized text, if necessary
--
function StringIdentity(theString)
	return GetLocalizedString(theString)
end

--===========================================================================
function GetBooleanAnd(valueA, valueB)
	return valueA and valueB
end

--===========================================================================
function GetBooleanOr(valueA, valueB)
	return valueA or valueB
end

--===========================================================================
-- Converts a percentage (real, 0..100) into a scaled integer (0..max),
-- clipping the result to 0..max in case the input is invalid.
--
function PercentToInt(percentage, max)
	local result = R2I(percentage * I2R(max) * 0.01)

	if result < 0 then
		result = 0
	elseif result > max then
		result = max
	end

	return result
end

--===========================================================================
function PercentTo255(percentage)
	return PercentToInt(percentage, 255)
end

--===========================================================================
function GetTimeOfDay()
	return GetFloatGameState(GAME_STATE_TIME_OF_DAY)
end

--===========================================================================
function SetTimeOfDay(whatTime)
	SetFloatGameState(GAME_STATE_TIME_OF_DAY, whatTime)
end

--===========================================================================
function SetTimeOfDayScalePercentBJ(scalePercent)
	SetTimeOfDayScale(scalePercent * 0.01)
end

--===========================================================================
function GetTimeOfDayScalePercentBJ()
	return GetTimeOfDayScale() * 100
end

--===========================================================================
function PlaySound(soundName)
	local soundHandle = CreateSound(soundName, false, false, true, 12700, 12700, "")
	StartSound(soundHandle)
	KillSoundWhenDone(soundHandle)
end

--===========================================================================
function CompareLocationsBJ(A, B)
	return GetLocationX(A) == GetLocationX(B) and GetLocationY(A) == GetLocationY(B)
end

--===========================================================================
function CompareRectsBJ(A, B)
	return GetRectMinX(A) == GetRectMinX(B) and GetRectMinY(A) == GetRectMinY(B) and GetRectMaxX(A) == GetRectMaxX(B) and GetRectMaxY(A) == GetRectMaxY(B)
end

--===========================================================================
-- Returns a square rect that exactly encompasses the specified circle.
--
function GetRectFromCircleBJ(center, radius)
	local centerX = GetLocationX(center)
	local centerY = GetLocationY(center)
	return Rect(centerX - radius, centerY - radius, centerX + radius, centerY + radius)
end



--***************************************************************************
--*
--*  Camera Utility Functions
--*
--***************************************************************************

--===========================================================================
function GetCurrentCameraSetup()
	local theCam = CreateCameraSetup()
	local duration = 0
	CameraSetupSetField(theCam, CAMERA_FIELD_TARGET_DISTANCE, GetCameraField(CAMERA_FIELD_TARGET_DISTANCE), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_FARZ, GetCameraField(CAMERA_FIELD_FARZ), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_ZOFFSET, GetCameraField(CAMERA_FIELD_ZOFFSET), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_ANGLE_OF_ATTACK, bj_RADTODEG * GetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_FIELD_OF_VIEW, bj_RADTODEG * GetCameraField(CAMERA_FIELD_FIELD_OF_VIEW), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_ROLL, bj_RADTODEG * GetCameraField(CAMERA_FIELD_ROLL), duration)
	CameraSetupSetField(theCam, CAMERA_FIELD_ROTATION, bj_RADTODEG * GetCameraField(CAMERA_FIELD_ROTATION), duration)
	CameraSetupSetDestPosition(theCam, GetCameraTargetPositionX(), GetCameraTargetPositionY(), duration)
	return theCam
end

--===========================================================================
function CameraSetupApplyForPlayer(doPan, whichSetup, whichPlayer, duration)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		CameraSetupApplyForceDuration(whichSetup, doPan, duration)
	end
end

--===========================================================================
function CameraSetupGetFieldSwap(whichField, whichSetup)
	return CameraSetupGetField(whichSetup, whichField)
end

--===========================================================================
function SetCameraFieldForPlayer(whichPlayer, whichField, value, duration)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraField(whichField, value, duration)
	end
end

--===========================================================================
function SetCameraTargetControllerNoZForPlayer(whichPlayer, whichUnit, xoffset, yoffset, inheritOrientation)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraTargetController(whichUnit, xoffset, yoffset, inheritOrientation)
	end
end

--===========================================================================
function SetCameraPositionForPlayer(whichPlayer, x, y)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraPosition(x, y)
	end
end

--===========================================================================
function SetCameraPositionLocForPlayer(whichPlayer, loc)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraPosition(GetLocationX(loc), GetLocationY(loc))
	end
end

--===========================================================================
function RotateCameraAroundLocBJ(degrees, loc, whichPlayer, duration)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraRotateMode(GetLocationX(loc), GetLocationY(loc), bj_DEGTORAD * degrees, duration)
	end
end

--===========================================================================
function PanCameraToForPlayer(whichPlayer, x, y)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PanCameraTo(x, y)
	end
end

--===========================================================================
function PanCameraToLocForPlayer(whichPlayer, loc)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PanCameraTo(GetLocationX(loc), GetLocationY(loc))
	end
end

--===========================================================================
function PanCameraToTimedForPlayer(whichPlayer, x, y, duration)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PanCameraToTimed(x, y, duration)
	end
end

--===========================================================================
function PanCameraToTimedLocForPlayer(whichPlayer, loc, duration)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PanCameraToTimed(GetLocationX(loc), GetLocationY(loc), duration)
	end
end

--===========================================================================
function PanCameraToTimedLocWithZForPlayer(whichPlayer, loc, zOffset, duration)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PanCameraToTimedWithZ(GetLocationX(loc), GetLocationY(loc), zOffset, duration)
	end
end

--===========================================================================
function SmartCameraPanBJ(whichPlayer, loc, duration)
	local dist
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.

		dist = DistanceBetweenPoints(loc, GetCameraTargetPositionLoc())
		if dist >= bj_SMARTPAN_TRESHOLD_SNAP then
			-- If the user is too far away, snap the camera.
			PanCameraToTimed(GetLocationX(loc), GetLocationY(loc), 0)
		elseif dist >= bj_SMARTPAN_TRESHOLD_PAN then
			-- If the user is moderately close, pan the camera.
			PanCameraToTimed(GetLocationX(loc), GetLocationY(loc), duration)
		else
		-- User is close enough, so don't touch the camera.
		end
	end
end

--===========================================================================
function SetCinematicCameraForPlayer(whichPlayer, cameraModelFile)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCinematicCamera(cameraModelFile)
	end
end

--===========================================================================
function ResetToGameCameraForPlayer(whichPlayer, duration)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ResetToGameCamera(duration)
	end
end

--===========================================================================
function CameraSetSourceNoiseForPlayer(whichPlayer, magnitude, velocity)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		CameraSetSourceNoise(magnitude, velocity)
	end
end

--===========================================================================
function CameraSetTargetNoiseForPlayer(whichPlayer, magnitude, velocity)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		CameraSetTargetNoise(magnitude, velocity)
	end
end

--===========================================================================
function CameraSetEQNoiseForPlayer(whichPlayer, magnitude)
	local richter = magnitude
	if richter > 5.0 then
		richter = 5.0
	end
	if richter < 2.0 then
		richter = 2.0
	end
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		CameraSetTargetNoiseEx(magnitude * 2.0, magnitude * Pow(10, richter), true)
		CameraSetSourceNoiseEx(magnitude * 2.0, magnitude * Pow(10, richter), true)
	end
end

--===========================================================================
function CameraClearNoiseForPlayer(whichPlayer)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		CameraSetSourceNoise(0, 0)
		CameraSetTargetNoise(0, 0)
	end
end

--===========================================================================
-- Query the current camera bounds.
--
function GetCurrentCameraBoundsMapRectBJ()
	return Rect(GetCameraBoundMinX(), GetCameraBoundMinY(), GetCameraBoundMaxX(), GetCameraBoundMaxY())
end

--===========================================================================
-- Query the initial camera bounds, as defined at map init.
--
function GetCameraBoundsMapRect()
	return bj_mapInitialCameraBounds
end

--===========================================================================
-- Query the playable map area, as defined at map init.
--
function GetPlayableMapRect()
	return bj_mapInitialPlayableArea
end

--===========================================================================
-- Query the entire map area, as defined at map init.
--
function GetEntireMapRect()
	return GetWorldBounds()
end

--===========================================================================
function SetCameraBoundsToRect(r)
	local minX = GetRectMinX(r)
	local minY = GetRectMinY(r)
	local maxX = GetRectMaxX(r)
	local maxY = GetRectMaxY(r)
	SetCameraBounds(minX, minY, minX, maxY, maxX, maxY, maxX, minY)
end

--===========================================================================
function SetCameraBoundsToRectForPlayerBJ(whichPlayer, r)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraBoundsToRect(r)
	end
end

--===========================================================================
function AdjustCameraBoundsBJ(adjustMethod, dxWest, dxEast, dyNorth, dySouth)
	local minX = 0
	local minY = 0
	local maxX = 0
	local maxY = 0
	local scale = 0

	if adjustMethod == bj_CAMERABOUNDS_ADJUST_ADD then
		scale = 1
	elseif adjustMethod == bj_CAMERABOUNDS_ADJUST_SUB then
		scale = -1
	else
		-- Unrecognized adjustment method - ignore the request.
		return
	end

	-- Adjust the actual camera values
	minX = GetCameraBoundMinX() - scale * dxWest
	maxX = GetCameraBoundMaxX() + scale * dxEast
	minY = GetCameraBoundMinY() - scale * dySouth
	maxY = GetCameraBoundMaxY() + scale * dyNorth

	-- Make sure the camera bounds are still valid.
	if maxX < minX then
		minX = (minX + maxX) * 0.5
		maxX = minX
	end
	if maxY < minY then
		minY = (minY + maxY) * 0.5
		maxY = minY
	end

	-- Apply the new camera values.
	SetCameraBounds(minX, minY, minX, maxY, maxX, maxY, maxX, minY)
end

--===========================================================================
function AdjustCameraBoundsForPlayerBJ(adjustMethod, whichPlayer, dxWest, dxEast, dyNorth, dySouth)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		AdjustCameraBoundsBJ(adjustMethod, dxWest, dxEast, dyNorth, dySouth)
	end
end

--===========================================================================
function SetCameraQuickPositionForPlayer(whichPlayer, x, y)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraQuickPosition(x, y)
	end
end

--===========================================================================
function SetCameraQuickPositionLocForPlayer(whichPlayer, loc)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraQuickPosition(GetLocationX(loc), GetLocationY(loc))
	end
end

--===========================================================================
function SetCameraQuickPositionLoc(loc)
	SetCameraQuickPosition(GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
function StopCameraForPlayerBJ(whichPlayer)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		StopCamera()
	end
end

--===========================================================================
function SetCameraOrientControllerForPlayerBJ(whichPlayer, whichUnit, xoffset, yoffset)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetCameraOrientController(whichUnit, xoffset, yoffset)
	end
end

--===========================================================================
function CameraSetSmoothingFactorBJ(factor)
	CameraSetSmoothingFactor(factor)
end

--===========================================================================
function CameraResetSmoothingFactorBJ()
	CameraSetSmoothingFactor(0)
end



--***************************************************************************
--*
--*  Text Utility Functions
--*
--***************************************************************************

--===========================================================================
function DisplayTextToForce(toForce, message)
	if IsPlayerInForce(GetLocalPlayer(), toForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		DisplayTextToPlayer(GetLocalPlayer(), 0, 0, message)
	end
end

--===========================================================================
function DisplayTimedTextToForce(toForce, duration, message)
	if IsPlayerInForce(GetLocalPlayer(), toForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, duration, message)
	end
end

--===========================================================================
function ClearTextMessagesBJ(toForce)
	if IsPlayerInForce(GetLocalPlayer(), toForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ClearTextMessages()
	end
end

--===========================================================================
-- The parameters for the API Substring function are unintuitive, so this
-- merely performs a translation for the starting index.
--
function SubStringBJ(source, start, end_)
	return SubString(source, start - 1, end_)
end

function GetHandleIdBJ(h)
	return GetHandleId(h)
end

function StringHashBJ(s)
	return StringHash(s)
end



--***************************************************************************
--*
--*  Event Registration Utility Functions
--*
--***************************************************************************

--===========================================================================
function TriggerRegisterTimerEventPeriodic(trig, timeout)
	return TriggerRegisterTimerEvent(trig, timeout, true)
end

--===========================================================================
function TriggerRegisterTimerEventSingle(trig, timeout)
	return TriggerRegisterTimerEvent(trig, timeout, false)
end

--===========================================================================
function TriggerRegisterTimerExpireEventBJ(trig, t)
	return TriggerRegisterTimerExpireEvent(trig, t)
end

--===========================================================================
function TriggerRegisterPlayerUnitEventSimple(trig, whichPlayer, whichEvent)
	return TriggerRegisterPlayerUnitEvent(trig, whichPlayer, whichEvent, nil)
end

--===========================================================================
function TriggerRegisterAnyUnitEventBJ(trig, whichEvent)
	local index

	index = 0
	for _ in _loop_() do
		TriggerRegisterPlayerUnitEvent(trig, Player(index), whichEvent, nil)

		index = index + 1
		if index == bj_MAX_PLAYER_SLOTS then break end
	end
end

--===========================================================================
function TriggerRegisterPlayerSelectionEventBJ(trig, whichPlayer, selected)
	if selected then
		return TriggerRegisterPlayerUnitEvent(trig, whichPlayer, EVENT_PLAYER_UNIT_SELECTED, nil)
	else
		return TriggerRegisterPlayerUnitEvent(trig, whichPlayer, EVENT_PLAYER_UNIT_DESELECTED, nil)
	end
end

--===========================================================================
function TriggerRegisterPlayerKeyEventBJ(trig, whichPlayer, keType, keKey)
	if keType == bj_KEYEVENTTYPE_DEPRESS then
		-- Depress event - find out what key
		if keKey == bj_KEYEVENTKEY_LEFT then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_LEFT_DOWN)
		elseif keKey == bj_KEYEVENTKEY_RIGHT then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_RIGHT_DOWN)
		elseif keKey == bj_KEYEVENTKEY_DOWN then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_DOWN_DOWN)
		elseif keKey == bj_KEYEVENTKEY_UP then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_UP_DOWN)
		else
			-- Unrecognized key - ignore the request and return failure.
			return nil
		end
	elseif keType == bj_KEYEVENTTYPE_RELEASE then
		-- Release event - find out what key
		if keKey == bj_KEYEVENTKEY_LEFT then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_LEFT_UP)
		elseif keKey == bj_KEYEVENTKEY_RIGHT then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_RIGHT_UP)
		elseif keKey == bj_KEYEVENTKEY_DOWN then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_DOWN_UP)
		elseif keKey == bj_KEYEVENTKEY_UP then
			return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ARROW_UP_UP)
		else
			-- Unrecognized key - ignore the request and return failure.
			return nil
		end
	else
		-- Unrecognized type - ignore the request and return failure.
		return nil
	end
end

--===========================================================================
function TriggerRegisterPlayerEventVictory(trig, whichPlayer)
	return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_VICTORY)
end

--===========================================================================
function TriggerRegisterPlayerEventDefeat(trig, whichPlayer)
	return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_DEFEAT)
end

--===========================================================================
function TriggerRegisterPlayerEventLeave(trig, whichPlayer)
	return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_LEAVE)
end

--===========================================================================
function TriggerRegisterPlayerEventAllianceChanged(trig, whichPlayer)
	return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_ALLIANCE_CHANGED)
end

--===========================================================================
function TriggerRegisterPlayerEventEndCinematic(trig, whichPlayer)
	return TriggerRegisterPlayerEvent(trig, whichPlayer, EVENT_PLAYER_END_CINEMATIC)
end

--===========================================================================
function TriggerRegisterGameStateEventTimeOfDay(trig, opcode, limitval)
	return TriggerRegisterGameStateEvent(trig, GAME_STATE_TIME_OF_DAY, opcode, limitval)
end

--===========================================================================
function TriggerRegisterEnterRegionSimple(trig, whichRegion)
	return TriggerRegisterEnterRegion(trig, whichRegion, nil)
end

--===========================================================================
function TriggerRegisterLeaveRegionSimple(trig, whichRegion)
	return TriggerRegisterLeaveRegion(trig, whichRegion, nil)
end

--===========================================================================
function TriggerRegisterEnterRectSimple(trig, r)
	local rectRegion = CreateRegion()
	RegionAddRect(rectRegion, r)
	return TriggerRegisterEnterRegion(trig, rectRegion, nil)
end

--===========================================================================
function TriggerRegisterLeaveRectSimple(trig, r)
	local rectRegion = CreateRegion()
	RegionAddRect(rectRegion, r)
	return TriggerRegisterLeaveRegion(trig, rectRegion, nil)
end

--===========================================================================
function TriggerRegisterDistanceBetweenUnits(trig, whichUnit, condition, range)
	return TriggerRegisterUnitInRange(trig, whichUnit, range, condition)
end

--===========================================================================
function TriggerRegisterUnitInRangeSimple(trig, range, whichUnit)
	return TriggerRegisterUnitInRange(trig, whichUnit, range, nil)
end

--===========================================================================
function TriggerRegisterUnitLifeEvent(trig, whichUnit, opcode, limitval)
	return TriggerRegisterUnitStateEvent(trig, whichUnit, UNIT_STATE_LIFE, opcode, limitval)
end

--===========================================================================
function TriggerRegisterUnitManaEvent(trig, whichUnit, opcode, limitval)
	return TriggerRegisterUnitStateEvent(trig, whichUnit, UNIT_STATE_MANA, opcode, limitval)
end

--===========================================================================
function TriggerRegisterDialogEventBJ(trig, whichDialog)
	return TriggerRegisterDialogEvent(trig, whichDialog)
end

--===========================================================================
function TriggerRegisterShowSkillEventBJ(trig)
	return TriggerRegisterGameEvent(trig, EVENT_GAME_SHOW_SKILL)
end

--===========================================================================
function TriggerRegisterBuildSubmenuEventBJ(trig)
	return TriggerRegisterGameEvent(trig, EVENT_GAME_BUILD_SUBMENU)
end

--===========================================================================
function TriggerRegisterGameLoadedEventBJ(trig)
	return TriggerRegisterGameEvent(trig, EVENT_GAME_LOADED)
end

--===========================================================================
function TriggerRegisterGameSavedEventBJ(trig)
	return TriggerRegisterGameEvent(trig, EVENT_GAME_SAVE)
end

--===========================================================================
function RegisterDestDeathInRegionEnum()
	bj_destInRegionDiesCount = bj_destInRegionDiesCount + 1
	if bj_destInRegionDiesCount <= bj_MAX_DEST_IN_REGION_EVENTS then
		TriggerRegisterDeathEvent(bj_destInRegionDiesTrig, GetEnumDestructable())
	end
end

--===========================================================================
function TriggerRegisterDestDeathInRegionEvent(trig, r)
	bj_destInRegionDiesTrig = trig
	bj_destInRegionDiesCount = 0
	EnumDestructablesInRect(r, nil, RegisterDestDeathInRegionEnum)
end



--***************************************************************************
--*
--*  Environment Utility Functions
--*
--***************************************************************************

--===========================================================================
function AddWeatherEffectSaveLast(where, effectID)
	bj_lastCreatedWeatherEffect = AddWeatherEffect(where, effectID)
	return bj_lastCreatedWeatherEffect
end

--===========================================================================
function GetLastCreatedWeatherEffect()
	return bj_lastCreatedWeatherEffect
end

--===========================================================================
function RemoveWeatherEffectBJ(whichWeatherEffect)
	RemoveWeatherEffect(whichWeatherEffect)
end

--===========================================================================
function TerrainDeformationCraterBJ(duration, permanent, where, radius, depth)
	bj_lastCreatedTerrainDeformation = TerrainDeformCrater(GetLocationX(where), GetLocationY(where), radius, depth, R2I(duration * 1000), permanent)
	return bj_lastCreatedTerrainDeformation
end

--===========================================================================
function TerrainDeformationRippleBJ(duration, limitNeg, where, startRadius, endRadius, depth, wavePeriod, waveWidth)
	local spaceWave
	local timeWave
	local radiusRatio

	if endRadius <= 0 or waveWidth <= 0 or wavePeriod <= 0 then
		return nil
	end

	timeWave = 2.0 * duration / wavePeriod
	spaceWave = 2.0 * endRadius / waveWidth
	radiusRatio = startRadius / endRadius

	bj_lastCreatedTerrainDeformation = TerrainDeformRipple(GetLocationX(where), GetLocationY(where), endRadius, depth, R2I(duration * 1000), 1, spaceWave, timeWave, radiusRatio, limitNeg)
	return bj_lastCreatedTerrainDeformation
end

--===========================================================================
function TerrainDeformationWaveBJ(duration, source, target, radius, depth, trailDelay)
	local distance
	local dirX
	local dirY
	local speed

	distance = DistanceBetweenPoints(source, target)
	if distance == 0 or duration <= 0 then
		return nil
	end

	dirX = (GetLocationX(target) - GetLocationX(source)) / distance
	dirY = (GetLocationY(target) - GetLocationY(source)) / distance
	speed = distance / duration

	bj_lastCreatedTerrainDeformation = TerrainDeformWave(GetLocationX(source), GetLocationY(source), dirX, dirY, distance, speed, radius, depth, R2I(trailDelay * 1000), 1)
	return bj_lastCreatedTerrainDeformation
end

--===========================================================================
function TerrainDeformationRandomBJ(duration, where, radius, minDelta, maxDelta, updateInterval)
	bj_lastCreatedTerrainDeformation = TerrainDeformRandom(GetLocationX(where), GetLocationY(where), radius, minDelta, maxDelta, R2I(duration * 1000), R2I(updateInterval * 1000))
	return bj_lastCreatedTerrainDeformation
end

--===========================================================================
function TerrainDeformationStopBJ(deformation, duration)
	TerrainDeformStop(deformation, R2I(duration * 1000))
end

--===========================================================================
function GetLastCreatedTerrainDeformation()
	return bj_lastCreatedTerrainDeformation
end

--===========================================================================
function AddLightningLoc(codeName, where1, where2)
	bj_lastCreatedLightning = AddLightningEx(codeName, true, GetLocationX(where1), GetLocationY(where1), GetLocationZ(where1), GetLocationX(where2), GetLocationY(where2), GetLocationZ(where2))
	return bj_lastCreatedLightning
end

--===========================================================================
function DestroyLightningBJ(whichBolt)
	return DestroyLightning(whichBolt)
end

--===========================================================================
function MoveLightningLoc(whichBolt, where1, where2)
	return MoveLightningEx(whichBolt, true, GetLocationX(where1), GetLocationY(where1), GetLocationZ(where1), GetLocationX(where2), GetLocationY(where2), GetLocationZ(where2))
end

--===========================================================================
function GetLightningColorABJ(whichBolt)
	return GetLightningColorA(whichBolt)
end

--===========================================================================
function GetLightningColorRBJ(whichBolt)
	return GetLightningColorR(whichBolt)
end

--===========================================================================
function GetLightningColorGBJ(whichBolt)
	return GetLightningColorG(whichBolt)
end

--===========================================================================
function GetLightningColorBBJ(whichBolt)
	return GetLightningColorB(whichBolt)
end

--===========================================================================
function SetLightningColorBJ(whichBolt, r, g, b, a)
	return SetLightningColor(whichBolt, r, g, b, a)
end

--===========================================================================
function GetLastCreatedLightningBJ()
	return bj_lastCreatedLightning
end

--===========================================================================
function GetAbilityEffectBJ(abilcode, t, index)
	return GetAbilityEffectById(abilcode, t, index)
end

--===========================================================================
function GetAbilitySoundBJ(abilcode, t)
	return GetAbilitySoundById(abilcode, t)
end


--===========================================================================
function GetTerrainCliffLevelBJ(where)
	return GetTerrainCliffLevel(GetLocationX(where), GetLocationY(where))
end

--===========================================================================
function GetTerrainTypeBJ(where)
	return GetTerrainType(GetLocationX(where), GetLocationY(where))
end

--===========================================================================
function GetTerrainVarianceBJ(where)
	return GetTerrainVariance(GetLocationX(where), GetLocationY(where))
end

--===========================================================================
function SetTerrainTypeBJ(where, terrainType, variation, area, shape)
	SetTerrainType(GetLocationX(where), GetLocationY(where), terrainType, variation, area, shape)
end

--===========================================================================
function IsTerrainPathableBJ(where, t)
	return IsTerrainPathable(GetLocationX(where), GetLocationY(where), t)
end

--===========================================================================
function SetTerrainPathableBJ(where, t, flag)
	SetTerrainPathable(GetLocationX(where), GetLocationY(where), t, flag)
end

--===========================================================================
function SetWaterBaseColorBJ(red, green, blue, transparency)
	SetWaterBaseColor(PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function CreateFogModifierRectSimple(whichPlayer, whichFogState, r, afterUnits)
	bj_lastCreatedFogModifier = CreateFogModifierRect(whichPlayer, whichFogState, r, true, afterUnits)
	return bj_lastCreatedFogModifier
end

--===========================================================================
function CreateFogModifierRadiusLocSimple(whichPlayer, whichFogState, center, radius, afterUnits)
	bj_lastCreatedFogModifier = CreateFogModifierRadiusLoc(whichPlayer, whichFogState, center, radius, true, afterUnits)
	return bj_lastCreatedFogModifier
end

--===========================================================================
-- Version of CreateFogModifierRect that assumes use of sharedVision and
-- gives the option of immediately enabling the modifier, so that triggers
-- can default to modifiers that are immediately enabled.
--
function CreateFogModifierRectBJ(enabled, whichPlayer, whichFogState, r)
	bj_lastCreatedFogModifier = CreateFogModifierRect(whichPlayer, whichFogState, r, true, false)
	if enabled then
		FogModifierStart(bj_lastCreatedFogModifier)
	end
	return bj_lastCreatedFogModifier
end

--===========================================================================
-- Version of CreateFogModifierRadius that assumes use of sharedVision and
-- gives the option of immediately enabling the modifier, so that triggers
-- can default to modifiers that are immediately enabled.
--
function CreateFogModifierRadiusLocBJ(enabled, whichPlayer, whichFogState, center, radius)
	bj_lastCreatedFogModifier = CreateFogModifierRadiusLoc(whichPlayer, whichFogState, center, radius, true, false)
	if enabled then
		FogModifierStart(bj_lastCreatedFogModifier)
	end
	return bj_lastCreatedFogModifier
end

--===========================================================================
function GetLastCreatedFogModifier()
	return bj_lastCreatedFogModifier
end

--===========================================================================
function FogEnableOn()
	FogEnable(true)
end

--===========================================================================
function FogEnableOff()
	FogEnable(false)
end

--===========================================================================
function FogMaskEnableOn()
	FogMaskEnable(true)
end

--===========================================================================
function FogMaskEnableOff()
	FogMaskEnable(false)
end

--===========================================================================
function UseTimeOfDayBJ(flag)
	SuspendTimeOfDay(not flag)
end

--===========================================================================
function SetTerrainFogExBJ(style, zstart, zend, density, red, green, blue)
	SetTerrainFogEx(style, zstart, zend, density, red * 0.01, green * 0.01, blue * 0.01)
end

--===========================================================================
function ResetTerrainFogBJ()
	ResetTerrainFog()
end

--===========================================================================
function SetDoodadAnimationBJ(animName, doodadID, radius, center)
	SetDoodadAnimation(GetLocationX(center), GetLocationY(center), radius, doodadID, false, animName, false)
end

--===========================================================================
function SetDoodadAnimationRectBJ(animName, doodadID, r)
	SetDoodadAnimationRect(r, doodadID, animName, false)
end

--===========================================================================
function AddUnitAnimationPropertiesBJ(add, animProperties, whichUnit)
	AddUnitAnimationProperties(whichUnit, animProperties, add)
end


--============================================================================
function CreateImageBJ(file, size, where, zOffset, imageType)
	bj_lastCreatedImage = CreateImage(file, size, size, size, GetLocationX(where), GetLocationY(where), zOffset, 0, 0, 0, imageType)
	return bj_lastCreatedImage
end

--============================================================================
function ShowImageBJ(flag, whichImage)
	ShowImage(whichImage, flag)
end

--============================================================================
function SetImagePositionBJ(whichImage, where, zOffset)
	SetImagePosition(whichImage, GetLocationX(where), GetLocationY(where), zOffset)
end

--============================================================================
function SetImageColorBJ(whichImage, red, green, blue, alpha)
	SetImageColor(whichImage, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - alpha))
end

--============================================================================
function GetLastCreatedImage()
	return bj_lastCreatedImage
end

--============================================================================
function CreateUbersplatBJ(where, name, red, green, blue, alpha, forcePaused, noBirthTime)
	bj_lastCreatedUbersplat = CreateUbersplat(GetLocationX(where), GetLocationY(where), name, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - alpha), forcePaused, noBirthTime)
	return bj_lastCreatedUbersplat
end

--============================================================================
function ShowUbersplatBJ(flag, whichSplat)
	ShowUbersplat(whichSplat, flag)
end

--============================================================================
function GetLastCreatedUbersplat()
	return bj_lastCreatedUbersplat
end


--***************************************************************************
--*
--*  Sound Utility Functions
--*
--***************************************************************************

--===========================================================================
function PlaySoundBJ(soundHandle)
	bj_lastPlayedSound = soundHandle
	if soundHandle ~= nil then
		StartSound(soundHandle)
	end
end

--===========================================================================
function StopSoundBJ(soundHandle, fadeOut)
	StopSound(soundHandle, false, fadeOut)
end

--===========================================================================
function SetSoundVolumeBJ(soundHandle, volumePercent)
	SetSoundVolume(soundHandle, PercentToInt(volumePercent, 127))
end

--===========================================================================
function SetSoundOffsetBJ(newOffset, soundHandle)
	SetSoundPlayPosition(soundHandle, R2I(newOffset * 1000))
end

--===========================================================================
function SetSoundDistanceCutoffBJ(soundHandle, cutoff)
	SetSoundDistanceCutoff(soundHandle, cutoff)
end

--===========================================================================
function SetSoundPitchBJ(soundHandle, pitch)
	SetSoundPitch(soundHandle, pitch)
end

--===========================================================================
function SetSoundPositionLocBJ(soundHandle, loc, z)
	SetSoundPosition(soundHandle, GetLocationX(loc), GetLocationY(loc), z)
end

--===========================================================================
function AttachSoundToUnitBJ(soundHandle, whichUnit)
	AttachSoundToUnit(soundHandle, whichUnit)
end

--===========================================================================
function SetSoundConeAnglesBJ(soundHandle, inside, outside, outsideVolumePercent)
	SetSoundConeAngles(soundHandle, inside, outside, PercentToInt(outsideVolumePercent, 127))
end

--===========================================================================
function KillSoundWhenDoneBJ(soundHandle)
	KillSoundWhenDone(soundHandle)
end

--===========================================================================
function PlaySoundAtPointBJ(soundHandle, volumePercent, loc, z)
	SetSoundPositionLocBJ(soundHandle, loc, z)
	SetSoundVolumeBJ(soundHandle, volumePercent)
	PlaySoundBJ(soundHandle)
end

--===========================================================================
function PlaySoundOnUnitBJ(soundHandle, volumePercent, whichUnit)
	AttachSoundToUnitBJ(soundHandle, whichUnit)
	SetSoundVolumeBJ(soundHandle, volumePercent)
	PlaySoundBJ(soundHandle)
end

--===========================================================================
function PlaySoundFromOffsetBJ(soundHandle, volumePercent, startingOffset)
	SetSoundVolumeBJ(soundHandle, volumePercent)
	PlaySoundBJ(soundHandle)
	SetSoundOffsetBJ(startingOffset, soundHandle)
end

--===========================================================================
function PlayMusicBJ(musicFileName)
	bj_lastPlayedMusic = musicFileName
	PlayMusic(musicFileName)
end

--===========================================================================
function PlayMusicExBJ(musicFileName, startingOffset, fadeInTime)
	bj_lastPlayedMusic = musicFileName
	PlayMusicEx(musicFileName, R2I(startingOffset * 1000), R2I(fadeInTime * 1000))
end

--===========================================================================
function SetMusicOffsetBJ(newOffset)
	SetMusicPlayPosition(R2I(newOffset * 1000))
end

--===========================================================================
function PlayThematicMusicBJ(musicName)
	PlayThematicMusic(musicName)
end

--===========================================================================
function PlayThematicMusicExBJ(musicName, startingOffset)
	PlayThematicMusicEx(musicName, R2I(startingOffset * 1000))
end

--===========================================================================
function SetThematicMusicOffsetBJ(newOffset)
	SetThematicMusicPlayPosition(R2I(newOffset * 1000))
end

--===========================================================================
function EndThematicMusicBJ()
	EndThematicMusic()
end

--===========================================================================
function StopMusicBJ(fadeOut)
	StopMusic(fadeOut)
end

--===========================================================================
function ResumeMusicBJ()
	ResumeMusic()
end

--===========================================================================
function SetMusicVolumeBJ(volumePercent)
	SetMusicVolume(PercentToInt(volumePercent, 127))
end

--===========================================================================
function GetSoundDurationBJ(soundHandle)
	if soundHandle == nil then
		return bj_NOTHING_SOUND_DURATION
	else
		return I2R(GetSoundDuration(soundHandle)) * 0.001
	end
end

--===========================================================================
function GetSoundFileDurationBJ(musicFileName)
	return I2R(GetSoundFileDuration(musicFileName)) * 0.001
end

--===========================================================================
function GetLastPlayedSound()
	return bj_lastPlayedSound
end

--===========================================================================
function GetLastPlayedMusic()
	return bj_lastPlayedMusic
end

--===========================================================================
function VolumeGroupSetVolumeBJ(vgroup, percent)
	VolumeGroupSetVolume(vgroup, percent * 0.01)
end

--===========================================================================
function SetCineModeVolumeGroupsImmediateBJ()
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UNITMOVEMENT, bj_CINEMODE_VOLUME_UNITMOVEMENT)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UNITSOUNDS, bj_CINEMODE_VOLUME_UNITSOUNDS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_COMBAT, bj_CINEMODE_VOLUME_COMBAT)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_SPELLS, bj_CINEMODE_VOLUME_SPELLS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UI, bj_CINEMODE_VOLUME_UI)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_MUSIC, bj_CINEMODE_VOLUME_MUSIC)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_AMBIENTSOUNDS, bj_CINEMODE_VOLUME_AMBIENTSOUNDS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_FIRE, bj_CINEMODE_VOLUME_FIRE)
end

--===========================================================================
function SetCineModeVolumeGroupsBJ()
	-- Delay the request if it occurs at map init.
	if bj_gameStarted then
		SetCineModeVolumeGroupsImmediateBJ()
	else
		TimerStart(bj_volumeGroupsTimer, bj_GAME_STARTED_THRESHOLD, false, SetCineModeVolumeGroupsImmediateBJ)
	end
end

--===========================================================================
function SetSpeechVolumeGroupsImmediateBJ()
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UNITMOVEMENT, bj_SPEECH_VOLUME_UNITMOVEMENT)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UNITSOUNDS, bj_SPEECH_VOLUME_UNITSOUNDS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_COMBAT, bj_SPEECH_VOLUME_COMBAT)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_SPELLS, bj_SPEECH_VOLUME_SPELLS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_UI, bj_SPEECH_VOLUME_UI)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_MUSIC, bj_SPEECH_VOLUME_MUSIC)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_AMBIENTSOUNDS, bj_SPEECH_VOLUME_AMBIENTSOUNDS)
	VolumeGroupSetVolume(SOUND_VOLUMEGROUP_FIRE, bj_SPEECH_VOLUME_FIRE)
end

--===========================================================================
function SetSpeechVolumeGroupsBJ()
	-- Delay the request if it occurs at map init.
	if bj_gameStarted then
		SetSpeechVolumeGroupsImmediateBJ()
	else
		TimerStart(bj_volumeGroupsTimer, bj_GAME_STARTED_THRESHOLD, false, SetSpeechVolumeGroupsImmediateBJ)
	end
end

--===========================================================================
function VolumeGroupResetImmediateBJ()
	VolumeGroupReset()
end

--===========================================================================
function VolumeGroupResetBJ()
	-- Delay the request if it occurs at map init.
	if bj_gameStarted then
		VolumeGroupResetImmediateBJ()
	else
		TimerStart(bj_volumeGroupsTimer, bj_GAME_STARTED_THRESHOLD, false, VolumeGroupResetImmediateBJ)
	end
end

--===========================================================================
function GetSoundIsPlayingBJ(soundHandle)
	return GetSoundIsLoading(soundHandle) or GetSoundIsPlaying(soundHandle)
end

--===========================================================================
function WaitForSoundBJ(soundHandle, offset)
	TriggerWaitForSound(soundHandle, offset)
end

--===========================================================================
function SetMapMusicIndexedBJ(musicName, index)
	SetMapMusic(musicName, false, index)
end

--===========================================================================
function SetMapMusicRandomBJ(musicName)
	SetMapMusic(musicName, true, 0)
end

--===========================================================================
function ClearMapMusicBJ()
	ClearMapMusic()
end

--===========================================================================
function SetStackedSoundBJ(add, soundHandle, r)
	local width = GetRectMaxX(r) - GetRectMinX(r)
	local height = GetRectMaxY(r) - GetRectMinY(r)

	SetSoundPosition(soundHandle, GetRectCenterX(r), GetRectCenterY(r), 0)
	if add then
		RegisterStackedSound(soundHandle, true, width, height)
	else
		UnregisterStackedSound(soundHandle, true, width, height)
	end
end

--===========================================================================
function StartSoundForPlayerBJ(whichPlayer, soundHandle)
	if whichPlayer == GetLocalPlayer() then
		StartSound(soundHandle)
	end
end

--===========================================================================
function VolumeGroupSetVolumeForPlayerBJ(whichPlayer, vgroup, scale)
	if GetLocalPlayer() == whichPlayer then
		VolumeGroupSetVolume(vgroup, scale)
	end
end

--===========================================================================
function EnableDawnDusk(flag)
	bj_useDawnDuskSounds = flag
end

--===========================================================================
function IsDawnDuskEnabled()
	return bj_useDawnDuskSounds
end



--***************************************************************************
--*
--*  Day/Night ambient sounds
--*
--***************************************************************************

--===========================================================================
function SetAmbientDaySound(inLabel)
	local ToD

	-- Stop old sound, if necessary
	if bj_dayAmbientSound ~= nil then
		StopSound(bj_dayAmbientSound, true, true)
	end

	-- Create new sound
	bj_dayAmbientSound = CreateMIDISound(inLabel, 20, 20)

	-- Start the sound if necessary, based on current time
	ToD = GetTimeOfDay()
	if ToD >= bj_TOD_DAWN and ToD < bj_TOD_DUSK then
		StartSound(bj_dayAmbientSound)
	end
end

--===========================================================================
function SetAmbientNightSound(inLabel)
	local ToD

	-- Stop old sound, if necessary
	if bj_nightAmbientSound ~= nil then
		StopSound(bj_nightAmbientSound, true, true)
	end

	-- Create new sound
	bj_nightAmbientSound = CreateMIDISound(inLabel, 20, 20)

	-- Start the sound if necessary, based on current time
	ToD = GetTimeOfDay()
	if ToD < bj_TOD_DAWN or ToD >= bj_TOD_DUSK then
		StartSound(bj_nightAmbientSound)
	end
end



--***************************************************************************
--*
--*  Special Effect Utility Functions
--*
--***************************************************************************

--===========================================================================
function AddSpecialEffectLocBJ(where, modelName)
	bj_lastCreatedEffect = AddSpecialEffectLoc(modelName, where)
	return bj_lastCreatedEffect
end

--===========================================================================
function AddSpecialEffectTargetUnitBJ(attachPointName, targetWidget, modelName)
	bj_lastCreatedEffect = AddSpecialEffectTarget(modelName, targetWidget, attachPointName)
	return bj_lastCreatedEffect
end

--===========================================================================
-- Two distinct trigger actions can't share the same function name, so this
-- dummy function simply mimics the behavior of an existing call.
--
-- Commented out - Destructibles have no attachment points.
--
--function AddSpecialEffectTargetDestructableBJ takes string attachPointName, widget targetWidget, string modelName returns effect
--    return AddSpecialEffectTargetUnitBJ(attachPointName, targetWidget, modelName)
--endfunction

--===========================================================================
-- Two distinct trigger actions can't share the same function name, so this
-- dummy function simply mimics the behavior of an existing call.
--
-- Commented out - Items have no attachment points.
--
--function AddSpecialEffectTargetItemBJ takes string attachPointName, widget targetWidget, string modelName returns effect
--    return AddSpecialEffectTargetUnitBJ(attachPointName, targetWidget, modelName)
--endfunction

--===========================================================================
function DestroyEffectBJ(whichEffect)
	DestroyEffect(whichEffect)
end

--===========================================================================
function GetLastCreatedEffectBJ()
	return bj_lastCreatedEffect
end



--***************************************************************************
--*
--*  Hero and Item Utility Functions
--*
--***************************************************************************

--===========================================================================
function GetItemLoc(whichItem)
	return Location(GetItemX(whichItem), GetItemY(whichItem))
end

--===========================================================================
function GetItemLifeBJ(whichWidget)
	return GetWidgetLife(whichWidget)
end

--===========================================================================
function SetItemLifeBJ(whichWidget, life)
	SetWidgetLife(whichWidget, life)
end

--===========================================================================
function AddHeroXPSwapped(xpToAdd, whichHero, showEyeCandy)
	AddHeroXP(whichHero, xpToAdd, showEyeCandy)
end

--===========================================================================
function SetHeroLevelBJ(whichHero, newLevel, showEyeCandy)
	local oldLevel = GetHeroLevel(whichHero)

	if newLevel > oldLevel then
		SetHeroLevel(whichHero, newLevel, showEyeCandy)
	elseif newLevel < oldLevel then
		UnitStripHeroLevel(whichHero, oldLevel - newLevel)
	else
	-- No change in level - ignore the request.
	end
end

--===========================================================================
function DecUnitAbilityLevelSwapped(abilcode, whichUnit)
	return DecUnitAbilityLevel(whichUnit, abilcode)
end

--===========================================================================
function IncUnitAbilityLevelSwapped(abilcode, whichUnit)
	return IncUnitAbilityLevel(whichUnit, abilcode)
end

--===========================================================================
function SetUnitAbilityLevelSwapped(abilcode, whichUnit, level)
	return SetUnitAbilityLevel(whichUnit, abilcode, level)
end

--===========================================================================
function GetUnitAbilityLevelSwapped(abilcode, whichUnit)
	return GetUnitAbilityLevel(whichUnit, abilcode)
end

--===========================================================================
function UnitHasBuffBJ(whichUnit, buffcode)
	return GetUnitAbilityLevel(whichUnit, buffcode) > 0
end

--===========================================================================
function UnitRemoveBuffBJ(buffcode, whichUnit)
	return UnitRemoveAbility(whichUnit, buffcode)
end

--===========================================================================
function UnitAddItemSwapped(whichItem, whichHero)
	return UnitAddItem(whichHero, whichItem)
end

--===========================================================================
function UnitAddItemByIdSwapped(itemId, whichHero)
	-- Create the item at the hero's feet first, and then give it to him.
	-- This is to ensure that the item will be left at the hero's feet if
	-- his inventory is full. 
	bj_lastCreatedItem = CreateItem(itemId, GetUnitX(whichHero), GetUnitY(whichHero))
	UnitAddItem(whichHero, bj_lastCreatedItem)
	return bj_lastCreatedItem
end

--===========================================================================
function UnitRemoveItemSwapped(whichItem, whichHero)
	bj_lastRemovedItem = whichItem
	UnitRemoveItem(whichHero, whichItem)
end

--===========================================================================
-- Translates 0-based slot indices to 1-based slot indices.
--
function UnitRemoveItemFromSlotSwapped(itemSlot, whichHero)
	bj_lastRemovedItem = UnitRemoveItemFromSlot(whichHero, itemSlot - 1)
	return bj_lastRemovedItem
end

--===========================================================================
function CreateItemLoc(itemId, loc)
	bj_lastCreatedItem = CreateItem(itemId, GetLocationX(loc), GetLocationY(loc))
	return bj_lastCreatedItem
end

--===========================================================================
function GetLastCreatedItem()
	return bj_lastCreatedItem
end

--===========================================================================
function GetLastRemovedItem()
	return bj_lastRemovedItem
end

--===========================================================================
function SetItemPositionLoc(whichItem, loc)
	SetItemPosition(whichItem, GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
function GetLearnedSkillBJ()
	return GetLearnedSkill()
end

--===========================================================================
function SuspendHeroXPBJ(flag, whichHero)
	SuspendHeroXP(whichHero, not flag)
end

--===========================================================================
function SetPlayerHandicapXPBJ(whichPlayer, handicapPercent)
	SetPlayerHandicapXP(whichPlayer, handicapPercent * 0.01)
end

--===========================================================================
function GetPlayerHandicapXPBJ(whichPlayer)
	return GetPlayerHandicapXP(whichPlayer) * 100
end

--===========================================================================
function SetPlayerHandicapBJ(whichPlayer, handicapPercent)
	SetPlayerHandicap(whichPlayer, handicapPercent * 0.01)
end

--===========================================================================
function GetPlayerHandicapBJ(whichPlayer)
	return GetPlayerHandicap(whichPlayer) * 100
end

--===========================================================================
function GetHeroStatBJ(whichStat, whichHero, includeBonuses)
	if whichStat == bj_HEROSTAT_STR then
		return GetHeroStr(whichHero, includeBonuses)
	elseif whichStat == bj_HEROSTAT_AGI then
		return GetHeroAgi(whichHero, includeBonuses)
	elseif whichStat == bj_HEROSTAT_INT then
		return GetHeroInt(whichHero, includeBonuses)
	else
		-- Unrecognized hero stat - return 0
		return 0
	end
end

--===========================================================================
function SetHeroStat(whichHero, whichStat, value)
	-- Ignore requests for negative hero stats.
	if value <= 0 then
		return
	end

	if whichStat == bj_HEROSTAT_STR then
		SetHeroStr(whichHero, value, true)
	elseif whichStat == bj_HEROSTAT_AGI then
		SetHeroAgi(whichHero, value, true)
	elseif whichStat == bj_HEROSTAT_INT then
		SetHeroInt(whichHero, value, true)
	else
	-- Unrecognized hero stat - ignore the request.
	end
end

--===========================================================================
function ModifyHeroStat(whichStat, whichHero, modifyMethod, value)
	if modifyMethod == bj_MODIFYMETHOD_ADD then
		SetHeroStat(whichHero, whichStat, GetHeroStatBJ(whichStat, whichHero, false) + value)
	elseif modifyMethod == bj_MODIFYMETHOD_SUB then
		SetHeroStat(whichHero, whichStat, GetHeroStatBJ(whichStat, whichHero, false) - value)
	elseif modifyMethod == bj_MODIFYMETHOD_SET then
		SetHeroStat(whichHero, whichStat, value)
	else
	-- Unrecognized modification method - ignore the request.
	end
end

--===========================================================================
function ModifyHeroSkillPoints(whichHero, modifyMethod, value)
	if modifyMethod == bj_MODIFYMETHOD_ADD then
		return UnitModifySkillPoints(whichHero, value)
	elseif modifyMethod == bj_MODIFYMETHOD_SUB then
		return UnitModifySkillPoints(whichHero,  - value)
	elseif modifyMethod == bj_MODIFYMETHOD_SET then
		return UnitModifySkillPoints(whichHero, value - GetHeroSkillPoints(whichHero))
	else
		-- Unrecognized modification method - ignore the request and return failure.
		return false
	end
end

--===========================================================================
function UnitDropItemPointBJ(whichUnit, whichItem, x, y)
	return UnitDropItemPoint(whichUnit, whichItem, x, y)
end

--===========================================================================
function UnitDropItemPointLoc(whichUnit, whichItem, loc)
	return UnitDropItemPoint(whichUnit, whichItem, GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
function UnitDropItemSlotBJ(whichUnit, whichItem, slot)
	return UnitDropItemSlot(whichUnit, whichItem, slot - 1)
end

--===========================================================================
function UnitDropItemTargetBJ(whichUnit, whichItem, target)
	return UnitDropItemTarget(whichUnit, whichItem, target)
end

--===========================================================================
-- Two distinct trigger actions can't share the same function name, so this
-- dummy function simply mimics the behavior of an existing call.
--
function UnitUseItemDestructable(whichUnit, whichItem, target)
	return UnitUseItemTarget(whichUnit, whichItem, target)
end

--===========================================================================
function UnitUseItemPointLoc(whichUnit, whichItem, loc)
	return UnitUseItemPoint(whichUnit, whichItem, GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
-- Translates 0-based slot indices to 1-based slot indices.
--
function UnitItemInSlotBJ(whichUnit, itemSlot)
	return UnitItemInSlot(whichUnit, itemSlot - 1)
end

--===========================================================================
-- Translates 0-based slot indices to 1-based slot indices.
--
function GetInventoryIndexOfItemTypeBJ(whichUnit, itemId)
	local index
	local indexItem

	index = 0
	for _ in _loop_() do
		indexItem = UnitItemInSlot(whichUnit, index)
		if indexItem ~= nil and GetItemTypeId(indexItem) == itemId then
			return index + 1
		end

		index = index + 1
		if index >= bj_MAX_INVENTORY then break end
	end
	return 0
end

--===========================================================================
function GetItemOfTypeFromUnitBJ(whichUnit, itemId)
	local index = GetInventoryIndexOfItemTypeBJ(whichUnit, itemId)

	if index == 0 then
		return nil
	else
		return UnitItemInSlot(whichUnit, index - 1)
	end
end

--===========================================================================
function UnitHasItemOfTypeBJ(whichUnit, itemId)
	return GetInventoryIndexOfItemTypeBJ(whichUnit, itemId) > 0
end

--===========================================================================
function UnitInventoryCount(whichUnit)
	local index = 0
	local count = 0

	for _ in _loop_() do
		if UnitItemInSlot(whichUnit, index) ~= nil then
			count = count + 1
		end

		index = index + 1
		if index >= bj_MAX_INVENTORY then break end
	end

	return count
end

--===========================================================================
function UnitInventorySizeBJ(whichUnit)
	return UnitInventorySize(whichUnit)
end

--===========================================================================
function SetItemInvulnerableBJ(whichItem, flag)
	SetItemInvulnerable(whichItem, flag)
end

--===========================================================================
function SetItemDropOnDeathBJ(whichItem, flag)
	SetItemDropOnDeath(whichItem, flag)
end

--===========================================================================
function SetItemDroppableBJ(whichItem, flag)
	SetItemDroppable(whichItem, flag)
end

--===========================================================================
function SetItemPlayerBJ(whichItem, whichPlayer, changeColor)
	SetItemPlayer(whichItem, whichPlayer, changeColor)
end

--===========================================================================
function SetItemVisibleBJ(show, whichItem)
	SetItemVisible(whichItem, show)
end

--===========================================================================
function IsItemHiddenBJ(whichItem)
	return not IsItemVisible(whichItem)
end

--===========================================================================
function ChooseRandomItemBJ(level)
	return ChooseRandomItem(level)
end

--===========================================================================
function ChooseRandomItemExBJ(level, whichType)
	return ChooseRandomItemEx(whichType, level)
end

--===========================================================================
function ChooseRandomNPBuildingBJ()
	return ChooseRandomNPBuilding()
end

--===========================================================================
function ChooseRandomCreepBJ(level)
	return ChooseRandomCreep(level)
end

--===========================================================================
function EnumItemsInRectBJ(r, actionFunc)
	EnumItemsInRect(r, nil, actionFunc)
end

--===========================================================================
-- See GroupPickRandomUnitEnum for the details of this algorithm.
--
function RandomItemInRectBJEnum()
	bj_itemRandomConsidered = bj_itemRandomConsidered + 1
	if GetRandomInt(1, bj_itemRandomConsidered) == 1 then
		bj_itemRandomCurrentPick = GetEnumItem()
	end
end

--===========================================================================
-- Picks a random item from within a rect, matching a condition
--
function RandomItemInRectBJ(r, filter)
	bj_itemRandomConsidered = 0
	bj_itemRandomCurrentPick = nil
	EnumItemsInRect(r, filter, RandomItemInRectBJEnum)
	DestroyBoolExpr(filter)
	return bj_itemRandomCurrentPick
end

--===========================================================================
-- Picks a random item from within a rect
--
function RandomItemInRectSimpleBJ(r)
	return RandomItemInRectBJ(r, nil)
end

--===========================================================================
function CheckItemStatus(whichItem, status)
	if status == bj_ITEM_STATUS_HIDDEN then
		return not IsItemVisible(whichItem)
	elseif status == bj_ITEM_STATUS_OWNED then
		return IsItemOwned(whichItem)
	elseif status == bj_ITEM_STATUS_INVULNERABLE then
		return IsItemInvulnerable(whichItem)
	elseif status == bj_ITEM_STATUS_POWERUP then
		return IsItemPowerup(whichItem)
	elseif status == bj_ITEM_STATUS_SELLABLE then
		return IsItemSellable(whichItem)
	elseif status == bj_ITEM_STATUS_PAWNABLE then
		return IsItemPawnable(whichItem)
	else
		-- Unrecognized status - return false
		return false
	end
end

--===========================================================================
function CheckItemcodeStatus(itemId, status)
	if status == bj_ITEMCODE_STATUS_POWERUP then
		return IsItemIdPowerup(itemId)
	elseif status == bj_ITEMCODE_STATUS_SELLABLE then
		return IsItemIdSellable(itemId)
	elseif status == bj_ITEMCODE_STATUS_PAWNABLE then
		return IsItemIdPawnable(itemId)
	else
		-- Unrecognized status - return false
		return false
	end
end



--***************************************************************************
--*
--*  Unit Utility Functions
--*
--***************************************************************************

--===========================================================================
function UnitId2OrderIdBJ(unitId)
	return unitId
end

--===========================================================================
function String2UnitIdBJ(unitIdString)
	return UnitId(unitIdString)
end

--===========================================================================
function UnitId2StringBJ(unitId)
	local unitString = UnitId2String(unitId)

	if unitString ~= nil then
		return unitString
	end

	-- The unitId was not recognized - return an empty string.
	return ""
end

--===========================================================================
function String2OrderIdBJ(orderIdString)
	local orderId

	-- Check to see if it's a generic order.
	orderId = OrderId(orderIdString)
	if orderId ~= 0 then
		return orderId
	end

	-- Check to see if it's a (train) unit order.
	orderId = UnitId(orderIdString)
	if orderId ~= 0 then
		return orderId
	end

	-- Unrecognized - return 0
	return 0
end

--===========================================================================
function OrderId2StringBJ(orderId)
	local orderString

	-- Check to see if it's a generic order.
	orderString = OrderId2String(orderId)
	if orderString ~= nil then
		return orderString
	end

	-- Check to see if it's a (train) unit order.
	orderString = UnitId2String(orderId)
	if orderString ~= nil then
		return orderString
	end

	-- Unrecognized - return an empty string.
	return ""
end

--===========================================================================
function GetIssuedOrderIdBJ()
	return GetIssuedOrderId()
end

--===========================================================================
function GetKillingUnitBJ()
	return GetKillingUnit()
end

--===========================================================================
function CreateUnitAtLocSaveLast(id, unitid, loc, face)
	if unitid == 1969713004 then
		bj_lastCreatedUnit = CreateBlightedGoldmine(id, GetLocationX(loc), GetLocationY(loc), face)
	else
		bj_lastCreatedUnit = CreateUnitAtLoc(id, unitid, loc, face)
	end

	return bj_lastCreatedUnit
end

--===========================================================================
function GetLastCreatedUnit()
	return bj_lastCreatedUnit
end

--===========================================================================
function CreateNUnitsAtLoc(count, unitId, whichPlayer, loc, face)
	GroupClear(bj_lastCreatedGroup)
	for _ in _loop_() do
		count = count - 1
		if count < 0 then break end
		CreateUnitAtLocSaveLast(whichPlayer, unitId, loc, face)
		GroupAddUnit(bj_lastCreatedGroup, bj_lastCreatedUnit)
	end
	return bj_lastCreatedGroup
end

--===========================================================================
function CreateNUnitsAtLocFacingLocBJ(count, unitId, whichPlayer, loc, lookAt)
	return CreateNUnitsAtLoc(count, unitId, whichPlayer, loc, AngleBetweenPoints(loc, lookAt))
end

--===========================================================================
function GetLastCreatedGroupEnum()
	GroupAddUnit(bj_groupLastCreatedDest, GetEnumUnit())
end

--===========================================================================
function GetLastCreatedGroup()
	bj_groupLastCreatedDest = CreateGroup()
	ForGroup(bj_lastCreatedGroup, GetLastCreatedGroupEnum)
	return bj_groupLastCreatedDest
end

--===========================================================================
function CreateCorpseLocBJ(unitid, whichPlayer, loc)
	bj_lastCreatedUnit = CreateCorpse(whichPlayer, unitid, GetLocationX(loc), GetLocationY(loc), GetRandomReal(0, 360))
	return bj_lastCreatedUnit
end

--===========================================================================
function UnitSuspendDecayBJ(suspend, whichUnit)
	UnitSuspendDecay(whichUnit, suspend)
end

--===========================================================================
function DelayedSuspendDecayStopAnimEnum()
	local enumUnit = GetEnumUnit()

	if GetUnitState(enumUnit, UNIT_STATE_LIFE) <= 0 then
		SetUnitTimeScale(enumUnit, 0.0001)
	end
end

--===========================================================================
function DelayedSuspendDecayBoneEnum()
	local enumUnit = GetEnumUnit()

	if GetUnitState(enumUnit, UNIT_STATE_LIFE) <= 0 then
		UnitSuspendDecay(enumUnit, true)
		SetUnitTimeScale(enumUnit, 0.0001)
	end
end

--===========================================================================
-- Game code explicitly sets the animation back to "decay bone" after the
-- initial corpse fades away, so we reset it now.  It's best not to show
-- off corpses thus created until after this grace period has passed.
--
function DelayedSuspendDecayFleshEnum()
	local enumUnit = GetEnumUnit()

	if GetUnitState(enumUnit, UNIT_STATE_LIFE) <= 0 then
		UnitSuspendDecay(enumUnit, true)
		SetUnitTimeScale(enumUnit, 10.0)
		SetUnitAnimation(enumUnit, "decay flesh")
	end
end

--===========================================================================
-- Waits a short period of time to ensure that the corpse is decaying, and
-- then suspend the animation and corpse decay.
--
function DelayedSuspendDecay()
	local boneGroup
	local fleshGroup

	-- Switch the global unit groups over to local variables and recreate
	-- the global versions, so that this function can handle overlapping
	-- calls.
	boneGroup = bj_suspendDecayBoneGroup
	fleshGroup = bj_suspendDecayFleshGroup
	bj_suspendDecayBoneGroup = CreateGroup()
	bj_suspendDecayFleshGroup = CreateGroup()

	ForGroup(fleshGroup, DelayedSuspendDecayStopAnimEnum)
	ForGroup(boneGroup, DelayedSuspendDecayStopAnimEnum)

	TriggerSleepAction(bj_CORPSE_MAX_DEATH_TIME)
	ForGroup(fleshGroup, DelayedSuspendDecayFleshEnum)
	ForGroup(boneGroup, DelayedSuspendDecayBoneEnum)

	TriggerSleepAction(0.05)
	ForGroup(fleshGroup, DelayedSuspendDecayStopAnimEnum)

	DestroyGroup(boneGroup)
	DestroyGroup(fleshGroup)
end

--===========================================================================
function DelayedSuspendDecayCreate()
	bj_delayedSuspendDecayTrig = CreateTrigger()
	TriggerRegisterTimerExpireEvent(bj_delayedSuspendDecayTrig, bj_delayedSuspendDecayTimer)
	TriggerAddAction(bj_delayedSuspendDecayTrig, DelayedSuspendDecay)
end

--===========================================================================
function CreatePermanentCorpseLocBJ(style, unitid, whichPlayer, loc, facing)
	bj_lastCreatedUnit = CreateCorpse(whichPlayer, unitid, GetLocationX(loc), GetLocationY(loc), facing)
	SetUnitBlendTime(bj_lastCreatedUnit, 0)

	if style == bj_CORPSETYPE_FLESH then
		SetUnitAnimation(bj_lastCreatedUnit, "decay flesh")
		GroupAddUnit(bj_suspendDecayFleshGroup, bj_lastCreatedUnit)
	elseif style == bj_CORPSETYPE_BONE then
		SetUnitAnimation(bj_lastCreatedUnit, "decay bone")
		GroupAddUnit(bj_suspendDecayBoneGroup, bj_lastCreatedUnit)
	else
		-- Unknown decay style - treat as skeletal.
		SetUnitAnimation(bj_lastCreatedUnit, "decay bone")
		GroupAddUnit(bj_suspendDecayBoneGroup, bj_lastCreatedUnit)
	end

	TimerStart(bj_delayedSuspendDecayTimer, 0.05, false, nil)
	return bj_lastCreatedUnit
end

--===========================================================================
function GetUnitStateSwap(whichState, whichUnit)
	return GetUnitState(whichUnit, whichState)
end

--===========================================================================
function GetUnitStatePercent(whichUnit, whichState, whichMaxState)
	local value = GetUnitState(whichUnit, whichState)
	local maxValue = GetUnitState(whichUnit, whichMaxState)

	-- Return 0 for null units.
	if whichUnit == nil or maxValue == 0 then
		return 0.0
	end

	return value / maxValue * 100.0
end

--===========================================================================
function GetUnitLifePercent(whichUnit)
	return GetUnitStatePercent(whichUnit, UNIT_STATE_LIFE, UNIT_STATE_MAX_LIFE)
end

--===========================================================================
function GetUnitManaPercent(whichUnit)
	return GetUnitStatePercent(whichUnit, UNIT_STATE_MANA, UNIT_STATE_MAX_MANA)
end

--===========================================================================
function SelectUnitSingle(whichUnit)
	ClearSelection()
	SelectUnit(whichUnit, true)
end

--===========================================================================
function SelectGroupBJEnum()
	SelectUnit(GetEnumUnit(), true)
end

--===========================================================================
function SelectGroupBJ(g)
	ClearSelection()
	ForGroup(g, SelectGroupBJEnum)
end

--===========================================================================
function SelectUnitAdd(whichUnit)
	SelectUnit(whichUnit, true)
end

--===========================================================================
function SelectUnitRemove(whichUnit)
	SelectUnit(whichUnit, false)
end

--===========================================================================
function ClearSelectionForPlayer(whichPlayer)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ClearSelection()
	end
end

--===========================================================================
function SelectUnitForPlayerSingle(whichUnit, whichPlayer)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ClearSelection()
		SelectUnit(whichUnit, true)
	end
end

--===========================================================================
function SelectGroupForPlayerBJ(g, whichPlayer)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ClearSelection()
		ForGroup(g, SelectGroupBJEnum)
	end
end

--===========================================================================
function SelectUnitAddForPlayer(whichUnit, whichPlayer)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SelectUnit(whichUnit, true)
	end
end

--===========================================================================
function SelectUnitRemoveForPlayer(whichUnit, whichPlayer)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SelectUnit(whichUnit, false)
	end
end

--===========================================================================
function SetUnitLifeBJ(whichUnit, newValue)
	SetUnitState(whichUnit, UNIT_STATE_LIFE, RMaxBJ(0, newValue))
end

--===========================================================================
function SetUnitManaBJ(whichUnit, newValue)
	SetUnitState(whichUnit, UNIT_STATE_MANA, RMaxBJ(0, newValue))
end

--===========================================================================
function SetUnitLifePercentBJ(whichUnit, percent)
	SetUnitState(whichUnit, UNIT_STATE_LIFE, GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE) * RMaxBJ(0, percent) * 0.01)
end

--===========================================================================
function SetUnitManaPercentBJ(whichUnit, percent)
	SetUnitState(whichUnit, UNIT_STATE_MANA, GetUnitState(whichUnit, UNIT_STATE_MAX_MANA) * RMaxBJ(0, percent) * 0.01)
end

--===========================================================================
function IsUnitDeadBJ(whichUnit)
	return GetUnitState(whichUnit, UNIT_STATE_LIFE) <= 0
end

--===========================================================================
function IsUnitAliveBJ(whichUnit)
	return not IsUnitDeadBJ(whichUnit)
end

--===========================================================================
function IsUnitGroupDeadBJEnum()
	if not IsUnitDeadBJ(GetEnumUnit()) then
		bj_isUnitGroupDeadResult = false
	end
end

--===========================================================================
-- Returns true if every unit of the group is dead.
--
function IsUnitGroupDeadBJ(g)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	local wantDestroy = bj_wantDestroyGroup
	bj_wantDestroyGroup = false

	bj_isUnitGroupDeadResult = true
	ForGroup(g, IsUnitGroupDeadBJEnum)

	-- If the user wants the group destroyed, do so now.
	if wantDestroy then
		DestroyGroup(g)
	end
	return bj_isUnitGroupDeadResult
end

--===========================================================================
function IsUnitGroupEmptyBJEnum()
	bj_isUnitGroupEmptyResult = false
end

--===========================================================================
-- Returns true if the group contains no units.
--
function IsUnitGroupEmptyBJ(g)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	local wantDestroy = bj_wantDestroyGroup
	bj_wantDestroyGroup = false

	bj_isUnitGroupEmptyResult = true
	ForGroup(g, IsUnitGroupEmptyBJEnum)

	-- If the user wants the group destroyed, do so now.
	if wantDestroy then
		DestroyGroup(g)
	end
	return bj_isUnitGroupEmptyResult
end

--===========================================================================
function IsUnitGroupInRectBJEnum()
	if not RectContainsUnit(bj_isUnitGroupInRectRect, GetEnumUnit()) then
		bj_isUnitGroupInRectResult = false
	end
end

--===========================================================================
-- Returns true if every unit of the group is within the given rect.
--
function IsUnitGroupInRectBJ(g, r)
	bj_isUnitGroupInRectResult = true
	bj_isUnitGroupInRectRect = r
	ForGroup(g, IsUnitGroupInRectBJEnum)
	return bj_isUnitGroupInRectResult
end

--===========================================================================
function IsUnitHiddenBJ(whichUnit)
	return IsUnitHidden(whichUnit)
end

--===========================================================================
function ShowUnitHide(whichUnit)
	ShowUnit(whichUnit, false)
end

--===========================================================================
function ShowUnitShow(whichUnit)
	-- Prevent dead heroes from being unhidden.
	if IsUnitType(whichUnit, UNIT_TYPE_HERO) and IsUnitDeadBJ(whichUnit) then
		return
	end

	ShowUnit(whichUnit, true)
end

--===========================================================================
function IssueHauntOrderAtLocBJFilter()
	return GetUnitTypeId(GetFilterUnit()) == 1852272492
end

--===========================================================================
function IssueHauntOrderAtLocBJ(whichPeon, loc)
	local g = nil
	local goldMine = nil

	-- Search for a gold mine within a 1-cell radius of the specified location.
	g = CreateGroup()
	GroupEnumUnitsInRangeOfLoc(g, loc, 2 * bj_CELLWIDTH, filterIssueHauntOrderAtLocBJ)
	goldMine = FirstOfGroup(g)
	DestroyGroup(g)

	-- If no mine was found, abort the request.
	if goldMine == nil then
		return false
	end

	-- Issue the Haunt Gold Mine order.
	return IssueTargetOrderById(whichPeon, 1969713004, goldMine)
end

--===========================================================================
function IssueBuildOrderByIdLocBJ(whichPeon, unitId, loc)
	if unitId == 1969713004 then
		return IssueHauntOrderAtLocBJ(whichPeon, loc)
	else
		return IssueBuildOrderById(whichPeon, unitId, GetLocationX(loc), GetLocationY(loc))
	end
end

--===========================================================================
function IssueTrainOrderByIdBJ(whichUnit, unitId)
	return IssueImmediateOrderById(whichUnit, unitId)
end

--===========================================================================
function GroupTrainOrderByIdBJ(g, unitId)
	return GroupImmediateOrderById(g, unitId)
end

--===========================================================================
function IssueUpgradeOrderByIdBJ(whichUnit, techId)
	return IssueImmediateOrderById(whichUnit, techId)
end

--===========================================================================
function GetAttackedUnitBJ()
	return GetTriggerUnit()
end

--===========================================================================
function SetUnitFlyHeightBJ(whichUnit, newHeight, rate)
	SetUnitFlyHeight(whichUnit, newHeight, rate)
end

--===========================================================================
function SetUnitTurnSpeedBJ(whichUnit, turnSpeed)
	SetUnitTurnSpeed(whichUnit, turnSpeed)
end

--===========================================================================
function SetUnitPropWindowBJ(whichUnit, propWindow)
	local angle = propWindow
	if angle <= 0 then
		angle = 1
	elseif angle >= 360 then
		angle = 359
	end
	angle = angle * bj_DEGTORAD

	SetUnitPropWindow(whichUnit, angle)
end

--===========================================================================
function GetUnitPropWindowBJ(whichUnit)
	return GetUnitPropWindow(whichUnit) * bj_RADTODEG
end

--===========================================================================
function GetUnitDefaultPropWindowBJ(whichUnit)
	return GetUnitDefaultPropWindow(whichUnit)
end

--===========================================================================
function SetUnitBlendTimeBJ(whichUnit, blendTime)
	SetUnitBlendTime(whichUnit, blendTime)
end

--===========================================================================
function SetUnitAcquireRangeBJ(whichUnit, acquireRange)
	SetUnitAcquireRange(whichUnit, acquireRange)
end

--===========================================================================
function UnitSetCanSleepBJ(whichUnit, canSleep)
	UnitAddSleep(whichUnit, canSleep)
end

--===========================================================================
function UnitCanSleepBJ(whichUnit)
	return UnitCanSleep(whichUnit)
end

--===========================================================================
function UnitWakeUpBJ(whichUnit)
	UnitWakeUp(whichUnit)
end

--===========================================================================
function UnitIsSleepingBJ(whichUnit)
	return UnitIsSleeping(whichUnit)
end

--===========================================================================
function WakePlayerUnitsEnum()
	UnitWakeUp(GetEnumUnit())
end

--===========================================================================
function WakePlayerUnits(whichPlayer)
	local g = CreateGroup()
	GroupEnumUnitsOfPlayer(g, whichPlayer, nil)
	ForGroup(g, WakePlayerUnitsEnum)
	DestroyGroup(g)
end

--===========================================================================
function EnableCreepSleepBJ(enable)
	SetPlayerState(Player(PLAYER_NEUTRAL_AGGRESSIVE), PLAYER_STATE_NO_CREEP_SLEEP, IntegerTertiaryOp(enable, 0, 1))

	-- If we're disabling, attempt to wake any already-sleeping creeps.
	if not enable then
		WakePlayerUnits(Player(PLAYER_NEUTRAL_AGGRESSIVE))
	end
end

--===========================================================================
function UnitGenerateAlarms(whichUnit, generate)
	return UnitIgnoreAlarm(whichUnit, not generate)
end

--===========================================================================
function DoesUnitGenerateAlarms(whichUnit)
	return not UnitIgnoreAlarmToggled(whichUnit)
end

--===========================================================================
function PauseAllUnitsBJEnum()
	PauseUnit(GetEnumUnit(), bj_pauseAllUnitsFlag)
end

--===========================================================================
-- Pause all units 
function PauseAllUnitsBJ(pause)
	local index
	local indexPlayer
	local g

	bj_pauseAllUnitsFlag = pause
	g = CreateGroup()
	index = 0
	for _ in _loop_() do
		indexPlayer = Player(index)

		-- If this is a computer slot, pause/resume the AI.
		if GetPlayerController(indexPlayer) == MAP_CONTROL_COMPUTER then
			PauseCompAI(indexPlayer, pause)
		end

		-- Enumerate and unpause every unit owned by the player.
		GroupEnumUnitsOfPlayer(g, indexPlayer, nil)
		ForGroup(g, PauseAllUnitsBJEnum)
		GroupClear(g)

		index = index + 1
		if index == bj_MAX_PLAYER_SLOTS then break end
	end
	DestroyGroup(g)
end

--===========================================================================
function PauseUnitBJ(pause, whichUnit)
	PauseUnit(whichUnit, pause)
end

--===========================================================================
function IsUnitPausedBJ(whichUnit)
	return IsUnitPaused(whichUnit)
end

--===========================================================================
function UnitPauseTimedLifeBJ(flag, whichUnit)
	UnitPauseTimedLife(whichUnit, flag)
end

--===========================================================================
function UnitApplyTimedLifeBJ(duration, buffId, whichUnit)
	UnitApplyTimedLife(whichUnit, buffId, duration)
end

--===========================================================================
function UnitShareVisionBJ(share, whichUnit, whichPlayer)
	UnitShareVision(whichUnit, whichPlayer, share)
end

--===========================================================================
function UnitRemoveBuffsBJ(buffType, whichUnit)
	if buffType == bj_REMOVEBUFFS_POSITIVE then
		UnitRemoveBuffs(whichUnit, true, false)
	elseif buffType == bj_REMOVEBUFFS_NEGATIVE then
		UnitRemoveBuffs(whichUnit, false, true)
	elseif buffType == bj_REMOVEBUFFS_ALL then
		UnitRemoveBuffs(whichUnit, true, true)
	elseif buffType == bj_REMOVEBUFFS_NONTLIFE then
		UnitRemoveBuffsEx(whichUnit, true, true, false, false, false, true, false)
	else
	-- Unrecognized dispel type - ignore the request.
	end
end

--===========================================================================
function UnitRemoveBuffsExBJ(polarity, resist, whichUnit, bTLife, bAura)
	local bPos = polarity == bj_BUFF_POLARITY_EITHER or polarity == bj_BUFF_POLARITY_POSITIVE
	local bNeg = polarity == bj_BUFF_POLARITY_EITHER or polarity == bj_BUFF_POLARITY_NEGATIVE
	local bMagic = resist == bj_BUFF_RESIST_BOTH or resist == bj_BUFF_RESIST_MAGIC
	local bPhys = resist == bj_BUFF_RESIST_BOTH or resist == bj_BUFF_RESIST_PHYSICAL

	UnitRemoveBuffsEx(whichUnit, bPos, bNeg, bMagic, bPhys, bTLife, bAura, false)
end

--===========================================================================
function UnitCountBuffsExBJ(polarity, resist, whichUnit, bTLife, bAura)
	local bPos = polarity == bj_BUFF_POLARITY_EITHER or polarity == bj_BUFF_POLARITY_POSITIVE
	local bNeg = polarity == bj_BUFF_POLARITY_EITHER or polarity == bj_BUFF_POLARITY_NEGATIVE
	local bMagic = resist == bj_BUFF_RESIST_BOTH or resist == bj_BUFF_RESIST_MAGIC
	local bPhys = resist == bj_BUFF_RESIST_BOTH or resist == bj_BUFF_RESIST_PHYSICAL

	return UnitCountBuffsEx(whichUnit, bPos, bNeg, bMagic, bPhys, bTLife, bAura, false)
end

--===========================================================================
function UnitRemoveAbilityBJ(abilityId, whichUnit)
	return UnitRemoveAbility(whichUnit, abilityId)
end

--===========================================================================
function UnitAddAbilityBJ(abilityId, whichUnit)
	return UnitAddAbility(whichUnit, abilityId)
end

--===========================================================================
function UnitRemoveTypeBJ(whichType, whichUnit)
	return UnitRemoveType(whichUnit, whichType)
end

--===========================================================================
function UnitAddTypeBJ(whichType, whichUnit)
	return UnitAddType(whichUnit, whichType)
end

--===========================================================================
function UnitMakeAbilityPermanentBJ(permanent, abilityId, whichUnit)
	return UnitMakeAbilityPermanent(whichUnit, permanent, abilityId)
end

--===========================================================================
function SetUnitExplodedBJ(whichUnit, exploded)
	SetUnitExploded(whichUnit, exploded)
end

--===========================================================================
function ExplodeUnitBJ(whichUnit)
	SetUnitExploded(whichUnit, true)
	KillUnit(whichUnit)
end

--===========================================================================
function GetTransportUnitBJ()
	return GetTransportUnit()
end

--===========================================================================
function GetLoadedUnitBJ()
	return GetLoadedUnit()
end

--===========================================================================
function IsUnitInTransportBJ(whichUnit, whichTransport)
	return IsUnitInTransport(whichUnit, whichTransport)
end

--===========================================================================
function IsUnitLoadedBJ(whichUnit)
	return IsUnitLoaded(whichUnit)
end

--===========================================================================
function IsUnitIllusionBJ(whichUnit)
	return IsUnitIllusion(whichUnit)
end

--===========================================================================
-- This attempts to replace a unit with a new unit type by creating a new
-- unit of the desired type using the old unit's location, facing, etc.
--
function ReplaceUnitBJ(whichUnit, newUnitId, unitStateMethod)
	local oldUnit = whichUnit
	local newUnit
	local wasHidden
	local index
	local indexItem
	local oldRatio

	-- If we have bogus data, don't attempt the replace.
	if oldUnit == nil then
		bj_lastReplacedUnit = oldUnit
		return oldUnit
	end

	-- Hide the original unit.
	wasHidden = IsUnitHidden(oldUnit)
	ShowUnit(oldUnit, false)

	-- Create the replacement unit.
	if newUnitId == 1969713004 then
		newUnit = CreateBlightedGoldmine(GetOwningPlayer(oldUnit), GetUnitX(oldUnit), GetUnitY(oldUnit), GetUnitFacing(oldUnit))
	else
		newUnit = CreateUnit(GetOwningPlayer(oldUnit), newUnitId, GetUnitX(oldUnit), GetUnitY(oldUnit), GetUnitFacing(oldUnit))
	end

	-- Set the unit's life and mana according to the requested method.
	if unitStateMethod == bj_UNIT_STATE_METHOD_RELATIVE then
		-- Set the replacement's current/max life ratio to that of the old unit.
		-- If both units have mana, do the same for mana.
		if GetUnitState(oldUnit, UNIT_STATE_MAX_LIFE) > 0 then
			oldRatio = GetUnitState(oldUnit, UNIT_STATE_LIFE) / GetUnitState(oldUnit, UNIT_STATE_MAX_LIFE)
			SetUnitState(newUnit, UNIT_STATE_LIFE, oldRatio * GetUnitState(newUnit, UNIT_STATE_MAX_LIFE))
		end

		if GetUnitState(oldUnit, UNIT_STATE_MAX_MANA) > 0 and GetUnitState(newUnit, UNIT_STATE_MAX_MANA) > 0 then
			oldRatio = GetUnitState(oldUnit, UNIT_STATE_MANA) / GetUnitState(oldUnit, UNIT_STATE_MAX_MANA)
			SetUnitState(newUnit, UNIT_STATE_MANA, oldRatio * GetUnitState(newUnit, UNIT_STATE_MAX_MANA))
		end
	elseif unitStateMethod == bj_UNIT_STATE_METHOD_ABSOLUTE then
		-- Set the replacement's current life to that of the old unit.
		-- If the new unit has mana, do the same for mana.
		SetUnitState(newUnit, UNIT_STATE_LIFE, GetUnitState(oldUnit, UNIT_STATE_LIFE))
		if GetUnitState(newUnit, UNIT_STATE_MAX_MANA) > 0 then
			SetUnitState(newUnit, UNIT_STATE_MANA, GetUnitState(oldUnit, UNIT_STATE_MANA))
		end
	elseif unitStateMethod == bj_UNIT_STATE_METHOD_DEFAULTS then
	-- The newly created unit should already have default life and mana.
	elseif unitStateMethod == bj_UNIT_STATE_METHOD_MAXIMUM then
		-- Use max life and mana.
		SetUnitState(newUnit, UNIT_STATE_LIFE, GetUnitState(newUnit, UNIT_STATE_MAX_LIFE))
		SetUnitState(newUnit, UNIT_STATE_MANA, GetUnitState(newUnit, UNIT_STATE_MAX_MANA))
	else
	-- Unrecognized unit state method - ignore the request.
	end

	-- Mirror properties of the old unit onto the new unit.
	--call PauseUnit(newUnit, IsUnitPaused(oldUnit))
	SetResourceAmount(newUnit, GetResourceAmount(oldUnit))

	-- If both the old and new units are heroes, handle their hero info.
	if IsUnitType(oldUnit, UNIT_TYPE_HERO) and IsUnitType(newUnit, UNIT_TYPE_HERO) then
		SetHeroXP(newUnit, GetHeroXP(oldUnit), false)

		index = 0
		for _ in _loop_() do
			indexItem = UnitItemInSlot(oldUnit, index)
			if indexItem ~= nil then
				UnitRemoveItem(oldUnit, indexItem)
				UnitAddItem(newUnit, indexItem)
			end

			index = index + 1
			if index >= bj_MAX_INVENTORY then break end
		end
	end

	-- Remove or kill the original unit.  It is sometimes unsafe to remove
	-- hidden units, so kill the original unit if it was previously hidden.
	if wasHidden then
		KillUnit(oldUnit)
		RemoveUnit(oldUnit)
	else
		RemoveUnit(oldUnit)
	end

	bj_lastReplacedUnit = newUnit
	return newUnit
end

--===========================================================================
function GetLastReplacedUnitBJ()
	return bj_lastReplacedUnit
end

--===========================================================================
function SetUnitPositionLocFacingBJ(whichUnit, loc, facing)
	SetUnitPositionLoc(whichUnit, loc)
	SetUnitFacing(whichUnit, facing)
end

--===========================================================================
function SetUnitPositionLocFacingLocBJ(whichUnit, loc, lookAt)
	SetUnitPositionLoc(whichUnit, loc)
	SetUnitFacing(whichUnit, AngleBetweenPoints(loc, lookAt))
end

--===========================================================================
function AddItemToStockBJ(itemId, whichUnit, currentStock, stockMax)
	AddItemToStock(whichUnit, itemId, currentStock, stockMax)
end

--===========================================================================
function AddUnitToStockBJ(unitId, whichUnit, currentStock, stockMax)
	AddUnitToStock(whichUnit, unitId, currentStock, stockMax)
end

--===========================================================================
function RemoveItemFromStockBJ(itemId, whichUnit)
	RemoveItemFromStock(whichUnit, itemId)
end

--===========================================================================
function RemoveUnitFromStockBJ(unitId, whichUnit)
	RemoveUnitFromStock(whichUnit, unitId)
end

--===========================================================================
function SetUnitUseFoodBJ(enable, whichUnit)
	SetUnitUseFood(whichUnit, enable)
end

--===========================================================================
function UnitDamagePointLoc(whichUnit, delay, radius, loc, amount, whichAttack, whichDamage)
	return UnitDamagePoint(whichUnit, delay, radius, GetLocationX(loc), GetLocationY(loc), amount, true, false, whichAttack, whichDamage, WEAPON_TYPE_WHOKNOWS)
end

--===========================================================================
function UnitDamageTargetBJ(whichUnit, target, amount, whichAttack, whichDamage)
	return UnitDamageTarget(whichUnit, target, amount, true, false, whichAttack, whichDamage, WEAPON_TYPE_WHOKNOWS)
end



--***************************************************************************
--*
--*  Destructable Utility Functions
--*
--***************************************************************************

--===========================================================================
function CreateDestructableLoc(objectid, loc, facing, scale, variation)
	bj_lastCreatedDestructable = CreateDestructable(objectid, GetLocationX(loc), GetLocationY(loc), facing, scale, variation)
	return bj_lastCreatedDestructable
end

--===========================================================================
function CreateDeadDestructableLocBJ(objectid, loc, facing, scale, variation)
	bj_lastCreatedDestructable = CreateDeadDestructable(objectid, GetLocationX(loc), GetLocationY(loc), facing, scale, variation)
	return bj_lastCreatedDestructable
end

--===========================================================================
function GetLastCreatedDestructable()
	return bj_lastCreatedDestructable
end

--===========================================================================
function ShowDestructableBJ(flag, d)
	ShowDestructable(d, flag)
end

--===========================================================================
function SetDestructableInvulnerableBJ(d, flag)
	SetDestructableInvulnerable(d, flag)
end

--===========================================================================
function IsDestructableInvulnerableBJ(d)
	return IsDestructableInvulnerable(d)
end

--===========================================================================
function GetDestructableLoc(whichDestructable)
	return Location(GetDestructableX(whichDestructable), GetDestructableY(whichDestructable))
end

--===========================================================================
function EnumDestructablesInRectAll(r, actionFunc)
	EnumDestructablesInRect(r, nil, actionFunc)
end

--===========================================================================
function EnumDestructablesInCircleBJFilter()
	local destLoc = GetDestructableLoc(GetFilterDestructable())
	local result

	result = DistanceBetweenPoints(destLoc, bj_enumDestructableCenter) <= bj_enumDestructableRadius
	RemoveLocation(destLoc)
	return result
end

--===========================================================================
function IsDestructableDeadBJ(d)
	return GetDestructableLife(d) <= 0
end

--===========================================================================
function IsDestructableAliveBJ(d)
	return not IsDestructableDeadBJ(d)
end

--===========================================================================
-- See GroupPickRandomUnitEnum for the details of this algorithm.
--
function RandomDestructableInRectBJEnum()
	bj_destRandomConsidered = bj_destRandomConsidered + 1
	if GetRandomInt(1, bj_destRandomConsidered) == 1 then
		bj_destRandomCurrentPick = GetEnumDestructable()
	end
end

--===========================================================================
-- Picks a random destructable from within a rect, matching a condition
--
function RandomDestructableInRectBJ(r, filter)
	bj_destRandomConsidered = 0
	bj_destRandomCurrentPick = nil
	EnumDestructablesInRect(r, filter, RandomDestructableInRectBJEnum)
	DestroyBoolExpr(filter)
	return bj_destRandomCurrentPick
end

--===========================================================================
-- Picks a random destructable from within a rect
--
function RandomDestructableInRectSimpleBJ(r)
	return RandomDestructableInRectBJ(r, nil)
end

--===========================================================================
-- Enumerates within a rect, with a filter to narrow the enumeration down
-- objects within a circular area.
--
function EnumDestructablesInCircleBJ(radius, loc, actionFunc)
	local r

	if radius >= 0 then
		bj_enumDestructableCenter = loc
		bj_enumDestructableRadius = radius
		r = GetRectFromCircleBJ(loc, radius)
		EnumDestructablesInRect(r, filterEnumDestructablesInCircleBJ, actionFunc)
		RemoveRect(r)
	end
end

--===========================================================================
function SetDestructableLifePercentBJ(d, percent)
	SetDestructableLife(d, GetDestructableMaxLife(d) * percent * 0.01)
end

--===========================================================================
function SetDestructableMaxLifeBJ(d, max)
	SetDestructableMaxLife(d, max)
end

--===========================================================================
function ModifyGateBJ(gateOperation, d)
	if gateOperation == bj_GATEOPERATION_CLOSE then
		if GetDestructableLife(d) <= 0 then
			DestructableRestoreLife(d, GetDestructableMaxLife(d), true)
		end
		SetDestructableAnimation(d, "stand")
	elseif gateOperation == bj_GATEOPERATION_OPEN then
		if GetDestructableLife(d) > 0 then
			KillDestructable(d)
		end
		SetDestructableAnimation(d, "death alternate")
	elseif gateOperation == bj_GATEOPERATION_DESTROY then
		if GetDestructableLife(d) > 0 then
			KillDestructable(d)
		end
		SetDestructableAnimation(d, "death")
	else
	-- Unrecognized gate state - ignore the request.
	end
end

--===========================================================================
-- Determine the elevator's height from its occlusion height.
--
function GetElevatorHeight(d)
	local height

	height = 1 + R2I(GetDestructableOccluderHeight(d) / bj_CLIFFHEIGHT)
	if height < 1 or height > 3 then
		height = 1
	end
	return height
end

--===========================================================================
-- To properly animate an elevator, we must know not only what height we
-- want to change to, but also what height we are currently at.  This code
-- determines the elevator's current height from its occlusion height.
-- Arbitrarily changing an elevator's occlusion height is thus inadvisable.
--
function ChangeElevatorHeight(d, newHeight)
	local oldHeight

	-- Cap the new height within the supported range.
	newHeight = IMaxBJ(1, newHeight)
	newHeight = IMinBJ(3, newHeight)

	-- Find out what height the elevator is already at.
	oldHeight = GetElevatorHeight(d)

	-- Set the elevator's occlusion height.
	SetDestructableOccluderHeight(d, bj_CLIFFHEIGHT * (newHeight - 1))

	if newHeight == 1 then
		if oldHeight == 2 then
			SetDestructableAnimation(d, "birth")
			QueueDestructableAnimation(d, "stand")
		elseif oldHeight == 3 then
			SetDestructableAnimation(d, "birth third")
			QueueDestructableAnimation(d, "stand")
		else
			-- Unrecognized old height - snap to new height.
			SetDestructableAnimation(d, "stand")
		end
	elseif newHeight == 2 then
		if oldHeight == 1 then
			SetDestructableAnimation(d, "death")
			QueueDestructableAnimation(d, "stand second")
		elseif oldHeight == 3 then
			SetDestructableAnimation(d, "birth second")
			QueueDestructableAnimation(d, "stand second")
		else
			-- Unrecognized old height - snap to new height.
			SetDestructableAnimation(d, "stand second")
		end
	elseif newHeight == 3 then
		if oldHeight == 1 then
			SetDestructableAnimation(d, "death third")
			QueueDestructableAnimation(d, "stand third")
		elseif oldHeight == 2 then
			SetDestructableAnimation(d, "death second")
			QueueDestructableAnimation(d, "stand third")
		else
			-- Unrecognized old height - snap to new height.
			SetDestructableAnimation(d, "stand third")
		end
	else
	-- Unrecognized new height - ignore the request.
	end
end

--===========================================================================
-- Grab the unit and throw his own coords in his face, forcing him to push
-- and shove until he finds a spot where noone will bother him.
--
function NudgeUnitsInRectEnum()
	local nudgee = GetEnumUnit()

	SetUnitPosition(nudgee, GetUnitX(nudgee), GetUnitY(nudgee))
end

--===========================================================================
function NudgeItemsInRectEnum()
	local nudgee = GetEnumItem()

	SetItemPosition(nudgee, GetItemX(nudgee), GetItemY(nudgee))
end

--===========================================================================
-- Nudge the items and units within a given rect ever so gently, so as to
-- encourage them to find locations where they can peacefully coexist with
-- pathing restrictions and live happy, fruitful lives.
--
function NudgeObjectsInRect(nudgeArea)
	local g

	g = CreateGroup()
	GroupEnumUnitsInRect(g, nudgeArea, nil)
	ForGroup(g, NudgeUnitsInRectEnum)
	DestroyGroup(g)

	EnumItemsInRect(nudgeArea, nil, NudgeItemsInRectEnum)
end

--===========================================================================
function NearbyElevatorExistsEnum()
	local d = GetEnumDestructable()
	local dType = GetDestructableTypeId(d)

	if dType == bj_ELEVATOR_CODE01 or dType == bj_ELEVATOR_CODE02 then
		bj_elevatorNeighbor = d
	end
end

--===========================================================================
function NearbyElevatorExists(x, y)
	local findThreshold = 32
	local r

	-- If another elevator is overlapping this one, ignore the wall.
	r = Rect(x - findThreshold, y - findThreshold, x + findThreshold, y + findThreshold)
	bj_elevatorNeighbor = nil
	EnumDestructablesInRect(r, nil, NearbyElevatorExistsEnum)
	RemoveRect(r)

	return bj_elevatorNeighbor ~= nil
end

--===========================================================================
function FindElevatorWallBlockerEnum()
	bj_elevatorWallBlocker = GetEnumDestructable()
end

--===========================================================================
-- This toggles pathing on or off for one wall of an elevator by killing
-- or reviving a pathing blocker at the appropriate location (and creating
-- the pathing blocker in the first place, if it does not yet exist).
--
function ChangeElevatorWallBlocker(x, y, facing, open)
	local blocker = nil
	local findThreshold = 32
	local nudgeLength = 4.25 * bj_CELLWIDTH
	local nudgeWidth = 1.25 * bj_CELLWIDTH
	local r

	-- Search for the pathing blocker within the general area.
	r = Rect(x - findThreshold, y - findThreshold, x + findThreshold, y + findThreshold)
	bj_elevatorWallBlocker = nil
	EnumDestructablesInRect(r, nil, FindElevatorWallBlockerEnum)
	RemoveRect(r)
	blocker = bj_elevatorWallBlocker

	-- Ensure that the blocker exists.
	if blocker == nil then
		blocker = CreateDeadDestructable(bj_ELEVATOR_BLOCKER_CODE, x, y, facing, 1, 0)
	elseif GetDestructableTypeId(blocker) ~= bj_ELEVATOR_BLOCKER_CODE then
		-- If a different destructible exists in the blocker's spot, ignore
		-- the request.  (Two destructibles cannot occupy the same location
		-- on the map, so we cannot create an elevator blocker here.)
		return
	end

	if open then
		-- Ensure that the blocker is dead.
		if GetDestructableLife(blocker) > 0 then
			KillDestructable(blocker)
		end
	else
		-- Ensure that the blocker is alive.
		if GetDestructableLife(blocker) <= 0 then
			DestructableRestoreLife(blocker, GetDestructableMaxLife(blocker), false)
		end

		-- Nudge any objects standing in the blocker's way.
		if facing == 0 then
			r = Rect(x - nudgeWidth / 2, y - nudgeLength / 2, x + nudgeWidth / 2, y + nudgeLength / 2)
			NudgeObjectsInRect(r)
			RemoveRect(r)
		elseif facing == 90 then
			r = Rect(x - nudgeLength / 2, y - nudgeWidth / 2, x + nudgeLength / 2, y + nudgeWidth / 2)
			NudgeObjectsInRect(r)
			RemoveRect(r)
		else
		-- Unrecognized blocker angle - don't nudge anything.
		end
	end
end

--===========================================================================
function ChangeElevatorWalls(open, walls, d)
	local x = GetDestructableX(d)
	local y = GetDestructableY(d)
	local distToBlocker = 192
	local distToNeighbor = 256

	if walls == bj_ELEVATOR_WALL_TYPE_ALL or walls == bj_ELEVATOR_WALL_TYPE_EAST then
		if not NearbyElevatorExists(x + distToNeighbor, y) then
			ChangeElevatorWallBlocker(x + distToBlocker, y, 0, open)
		end
	end

	if walls == bj_ELEVATOR_WALL_TYPE_ALL or walls == bj_ELEVATOR_WALL_TYPE_NORTH then
		if not NearbyElevatorExists(x, y + distToNeighbor) then
			ChangeElevatorWallBlocker(x, y + distToBlocker, 90, open)
		end
	end

	if walls == bj_ELEVATOR_WALL_TYPE_ALL or walls == bj_ELEVATOR_WALL_TYPE_SOUTH then
		if not NearbyElevatorExists(x, y - distToNeighbor) then
			ChangeElevatorWallBlocker(x, y - distToBlocker, 90, open)
		end
	end

	if walls == bj_ELEVATOR_WALL_TYPE_ALL or walls == bj_ELEVATOR_WALL_TYPE_WEST then
		if not NearbyElevatorExists(x - distToNeighbor, y) then
			ChangeElevatorWallBlocker(x - distToBlocker, y, 0, open)
		end
	end
end



--***************************************************************************
--*
--*  Neutral Building Utility Functions
--*
--***************************************************************************

--===========================================================================
function WaygateActivateBJ(activate, waygate)
	WaygateActivate(waygate, activate)
end

--===========================================================================
function WaygateIsActiveBJ(waygate)
	return WaygateIsActive(waygate)
end

--===========================================================================
function WaygateSetDestinationLocBJ(waygate, loc)
	WaygateSetDestination(waygate, GetLocationX(loc), GetLocationY(loc))
end

--===========================================================================
function WaygateGetDestinationLocBJ(waygate)
	return Location(WaygateGetDestinationX(waygate), WaygateGetDestinationY(waygate))
end

--===========================================================================
function UnitSetUsesAltIconBJ(flag, whichUnit)
	UnitSetUsesAltIcon(whichUnit, flag)
end



--***************************************************************************
--*
--*  UI Utility Functions
--*
--***************************************************************************

--===========================================================================
function ForceUIKeyBJ(whichPlayer, key)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ForceUIKey(key)
	end
end

--===========================================================================
function ForceUICancelBJ(whichPlayer)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ForceUICancel()
	end
end



--***************************************************************************
--*
--*  Group and Force Utility Functions
--*
--***************************************************************************

--===========================================================================
function ForGroupBJ(whichGroup, callback)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	local wantDestroy = bj_wantDestroyGroup
	bj_wantDestroyGroup = false

	ForGroup(whichGroup, callback)

	-- If the user wants the group destroyed, do so now.
	if wantDestroy then
		DestroyGroup(whichGroup)
	end
end

--===========================================================================
function GroupAddUnitSimple(whichUnit, whichGroup)
	GroupAddUnit(whichGroup, whichUnit)
end

--===========================================================================
function GroupRemoveUnitSimple(whichUnit, whichGroup)
	GroupRemoveUnit(whichGroup, whichUnit)
end

--===========================================================================
function GroupAddGroupEnum()
	GroupAddUnit(bj_groupAddGroupDest, GetEnumUnit())
end

--===========================================================================
function GroupAddGroup(sourceGroup, destGroup)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	local wantDestroy = bj_wantDestroyGroup
	bj_wantDestroyGroup = false

	bj_groupAddGroupDest = destGroup
	ForGroup(sourceGroup, GroupAddGroupEnum)

	-- If the user wants the group destroyed, do so now.
	if wantDestroy then
		DestroyGroup(sourceGroup)
	end
end

--===========================================================================
function GroupRemoveGroupEnum()
	GroupRemoveUnit(bj_groupRemoveGroupDest, GetEnumUnit())
end

--===========================================================================
function GroupRemoveGroup(sourceGroup, destGroup)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	local wantDestroy = bj_wantDestroyGroup
	bj_wantDestroyGroup = false

	bj_groupRemoveGroupDest = destGroup
	ForGroup(sourceGroup, GroupRemoveGroupEnum)

	-- If the user wants the group destroyed, do so now.
	if wantDestroy then
		DestroyGroup(sourceGroup)
	end
end

--===========================================================================
function ForceAddPlayerSimple(whichPlayer, whichForce)
	ForceAddPlayer(whichForce, whichPlayer)
end

--===========================================================================
function ForceRemovePlayerSimple(whichPlayer, whichForce)
	ForceRemovePlayer(whichForce, whichPlayer)
end

--===========================================================================
-- Consider each unit, one at a time, keeping a "current pick".   Once all units
-- are considered, this "current pick" will be the resulting random unit.
--
-- The chance of picking a given unit over the "current pick" is 1/N, where N is
-- the number of units considered thusfar (including the current consideration).
--
function GroupPickRandomUnitEnum()
	bj_groupRandomConsidered = bj_groupRandomConsidered + 1
	if GetRandomInt(1, bj_groupRandomConsidered) == 1 then
		bj_groupRandomCurrentPick = GetEnumUnit()
	end
end

--===========================================================================
-- Picks a random unit from a group.
--
function GroupPickRandomUnit(whichGroup)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	local wantDestroy = bj_wantDestroyGroup
	bj_wantDestroyGroup = false

	bj_groupRandomConsidered = 0
	bj_groupRandomCurrentPick = nil
	ForGroup(whichGroup, GroupPickRandomUnitEnum)

	-- If the user wants the group destroyed, do so now.
	if wantDestroy then
		DestroyGroup(whichGroup)
	end
	return bj_groupRandomCurrentPick
end

--===========================================================================
-- See GroupPickRandomUnitEnum for the details of this algorithm.
--
function ForcePickRandomPlayerEnum()
	bj_forceRandomConsidered = bj_forceRandomConsidered + 1
	if GetRandomInt(1, bj_forceRandomConsidered) == 1 then
		bj_forceRandomCurrentPick = GetEnumPlayer()
	end
end

--===========================================================================
-- Picks a random player from a force.
--
function ForcePickRandomPlayer(whichForce)
	bj_forceRandomConsidered = 0
	bj_forceRandomCurrentPick = nil
	ForForce(whichForce, ForcePickRandomPlayerEnum)
	return bj_forceRandomCurrentPick
end

--===========================================================================
function EnumUnitsSelected(whichPlayer, enumFilter, enumAction)
	local g = CreateGroup()
	SyncSelections()
	GroupEnumUnitsSelected(g, whichPlayer, enumFilter)
	DestroyBoolExpr(enumFilter)
	ForGroup(g, enumAction)
	DestroyGroup(g)
end

--===========================================================================
function GetUnitsInRectMatching(r, filter)
	local g = CreateGroup()
	GroupEnumUnitsInRect(g, r, filter)
	DestroyBoolExpr(filter)
	return g
end

--===========================================================================
function GetUnitsInRectAll(r)
	return GetUnitsInRectMatching(r, nil)
end

--===========================================================================
function GetUnitsInRectOfPlayerFilter()
	return GetOwningPlayer(GetFilterUnit()) == bj_groupEnumOwningPlayer
end

--===========================================================================
function GetUnitsInRectOfPlayer(r, whichPlayer)
	local g = CreateGroup()
	bj_groupEnumOwningPlayer = whichPlayer
	GroupEnumUnitsInRect(g, r, filterGetUnitsInRectOfPlayer)
	return g
end

--===========================================================================
function GetUnitsInRangeOfLocMatching(radius, whichLocation, filter)
	local g = CreateGroup()
	GroupEnumUnitsInRangeOfLoc(g, whichLocation, radius, filter)
	DestroyBoolExpr(filter)
	return g
end

--===========================================================================
function GetUnitsInRangeOfLocAll(radius, whichLocation)
	return GetUnitsInRangeOfLocMatching(radius, whichLocation, nil)
end

--===========================================================================
function GetUnitsOfTypeIdAllFilter()
	return GetUnitTypeId(GetFilterUnit()) == bj_groupEnumTypeId
end

--===========================================================================
function GetUnitsOfTypeIdAll(unitid)
	local result = CreateGroup()
	local g = CreateGroup()
	local index

	index = 0
	for _ in _loop_() do
		bj_groupEnumTypeId = unitid
		GroupClear(g)
		GroupEnumUnitsOfPlayer(g, Player(index), filterGetUnitsOfTypeIdAll)
		GroupAddGroup(g, result)

		index = index + 1
		if index == bj_MAX_PLAYER_SLOTS then break end
	end
	DestroyGroup(g)

	return result
end

--===========================================================================
function GetUnitsOfPlayerMatching(whichPlayer, filter)
	local g = CreateGroup()
	GroupEnumUnitsOfPlayer(g, whichPlayer, filter)
	DestroyBoolExpr(filter)
	return g
end

--===========================================================================
function GetUnitsOfPlayerAll(whichPlayer)
	return GetUnitsOfPlayerMatching(whichPlayer, nil)
end

--===========================================================================
function GetUnitsOfPlayerAndTypeIdFilter()
	return GetUnitTypeId(GetFilterUnit()) == bj_groupEnumTypeId
end

--===========================================================================
function GetUnitsOfPlayerAndTypeId(whichPlayer, unitid)
	local g = CreateGroup()
	bj_groupEnumTypeId = unitid
	GroupEnumUnitsOfPlayer(g, whichPlayer, filterGetUnitsOfPlayerAndTypeId)
	return g
end

--===========================================================================
function GetUnitsSelectedAll(whichPlayer)
	local g = CreateGroup()
	SyncSelections()
	GroupEnumUnitsSelected(g, whichPlayer, nil)
	return g
end

--===========================================================================
function GetForceOfPlayer(whichPlayer)
	local f = CreateForce()
	ForceAddPlayer(f, whichPlayer)
	return f
end

--===========================================================================
function GetPlayersAll()
	return bj_FORCE_ALL_PLAYERS
end

--===========================================================================
function GetPlayersByMapControl(whichControl)
	local f = CreateForce()
	local playerIndex
	local indexPlayer

	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)
		if GetPlayerController(indexPlayer) == whichControl then
			ForceAddPlayer(f, indexPlayer)
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYER_SLOTS then break end
	end

	return f
end

--===========================================================================
function GetPlayersAllies(whichPlayer)
	local f = CreateForce()
	ForceEnumAllies(f, whichPlayer, nil)
	return f
end

--===========================================================================
function GetPlayersEnemies(whichPlayer)
	local f = CreateForce()
	ForceEnumEnemies(f, whichPlayer, nil)
	return f
end

--===========================================================================
function GetPlayersMatching(filter)
	local f = CreateForce()
	ForceEnumPlayers(f, filter)
	DestroyBoolExpr(filter)
	return f
end

--===========================================================================
function CountUnitsInGroupEnum()
	bj_groupCountUnits = bj_groupCountUnits + 1
end

--===========================================================================
function CountUnitsInGroup(g)
	-- If the user wants the group destroyed, remember that fact and clear
	-- the flag, in case it is used again in the callback.
	local wantDestroy = bj_wantDestroyGroup
	bj_wantDestroyGroup = false

	bj_groupCountUnits = 0
	ForGroup(g, CountUnitsInGroupEnum)

	-- If the user wants the group destroyed, do so now.
	if wantDestroy then
		DestroyGroup(g)
	end
	return bj_groupCountUnits
end

--===========================================================================
function CountPlayersInForceEnum()
	bj_forceCountPlayers = bj_forceCountPlayers + 1
end

--===========================================================================
function CountPlayersInForceBJ(f)
	bj_forceCountPlayers = 0
	ForForce(f, CountPlayersInForceEnum)
	return bj_forceCountPlayers
end

--===========================================================================
function GetRandomSubGroupEnum()
	if bj_randomSubGroupWant > 0 then
		if bj_randomSubGroupWant >= bj_randomSubGroupTotal or GetRandomReal(0, 1) < bj_randomSubGroupChance then
			-- We either need every remaining unit, or the unit passed its chance check.
			GroupAddUnit(bj_randomSubGroupGroup, GetEnumUnit())
			bj_randomSubGroupWant = bj_randomSubGroupWant - 1
		end
	end
	bj_randomSubGroupTotal = bj_randomSubGroupTotal - 1
end

--===========================================================================
function GetRandomSubGroup(count, sourceGroup)
	local g = CreateGroup()

	bj_randomSubGroupGroup = g
	bj_randomSubGroupWant = count
	bj_randomSubGroupTotal = CountUnitsInGroup(sourceGroup)

	if bj_randomSubGroupWant <= 0 or bj_randomSubGroupTotal <= 0 then
		return g
	end

	bj_randomSubGroupChance = I2R(bj_randomSubGroupWant) / I2R(bj_randomSubGroupTotal)
	ForGroup(sourceGroup, GetRandomSubGroupEnum)
	return g
end

--===========================================================================
function LivingPlayerUnitsOfTypeIdFilter()
	local filterUnit = GetFilterUnit()
	return IsUnitAliveBJ(filterUnit) and GetUnitTypeId(filterUnit) == bj_livingPlayerUnitsTypeId
end

--===========================================================================
function CountLivingPlayerUnitsOfTypeId(unitId, whichPlayer)
	local g
	local matchedCount

	g = CreateGroup()
	bj_livingPlayerUnitsTypeId = unitId
	GroupEnumUnitsOfPlayer(g, whichPlayer, filterLivingPlayerUnitsOfTypeId)
	matchedCount = CountUnitsInGroup(g)
	DestroyGroup(g)

	return matchedCount
end



--***************************************************************************
--*
--*  Animation Utility Functions
--*
--***************************************************************************

--===========================================================================
function ResetUnitAnimation(whichUnit)
	SetUnitAnimation(whichUnit, "stand")
end

--===========================================================================
function SetUnitTimeScalePercent(whichUnit, percentScale)
	SetUnitTimeScale(whichUnit, percentScale * 0.01)
end

--===========================================================================
function SetUnitScalePercent(whichUnit, percentScaleX, percentScaleY, percentScaleZ)
	SetUnitScale(whichUnit, percentScaleX * 0.01, percentScaleY * 0.01, percentScaleZ * 0.01)
end

--===========================================================================
-- This version differs from the common.j interface in that the alpha value
-- is reversed so as to be displayed as transparency, and all four parameters
-- are treated as percentages rather than bytes.
--
function SetUnitVertexColorBJ(whichUnit, red, green, blue, transparency)
	SetUnitVertexColor(whichUnit, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function UnitAddIndicatorBJ(whichUnit, red, green, blue, transparency)
	AddIndicator(whichUnit, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function DestructableAddIndicatorBJ(whichDestructable, red, green, blue, transparency)
	AddIndicator(whichDestructable, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function ItemAddIndicatorBJ(whichItem, red, green, blue, transparency)
	AddIndicator(whichItem, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
-- Sets a unit's facing to point directly at a location.
--
function SetUnitFacingToFaceLocTimed(whichUnit, target, duration)
	local unitLoc = GetUnitLoc(whichUnit)

	SetUnitFacingTimed(whichUnit, AngleBetweenPoints(unitLoc, target), duration)
	RemoveLocation(unitLoc)
end

--===========================================================================
-- Sets a unit's facing to point directly at another unit.
--
function SetUnitFacingToFaceUnitTimed(whichUnit, target, duration)
	local unitLoc = GetUnitLoc(target)

	SetUnitFacingToFaceLocTimed(whichUnit, unitLoc, duration)
	RemoveLocation(unitLoc)
end

--===========================================================================
function QueueUnitAnimationBJ(whichUnit, whichAnimation)
	QueueUnitAnimation(whichUnit, whichAnimation)
end

--===========================================================================
function SetDestructableAnimationBJ(d, whichAnimation)
	SetDestructableAnimation(d, whichAnimation)
end

--===========================================================================
function QueueDestructableAnimationBJ(d, whichAnimation)
	QueueDestructableAnimation(d, whichAnimation)
end

--===========================================================================
function SetDestAnimationSpeedPercent(d, percentScale)
	SetDestructableAnimationSpeed(d, percentScale * 0.01)
end



--***************************************************************************
--*
--*  Dialog Utility Functions
--*
--***************************************************************************

--===========================================================================
function DialogDisplayBJ(flag, whichDialog, whichPlayer)
	DialogDisplay(whichPlayer, whichDialog, flag)
end

--===========================================================================
function DialogSetMessageBJ(whichDialog, message)
	DialogSetMessage(whichDialog, message)
end

--===========================================================================
function DialogAddButtonBJ(whichDialog, buttonText)
	bj_lastCreatedButton = DialogAddButton(whichDialog, buttonText, 0)
	return bj_lastCreatedButton
end

--===========================================================================
function DialogAddButtonWithHotkeyBJ(whichDialog, buttonText, hotkey)
	bj_lastCreatedButton = DialogAddButton(whichDialog, buttonText, hotkey)
	return bj_lastCreatedButton
end

--===========================================================================
function DialogClearBJ(whichDialog)
	DialogClear(whichDialog)
end

--===========================================================================
function GetLastCreatedButtonBJ()
	return bj_lastCreatedButton
end

--===========================================================================
function GetClickedButtonBJ()
	return GetClickedButton()
end

--===========================================================================
function GetClickedDialogBJ()
	return GetClickedDialog()
end



--***************************************************************************
--*
--*  Alliance Utility Functions
--*
--***************************************************************************

--===========================================================================
function SetPlayerAllianceBJ(sourcePlayer, whichAllianceSetting, value, otherPlayer)
	-- Prevent players from attempting to ally with themselves.
	if sourcePlayer == otherPlayer then
		return
	end

	SetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting, value)
end

--===========================================================================
-- Set all flags used by the in-game "Ally" checkbox.
--
function SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_PASSIVE, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_HELP_REQUEST, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_HELP_RESPONSE, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_XP, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_SPELLS, flag)
end

--===========================================================================
-- Set all flags used by the in-game "Shared Vision" checkbox.
--
function SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_VISION, flag)
end

--===========================================================================
-- Set all flags used by the in-game "Shared Units" checkbox.
--
function SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_CONTROL, flag)
end

--===========================================================================
-- Set all flags used by the in-game "Shared Units" checkbox with the Full
-- Shared Unit Control feature enabled.
--
function SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, flag)
	SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_ADVANCED_CONTROL, flag)
end

--===========================================================================
function SetPlayerAllianceStateBJ(sourcePlayer, otherPlayer, allianceState)
	-- Prevent players from attempting to ally with themselves.
	if sourcePlayer == otherPlayer then
		return
	end

	if allianceState == bj_ALLIANCE_UNALLIED then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
	elseif allianceState == bj_ALLIANCE_UNALLIED_VISION then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
	elseif allianceState == bj_ALLIANCE_ALLIED then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
	elseif allianceState == bj_ALLIANCE_ALLIED_VISION then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
	elseif allianceState == bj_ALLIANCE_ALLIED_UNITS then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
	elseif allianceState == bj_ALLIANCE_ALLIED_ADVUNITS then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, true)
	elseif allianceState == bj_ALLIANCE_NEUTRAL then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_PASSIVE, true)
	elseif allianceState == bj_ALLIANCE_NEUTRAL_VISION then
		SetPlayerAllianceStateAllyBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateVisionBJ(sourcePlayer, otherPlayer, true)
		SetPlayerAllianceStateControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAllianceStateFullControlBJ(sourcePlayer, otherPlayer, false)
		SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_PASSIVE, true)
	else
	-- Unrecognized alliance state - ignore the request.
	end
end

--===========================================================================
-- Set the alliance states for an entire force towards another force.
--
function SetForceAllianceStateBJ(sourceForce, targetForce, allianceState)
	local sourceIndex
	local targetIndex

	sourceIndex = 0
	for _ in _loop_() do

		if sourceForce == bj_FORCE_ALL_PLAYERS or IsPlayerInForce(Player(sourceIndex), sourceForce) then
			targetIndex = 0
			for _ in _loop_() do
				if targetForce == bj_FORCE_ALL_PLAYERS or IsPlayerInForce(Player(targetIndex), targetForce) then
					SetPlayerAllianceStateBJ(Player(sourceIndex), Player(targetIndex), allianceState)
				end

				targetIndex = targetIndex + 1
				if targetIndex == bj_MAX_PLAYER_SLOTS then break end
			end
		end

		sourceIndex = sourceIndex + 1
		if sourceIndex == bj_MAX_PLAYER_SLOTS then break end
	end
end

--===========================================================================
-- Test to see if two players are co-allied (allied with each other).
--
function PlayersAreCoAllied(playerA, playerB)
	-- Players are considered to be allied with themselves.
	if playerA == playerB then
		return true
	end

	-- Co-allies are both allied with each other.
	if GetPlayerAlliance(playerA, playerB, ALLIANCE_PASSIVE) then
		if GetPlayerAlliance(playerB, playerA, ALLIANCE_PASSIVE) then
			return true
		end
	end
	return false
end

--===========================================================================
-- Force (whichPlayer) AI player to share vision and advanced unit control 
-- with all AI players of its allies.
--
function ShareEverythingWithTeamAI(whichPlayer)
	local playerIndex
	local indexPlayer

	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)
		if PlayersAreCoAllied(whichPlayer, indexPlayer) and whichPlayer ~= indexPlayer then
			if GetPlayerController(indexPlayer) == MAP_CONTROL_COMPUTER then
				SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_VISION, true)
				SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_CONTROL, true)
				SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_ADVANCED_CONTROL, true)
			end
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Force (whichPlayer) to share vision and advanced unit control with all of his/her allies.
--
function ShareEverythingWithTeam(whichPlayer)
	local playerIndex
	local indexPlayer

	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)
		if PlayersAreCoAllied(whichPlayer, indexPlayer) and whichPlayer ~= indexPlayer then
			SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_VISION, true)
			SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_CONTROL, true)
			SetPlayerAlliance(indexPlayer, whichPlayer, ALLIANCE_SHARED_CONTROL, true)
			SetPlayerAlliance(whichPlayer, indexPlayer, ALLIANCE_SHARED_ADVANCED_CONTROL, true)
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Creates a 'Neutral Victim' player slot.  This slot is passive towards all
-- other players, but all other players are aggressive towards him/her.
-- 
function ConfigureNeutralVictim()
	local index
	local indexPlayer
	local neutralVictim = Player(bj_PLAYER_NEUTRAL_VICTIM)

	index = 0
	for _ in _loop_() do
		indexPlayer = Player(index)

		SetPlayerAlliance(neutralVictim, indexPlayer, ALLIANCE_PASSIVE, true)
		SetPlayerAlliance(indexPlayer, neutralVictim, ALLIANCE_PASSIVE, false)

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end

	-- Neutral Victim and Neutral Aggressive should not fight each other.
	indexPlayer = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	SetPlayerAlliance(neutralVictim, indexPlayer, ALLIANCE_PASSIVE, true)
	SetPlayerAlliance(indexPlayer, neutralVictim, ALLIANCE_PASSIVE, true)

	-- Neutral Victim does not give bounties.
	SetPlayerState(neutralVictim, PLAYER_STATE_GIVES_BOUNTY, 0)
end

--===========================================================================
function MakeUnitsPassiveForPlayerEnum()
	SetUnitOwner(GetEnumUnit(), Player(bj_PLAYER_NEUTRAL_VICTIM), false)
end

--===========================================================================
-- Change ownership for every unit of (whichPlayer)'s team to neutral passive.
--
function MakeUnitsPassiveForPlayer(whichPlayer)
	local playerUnits = CreateGroup()
	CachePlayerHeroData(whichPlayer)
	GroupEnumUnitsOfPlayer(playerUnits, whichPlayer, nil)
	ForGroup(playerUnits, MakeUnitsPassiveForPlayerEnum)
	DestroyGroup(playerUnits)
end

--===========================================================================
-- Change ownership for every unit of (whichPlayer)'s team to neutral passive.
--
function MakeUnitsPassiveForTeam(whichPlayer)
	local playerIndex
	local indexPlayer

	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)
		if PlayersAreCoAllied(whichPlayer, indexPlayer) then
			MakeUnitsPassiveForPlayer(indexPlayer)
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Determine whether or not victory/defeat is disabled via cheat codes.
--
function AllowVictoryDefeat(gameResult)
	if gameResult == PLAYER_GAME_RESULT_VICTORY then
		return not IsNoVictoryCheat()
	end
	if gameResult == PLAYER_GAME_RESULT_DEFEAT then
		return not IsNoDefeatCheat()
	end
	if gameResult == PLAYER_GAME_RESULT_NEUTRAL then
		return not IsNoVictoryCheat() and not IsNoDefeatCheat()
	end
	return true
end

--===========================================================================
function EndGameBJ()
	EndGame(true)
end

--===========================================================================
function MeleeVictoryDialogBJ(whichPlayer, leftGame)
	local t = CreateTrigger()
	local d = DialogCreate()
	local formatString

	-- Display "player was victorious" or "player has left the game" message
	if leftGame then
		formatString = GetLocalizedString("PLAYER_LEFT_GAME")
	else
		formatString = GetLocalizedString("PLAYER_VICTORIOUS")
	end

	DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, formatString)

	DialogSetMessage(d, GetLocalizedString("GAMEOVER_VICTORY_MSG"))
	DialogAddButton(d, GetLocalizedString("GAMEOVER_CONTINUE_GAME"), GetLocalizedHotkey("GAMEOVER_CONTINUE_GAME"))

	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddQuitButton(d, true, GetLocalizedString("GAMEOVER_QUIT_GAME"), GetLocalizedHotkey("GAMEOVER_QUIT_GAME")))

	DialogDisplay(whichPlayer, d, true)
	StartSoundForPlayerBJ(whichPlayer, bj_victoryDialogSound)
end

--===========================================================================
function MeleeDefeatDialogBJ(whichPlayer, leftGame)
	local t = CreateTrigger()
	local d = DialogCreate()
	local formatString

	-- Display "player was defeated" or "player has left the game" message
	if leftGame then
		formatString = GetLocalizedString("PLAYER_LEFT_GAME")
	else
		formatString = GetLocalizedString("PLAYER_DEFEATED")
	end

	DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, formatString)

	DialogSetMessage(d, GetLocalizedString("GAMEOVER_DEFEAT_MSG"))

	-- Only show the continue button if the game is not over and observers on death are allowed
	if not bj_meleeGameOver and IsMapFlagSet(MAP_OBSERVERS_ON_DEATH) then
		DialogAddButton(d, GetLocalizedString("GAMEOVER_CONTINUE_OBSERVING"), GetLocalizedHotkey("GAMEOVER_CONTINUE_OBSERVING"))
	end

	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddQuitButton(d, true, GetLocalizedString("GAMEOVER_QUIT_GAME"), GetLocalizedHotkey("GAMEOVER_QUIT_GAME")))

	DialogDisplay(whichPlayer, d, true)
	StartSoundForPlayerBJ(whichPlayer, bj_defeatDialogSound)
end

--===========================================================================
function GameOverDialogBJ(whichPlayer, leftGame)
	local t = CreateTrigger()
	local d = DialogCreate()
	local s

	-- Display "player left the game" message
	DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, GetLocalizedString("PLAYER_LEFT_GAME"))

	if GetIntegerGameState(GAME_STATE_DISCONNECTED) ~= 0 then
		s = GetLocalizedString("GAMEOVER_DISCONNECTED")
	else
		s = GetLocalizedString("GAMEOVER_GAME_OVER")
	end

	DialogSetMessage(d, s)

	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddQuitButton(d, true, GetLocalizedString("GAMEOVER_OK"), GetLocalizedHotkey("GAMEOVER_OK")))

	DialogDisplay(whichPlayer, d, true)
	StartSoundForPlayerBJ(whichPlayer, bj_defeatDialogSound)
end

--===========================================================================
function RemovePlayerPreserveUnitsBJ(whichPlayer, gameResult, leftGame)
	if AllowVictoryDefeat(gameResult) then

		RemovePlayer(whichPlayer, gameResult)

		if gameResult == PLAYER_GAME_RESULT_VICTORY then
			MeleeVictoryDialogBJ(whichPlayer, leftGame)
			return
		elseif gameResult == PLAYER_GAME_RESULT_DEFEAT then
			MeleeDefeatDialogBJ(whichPlayer, leftGame)
		else
			GameOverDialogBJ(whichPlayer, leftGame)
		end

	end
end

--===========================================================================
function CustomVictoryOkBJ()
	if bj_isSinglePlayer then
		PauseGame(false)
		-- Bump the difficulty back up to the default.
		SetGameDifficulty(GetDefaultDifficulty())
	end

	if bj_changeLevelMapName == nil then
		EndGame(bj_changeLevelShowScores)
	else
		ChangeLevel(bj_changeLevelMapName, bj_changeLevelShowScores)
	end
end

--===========================================================================
function CustomVictoryQuitBJ()
	if bj_isSinglePlayer then
		PauseGame(false)
		-- Bump the difficulty back up to the default.
		SetGameDifficulty(GetDefaultDifficulty())
	end

	EndGame(bj_changeLevelShowScores)
end

--===========================================================================
function CustomVictoryDialogBJ(whichPlayer)
	local t = CreateTrigger()
	local d = DialogCreate()

	DialogSetMessage(d, GetLocalizedString("GAMEOVER_VICTORY_MSG"))

	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_CONTINUE"), GetLocalizedHotkey("GAMEOVER_CONTINUE")))
	TriggerAddAction(t, CustomVictoryOkBJ)

	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_QUIT_MISSION"), GetLocalizedHotkey("GAMEOVER_QUIT_MISSION")))
	TriggerAddAction(t, CustomVictoryQuitBJ)

	if GetLocalPlayer() == whichPlayer then
		EnableUserControl(true)
		if bj_isSinglePlayer then
			PauseGame(true)
		end
		EnableUserUI(false)
	end

	DialogDisplay(whichPlayer, d, true)
	VolumeGroupSetVolumeForPlayerBJ(whichPlayer, SOUND_VOLUMEGROUP_UI, 1.0)
	StartSoundForPlayerBJ(whichPlayer, bj_victoryDialogSound)
end

--===========================================================================
function CustomVictorySkipBJ(whichPlayer)
	if GetLocalPlayer() == whichPlayer then
		if bj_isSinglePlayer then
			-- Bump the difficulty back up to the default.
			SetGameDifficulty(GetDefaultDifficulty())
		end

		if bj_changeLevelMapName == nil then
			EndGame(bj_changeLevelShowScores)
		else
			ChangeLevel(bj_changeLevelMapName, bj_changeLevelShowScores)
		end
	end
end

--===========================================================================
function CustomVictoryBJ(whichPlayer, showDialog, showScores)
	if AllowVictoryDefeat(PLAYER_GAME_RESULT_VICTORY) then
		RemovePlayer(whichPlayer, PLAYER_GAME_RESULT_VICTORY)

		if not bj_isSinglePlayer then
			DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, GetLocalizedString("PLAYER_VICTORIOUS"))
		end

		-- UI only needs to be displayed to users.
		if GetPlayerController(whichPlayer) == MAP_CONTROL_USER then
			bj_changeLevelShowScores = showScores
			if showDialog then
				CustomVictoryDialogBJ(whichPlayer)
			else
				CustomVictorySkipBJ(whichPlayer)
			end
		end
	end
end

--===========================================================================
function CustomDefeatRestartBJ()
	PauseGame(false)
	RestartGame(true)
end

--===========================================================================
function CustomDefeatReduceDifficultyBJ()
	local diff = GetGameDifficulty()

	PauseGame(false)

	-- Knock the difficulty down, if possible.
	if diff == MAP_DIFFICULTY_EASY then
	-- Sorry, but it doesn't get any easier than this.
	elseif diff == MAP_DIFFICULTY_NORMAL then
		SetGameDifficulty(MAP_DIFFICULTY_EASY)
	elseif diff == MAP_DIFFICULTY_HARD then
		SetGameDifficulty(MAP_DIFFICULTY_NORMAL)
	else
	-- Unrecognized difficulty
	end

	RestartGame(true)
end

--===========================================================================
function CustomDefeatLoadBJ()
	PauseGame(false)
	DisplayLoadDialog()
end

--===========================================================================
function CustomDefeatQuitBJ()
	if bj_isSinglePlayer then
		PauseGame(false)
	end

	-- Bump the difficulty back up to the default.
	SetGameDifficulty(GetDefaultDifficulty())
	EndGame(true)
end

--===========================================================================
function CustomDefeatDialogBJ(whichPlayer, message)
	local t = CreateTrigger()
	local d = DialogCreate()

	DialogSetMessage(d, message)

	if bj_isSinglePlayer then
		t = CreateTrigger()
		TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_RESTART"), GetLocalizedHotkey("GAMEOVER_RESTART")))
		TriggerAddAction(t, CustomDefeatRestartBJ)

		if GetGameDifficulty() ~= MAP_DIFFICULTY_EASY then
			t = CreateTrigger()
			TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_REDUCE_DIFFICULTY"), GetLocalizedHotkey("GAMEOVER_REDUCE_DIFFICULTY")))
			TriggerAddAction(t, CustomDefeatReduceDifficultyBJ)
		end

		t = CreateTrigger()
		TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_LOAD"), GetLocalizedHotkey("GAMEOVER_LOAD")))
		TriggerAddAction(t, CustomDefeatLoadBJ)
	end

	t = CreateTrigger()
	TriggerRegisterDialogButtonEvent(t, DialogAddButton(d, GetLocalizedString("GAMEOVER_QUIT_MISSION"), GetLocalizedHotkey("GAMEOVER_QUIT_MISSION")))
	TriggerAddAction(t, CustomDefeatQuitBJ)

	if GetLocalPlayer() == whichPlayer then
		EnableUserControl(true)
		if bj_isSinglePlayer then
			PauseGame(true)
		end
		EnableUserUI(false)
	end

	DialogDisplay(whichPlayer, d, true)
	VolumeGroupSetVolumeForPlayerBJ(whichPlayer, SOUND_VOLUMEGROUP_UI, 1.0)
	StartSoundForPlayerBJ(whichPlayer, bj_defeatDialogSound)
end

--===========================================================================
function CustomDefeatBJ(whichPlayer, message)
	if AllowVictoryDefeat(PLAYER_GAME_RESULT_DEFEAT) then
		RemovePlayer(whichPlayer, PLAYER_GAME_RESULT_DEFEAT)

		if not bj_isSinglePlayer then
			DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, GetLocalizedString("PLAYER_DEFEATED"))
		end

		-- UI only needs to be displayed to users.
		if GetPlayerController(whichPlayer) == MAP_CONTROL_USER then
			CustomDefeatDialogBJ(whichPlayer, message)
		end
	end
end

--===========================================================================
function SetNextLevelBJ(nextLevel)
	if nextLevel == "" then
		bj_changeLevelMapName = nil
	else
		bj_changeLevelMapName = nextLevel
	end
end

--===========================================================================
function SetPlayerOnScoreScreenBJ(flag, whichPlayer)
	SetPlayerOnScoreScreen(whichPlayer, flag)
end



--***************************************************************************
--*
--*  Quest Utility Functions
--*
--***************************************************************************

--===========================================================================
function CreateQuestBJ(questType, title, description, iconPath)
	local required = questType == bj_QUESTTYPE_REQ_DISCOVERED or questType == bj_QUESTTYPE_REQ_UNDISCOVERED
	local discovered = questType == bj_QUESTTYPE_REQ_DISCOVERED or questType == bj_QUESTTYPE_OPT_DISCOVERED

	bj_lastCreatedQuest = CreateQuest()
	QuestSetTitle(bj_lastCreatedQuest, title)
	QuestSetDescription(bj_lastCreatedQuest, description)
	QuestSetIconPath(bj_lastCreatedQuest, iconPath)
	QuestSetRequired(bj_lastCreatedQuest, required)
	QuestSetDiscovered(bj_lastCreatedQuest, discovered)
	QuestSetCompleted(bj_lastCreatedQuest, false)
	return bj_lastCreatedQuest
end

--===========================================================================
function DestroyQuestBJ(whichQuest)
	DestroyQuest(whichQuest)
end

--===========================================================================
function QuestSetEnabledBJ(enabled, whichQuest)
	QuestSetEnabled(whichQuest, enabled)
end

--===========================================================================
function QuestSetTitleBJ(whichQuest, title)
	QuestSetTitle(whichQuest, title)
end

--===========================================================================
function QuestSetDescriptionBJ(whichQuest, description)
	QuestSetDescription(whichQuest, description)
end

--===========================================================================
function QuestSetCompletedBJ(whichQuest, completed)
	QuestSetCompleted(whichQuest, completed)
end

--===========================================================================
function QuestSetFailedBJ(whichQuest, failed)
	QuestSetFailed(whichQuest, failed)
end

--===========================================================================
function QuestSetDiscoveredBJ(whichQuest, discovered)
	QuestSetDiscovered(whichQuest, discovered)
end

--===========================================================================
function GetLastCreatedQuestBJ()
	return bj_lastCreatedQuest
end

--===========================================================================
function CreateQuestItemBJ(whichQuest, description)
	bj_lastCreatedQuestItem = QuestCreateItem(whichQuest)
	QuestItemSetDescription(bj_lastCreatedQuestItem, description)
	QuestItemSetCompleted(bj_lastCreatedQuestItem, false)
	return bj_lastCreatedQuestItem
end

--===========================================================================
function QuestItemSetDescriptionBJ(whichQuestItem, description)
	QuestItemSetDescription(whichQuestItem, description)
end

--===========================================================================
function QuestItemSetCompletedBJ(whichQuestItem, completed)
	QuestItemSetCompleted(whichQuestItem, completed)
end

--===========================================================================
function GetLastCreatedQuestItemBJ()
	return bj_lastCreatedQuestItem
end

--===========================================================================
function CreateDefeatConditionBJ(description)
	bj_lastCreatedDefeatCondition = CreateDefeatCondition()
	DefeatConditionSetDescription(bj_lastCreatedDefeatCondition, description)
	return bj_lastCreatedDefeatCondition
end

--===========================================================================
function DestroyDefeatConditionBJ(whichCondition)
	DestroyDefeatCondition(whichCondition)
end

--===========================================================================
function DefeatConditionSetDescriptionBJ(whichCondition, description)
	DefeatConditionSetDescription(whichCondition, description)
end

--===========================================================================
function GetLastCreatedDefeatConditionBJ()
	return bj_lastCreatedDefeatCondition
end

--===========================================================================
function FlashQuestDialogButtonBJ()
	FlashQuestDialogButton()
end

--===========================================================================
function QuestMessageBJ(f, messageType, message)
	if IsPlayerInForce(GetLocalPlayer(), f) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.

		if messageType == bj_QUESTMESSAGE_DISCOVERED then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUEST, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUEST, message)
			StartSound(bj_questDiscoveredSound)
			FlashQuestDialogButton()

		elseif messageType == bj_QUESTMESSAGE_UPDATED then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTUPDATE, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTUPDATE, message)
			StartSound(bj_questUpdatedSound)
			FlashQuestDialogButton()

		elseif messageType == bj_QUESTMESSAGE_COMPLETED then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTDONE, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTDONE, message)
			StartSound(bj_questCompletedSound)
			FlashQuestDialogButton()

		elseif messageType == bj_QUESTMESSAGE_FAILED then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTFAILED, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTFAILED, message)
			StartSound(bj_questFailedSound)
			FlashQuestDialogButton()

		elseif messageType == bj_QUESTMESSAGE_REQUIREMENT then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_QUESTREQUIREMENT, message)

		elseif messageType == bj_QUESTMESSAGE_MISSIONFAILED then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_MISSIONFAILED, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_MISSIONFAILED, message)
			StartSound(bj_questFailedSound)

		elseif messageType == bj_QUESTMESSAGE_HINT then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_HINT, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_HINT, message)
			StartSound(bj_questHintSound)

		elseif messageType == bj_QUESTMESSAGE_ALWAYSHINT then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, message)
			StartSound(bj_questHintSound)

		elseif messageType == bj_QUESTMESSAGE_SECRET then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_SECRET, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_SECRET, message)
			StartSound(bj_questSecretSound)

		elseif messageType == bj_QUESTMESSAGE_UNITACQUIRED then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_UNITACQUIRED, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_UNITACQUIRED, message)
			StartSound(bj_questHintSound)

		elseif messageType == bj_QUESTMESSAGE_UNITAVAILABLE then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_UNITAVAILABLE, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_UNITAVAILABLE, message)
			StartSound(bj_questHintSound)

		elseif messageType == bj_QUESTMESSAGE_ITEMACQUIRED then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_ITEMACQUIRED, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_ITEMACQUIRED, message)
			StartSound(bj_questItemAcquiredSound)

		elseif messageType == bj_QUESTMESSAGE_WARNING then
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_WARNING, " ")
			DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_TEXT_DELAY_WARNING, message)
			StartSound(bj_questWarningSound)

		else
		-- Unrecognized message type - ignore the request.
		end
	end
end



--***************************************************************************
--*
--*  Timer Utility Functions
--*
--***************************************************************************

--===========================================================================
function StartTimerBJ(t, periodic, timeout)
	bj_lastStartedTimer = t
	TimerStart(t, timeout, periodic, nil)
	return bj_lastStartedTimer
end

--===========================================================================
function CreateTimerBJ(periodic, timeout)
	bj_lastStartedTimer = CreateTimer()
	TimerStart(bj_lastStartedTimer, timeout, periodic, nil)
	return bj_lastStartedTimer
end

--===========================================================================
function DestroyTimerBJ(whichTimer)
	DestroyTimer(whichTimer)
end

--===========================================================================
function PauseTimerBJ(pause, whichTimer)
	if pause then
		PauseTimer(whichTimer)
	else
		ResumeTimer(whichTimer)
	end
end

--===========================================================================
function GetLastCreatedTimerBJ()
	return bj_lastStartedTimer
end

--===========================================================================
function CreateTimerDialogBJ(t, title)
	bj_lastCreatedTimerDialog = CreateTimerDialog(t)
	TimerDialogSetTitle(bj_lastCreatedTimerDialog, title)
	TimerDialogDisplay(bj_lastCreatedTimerDialog, true)
	return bj_lastCreatedTimerDialog
end

--===========================================================================
function DestroyTimerDialogBJ(td)
	DestroyTimerDialog(td)
end

--===========================================================================
function TimerDialogSetTitleBJ(td, title)
	TimerDialogSetTitle(td, title)
end

--===========================================================================
function TimerDialogSetTitleColorBJ(td, red, green, blue, transparency)
	TimerDialogSetTitleColor(td, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function TimerDialogSetTimeColorBJ(td, red, green, blue, transparency)
	TimerDialogSetTimeColor(td, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function TimerDialogSetSpeedBJ(td, speedMultFactor)
	TimerDialogSetSpeed(td, speedMultFactor)
end

--===========================================================================
function TimerDialogDisplayForPlayerBJ(show, td, whichPlayer)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		TimerDialogDisplay(td, show)
	end
end

--===========================================================================
function TimerDialogDisplayBJ(show, td)
	TimerDialogDisplay(td, show)
end

--===========================================================================
function GetLastCreatedTimerDialogBJ()
	return bj_lastCreatedTimerDialog
end



--***************************************************************************
--*
--*  Leaderboard Utility Functions
--*
--***************************************************************************

--===========================================================================
function LeaderboardResizeBJ(lb)
	local size = LeaderboardGetItemCount(lb)

	if LeaderboardGetLabelText(lb) == "" then
		size = size - 1
	end
	LeaderboardSetSizeByItemCount(lb, size)
end

--===========================================================================
function LeaderboardSetPlayerItemValueBJ(whichPlayer, lb, val)
	LeaderboardSetItemValue(lb, LeaderboardGetPlayerIndex(lb, whichPlayer), val)
end

--===========================================================================
function LeaderboardSetPlayerItemLabelBJ(whichPlayer, lb, val)
	LeaderboardSetItemLabel(lb, LeaderboardGetPlayerIndex(lb, whichPlayer), val)
end

--===========================================================================
function LeaderboardSetPlayerItemStyleBJ(whichPlayer, lb, showLabel, showValue, showIcon)
	LeaderboardSetItemStyle(lb, LeaderboardGetPlayerIndex(lb, whichPlayer), showLabel, showValue, showIcon)
end

--===========================================================================
function LeaderboardSetPlayerItemLabelColorBJ(whichPlayer, lb, red, green, blue, transparency)
	LeaderboardSetItemLabelColor(lb, LeaderboardGetPlayerIndex(lb, whichPlayer), PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function LeaderboardSetPlayerItemValueColorBJ(whichPlayer, lb, red, green, blue, transparency)
	LeaderboardSetItemValueColor(lb, LeaderboardGetPlayerIndex(lb, whichPlayer), PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function LeaderboardSetLabelColorBJ(lb, red, green, blue, transparency)
	LeaderboardSetLabelColor(lb, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function LeaderboardSetValueColorBJ(lb, red, green, blue, transparency)
	LeaderboardSetValueColor(lb, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function LeaderboardSetLabelBJ(lb, label)
	LeaderboardSetLabel(lb, label)
	LeaderboardResizeBJ(lb)
end

--===========================================================================
function LeaderboardSetStyleBJ(lb, showLabel, showNames, showValues, showIcons)
	LeaderboardSetStyle(lb, showLabel, showNames, showValues, showIcons)
end

--===========================================================================
function LeaderboardGetItemCountBJ(lb)
	return LeaderboardGetItemCount(lb)
end

--===========================================================================
function LeaderboardHasPlayerItemBJ(lb, whichPlayer)
	return LeaderboardHasPlayerItem(lb, whichPlayer)
end

--===========================================================================
function ForceSetLeaderboardBJ(lb, toForce)
	local index
	local indexPlayer

	index = 0
	for _ in _loop_() do
		indexPlayer = Player(index)
		if IsPlayerInForce(indexPlayer, toForce) then
			PlayerSetLeaderboard(indexPlayer, lb)
		end
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
function CreateLeaderboardBJ(toForce, label)
	bj_lastCreatedLeaderboard = CreateLeaderboard()
	LeaderboardSetLabel(bj_lastCreatedLeaderboard, label)
	ForceSetLeaderboardBJ(bj_lastCreatedLeaderboard, toForce)
	LeaderboardDisplay(bj_lastCreatedLeaderboard, true)
	return bj_lastCreatedLeaderboard
end

--===========================================================================
function DestroyLeaderboardBJ(lb)
	DestroyLeaderboard(lb)
end

--===========================================================================
function LeaderboardDisplayBJ(show, lb)
	LeaderboardDisplay(lb, show)
end

--===========================================================================
function LeaderboardAddItemBJ(whichPlayer, lb, label, value)
	if LeaderboardHasPlayerItem(lb, whichPlayer) then
		LeaderboardRemovePlayerItem(lb, whichPlayer)
	end
	LeaderboardAddItem(lb, label, value, whichPlayer)
	LeaderboardResizeBJ(lb)
--call LeaderboardSetSizeByItemCount(lb, LeaderboardGetItemCount(lb))
end

--===========================================================================
function LeaderboardRemovePlayerItemBJ(whichPlayer, lb)
	LeaderboardRemovePlayerItem(lb, whichPlayer)
	LeaderboardResizeBJ(lb)
end

--===========================================================================
function LeaderboardSortItemsBJ(lb, sortType, ascending)
	if sortType == bj_SORTTYPE_SORTBYVALUE then
		LeaderboardSortItemsByValue(lb, ascending)
	elseif sortType == bj_SORTTYPE_SORTBYPLAYER then
		LeaderboardSortItemsByPlayer(lb, ascending)
	elseif sortType == bj_SORTTYPE_SORTBYLABEL then
		LeaderboardSortItemsByLabel(lb, ascending)
	else
	-- Unrecognized sort type - ignore the request.
	end
end

--===========================================================================
function LeaderboardSortItemsByPlayerBJ(lb, ascending)
	LeaderboardSortItemsByPlayer(lb, ascending)
end

--===========================================================================
function LeaderboardSortItemsByLabelBJ(lb, ascending)
	LeaderboardSortItemsByLabel(lb, ascending)
end

--===========================================================================
function LeaderboardGetPlayerIndexBJ(whichPlayer, lb)
	return LeaderboardGetPlayerIndex(lb, whichPlayer) + 1
end

--===========================================================================
-- Returns the player who is occupying a specified position in a leaderboard.
-- The position parameter is expected in the range of 1..16.
--
function LeaderboardGetIndexedPlayerBJ(position, lb)
	local index
	local indexPlayer

	index = 0
	for _ in _loop_() do
		indexPlayer = Player(index)
		if LeaderboardGetPlayerIndex(lb, indexPlayer) == position - 1 then
			return indexPlayer
		end

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end

	return Player(PLAYER_NEUTRAL_PASSIVE)
end

--===========================================================================
function PlayerGetLeaderboardBJ(whichPlayer)
	return PlayerGetLeaderboard(whichPlayer)
end

--===========================================================================
function GetLastCreatedLeaderboard()
	return bj_lastCreatedLeaderboard
end

--***************************************************************************
--*
--*  Multiboard Utility Functions
--*
--***************************************************************************

--===========================================================================
function CreateMultiboardBJ(cols, rows, title)
	bj_lastCreatedMultiboard = CreateMultiboard()
	MultiboardSetRowCount(bj_lastCreatedMultiboard, rows)
	MultiboardSetColumnCount(bj_lastCreatedMultiboard, cols)
	MultiboardSetTitleText(bj_lastCreatedMultiboard, title)
	MultiboardDisplay(bj_lastCreatedMultiboard, true)
	return bj_lastCreatedMultiboard
end

--===========================================================================
function DestroyMultiboardBJ(mb)
	DestroyMultiboard(mb)
end

--===========================================================================
function GetLastCreatedMultiboard()
	return bj_lastCreatedMultiboard
end

--===========================================================================
function MultiboardDisplayBJ(show, mb)
	MultiboardDisplay(mb, show)
end

--===========================================================================
function MultiboardMinimizeBJ(minimize, mb)
	MultiboardMinimize(mb, minimize)
end

--===========================================================================
function MultiboardSetTitleTextColorBJ(mb, red, green, blue, transparency)
	MultiboardSetTitleTextColor(mb, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function MultiboardAllowDisplayBJ(flag)
	MultiboardSuppressDisplay(not flag)
end

--===========================================================================
function MultiboardSetItemStyleBJ(mb, col, row, showValue, showIcon)
	local curRow = 0
	local curCol = 0
	local numRows = MultiboardGetRowCount(mb)
	local numCols = MultiboardGetColumnCount(mb)
	local mbitem = nil

	-- Loop over rows, using 1-based index
	for _ in _loop_() do
		curRow = curRow + 1
		if curRow > numRows then break end

		-- Apply setting to the requested row, or all rows (if row is 0)
		if row == 0 or row == curRow then
			-- Loop over columns, using 1-based index
			curCol = 0
			for _ in _loop_() do
				curCol = curCol + 1
				if curCol > numCols then break end

				-- Apply setting to the requested column, or all columns (if col is 0)
				if col == 0 or col == curCol then
					mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
					MultiboardSetItemStyle(mbitem, showValue, showIcon)
					MultiboardReleaseItem(mbitem)
				end
			end
		end
	end
end

--===========================================================================
function MultiboardSetItemValueBJ(mb, col, row, val)
	local curRow = 0
	local curCol = 0
	local numRows = MultiboardGetRowCount(mb)
	local numCols = MultiboardGetColumnCount(mb)
	local mbitem = nil

	-- Loop over rows, using 1-based index
	for _ in _loop_() do
		curRow = curRow + 1
		if curRow > numRows then break end

		-- Apply setting to the requested row, or all rows (if row is 0)
		if row == 0 or row == curRow then
			-- Loop over columns, using 1-based index
			curCol = 0
			for _ in _loop_() do
				curCol = curCol + 1
				if curCol > numCols then break end

				-- Apply setting to the requested column, or all columns (if col is 0)
				if col == 0 or col == curCol then
					mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
					MultiboardSetItemValue(mbitem, val)
					MultiboardReleaseItem(mbitem)
				end
			end
		end
	end
end

--===========================================================================
function MultiboardSetItemColorBJ(mb, col, row, red, green, blue, transparency)
	local curRow = 0
	local curCol = 0
	local numRows = MultiboardGetRowCount(mb)
	local numCols = MultiboardGetColumnCount(mb)
	local mbitem = nil

	-- Loop over rows, using 1-based index
	for _ in _loop_() do
		curRow = curRow + 1
		if curRow > numRows then break end

		-- Apply setting to the requested row, or all rows (if row is 0)
		if row == 0 or row == curRow then
			-- Loop over columns, using 1-based index
			curCol = 0
			for _ in _loop_() do
				curCol = curCol + 1
				if curCol > numCols then break end

				-- Apply setting to the requested column, or all columns (if col is 0)
				if col == 0 or col == curCol then
					mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
					MultiboardSetItemValueColor(mbitem, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
					MultiboardReleaseItem(mbitem)
				end
			end
		end
	end
end

--===========================================================================
function MultiboardSetItemWidthBJ(mb, col, row, width)
	local curRow = 0
	local curCol = 0
	local numRows = MultiboardGetRowCount(mb)
	local numCols = MultiboardGetColumnCount(mb)
	local mbitem = nil

	-- Loop over rows, using 1-based index
	for _ in _loop_() do
		curRow = curRow + 1
		if curRow > numRows then break end

		-- Apply setting to the requested row, or all rows (if row is 0)
		if row == 0 or row == curRow then
			-- Loop over columns, using 1-based index
			curCol = 0
			for _ in _loop_() do
				curCol = curCol + 1
				if curCol > numCols then break end

				-- Apply setting to the requested column, or all columns (if col is 0)
				if col == 0 or col == curCol then
					mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
					MultiboardSetItemWidth(mbitem, width / 100.0)
					MultiboardReleaseItem(mbitem)
				end
			end
		end
	end
end

--===========================================================================
function MultiboardSetItemIconBJ(mb, col, row, iconFileName)
	local curRow = 0
	local curCol = 0
	local numRows = MultiboardGetRowCount(mb)
	local numCols = MultiboardGetColumnCount(mb)
	local mbitem = nil

	-- Loop over rows, using 1-based index
	for _ in _loop_() do
		curRow = curRow + 1
		if curRow > numRows then break end

		-- Apply setting to the requested row, or all rows (if row is 0)
		if row == 0 or row == curRow then
			-- Loop over columns, using 1-based index
			curCol = 0
			for _ in _loop_() do
				curCol = curCol + 1
				if curCol > numCols then break end

				-- Apply setting to the requested column, or all columns (if col is 0)
				if col == 0 or col == curCol then
					mbitem = MultiboardGetItem(mb, curRow - 1, curCol - 1)
					MultiboardSetItemIcon(mbitem, iconFileName)
					MultiboardReleaseItem(mbitem)
				end
			end
		end
	end
end



--***************************************************************************
--*
--*  Text Tag Utility Functions
--*
--***************************************************************************

--===========================================================================
-- Scale the font size linearly such that size 10 equates to height 0.023.
-- Screen-relative font heights are harder to grasp and than font sizes.
--
function TextTagSize2Height(size)
	return size * 0.023 / 10
end

--===========================================================================
-- Scale the speed linearly such that speed 128 equates to 0.071.
-- Screen-relative speeds are hard to grasp.
--
function TextTagSpeed2Velocity(speed)
	return speed * 0.071 / 128
end

--===========================================================================
function SetTextTagColorBJ(tt, red, green, blue, transparency)
	SetTextTagColor(tt, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
end

--===========================================================================
function SetTextTagVelocityBJ(tt, speed, angle)
	local vel = TextTagSpeed2Velocity(speed)
	local xvel = vel * Cos(angle * bj_DEGTORAD)
	local yvel = vel * Sin(angle * bj_DEGTORAD)

	SetTextTagVelocity(tt, xvel, yvel)
end

--===========================================================================
function SetTextTagTextBJ(tt, s, size)
	local textHeight = TextTagSize2Height(size)

	SetTextTagText(tt, s, textHeight)
end

--===========================================================================
function SetTextTagPosBJ(tt, loc, zOffset)
	SetTextTagPos(tt, GetLocationX(loc), GetLocationY(loc), zOffset)
end

--===========================================================================
function SetTextTagPosUnitBJ(tt, whichUnit, zOffset)
	SetTextTagPosUnit(tt, whichUnit, zOffset)
end

--===========================================================================
function SetTextTagSuspendedBJ(tt, flag)
	SetTextTagSuspended(tt, flag)
end

--===========================================================================
function SetTextTagPermanentBJ(tt, flag)
	SetTextTagPermanent(tt, flag)
end

--===========================================================================
function SetTextTagAgeBJ(tt, age)
	SetTextTagAge(tt, age)
end

--===========================================================================
function SetTextTagLifespanBJ(tt, lifespan)
	SetTextTagLifespan(tt, lifespan)
end

--===========================================================================
function SetTextTagFadepointBJ(tt, fadepoint)
	SetTextTagFadepoint(tt, fadepoint)
end

--===========================================================================
function CreateTextTagLocBJ(s, loc, zOffset, size, red, green, blue, transparency)
	bj_lastCreatedTextTag = CreateTextTag()
	SetTextTagTextBJ(bj_lastCreatedTextTag, s, size)
	SetTextTagPosBJ(bj_lastCreatedTextTag, loc, zOffset)
	SetTextTagColorBJ(bj_lastCreatedTextTag, red, green, blue, transparency)

	return bj_lastCreatedTextTag
end

--===========================================================================
function CreateTextTagUnitBJ(s, whichUnit, zOffset, size, red, green, blue, transparency)
	bj_lastCreatedTextTag = CreateTextTag()
	SetTextTagTextBJ(bj_lastCreatedTextTag, s, size)
	SetTextTagPosUnitBJ(bj_lastCreatedTextTag, whichUnit, zOffset)
	SetTextTagColorBJ(bj_lastCreatedTextTag, red, green, blue, transparency)

	return bj_lastCreatedTextTag
end

--===========================================================================
function DestroyTextTagBJ(tt)
	DestroyTextTag(tt)
end

--===========================================================================
function ShowTextTagForceBJ(show, tt, whichForce)
	if IsPlayerInForce(GetLocalPlayer(), whichForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		SetTextTagVisibility(tt, show)
	end
end

--===========================================================================
function GetLastCreatedTextTag()
	return bj_lastCreatedTextTag
end



--***************************************************************************
--*
--*  Cinematic Utility Functions
--*
--***************************************************************************

--===========================================================================
function PauseGameOn()
	PauseGame(true)
end

--===========================================================================
function PauseGameOff()
	PauseGame(false)
end

--===========================================================================
function SetUserControlForceOn(whichForce)
	if IsPlayerInForce(GetLocalPlayer(), whichForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		EnableUserControl(true)
	end
end

--===========================================================================
function SetUserControlForceOff(whichForce)
	if IsPlayerInForce(GetLocalPlayer(), whichForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		EnableUserControl(false)
	end
end

--===========================================================================
function ShowInterfaceForceOn(whichForce, fadeDuration)
	if IsPlayerInForce(GetLocalPlayer(), whichForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ShowInterface(true, fadeDuration)
	end
end

--===========================================================================
function ShowInterfaceForceOff(whichForce, fadeDuration)
	if IsPlayerInForce(GetLocalPlayer(), whichForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		ShowInterface(false, fadeDuration)
	end
end

--===========================================================================
function PingMinimapForForce(whichForce, x, y, duration)
	if IsPlayerInForce(GetLocalPlayer(), whichForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PingMinimap(x, y, duration)
	--call StartSound(bj_pingMinimapSound)
	end
end

--===========================================================================
function PingMinimapLocForForce(whichForce, loc, duration)
	PingMinimapForForce(whichForce, GetLocationX(loc), GetLocationY(loc), duration)
end

--===========================================================================
function PingMinimapForPlayer(whichPlayer, x, y, duration)
	if GetLocalPlayer() == whichPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		PingMinimap(x, y, duration)
	--call StartSound(bj_pingMinimapSound)
	end
end

--===========================================================================
function PingMinimapLocForPlayer(whichPlayer, loc, duration)
	PingMinimapForPlayer(whichPlayer, GetLocationX(loc), GetLocationY(loc), duration)
end

--===========================================================================
function PingMinimapForForceEx(whichForce, x, y, duration, style, red, green, blue)
	local red255 = PercentTo255(red)
	local green255 = PercentTo255(green)
	local blue255 = PercentTo255(blue)

	if IsPlayerInForce(GetLocalPlayer(), whichForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.

		-- Prevent 100% red simple and flashy pings, as they become "attack" pings.
		if red255 == 255 and green255 == 0 and blue255 == 0 then
			red255 = 254
		end

		if style == bj_MINIMAPPINGSTYLE_SIMPLE then
			PingMinimapEx(x, y, duration, red255, green255, blue255, false)
		elseif style == bj_MINIMAPPINGSTYLE_FLASHY then
			PingMinimapEx(x, y, duration, red255, green255, blue255, true)
		elseif style == bj_MINIMAPPINGSTYLE_ATTACK then
			PingMinimapEx(x, y, duration, 255, 0, 0, false)
		else
		-- Unrecognized ping style - ignore the request.
		end

	--call StartSound(bj_pingMinimapSound)
	end
end

--===========================================================================
function PingMinimapLocForForceEx(whichForce, loc, duration, style, red, green, blue)
	PingMinimapForForceEx(whichForce, GetLocationX(loc), GetLocationY(loc), duration, style, red, green, blue)
end

--===========================================================================
function EnableWorldFogBoundaryBJ(enable, f)
	if IsPlayerInForce(GetLocalPlayer(), f) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		EnableWorldFogBoundary(enable)
	end
end

--===========================================================================
function EnableOcclusionBJ(enable, f)
	if IsPlayerInForce(GetLocalPlayer(), f) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.
		EnableOcclusion(enable)
	end
end



--***************************************************************************
--*
--*  Cinematic Transmission Utility Functions
--*
--***************************************************************************

--===========================================================================
-- If cancelled, stop the sound and end the cinematic scene.
--
function CancelCineSceneBJ()
	StopSoundBJ(bj_cineSceneLastSound, true)
	EndCinematicScene()
end

--===========================================================================
-- Init a trigger to listen for END_CINEMATIC events and respond to them if
-- a cinematic scene is in progress.  For performance reasons, this should
-- only be called once a cinematic scene has been started, so that maps
-- lacking such scenes do not bother to register for these events.
--
function TryInitCinematicBehaviorBJ()
	local index

	if bj_cineSceneBeingSkipped == nil then
		bj_cineSceneBeingSkipped = CreateTrigger()
		index = 0
		for _ in _loop_() do
			TriggerRegisterPlayerEvent(bj_cineSceneBeingSkipped, Player(index), EVENT_PLAYER_END_CINEMATIC)
			index = index + 1
			if index == bj_MAX_PLAYERS then break end
		end
		TriggerAddAction(bj_cineSceneBeingSkipped, CancelCineSceneBJ)
	end
end

--===========================================================================
function SetCinematicSceneBJ(soundHandle, portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
	bj_cineSceneLastSound = soundHandle
	PlaySoundBJ(soundHandle)
	SetCinematicScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
end

--===========================================================================
function GetTransmissionDuration(soundHandle, timeType, timeVal)
	local duration

	if timeType == bj_TIMETYPE_ADD then
		duration = GetSoundDurationBJ(soundHandle) + timeVal
	elseif timeType == bj_TIMETYPE_SET then
		duration = timeVal
	elseif timeType == bj_TIMETYPE_SUB then
		duration = GetSoundDurationBJ(soundHandle) - timeVal
	else
		-- Unrecognized timeType - ignore timeVal.
		duration = GetSoundDurationBJ(soundHandle)
	end

	-- Make sure we have a non-negative duration.
	if duration < 0 then
		duration = 0
	end
	return duration
end

--===========================================================================
function WaitTransmissionDuration(soundHandle, timeType, timeVal)
	if timeType == bj_TIMETYPE_SET then
		-- If we have a static duration wait, just perform the wait.
		TriggerSleepAction(timeVal)

	elseif soundHandle == nil then
		-- If the sound does not exist, perform a default length wait.
		TriggerSleepAction(bj_NOTHING_SOUND_DURATION)

	elseif timeType == bj_TIMETYPE_SUB then
		-- If the transmission is cutting off the sound, wait for the sound
		-- to be mostly finished.
		WaitForSoundBJ(soundHandle, timeVal)

	elseif timeType == bj_TIMETYPE_ADD then
		-- If the transmission is extending beyond the sound's length, wait
		-- for it to finish, and then wait the additional time.
		WaitForSoundBJ(soundHandle, 0)
		TriggerSleepAction(timeVal)

	else
	-- Unrecognized timeType - ignore.
	end
end

--===========================================================================
function DoTransmissionBasicsXYBJ(unitId, color, x, y, soundHandle, unitName, message, duration)
	SetCinematicSceneBJ(soundHandle, unitId, color, unitName, message, duration + bj_TRANSMISSION_PORT_HANGTIME, duration)

	if unitId ~= 0 then
		PingMinimap(x, y, bj_TRANSMISSION_PING_TIME)
	--call SetCameraQuickPosition(x, y)
	end
end

--===========================================================================
-- Display a text message to a Player Group with an accompanying sound,
-- portrait, speech indicator, and all that good stuff.
--   - Query duration of sound
--   - Play sound
--   - Display text message for duration
--   - Display animating portrait for duration
--   - Display a speech indicator for the unit
--   - Ping the minimap
--
function TransmissionFromUnitWithNameBJ(toForce, whichUnit, unitName, soundHandle, message, timeType, timeVal, wait)
	TryInitCinematicBehaviorBJ()

	-- Ensure that the time value is non-negative.
	timeVal = RMaxBJ(timeVal, 0)

	bj_lastTransmissionDuration = GetTransmissionDuration(soundHandle, timeType, timeVal)
	bj_lastPlayedSound = soundHandle

	if IsPlayerInForce(GetLocalPlayer(), toForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.

		if whichUnit == nil then
			-- If the unit reference is invalid, send the transmission from the center of the map with no portrait.
			DoTransmissionBasicsXYBJ(0, PLAYER_COLOR_RED, 0, 0, soundHandle, unitName, message, bj_lastTransmissionDuration)
		else
			DoTransmissionBasicsXYBJ(GetUnitTypeId(whichUnit), GetPlayerColor(GetOwningPlayer(whichUnit)), GetUnitX(whichUnit), GetUnitY(whichUnit), soundHandle, unitName, message, bj_lastTransmissionDuration)
			if not IsUnitHidden(whichUnit) then
				UnitAddIndicator(whichUnit, bj_TRANSMISSION_IND_RED, bj_TRANSMISSION_IND_BLUE, bj_TRANSMISSION_IND_GREEN, bj_TRANSMISSION_IND_ALPHA)
			end
		end
	end

	if wait and bj_lastTransmissionDuration > 0 then
		-- call TriggerSleepAction(bj_lastTransmissionDuration)
		WaitTransmissionDuration(soundHandle, timeType, timeVal)
	end

end

--===========================================================================
-- This operates like TransmissionFromUnitWithNameBJ, but for a unit type
-- rather than a unit instance.  As such, no speech indicator is employed.
--
function TransmissionFromUnitTypeWithNameBJ(toForce, fromPlayer, unitId, unitName, loc, soundHandle, message, timeType, timeVal, wait)
	TryInitCinematicBehaviorBJ()

	-- Ensure that the time value is non-negative.
	timeVal = RMaxBJ(timeVal, 0)

	bj_lastTransmissionDuration = GetTransmissionDuration(soundHandle, timeType, timeVal)
	bj_lastPlayedSound = soundHandle

	if IsPlayerInForce(GetLocalPlayer(), toForce) then
		-- Use only local code (no net traffic) within this block to avoid desyncs.

		DoTransmissionBasicsXYBJ(unitId, GetPlayerColor(fromPlayer), GetLocationX(loc), GetLocationY(loc), soundHandle, unitName, message, bj_lastTransmissionDuration)
	end

	if wait and bj_lastTransmissionDuration > 0 then
		-- call TriggerSleepAction(bj_lastTransmissionDuration)
		WaitTransmissionDuration(soundHandle, timeType, timeVal)
	end

end

--===========================================================================
function GetLastTransmissionDurationBJ()
	return bj_lastTransmissionDuration
end

--===========================================================================
function ForceCinematicSubtitlesBJ(flag)
	ForceCinematicSubtitles(flag)
end


--***************************************************************************
--*
--*  Cinematic Mode Utility Functions
--*
--***************************************************************************

--===========================================================================
-- Makes many common UI settings changes at once, for use when beginning and
-- ending cinematic sequences.  Note that some affects apply to all players,
-- such as game speed.  This is unavoidable.
--   - Clear the screen of text messages
--   - Hide interface UI (letterbox mode)
--   - Hide game messages (ally under attack, etc.)
--   - Disable user control
--   - Disable occlusion
--   - Set game speed (for all players)
--   - Lock game speed (for all players)
--   - Disable black mask (for all players)
--   - Disable fog of war (for all players)
--   - Disable world boundary fog (for all players)
--   - Dim non-speech sound channels
--   - End any outstanding music themes
--   - Fix the random seed to a set value
--   - Reset the camera smoothing factor
--
function CinematicModeExBJ(cineMode, forForce, interfaceFadeTime)
	-- If the game hasn't started yet, perform interface fades immediately
	if not bj_gameStarted then
		interfaceFadeTime = 0
	end

	if cineMode then
		-- Save the UI state so that we can restore it later.
		if not bj_cineModeAlreadyIn then
			bj_cineModeAlreadyIn = true
			bj_cineModePriorSpeed = GetGameSpeed()
			bj_cineModePriorFogSetting = IsFogEnabled()
			bj_cineModePriorMaskSetting = IsFogMaskEnabled()
			bj_cineModePriorDawnDusk = IsDawnDuskEnabled()
			bj_cineModeSavedSeed = GetRandomInt(0, 1000000)
		end

		-- Perform local changes
		if IsPlayerInForce(GetLocalPlayer(), forForce) then
			-- Use only local code (no net traffic) within this block to avoid desyncs.
			ClearTextMessages()
			ShowInterface(false, interfaceFadeTime)
			EnableUserControl(false)
			EnableOcclusion(false)
			SetCineModeVolumeGroupsBJ()
		end

		-- Perform global changes
		SetGameSpeed(bj_CINEMODE_GAMESPEED)
		SetMapFlag(MAP_LOCK_SPEED, true)
		FogMaskEnable(false)
		FogEnable(false)
		EnableWorldFogBoundary(false)
		EnableDawnDusk(false)

		-- Use a fixed random seed, so that cinematics play consistently.
		SetRandomSeed(0)
	else
		bj_cineModeAlreadyIn = false

		-- Perform local changes
		if IsPlayerInForce(GetLocalPlayer(), forForce) then
			-- Use only local code (no net traffic) within this block to avoid desyncs.
			ShowInterface(true, interfaceFadeTime)
			EnableUserControl(true)
			EnableOcclusion(true)
			VolumeGroupReset()
			EndThematicMusic()
			CameraResetSmoothingFactorBJ()
		end

		-- Perform global changes
		SetMapFlag(MAP_LOCK_SPEED, false)
		SetGameSpeed(bj_cineModePriorSpeed)
		FogMaskEnable(bj_cineModePriorMaskSetting)
		FogEnable(bj_cineModePriorFogSetting)
		EnableWorldFogBoundary(true)
		EnableDawnDusk(bj_cineModePriorDawnDusk)
		SetRandomSeed(bj_cineModeSavedSeed)
	end
end

--===========================================================================
function CinematicModeBJ(cineMode, forForce)
	CinematicModeExBJ(cineMode, forForce, bj_CINEMODE_INTERFACEFADE)
end



--***************************************************************************
--*
--*  Cinematic Filter Utility Functions
--*
--***************************************************************************

--===========================================================================
function DisplayCineFilterBJ(flag)
	DisplayCineFilter(flag)
end

--===========================================================================
function CinematicFadeCommonBJ(red, green, blue, duration, tex, startTrans, endTrans)
	if duration == 0 then
		-- If the fade is instant, use the same starting and ending values,
		-- so that we effectively do a set rather than a fade.
		startTrans = endTrans
	end
	EnableUserUI(false)
	SetCineFilterTexture(tex)
	SetCineFilterBlendMode(BLEND_MODE_BLEND)
	SetCineFilterTexMapFlags(TEXMAP_FLAG_NONE)
	SetCineFilterStartUV(0, 0, 1, 1)
	SetCineFilterEndUV(0, 0, 1, 1)
	SetCineFilterStartColor(PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100 - startTrans))
	SetCineFilterEndColor(PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100 - endTrans))
	SetCineFilterDuration(duration)
	DisplayCineFilter(true)
end

--===========================================================================
function FinishCinematicFadeBJ()
	DestroyTimer(bj_cineFadeFinishTimer)
	bj_cineFadeFinishTimer = nil
	DisplayCineFilter(false)
	EnableUserUI(true)
end

--===========================================================================
function FinishCinematicFadeAfterBJ(duration)
	-- Create a timer to end the cinematic fade.
	bj_cineFadeFinishTimer = CreateTimer()
	TimerStart(bj_cineFadeFinishTimer, duration, false, FinishCinematicFadeBJ)
end

--===========================================================================
function ContinueCinematicFadeBJ()
	DestroyTimer(bj_cineFadeContinueTimer)
	bj_cineFadeContinueTimer = nil
	CinematicFadeCommonBJ(bj_cineFadeContinueRed, bj_cineFadeContinueGreen, bj_cineFadeContinueBlue, bj_cineFadeContinueDuration, bj_cineFadeContinueTex, bj_cineFadeContinueTrans, 100)
end

--===========================================================================
function ContinueCinematicFadeAfterBJ(duration, red, green, blue, trans, tex)
	bj_cineFadeContinueRed = red
	bj_cineFadeContinueGreen = green
	bj_cineFadeContinueBlue = blue
	bj_cineFadeContinueTrans = trans
	bj_cineFadeContinueDuration = duration
	bj_cineFadeContinueTex = tex

	-- Create a timer to continue the cinematic fade.
	bj_cineFadeContinueTimer = CreateTimer()
	TimerStart(bj_cineFadeContinueTimer, duration, false, ContinueCinematicFadeBJ)
end

--===========================================================================
function AbortCinematicFadeBJ()
	if bj_cineFadeContinueTimer ~= nil then
		DestroyTimer(bj_cineFadeContinueTimer)
	end

	if bj_cineFadeFinishTimer ~= nil then
		DestroyTimer(bj_cineFadeFinishTimer)
	end
end

--===========================================================================
function CinematicFadeBJ(fadetype, duration, tex, red, green, blue, trans)
	if fadetype == bj_CINEFADETYPE_FADEOUT then
		-- Fade out to the requested color.
		AbortCinematicFadeBJ()
		CinematicFadeCommonBJ(red, green, blue, duration, tex, 100, trans)
	elseif fadetype == bj_CINEFADETYPE_FADEIN then
		-- Fade in from the requested color.
		AbortCinematicFadeBJ()
		CinematicFadeCommonBJ(red, green, blue, duration, tex, trans, 100)
		FinishCinematicFadeAfterBJ(duration)
	elseif fadetype == bj_CINEFADETYPE_FADEOUTIN then
		-- Fade out to the requested color, and then fade back in from it.
		if duration > 0 then
			AbortCinematicFadeBJ()
			CinematicFadeCommonBJ(red, green, blue, duration * 0.5, tex, 100, trans)
			ContinueCinematicFadeAfterBJ(duration * 0.5, red, green, blue, trans, tex)
			FinishCinematicFadeAfterBJ(duration)
		end
	else
	-- Unrecognized fadetype - ignore the request.
	end
end

--===========================================================================
function CinematicFilterGenericBJ(duration, bmode, tex, red0, green0, blue0, trans0, red1, green1, blue1, trans1)
	AbortCinematicFadeBJ()
	SetCineFilterTexture(tex)
	SetCineFilterBlendMode(bmode)
	SetCineFilterTexMapFlags(TEXMAP_FLAG_NONE)
	SetCineFilterStartUV(0, 0, 1, 1)
	SetCineFilterEndUV(0, 0, 1, 1)
	SetCineFilterStartColor(PercentTo255(red0), PercentTo255(green0), PercentTo255(blue0), PercentTo255(100 - trans0))
	SetCineFilterEndColor(PercentTo255(red1), PercentTo255(green1), PercentTo255(blue1), PercentTo255(100 - trans1))
	SetCineFilterDuration(duration)
	DisplayCineFilter(true)
end



--***************************************************************************
--*
--*  Rescuable Unit Utility Functions
--*
--***************************************************************************

--===========================================================================
-- Rescues a unit for a player.  This performs the default rescue behavior,
-- including a rescue sound, flashing selection circle, ownership change,
-- and optionally a unit color change.
--
function RescueUnitBJ(whichUnit, rescuer, changeColor)
	if IsUnitDeadBJ(whichUnit) or GetOwningPlayer(whichUnit) == rescuer then
		return
	end

	StartSound(bj_rescueSound)
	SetUnitOwner(whichUnit, rescuer, changeColor)
	UnitAddIndicator(whichUnit, 0, 255, 0, 255)
	PingMinimapForPlayer(rescuer, GetUnitX(whichUnit), GetUnitY(whichUnit), bj_RESCUE_PING_TIME)
end

--===========================================================================
function TriggerActionUnitRescuedBJ()
	local theUnit = GetTriggerUnit()

	if IsUnitType(theUnit, UNIT_TYPE_STRUCTURE) then
		RescueUnitBJ(theUnit, GetOwningPlayer(GetRescuer()), bj_rescueChangeColorBldg)
	else
		RescueUnitBJ(theUnit, GetOwningPlayer(GetRescuer()), bj_rescueChangeColorUnit)
	end
end

--===========================================================================
-- Attempt to init triggers for default rescue behavior.  For performance
-- reasons, this should only be attempted if a player is set to Rescuable,
-- or if a specific unit is thus flagged.
--
function TryInitRescuableTriggersBJ()
	local index

	if bj_rescueUnitBehavior == nil then
		bj_rescueUnitBehavior = CreateTrigger()
		index = 0
		for _ in _loop_() do
			TriggerRegisterPlayerUnitEvent(bj_rescueUnitBehavior, Player(index), EVENT_PLAYER_UNIT_RESCUED, nil)
			index = index + 1
			if index == bj_MAX_PLAYER_SLOTS then break end
		end
		TriggerAddAction(bj_rescueUnitBehavior, TriggerActionUnitRescuedBJ)
	end
end

--===========================================================================
-- Determines whether or not rescued units automatically change color upon
-- being rescued.
--
function SetRescueUnitColorChangeBJ(changeColor)
	bj_rescueChangeColorUnit = changeColor
end

--===========================================================================
-- Determines whether or not rescued buildings automatically change color
-- upon being rescued.
--
function SetRescueBuildingColorChangeBJ(changeColor)
	bj_rescueChangeColorBldg = changeColor
end

--===========================================================================
function MakeUnitRescuableToForceBJEnum()
	TryInitRescuableTriggersBJ()
	SetUnitRescuable(bj_makeUnitRescuableUnit, GetEnumPlayer(), bj_makeUnitRescuableFlag)
end

--===========================================================================
function MakeUnitRescuableToForceBJ(whichUnit, isRescuable, whichForce)
	-- Flag the unit as rescuable/unrescuable for the appropriate players.
	bj_makeUnitRescuableUnit = whichUnit
	bj_makeUnitRescuableFlag = isRescuable
	ForForce(whichForce, MakeUnitRescuableToForceBJEnum)
end

--===========================================================================
function InitRescuableBehaviorBJ()
	local index

	index = 0
	for _ in _loop_() do
		-- If at least one player slot is "Rescuable"-controlled, init the
		-- rescue behavior triggers.
		if GetPlayerController(Player(index)) == MAP_CONTROL_RESCUABLE then
			TryInitRescuableTriggersBJ()
			return
		end
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end



--***************************************************************************
--*
--*  Research and Upgrade Utility Functions
--*
--***************************************************************************

--===========================================================================
function SetPlayerTechResearchedSwap(techid, levels, whichPlayer)
	SetPlayerTechResearched(whichPlayer, techid, levels)
end

--===========================================================================
function SetPlayerTechMaxAllowedSwap(techid, maximum, whichPlayer)
	SetPlayerTechMaxAllowed(whichPlayer, techid, maximum)
end

--===========================================================================
function SetPlayerMaxHeroesAllowed(maximum, whichPlayer)
	SetPlayerTechMaxAllowed(whichPlayer, 1212502607, maximum)
end

--===========================================================================
function GetPlayerTechCountSimple(techid, whichPlayer)
	return GetPlayerTechCount(whichPlayer, techid, true)
end

--===========================================================================
function GetPlayerTechMaxAllowedSwap(techid, whichPlayer)
	return GetPlayerTechMaxAllowed(whichPlayer, techid)
end

--===========================================================================
function SetPlayerAbilityAvailableBJ(avail, abilid, whichPlayer)
	SetPlayerAbilityAvailable(whichPlayer, abilid, avail)
end



--***************************************************************************
--*
--*  Campaign Utility Functions
--*
--***************************************************************************

function SetCampaignMenuRaceBJ(campaignNumber)
	if campaignNumber == bj_CAMPAIGN_INDEX_T then
		SetCampaignMenuRace(RACE_OTHER)
	elseif campaignNumber == bj_CAMPAIGN_INDEX_H then
		SetCampaignMenuRace(RACE_HUMAN)
	elseif campaignNumber == bj_CAMPAIGN_INDEX_U then
		SetCampaignMenuRace(RACE_UNDEAD)
	elseif campaignNumber == bj_CAMPAIGN_INDEX_O then
		SetCampaignMenuRace(RACE_ORC)
	elseif campaignNumber == bj_CAMPAIGN_INDEX_N then
		SetCampaignMenuRace(RACE_NIGHTELF)
	elseif campaignNumber == bj_CAMPAIGN_INDEX_XN then
		SetCampaignMenuRaceEx(bj_CAMPAIGN_OFFSET_XN)
	elseif campaignNumber == bj_CAMPAIGN_INDEX_XH then
		SetCampaignMenuRaceEx(bj_CAMPAIGN_OFFSET_XH)
	elseif campaignNumber == bj_CAMPAIGN_INDEX_XU then
		SetCampaignMenuRaceEx(bj_CAMPAIGN_OFFSET_XU)
	elseif campaignNumber == bj_CAMPAIGN_INDEX_XO then
		SetCampaignMenuRaceEx(bj_CAMPAIGN_OFFSET_XO)
	else
	-- Unrecognized campaign - ignore the request
	end
end

--===========================================================================
-- Converts a single campaign mission designation into campaign and mission
-- numbers.  The 1000's digit is considered the campaign index, and the 1's
-- digit is considered the mission index within that campaign.  This is done
-- so that the trigger for this can use a single drop-down to list all of
-- the campaign missions.
--
function SetMissionAvailableBJ(available, missionIndex)
	local campaignNumber = missionIndex // 1000
	local missionNumber = missionIndex - campaignNumber * 1000

	SetMissionAvailable(campaignNumber, missionNumber, available)
end

--===========================================================================
function SetCampaignAvailableBJ(available, campaignNumber)
	local campaignOffset

	if campaignNumber == bj_CAMPAIGN_INDEX_H then
		SetTutorialCleared(true)
	end

	if campaignNumber == bj_CAMPAIGN_INDEX_XN then
		campaignOffset = bj_CAMPAIGN_OFFSET_XN
	elseif campaignNumber == bj_CAMPAIGN_INDEX_XH then
		campaignOffset = bj_CAMPAIGN_OFFSET_XH
	elseif campaignNumber == bj_CAMPAIGN_INDEX_XU then
		campaignOffset = bj_CAMPAIGN_OFFSET_XU
	elseif campaignNumber == bj_CAMPAIGN_INDEX_XO then
		campaignOffset = bj_CAMPAIGN_OFFSET_XO
	else
		campaignOffset = campaignNumber
	end

	SetCampaignAvailable(campaignOffset, available)
	SetCampaignMenuRaceBJ(campaignNumber)
	ForceCampaignSelectScreen()
end

--===========================================================================
function SetCinematicAvailableBJ(available, cinematicIndex)
	if cinematicIndex == bj_CINEMATICINDEX_TOP then
		SetOpCinematicAvailable(bj_CAMPAIGN_INDEX_T, available)
		PlayCinematic("TutorialOp")
	elseif cinematicIndex == bj_CINEMATICINDEX_HOP then
		SetOpCinematicAvailable(bj_CAMPAIGN_INDEX_H, available)
		PlayCinematic("HumanOp")
	elseif cinematicIndex == bj_CINEMATICINDEX_HED then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_H, available)
		PlayCinematic("HumanEd")
	elseif cinematicIndex == bj_CINEMATICINDEX_OOP then
		SetOpCinematicAvailable(bj_CAMPAIGN_INDEX_O, available)
		PlayCinematic("OrcOp")
	elseif cinematicIndex == bj_CINEMATICINDEX_OED then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_O, available)
		PlayCinematic("OrcEd")
	elseif cinematicIndex == bj_CINEMATICINDEX_UOP then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_U, available)
		PlayCinematic("UndeadOp")
	elseif cinematicIndex == bj_CINEMATICINDEX_UED then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_U, available)
		PlayCinematic("UndeadEd")
	elseif cinematicIndex == bj_CINEMATICINDEX_NOP then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_N, available)
		PlayCinematic("NightElfOp")
	elseif cinematicIndex == bj_CINEMATICINDEX_NED then
		SetEdCinematicAvailable(bj_CAMPAIGN_INDEX_N, available)
		PlayCinematic("NightElfEd")
	elseif cinematicIndex == bj_CINEMATICINDEX_XOP then
		SetOpCinematicAvailable(bj_CAMPAIGN_OFFSET_XN, available)
		PlayCinematic("IntroX")
	elseif cinematicIndex == bj_CINEMATICINDEX_XED then
		SetEdCinematicAvailable(bj_CAMPAIGN_OFFSET_XU, available)
		PlayCinematic("OutroX")
	else
	-- Unrecognized cinematic - ignore the request.
	end
end

--===========================================================================
function InitGameCacheBJ(campaignFile)
	bj_lastCreatedGameCache = InitGameCache(campaignFile)
	return bj_lastCreatedGameCache
end

--===========================================================================
function SaveGameCacheBJ(cache)
	return SaveGameCache(cache)
end

--===========================================================================
function GetLastCreatedGameCacheBJ()
	return bj_lastCreatedGameCache
end

--===========================================================================
function InitHashtableBJ()
	bj_lastCreatedHashtable = InitHashtable()
	return bj_lastCreatedHashtable
end

--===========================================================================
function GetLastCreatedHashtableBJ()
	return bj_lastCreatedHashtable
end

--===========================================================================
function StoreRealBJ(value, key, missionKey, cache)
	StoreReal(cache, missionKey, key, value)
end

--===========================================================================
function StoreIntegerBJ(value, key, missionKey, cache)
	StoreInteger(cache, missionKey, key, value)
end

--===========================================================================
function StoreBooleanBJ(value, key, missionKey, cache)
	StoreBoolean(cache, missionKey, key, value)
end

--===========================================================================
function StoreStringBJ(value, key, missionKey, cache)
	return StoreString(cache, missionKey, key, value)
end

--===========================================================================
function StoreUnitBJ(whichUnit, key, missionKey, cache)
	return StoreUnit(cache, missionKey, key, whichUnit)
end

--===========================================================================
function SaveRealBJ(value, key, missionKey, table)
	SaveReal(table, missionKey, key, value)
end

--===========================================================================
function SaveIntegerBJ(value, key, missionKey, table)
	SaveInteger(table, missionKey, key, value)
end

--===========================================================================
function SaveBooleanBJ(value, key, missionKey, table)
	SaveBoolean(table, missionKey, key, value)
end

--===========================================================================
function SaveStringBJ(value, key, missionKey, table)
	return SaveStr(table, missionKey, key, value)
end

--===========================================================================
function SavePlayerHandleBJ(whichPlayer, key, missionKey, table)
	return SavePlayerHandle(table, missionKey, key, whichPlayer)
end

--===========================================================================
function SaveWidgetHandleBJ(whichWidget, key, missionKey, table)
	return SaveWidgetHandle(table, missionKey, key, whichWidget)
end

--===========================================================================
function SaveDestructableHandleBJ(whichDestructable, key, missionKey, table)
	return SaveDestructableHandle(table, missionKey, key, whichDestructable)
end

--===========================================================================
function SaveItemHandleBJ(whichItem, key, missionKey, table)
	return SaveItemHandle(table, missionKey, key, whichItem)
end

--===========================================================================
function SaveUnitHandleBJ(whichUnit, key, missionKey, table)
	return SaveUnitHandle(table, missionKey, key, whichUnit)
end

--===========================================================================
function SaveAbilityHandleBJ(whichAbility, key, missionKey, table)
	return SaveAbilityHandle(table, missionKey, key, whichAbility)
end

--===========================================================================
function SaveTimerHandleBJ(whichTimer, key, missionKey, table)
	return SaveTimerHandle(table, missionKey, key, whichTimer)
end

--===========================================================================
function SaveTriggerHandleBJ(whichTrigger, key, missionKey, table)
	return SaveTriggerHandle(table, missionKey, key, whichTrigger)
end

--===========================================================================
function SaveTriggerConditionHandleBJ(whichTriggercondition, key, missionKey, table)
	return SaveTriggerConditionHandle(table, missionKey, key, whichTriggercondition)
end

--===========================================================================
function SaveTriggerActionHandleBJ(whichTriggeraction, key, missionKey, table)
	return SaveTriggerActionHandle(table, missionKey, key, whichTriggeraction)
end

--===========================================================================
function SaveTriggerEventHandleBJ(whichEvent, key, missionKey, table)
	return SaveTriggerEventHandle(table, missionKey, key, whichEvent)
end

--===========================================================================
function SaveForceHandleBJ(whichForce, key, missionKey, table)
	return SaveForceHandle(table, missionKey, key, whichForce)
end

--===========================================================================
function SaveGroupHandleBJ(whichGroup, key, missionKey, table)
	return SaveGroupHandle(table, missionKey, key, whichGroup)
end

--===========================================================================
function SaveLocationHandleBJ(whichLocation, key, missionKey, table)
	return SaveLocationHandle(table, missionKey, key, whichLocation)
end

--===========================================================================
function SaveRectHandleBJ(whichRect, key, missionKey, table)
	return SaveRectHandle(table, missionKey, key, whichRect)
end

--===========================================================================
function SaveBooleanExprHandleBJ(whichBoolexpr, key, missionKey, table)
	return SaveBooleanExprHandle(table, missionKey, key, whichBoolexpr)
end

--===========================================================================
function SaveSoundHandleBJ(whichSound, key, missionKey, table)
	return SaveSoundHandle(table, missionKey, key, whichSound)
end

--===========================================================================
function SaveEffectHandleBJ(whichEffect, key, missionKey, table)
	return SaveEffectHandle(table, missionKey, key, whichEffect)
end

--===========================================================================
function SaveUnitPoolHandleBJ(whichUnitpool, key, missionKey, table)
	return SaveUnitPoolHandle(table, missionKey, key, whichUnitpool)
end

--===========================================================================
function SaveItemPoolHandleBJ(whichItempool, key, missionKey, table)
	return SaveItemPoolHandle(table, missionKey, key, whichItempool)
end

--===========================================================================
function SaveQuestHandleBJ(whichQuest, key, missionKey, table)
	return SaveQuestHandle(table, missionKey, key, whichQuest)
end

--===========================================================================
function SaveQuestItemHandleBJ(whichQuestitem, key, missionKey, table)
	return SaveQuestItemHandle(table, missionKey, key, whichQuestitem)
end

--===========================================================================
function SaveDefeatConditionHandleBJ(whichDefeatcondition, key, missionKey, table)
	return SaveDefeatConditionHandle(table, missionKey, key, whichDefeatcondition)
end

--===========================================================================
function SaveTimerDialogHandleBJ(whichTimerdialog, key, missionKey, table)
	return SaveTimerDialogHandle(table, missionKey, key, whichTimerdialog)
end

--===========================================================================
function SaveLeaderboardHandleBJ(whichLeaderboard, key, missionKey, table)
	return SaveLeaderboardHandle(table, missionKey, key, whichLeaderboard)
end

--===========================================================================
function SaveMultiboardHandleBJ(whichMultiboard, key, missionKey, table)
	return SaveMultiboardHandle(table, missionKey, key, whichMultiboard)
end

--===========================================================================
function SaveMultiboardItemHandleBJ(whichMultiboarditem, key, missionKey, table)
	return SaveMultiboardItemHandle(table, missionKey, key, whichMultiboarditem)
end

--===========================================================================
function SaveTrackableHandleBJ(whichTrackable, key, missionKey, table)
	return SaveTrackableHandle(table, missionKey, key, whichTrackable)
end

--===========================================================================
function SaveDialogHandleBJ(whichDialog, key, missionKey, table)
	return SaveDialogHandle(table, missionKey, key, whichDialog)
end

--===========================================================================
function SaveButtonHandleBJ(whichButton, key, missionKey, table)
	return SaveButtonHandle(table, missionKey, key, whichButton)
end

--===========================================================================
function SaveTextTagHandleBJ(whichTexttag, key, missionKey, table)
	return SaveTextTagHandle(table, missionKey, key, whichTexttag)
end

--===========================================================================
function SaveLightningHandleBJ(whichLightning, key, missionKey, table)
	return SaveLightningHandle(table, missionKey, key, whichLightning)
end

--===========================================================================
function SaveImageHandleBJ(whichImage, key, missionKey, table)
	return SaveImageHandle(table, missionKey, key, whichImage)
end

--===========================================================================
function SaveUbersplatHandleBJ(whichUbersplat, key, missionKey, table)
	return SaveUbersplatHandle(table, missionKey, key, whichUbersplat)
end

--===========================================================================
function SaveRegionHandleBJ(whichRegion, key, missionKey, table)
	return SaveRegionHandle(table, missionKey, key, whichRegion)
end

--===========================================================================
function SaveFogStateHandleBJ(whichFogState, key, missionKey, table)
	return SaveFogStateHandle(table, missionKey, key, whichFogState)
end

--===========================================================================
function SaveFogModifierHandleBJ(whichFogModifier, key, missionKey, table)
	return SaveFogModifierHandle(table, missionKey, key, whichFogModifier)
end

--===========================================================================
function SaveAgentHandleBJ(whichAgent, key, missionKey, table)
	return SaveAgentHandle(table, missionKey, key, whichAgent)
end

--===========================================================================
function SaveHashtableHandleBJ(whichHashtable, key, missionKey, table)
	return SaveHashtableHandle(table, missionKey, key, whichHashtable)
end

--===========================================================================
function GetStoredRealBJ(key, missionKey, cache)
	--call SyncStoredReal(cache, missionKey, key)
	return GetStoredReal(cache, missionKey, key)
end

--===========================================================================
function GetStoredIntegerBJ(key, missionKey, cache)
	--call SyncStoredInteger(cache, missionKey, key)
	return GetStoredInteger(cache, missionKey, key)
end

--===========================================================================
function GetStoredBooleanBJ(key, missionKey, cache)
	--call SyncStoredBoolean(cache, missionKey, key)
	return GetStoredBoolean(cache, missionKey, key)
end

--===========================================================================
function GetStoredStringBJ(key, missionKey, cache)
	local s

	--call SyncStoredString(cache, missionKey, key)
	s = GetStoredString(cache, missionKey, key)
	if s == nil then
		return ""
	else
		return s
	end
end

--===========================================================================
function LoadRealBJ(key, missionKey, table)
	--call SyncStoredReal(table, missionKey, key)
	return LoadReal(table, missionKey, key)
end

--===========================================================================
function LoadIntegerBJ(key, missionKey, table)
	--call SyncStoredInteger(table, missionKey, key)
	return LoadInteger(table, missionKey, key)
end

--===========================================================================
function LoadBooleanBJ(key, missionKey, table)
	--call SyncStoredBoolean(table, missionKey, key)
	return LoadBoolean(table, missionKey, key)
end

--===========================================================================
function LoadStringBJ(key, missionKey, table)
	local s

	--call SyncStoredString(table, missionKey, key)
	s = LoadStr(table, missionKey, key)
	if s == nil then
		return ""
	else
		return s
	end
end

--===========================================================================
function LoadPlayerHandleBJ(key, missionKey, table)
	return LoadPlayerHandle(table, missionKey, key)
end

--===========================================================================
function LoadWidgetHandleBJ(key, missionKey, table)
	return LoadWidgetHandle(table, missionKey, key)
end

--===========================================================================
function LoadDestructableHandleBJ(key, missionKey, table)
	return LoadDestructableHandle(table, missionKey, key)
end

--===========================================================================
function LoadItemHandleBJ(key, missionKey, table)
	return LoadItemHandle(table, missionKey, key)
end

--===========================================================================
function LoadUnitHandleBJ(key, missionKey, table)
	return LoadUnitHandle(table, missionKey, key)
end

--===========================================================================
function LoadAbilityHandleBJ(key, missionKey, table)
	return LoadAbilityHandle(table, missionKey, key)
end

--===========================================================================
function LoadTimerHandleBJ(key, missionKey, table)
	return LoadTimerHandle(table, missionKey, key)
end

--===========================================================================
function LoadTriggerHandleBJ(key, missionKey, table)
	return LoadTriggerHandle(table, missionKey, key)
end

--===========================================================================
function LoadTriggerConditionHandleBJ(key, missionKey, table)
	return LoadTriggerConditionHandle(table, missionKey, key)
end

--===========================================================================
function LoadTriggerActionHandleBJ(key, missionKey, table)
	return LoadTriggerActionHandle(table, missionKey, key)
end

--===========================================================================
function LoadTriggerEventHandleBJ(key, missionKey, table)
	return LoadTriggerEventHandle(table, missionKey, key)
end

--===========================================================================
function LoadForceHandleBJ(key, missionKey, table)
	return LoadForceHandle(table, missionKey, key)
end

--===========================================================================
function LoadGroupHandleBJ(key, missionKey, table)
	return LoadGroupHandle(table, missionKey, key)
end

--===========================================================================
function LoadLocationHandleBJ(key, missionKey, table)
	return LoadLocationHandle(table, missionKey, key)
end

--===========================================================================
function LoadRectHandleBJ(key, missionKey, table)
	return LoadRectHandle(table, missionKey, key)
end

--===========================================================================
function LoadBooleanExprHandleBJ(key, missionKey, table)
	return LoadBooleanExprHandle(table, missionKey, key)
end

--===========================================================================
function LoadSoundHandleBJ(key, missionKey, table)
	return LoadSoundHandle(table, missionKey, key)
end

--===========================================================================
function LoadEffectHandleBJ(key, missionKey, table)
	return LoadEffectHandle(table, missionKey, key)
end

--===========================================================================
function LoadUnitPoolHandleBJ(key, missionKey, table)
	return LoadUnitPoolHandle(table, missionKey, key)
end

--===========================================================================
function LoadItemPoolHandleBJ(key, missionKey, table)
	return LoadItemPoolHandle(table, missionKey, key)
end

--===========================================================================
function LoadQuestHandleBJ(key, missionKey, table)
	return LoadQuestHandle(table, missionKey, key)
end

--===========================================================================
function LoadQuestItemHandleBJ(key, missionKey, table)
	return LoadQuestItemHandle(table, missionKey, key)
end

--===========================================================================
function LoadDefeatConditionHandleBJ(key, missionKey, table)
	return LoadDefeatConditionHandle(table, missionKey, key)
end

--===========================================================================
function LoadTimerDialogHandleBJ(key, missionKey, table)
	return LoadTimerDialogHandle(table, missionKey, key)
end

--===========================================================================
function LoadLeaderboardHandleBJ(key, missionKey, table)
	return LoadLeaderboardHandle(table, missionKey, key)
end

--===========================================================================
function LoadMultiboardHandleBJ(key, missionKey, table)
	return LoadMultiboardHandle(table, missionKey, key)
end

--===========================================================================
function LoadMultiboardItemHandleBJ(key, missionKey, table)
	return LoadMultiboardItemHandle(table, missionKey, key)
end

--===========================================================================
function LoadTrackableHandleBJ(key, missionKey, table)
	return LoadTrackableHandle(table, missionKey, key)
end

--===========================================================================
function LoadDialogHandleBJ(key, missionKey, table)
	return LoadDialogHandle(table, missionKey, key)
end

--===========================================================================
function LoadButtonHandleBJ(key, missionKey, table)
	return LoadButtonHandle(table, missionKey, key)
end

--===========================================================================
function LoadTextTagHandleBJ(key, missionKey, table)
	return LoadTextTagHandle(table, missionKey, key)
end

--===========================================================================
function LoadLightningHandleBJ(key, missionKey, table)
	return LoadLightningHandle(table, missionKey, key)
end

--===========================================================================
function LoadImageHandleBJ(key, missionKey, table)
	return LoadImageHandle(table, missionKey, key)
end

--===========================================================================
function LoadUbersplatHandleBJ(key, missionKey, table)
	return LoadUbersplatHandle(table, missionKey, key)
end

--===========================================================================
function LoadRegionHandleBJ(key, missionKey, table)
	return LoadRegionHandle(table, missionKey, key)
end

--===========================================================================
function LoadFogStateHandleBJ(key, missionKey, table)
	return LoadFogStateHandle(table, missionKey, key)
end

--===========================================================================
function LoadFogModifierHandleBJ(key, missionKey, table)
	return LoadFogModifierHandle(table, missionKey, key)
end

--===========================================================================
function LoadHashtableHandleBJ(key, missionKey, table)
	return LoadHashtableHandle(table, missionKey, key)
end

--===========================================================================
function RestoreUnitLocFacingAngleBJ(key, missionKey, cache, forWhichPlayer, loc, facing)
	--call SyncStoredUnit(cache, missionKey, key)
	bj_lastLoadedUnit = RestoreUnit(cache, missionKey, key, forWhichPlayer, GetLocationX(loc), GetLocationY(loc), facing)
	return bj_lastLoadedUnit
end

--===========================================================================
function RestoreUnitLocFacingPointBJ(key, missionKey, cache, forWhichPlayer, loc, lookAt)
	--call SyncStoredUnit(cache, missionKey, key)
	return RestoreUnitLocFacingAngleBJ(key, missionKey, cache, forWhichPlayer, loc, AngleBetweenPoints(loc, lookAt))
end

--===========================================================================
function GetLastRestoredUnitBJ()
	return bj_lastLoadedUnit
end

--===========================================================================
function FlushGameCacheBJ(cache)
	FlushGameCache(cache)
end

--===========================================================================
function FlushStoredMissionBJ(missionKey, cache)
	FlushStoredMission(cache, missionKey)
end

--===========================================================================
function FlushParentHashtableBJ(table)
	FlushParentHashtable(table)
end

--===========================================================================
function FlushChildHashtableBJ(missionKey, table)
	FlushChildHashtable(table, missionKey)
end

--===========================================================================
function HaveStoredValue(key, valueType, missionKey, cache)
	if valueType == bj_GAMECACHE_BOOLEAN then
		return HaveStoredBoolean(cache, missionKey, key)
	elseif valueType == bj_GAMECACHE_INTEGER then
		return HaveStoredInteger(cache, missionKey, key)
	elseif valueType == bj_GAMECACHE_REAL then
		return HaveStoredReal(cache, missionKey, key)
	elseif valueType == bj_GAMECACHE_UNIT then
		return HaveStoredUnit(cache, missionKey, key)
	elseif valueType == bj_GAMECACHE_STRING then
		return HaveStoredString(cache, missionKey, key)
	else
		-- Unrecognized value type - ignore the request.
		return false
	end
end

--===========================================================================
function HaveSavedValue(key, valueType, missionKey, table)
	if valueType == bj_HASHTABLE_BOOLEAN then
		return HaveSavedBoolean(table, missionKey, key)
	elseif valueType == bj_HASHTABLE_INTEGER then
		return HaveSavedInteger(table, missionKey, key)
	elseif valueType == bj_HASHTABLE_REAL then
		return HaveSavedReal(table, missionKey, key)
	elseif valueType == bj_HASHTABLE_STRING then
		return HaveSavedString(table, missionKey, key)
	elseif valueType == bj_HASHTABLE_HANDLE then
		return HaveSavedHandle(table, missionKey, key)
	else
		-- Unrecognized value type - ignore the request.
		return false
	end
end

--===========================================================================
function ShowCustomCampaignButton(show, whichButton)
	SetCustomCampaignButtonVisible(whichButton - 1, show)
end

--===========================================================================
function IsCustomCampaignButtonVisibile(whichButton)
	return GetCustomCampaignButtonVisible(whichButton - 1)
end

--===========================================================================
function LoadGameBJ(loadFileName, doScoreScreen)
	LoadGame(loadFileName, doScoreScreen)
end

--===========================================================================
function SaveAndChangeLevelBJ(saveFileName, newLevel, doScoreScreen)
	SaveGame(saveFileName)
	ChangeLevel(newLevel, doScoreScreen)
end

--===========================================================================
function SaveAndLoadGameBJ(saveFileName, loadFileName, doScoreScreen)
	SaveGame(saveFileName)
	LoadGame(loadFileName, doScoreScreen)
end

--===========================================================================
function RenameSaveDirectoryBJ(sourceDirName, destDirName)
	return RenameSaveDirectory(sourceDirName, destDirName)
end

--===========================================================================
function RemoveSaveDirectoryBJ(sourceDirName)
	return RemoveSaveDirectory(sourceDirName)
end

--===========================================================================
function CopySaveGameBJ(sourceSaveName, destSaveName)
	return CopySaveGame(sourceSaveName, destSaveName)
end



--***************************************************************************
--*
--*  Miscellaneous Utility Functions
--*
--***************************************************************************

--===========================================================================
function GetPlayerStartLocationX(whichPlayer)
	return GetStartLocationX(GetPlayerStartLocation(whichPlayer))
end

--===========================================================================
function GetPlayerStartLocationY(whichPlayer)
	return GetStartLocationY(GetPlayerStartLocation(whichPlayer))
end

--===========================================================================
function GetPlayerStartLocationLoc(whichPlayer)
	return GetStartLocationLoc(GetPlayerStartLocation(whichPlayer))
end

--===========================================================================
function GetRectCenter(whichRect)
	return Location(GetRectCenterX(whichRect), GetRectCenterY(whichRect))
end

--===========================================================================
function IsPlayerSlotState(whichPlayer, whichState)
	return GetPlayerSlotState(whichPlayer) == whichState
end

--===========================================================================
function GetFadeFromSeconds(seconds)
	if seconds ~= 0 then
		return 128 // R2I(seconds)
	end
	return 10000
end

--===========================================================================
function GetFadeFromSecondsAsReal(seconds)
	if seconds ~= 0 then
		return 128.0 / seconds
	end
	return 10000.0
end

--===========================================================================
function AdjustPlayerStateSimpleBJ(whichPlayer, whichPlayerState, delta)
	SetPlayerState(whichPlayer, whichPlayerState, GetPlayerState(whichPlayer, whichPlayerState) + delta)
end

--===========================================================================
function AdjustPlayerStateBJ(delta, whichPlayer, whichPlayerState)
	-- If the change was positive, apply the difference to the player's
	-- gathered resources property as well.
	if delta > 0 then
		if whichPlayerState == PLAYER_STATE_RESOURCE_GOLD then
			AdjustPlayerStateSimpleBJ(whichPlayer, PLAYER_STATE_GOLD_GATHERED, delta)
		elseif whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER then
			AdjustPlayerStateSimpleBJ(whichPlayer, PLAYER_STATE_LUMBER_GATHERED, delta)
		end
	end

	AdjustPlayerStateSimpleBJ(whichPlayer, whichPlayerState, delta)
end

--===========================================================================
function SetPlayerStateBJ(whichPlayer, whichPlayerState, value)
	local oldValue = GetPlayerState(whichPlayer, whichPlayerState)
	AdjustPlayerStateBJ(value - oldValue, whichPlayer, whichPlayerState)
end

--===========================================================================
function SetPlayerFlagBJ(whichPlayerFlag, flag, whichPlayer)
	SetPlayerState(whichPlayer, whichPlayerFlag, IntegerTertiaryOp(flag, 1, 0))
end

--===========================================================================
function SetPlayerTaxRateBJ(rate, whichResource, sourcePlayer, otherPlayer)
	SetPlayerTaxRate(sourcePlayer, otherPlayer, whichResource, rate)
end

--===========================================================================
function GetPlayerTaxRateBJ(whichResource, sourcePlayer, otherPlayer)
	return GetPlayerTaxRate(sourcePlayer, otherPlayer, whichResource)
end

--===========================================================================
function IsPlayerFlagSetBJ(whichPlayerFlag, whichPlayer)
	return GetPlayerState(whichPlayer, whichPlayerFlag) == 1
end

--===========================================================================
function AddResourceAmountBJ(delta, whichUnit)
	AddResourceAmount(whichUnit, delta)
end

--===========================================================================
function GetConvertedPlayerId(whichPlayer)
	return GetPlayerId(whichPlayer) + 1
end

--===========================================================================
function ConvertedPlayer(convertedPlayerId)
	return Player(convertedPlayerId - 1)
end

--===========================================================================
function GetRectWidthBJ(r)
	return GetRectMaxX(r) - GetRectMinX(r)
end

--===========================================================================
function GetRectHeightBJ(r)
	return GetRectMaxY(r) - GetRectMinY(r)
end

--===========================================================================
-- Replaces a gold mine with a blighted gold mine for the given player.
--
function BlightGoldMineForPlayerBJ(goldMine, whichPlayer)
	local mineX
	local mineY
	local mineGold
	local newMine

	-- Make sure we're replacing a Gold Mine and not some other type of unit.
	if GetUnitTypeId(goldMine) ~= 1852272492 then
		return nil
	end

	-- Save the Gold Mine's properties and remove it.
	mineX = GetUnitX(goldMine)
	mineY = GetUnitY(goldMine)
	mineGold = GetResourceAmount(goldMine)
	RemoveUnit(goldMine)

	-- Create a Haunted Gold Mine to replace the Gold Mine.
	newMine = CreateBlightedGoldmine(whichPlayer, mineX, mineY, bj_UNIT_FACING)
	SetResourceAmount(newMine, mineGold)
	return newMine
end

--===========================================================================
function BlightGoldMineForPlayer(goldMine, whichPlayer)
	bj_lastHauntedGoldMine = BlightGoldMineForPlayerBJ(goldMine, whichPlayer)
	return bj_lastHauntedGoldMine
end

--===========================================================================
function GetLastHauntedGoldMine()
	return bj_lastHauntedGoldMine
end

--===========================================================================
function IsPointBlightedBJ(where)
	return IsPointBlighted(GetLocationX(where), GetLocationY(where))
end

--===========================================================================
function SetPlayerColorBJEnum()
	SetUnitColor(GetEnumUnit(), bj_setPlayerTargetColor)
end

--===========================================================================
function SetPlayerColorBJ(whichPlayer, color, changeExisting)
	local g

	SetPlayerColor(whichPlayer, color)
	if changeExisting then
		bj_setPlayerTargetColor = color
		g = CreateGroup()
		GroupEnumUnitsOfPlayer(g, whichPlayer, nil)
		ForGroup(g, SetPlayerColorBJEnum)
		DestroyGroup(g)
	end
end

--===========================================================================
function SetPlayerUnitAvailableBJ(unitId, allowed, whichPlayer)
	if allowed then
		SetPlayerTechMaxAllowed(whichPlayer, unitId, -1)
	else
		SetPlayerTechMaxAllowed(whichPlayer, unitId, 0)
	end
end

--===========================================================================
function LockGameSpeedBJ()
	SetMapFlag(MAP_LOCK_SPEED, true)
end

--===========================================================================
function UnlockGameSpeedBJ()
	SetMapFlag(MAP_LOCK_SPEED, false)
end

--===========================================================================
function IssueTargetOrderBJ(whichUnit, order, targetWidget)
	return IssueTargetOrder(whichUnit, order, targetWidget)
end

--===========================================================================
function IssuePointOrderLocBJ(whichUnit, order, whichLocation)
	return IssuePointOrderLoc(whichUnit, order, whichLocation)
end

--===========================================================================
-- Two distinct trigger actions can't share the same function name, so this
-- dummy function simply mimics the behavior of an existing call.
--
function IssueTargetDestructableOrder(whichUnit, order, targetWidget)
	return IssueTargetOrder(whichUnit, order, targetWidget)
end

function IssueTargetItemOrder(whichUnit, order, targetWidget)
	return IssueTargetOrder(whichUnit, order, targetWidget)
end

--===========================================================================
function IssueImmediateOrderBJ(whichUnit, order)
	return IssueImmediateOrder(whichUnit, order)
end

--===========================================================================
function GroupTargetOrderBJ(whichGroup, order, targetWidget)
	return GroupTargetOrder(whichGroup, order, targetWidget)
end

--===========================================================================
function GroupPointOrderLocBJ(whichGroup, order, whichLocation)
	return GroupPointOrderLoc(whichGroup, order, whichLocation)
end

--===========================================================================
function GroupImmediateOrderBJ(whichGroup, order)
	return GroupImmediateOrder(whichGroup, order)
end

--===========================================================================
-- Two distinct trigger actions can't share the same function name, so this
-- dummy function simply mimics the behavior of an existing call.
--
function GroupTargetDestructableOrder(whichGroup, order, targetWidget)
	return GroupTargetOrder(whichGroup, order, targetWidget)
end

function GroupTargetItemOrder(whichGroup, order, targetWidget)
	return GroupTargetOrder(whichGroup, order, targetWidget)
end

--===========================================================================
function GetDyingDestructable()
	return GetTriggerDestructable()
end

--===========================================================================
-- Rally point setting
--
function SetUnitRallyPoint(whichUnit, targPos)
	IssuePointOrderLocBJ(whichUnit, "setrally", targPos)
end

--===========================================================================
function SetUnitRallyUnit(whichUnit, targUnit)
	IssueTargetOrder(whichUnit, "setrally", targUnit)
end

--===========================================================================
function SetUnitRallyDestructable(whichUnit, targDest)
	IssueTargetOrder(whichUnit, "setrally", targDest)
end

--===========================================================================
-- Utility function for use by editor-generated item drop table triggers.
-- This function is added as an action to all destructable drop triggers,
-- so that a widget drop may be differentiated from a unit drop.
--
function SaveDyingWidget()
	bj_lastDyingWidget = GetTriggerWidget()
end

--===========================================================================
function SetBlightRectBJ(addBlight, whichPlayer, r)
	SetBlightRect(whichPlayer, r, addBlight)
end

--===========================================================================
function SetBlightRadiusLocBJ(addBlight, whichPlayer, loc, radius)
	SetBlightLoc(whichPlayer, loc, radius, addBlight)
end

--===========================================================================
function GetAbilityName(abilcode)
	return GetObjectName(abilcode)
end


--***************************************************************************
--*
--*  Melee Template Visibility Settings
--*
--***************************************************************************

--===========================================================================
function MeleeStartingVisibility()
	-- Start by setting the ToD.
	SetFloatGameState(GAME_STATE_TIME_OF_DAY, bj_MELEE_STARTING_TOD)

-- call FogMaskEnable(true)
-- call FogEnable(true)
end



--***************************************************************************
--*
--*  Melee Template Starting Resources
--*
--***************************************************************************

--===========================================================================
function MeleeStartingResources()
	local index
	local indexPlayer
	local v
	local startingGold
	local startingLumber

	v = VersionGet()
	if v == VERSION_REIGN_OF_CHAOS then
		startingGold = bj_MELEE_STARTING_GOLD_V0
		startingLumber = bj_MELEE_STARTING_LUMBER_V0
	else
		startingGold = bj_MELEE_STARTING_GOLD_V1
		startingLumber = bj_MELEE_STARTING_LUMBER_V1
	end

	-- Set each player's starting resources.
	index = 0
	for _ in _loop_() do
		indexPlayer = Player(index)
		if GetPlayerSlotState(indexPlayer) == PLAYER_SLOT_STATE_PLAYING then
			SetPlayerState(indexPlayer, PLAYER_STATE_RESOURCE_GOLD, startingGold)
			SetPlayerState(indexPlayer, PLAYER_STATE_RESOURCE_LUMBER, startingLumber)
		end

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end



--***************************************************************************
--*
--*  Melee Template Hero Limit
--*
--***************************************************************************

--===========================================================================
function ReducePlayerTechMaxAllowed(whichPlayer, techId, limit)
	local oldMax = GetPlayerTechMaxAllowed(whichPlayer, techId)

	-- A value of -1 is used to indicate no limit, so check for that as well.
	if oldMax < 0 or oldMax > limit then
		SetPlayerTechMaxAllowed(whichPlayer, techId, limit)
	end
end

--===========================================================================
function MeleeStartingHeroLimit()
	local index

	index = 0
	for _ in _loop_() do
		-- max heroes per player
		SetPlayerMaxHeroesAllowed(bj_MELEE_HERO_LIMIT, Player(index))

		-- each player is restricted to a limit per hero type as well
		ReducePlayerTechMaxAllowed(Player(index), 1214344551, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1215130471, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1215324524, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1214409837, bj_MELEE_HERO_TYPE_LIMIT)

		ReducePlayerTechMaxAllowed(Player(index), 1331850337, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1332109682, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1333027688, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1332963428, bj_MELEE_HERO_TYPE_LIMIT)

		ReducePlayerTechMaxAllowed(Player(index), 1164207469, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1164666213, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1164799855, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1165451634, bj_MELEE_HERO_TYPE_LIMIT)

		ReducePlayerTechMaxAllowed(Player(index), 1432642913, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1432646245, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1433168227, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1432580716, bj_MELEE_HERO_TYPE_LIMIT)

		ReducePlayerTechMaxAllowed(Player(index), 1315988077, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1315074670, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1315858291, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1315990632, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1315074932, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1315007587, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1316252014, bj_MELEE_HERO_TYPE_LIMIT)
		ReducePlayerTechMaxAllowed(Player(index), 1315334514, bj_MELEE_HERO_TYPE_LIMIT)

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end



--***************************************************************************
--*
--*  Melee Template Granted Hero Items
--*
--***************************************************************************

--===========================================================================
function MeleeTrainedUnitIsHeroBJFilter()
	return IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO)
end

--===========================================================================
-- The first N heroes trained or hired for each player start off with a
-- standard set of items.  This is currently:
--   - 1x Scroll of Town Portal
--
function MeleeGrantItemsToHero(whichUnit)
	local owner = GetPlayerId(GetOwningPlayer(whichUnit))

	-- If we haven't twinked N heroes for this player yet, twink away.
	if bj_meleeTwinkedHeroes[owner] < bj_MELEE_MAX_TWINKED_HEROES then
		UnitAddItemById(whichUnit, 1937012592)
		bj_meleeTwinkedHeroes[owner] = bj_meleeTwinkedHeroes[owner] + 1
	end
end

--===========================================================================
function MeleeGrantItemsToTrainedHero()
	MeleeGrantItemsToHero(GetTrainedUnit())
end

--===========================================================================
function MeleeGrantItemsToHiredHero()
	MeleeGrantItemsToHero(GetSoldUnit())
end

--===========================================================================
function MeleeGrantHeroItems()
	local index
	local trig

	-- Initialize the twinked hero counts.
	index = 0
	for _ in _loop_() do
		bj_meleeTwinkedHeroes[index] = 0

		index = index + 1
		if index == bj_MAX_PLAYER_SLOTS then break end
	end

	-- Register for an event whenever a hero is trained, so that we can give
	-- him/her their starting items.
	index = 0
	for _ in _loop_() do
		trig = CreateTrigger()
		TriggerRegisterPlayerUnitEvent(trig, Player(index), EVENT_PLAYER_UNIT_TRAIN_FINISH, filterMeleeTrainedUnitIsHeroBJ)
		TriggerAddAction(trig, MeleeGrantItemsToTrainedHero)

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end

	-- Register for an event whenever a neutral hero is hired, so that we
	-- can give him/her their starting items.
	trig = CreateTrigger()
	TriggerRegisterPlayerUnitEvent(trig, Player(PLAYER_NEUTRAL_PASSIVE), EVENT_PLAYER_UNIT_SELL, filterMeleeTrainedUnitIsHeroBJ)
	TriggerAddAction(trig, MeleeGrantItemsToHiredHero)

	-- Flag that we are giving starting items to heroes, so that the melee
	-- starting units code can create them as necessary.
	bj_meleeGrantHeroItems = true
end



--***************************************************************************
--*
--*  Melee Template Clear Start Locations
--*
--***************************************************************************

--===========================================================================
function MeleeClearExcessUnit()
	local theUnit = GetEnumUnit()
	local owner = GetPlayerId(GetOwningPlayer(theUnit))

	if owner == PLAYER_NEUTRAL_AGGRESSIVE then
		-- Remove any Neutral Hostile units from the area.
		RemoveUnit(GetEnumUnit())
	elseif owner == PLAYER_NEUTRAL_PASSIVE then
		-- Remove non-structure Neutral Passive units from the area.
		if not IsUnitType(theUnit, UNIT_TYPE_STRUCTURE) then
			RemoveUnit(GetEnumUnit())
		end
	end
end

--===========================================================================
function MeleeClearNearbyUnits(x, y, range)
	local nearbyUnits

	nearbyUnits = CreateGroup()
	GroupEnumUnitsInRange(nearbyUnits, x, y, range, nil)
	ForGroup(nearbyUnits, MeleeClearExcessUnit)
	DestroyGroup(nearbyUnits)
end

--===========================================================================
function MeleeClearExcessUnits()
	local index
	local locX
	local locY
	local indexPlayer

	index = 0
	for _ in _loop_() do
		indexPlayer = Player(index)

		-- If the player slot is being used, clear any nearby creeps.
		if GetPlayerSlotState(indexPlayer) == PLAYER_SLOT_STATE_PLAYING then
			locX = GetStartLocationX(GetPlayerStartLocation(indexPlayer))
			locY = GetStartLocationY(GetPlayerStartLocation(indexPlayer))

			MeleeClearNearbyUnits(locX, locY, bj_MELEE_CLEAR_UNITS_RADIUS)
		end

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end



--***************************************************************************
--*
--*  Melee Template Starting Units
--*
--***************************************************************************

--===========================================================================
function MeleeEnumFindNearestMine()
	local enumUnit = GetEnumUnit()
	local dist
	local unitLoc

	if GetUnitTypeId(enumUnit) == 1852272492 then
		unitLoc = GetUnitLoc(enumUnit)
		dist = DistanceBetweenPoints(unitLoc, bj_meleeNearestMineToLoc)
		RemoveLocation(unitLoc)

		-- If this is our first mine, or the closest thusfar, use it instead.
		if bj_meleeNearestMineDist < 0 or dist < bj_meleeNearestMineDist then
			bj_meleeNearestMine = enumUnit
			bj_meleeNearestMineDist = dist
		end
	end
end

--===========================================================================
function MeleeFindNearestMine(src, range)
	local nearbyMines

	bj_meleeNearestMine = nil
	bj_meleeNearestMineDist = -1
	bj_meleeNearestMineToLoc = src

	nearbyMines = CreateGroup()
	GroupEnumUnitsInRangeOfLoc(nearbyMines, src, range, nil)
	ForGroup(nearbyMines, MeleeEnumFindNearestMine)
	DestroyGroup(nearbyMines)

	return bj_meleeNearestMine
end

--===========================================================================
function MeleeRandomHeroLoc(p, id1, id2, id3, id4, loc)
	local hero = nil
	local roll
	local pick
	local v

	-- The selection of heroes is dependant on the game version.
	v = VersionGet()
	if v == VERSION_REIGN_OF_CHAOS then
		roll = GetRandomInt(1, 3)
	else
		roll = GetRandomInt(1, 4)
	end

	-- Translate the roll into a unitid.
	if roll == 1 then
		pick = id1
	elseif roll == 2 then
		pick = id2
	elseif roll == 3 then
		pick = id3
	elseif roll == 4 then
		pick = id4
	else
		-- Unrecognized id index - pick the first hero in the list.
		pick = id1
	end

	-- Create the hero.
	hero = CreateUnitAtLoc(p, pick, loc, bj_UNIT_FACING)
	if bj_meleeGrantHeroItems then
		MeleeGrantItemsToHero(hero)
	end
	return hero
end

--===========================================================================
-- Returns a location which is (distance) away from (src) in the direction of (targ).
--
function MeleeGetProjectedLoc(src, targ, distance, deltaAngle)
	local srcX = GetLocationX(src)
	local srcY = GetLocationY(src)
	local direction = Atan2(GetLocationY(targ) - srcY, GetLocationX(targ) - srcX) + deltaAngle
	return Location(srcX + distance * Cos(direction), srcY + distance * Sin(direction))
end

--===========================================================================
function MeleeGetNearestValueWithin(val, minVal, maxVal)
	if val < minVal then
		return minVal
	elseif val > maxVal then
		return maxVal
	else
		return val
	end
end

--===========================================================================
function MeleeGetLocWithinRect(src, r)
	local withinX = MeleeGetNearestValueWithin(GetLocationX(src), GetRectMinX(r), GetRectMaxX(r))
	local withinY = MeleeGetNearestValueWithin(GetLocationY(src), GetRectMinY(r), GetRectMaxY(r))
	return Location(withinX, withinY)
end

--===========================================================================
-- Starting Units for Human Players
--   - 1 Town Hall, placed at start location
--   - 5 Peasants, placed between start location and nearest gold mine
--
function MeleeStartingUnitsHuman(whichPlayer, startLoc, doHeroes, doCamera, doPreload)
	local useRandomHero = IsMapFlagSet(MAP_RANDOM_HERO)
	local unitSpacing = 64.0
	local nearestMine
	local nearMineLoc
	local heroLoc
	local peonX
	local peonY
	local townHall = nil

	if doPreload then
		Preloader("scripts\\HumanMelee.pld")
	end

	nearestMine = MeleeFindNearestMine(startLoc, bj_MELEE_MINE_SEARCH_RADIUS)
	if nearestMine ~= nil then
		-- Spawn Town Hall at the start location.
		townHall = CreateUnitAtLoc(whichPlayer, 1752461175, startLoc, bj_UNIT_FACING)

		-- Spawn Peasants near the mine.
		nearMineLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 320, 0)
		peonX = GetLocationX(nearMineLoc)
		peonY = GetLocationY(nearMineLoc)
		CreateUnit(whichPlayer, 1752196449, peonX + 0.0 * unitSpacing, peonY + 1.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1752196449, peonX + 1.0 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1752196449, peonX - 1.0 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1752196449, peonX + 0.6 * unitSpacing, peonY - 1.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1752196449, peonX - 0.6 * unitSpacing, peonY - 1.0 * unitSpacing, bj_UNIT_FACING)

		-- Set random hero spawn point to be off to the side of the start location.
		heroLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 384, 45)
	else
		-- Spawn Town Hall at the start location.
		townHall = CreateUnitAtLoc(whichPlayer, 1752461175, startLoc, bj_UNIT_FACING)

		-- Spawn Peasants directly south of the town hall.
		peonX = GetLocationX(startLoc)
		peonY = GetLocationY(startLoc) - 224.0
		CreateUnit(whichPlayer, 1752196449, peonX + 2.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1752196449, peonX + 1.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1752196449, peonX + 0.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1752196449, peonX - 1.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1752196449, peonX - 2.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)

		-- Set random hero spawn point to be just south of the start location.
		heroLoc = Location(peonX, peonY - 2.0 * unitSpacing)
	end

	if townHall ~= nil then
		UnitAddAbilityBJ(1097689443, townHall)
		UnitMakeAbilityPermanentBJ(true, 1097689443, townHall)
	end

	if doHeroes then
		-- If the "Random Hero" option is set, start the player with a random hero.
		-- Otherwise, give them a "free hero" token.
		if useRandomHero then
			MeleeRandomHeroLoc(whichPlayer, 1214344551, 1215130471, 1215324524, 1214409837, heroLoc)
		else
			SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_HERO_TOKENS, bj_MELEE_STARTING_HERO_TOKENS)
		end
	end

	if doCamera then
		-- Center the camera on the initial Peasants.
		SetCameraPositionForPlayer(whichPlayer, peonX, peonY)
		SetCameraQuickPositionForPlayer(whichPlayer, peonX, peonY)
	end
end

--===========================================================================
-- Starting Units for Orc Players
--   - 1 Great Hall, placed at start location
--   - 5 Peons, placed between start location and nearest gold mine
--
function MeleeStartingUnitsOrc(whichPlayer, startLoc, doHeroes, doCamera, doPreload)
	local useRandomHero = IsMapFlagSet(MAP_RANDOM_HERO)
	local unitSpacing = 64.0
	local nearestMine
	local nearMineLoc
	local heroLoc
	local peonX
	local peonY

	if doPreload then
		Preloader("scripts\\OrcMelee.pld")
	end

	nearestMine = MeleeFindNearestMine(startLoc, bj_MELEE_MINE_SEARCH_RADIUS)
	if nearestMine ~= nil then
		-- Spawn Great Hall at the start location.
		CreateUnitAtLoc(whichPlayer, 1869050469, startLoc, bj_UNIT_FACING)

		-- Spawn Peons near the mine.
		nearMineLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 320, 0)
		peonX = GetLocationX(nearMineLoc)
		peonY = GetLocationY(nearMineLoc)
		CreateUnit(whichPlayer, 1869636975, peonX + 0.0 * unitSpacing, peonY + 1.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1869636975, peonX + 1.0 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1869636975, peonX - 1.0 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1869636975, peonX + 0.6 * unitSpacing, peonY - 1.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1869636975, peonX - 0.6 * unitSpacing, peonY - 1.0 * unitSpacing, bj_UNIT_FACING)

		-- Set random hero spawn point to be off to the side of the start location.
		heroLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 384, 45)
	else
		-- Spawn Great Hall at the start location.
		CreateUnitAtLoc(whichPlayer, 1869050469, startLoc, bj_UNIT_FACING)

		-- Spawn Peons directly south of the town hall.
		peonX = GetLocationX(startLoc)
		peonY = GetLocationY(startLoc) - 224.0
		CreateUnit(whichPlayer, 1869636975, peonX + 2.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1869636975, peonX + 1.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1869636975, peonX + 0.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1869636975, peonX - 1.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1869636975, peonX - 2.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)

		-- Set random hero spawn point to be just south of the start location.
		heroLoc = Location(peonX, peonY - 2.0 * unitSpacing)
	end

	if doHeroes then
		-- If the "Random Hero" option is set, start the player with a random hero.
		-- Otherwise, give them a "free hero" token.
		if useRandomHero then
			MeleeRandomHeroLoc(whichPlayer, 1331850337, 1332109682, 1333027688, 1332963428, heroLoc)
		else
			SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_HERO_TOKENS, bj_MELEE_STARTING_HERO_TOKENS)
		end
	end

	if doCamera then
		-- Center the camera on the initial Peons.
		SetCameraPositionForPlayer(whichPlayer, peonX, peonY)
		SetCameraQuickPositionForPlayer(whichPlayer, peonX, peonY)
	end
end

--===========================================================================
-- Starting Units for Undead Players
--   - 1 Necropolis, placed at start location
--   - 1 Haunted Gold Mine, placed on nearest gold mine
--   - 3 Acolytes, placed between start location and nearest gold mine
--   - 1 Ghoul, placed between start location and nearest gold mine
--   - Blight, centered on nearest gold mine, spread across a "large area"
--
function MeleeStartingUnitsUndead(whichPlayer, startLoc, doHeroes, doCamera, doPreload)
	local useRandomHero = IsMapFlagSet(MAP_RANDOM_HERO)
	local unitSpacing = 64.0
	local nearestMine
	local nearMineLoc
	local nearTownLoc
	local heroLoc
	local peonX
	local peonY
	local ghoulX
	local ghoulY

	if doPreload then
		Preloader("scripts\\UndeadMelee.pld")
	end

	nearestMine = MeleeFindNearestMine(startLoc, bj_MELEE_MINE_SEARCH_RADIUS)
	if nearestMine ~= nil then
		-- Spawn Necropolis at the start location.
		CreateUnitAtLoc(whichPlayer, 1970172012, startLoc, bj_UNIT_FACING)

		-- Replace the nearest gold mine with a blighted version.
		nearestMine = BlightGoldMineForPlayerBJ(nearestMine, whichPlayer)

		-- Spawn Ghoul near the Necropolis.
		nearTownLoc = MeleeGetProjectedLoc(startLoc, GetUnitLoc(nearestMine), 288, 0)
		ghoulX = GetLocationX(nearTownLoc)
		ghoulY = GetLocationY(nearTownLoc)
		bj_ghoul[GetPlayerId(whichPlayer)] = CreateUnit(whichPlayer, 1969711215, ghoulX + 0.0 * unitSpacing, ghoulY + 0.0 * unitSpacing, bj_UNIT_FACING)

		-- Spawn Acolytes near the mine.
		nearMineLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 320, 0)
		peonX = GetLocationX(nearMineLoc)
		peonY = GetLocationY(nearMineLoc)
		CreateUnit(whichPlayer, 1969316719, peonX + 0.0 * unitSpacing, peonY + 0.5 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1969316719, peonX + 0.65 * unitSpacing, peonY - 0.5 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1969316719, peonX - 0.65 * unitSpacing, peonY - 0.5 * unitSpacing, bj_UNIT_FACING)

		-- Create a patch of blight around the gold mine.
		SetBlightLoc(whichPlayer, nearMineLoc, 768, true)

		-- Set random hero spawn point to be off to the side of the start location.
		heroLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 384, 45)
	else
		-- Spawn Necropolis at the start location.
		CreateUnitAtLoc(whichPlayer, 1970172012, startLoc, bj_UNIT_FACING)

		-- Spawn Acolytes and Ghoul directly south of the Necropolis.
		peonX = GetLocationX(startLoc)
		peonY = GetLocationY(startLoc) - 224.0
		CreateUnit(whichPlayer, 1969316719, peonX - 1.5 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1969316719, peonX - 0.5 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1969316719, peonX + 0.5 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1969711215, peonX + 1.5 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)

		-- Create a patch of blight around the start location.
		SetBlightLoc(whichPlayer, startLoc, 768, true)

		-- Set random hero spawn point to be just south of the start location.
		heroLoc = Location(peonX, peonY - 2.0 * unitSpacing)
	end

	if doHeroes then
		-- If the "Random Hero" option is set, start the player with a random hero.
		-- Otherwise, give them a "free hero" token.
		if useRandomHero then
			MeleeRandomHeroLoc(whichPlayer, 1432642913, 1432646245, 1433168227, 1432580716, heroLoc)
		else
			SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_HERO_TOKENS, bj_MELEE_STARTING_HERO_TOKENS)
		end
	end

	if doCamera then
		-- Center the camera on the initial Acolytes.
		SetCameraPositionForPlayer(whichPlayer, peonX, peonY)
		SetCameraQuickPositionForPlayer(whichPlayer, peonX, peonY)
	end
end

--===========================================================================
-- Starting Units for Night Elf Players
--   - 1 Tree of Life, placed by nearest gold mine, already entangled
--   - 5 Wisps, placed between Tree of Life and nearest gold mine
--
function MeleeStartingUnitsNightElf(whichPlayer, startLoc, doHeroes, doCamera, doPreload)
	local useRandomHero = IsMapFlagSet(MAP_RANDOM_HERO)
	local unitSpacing = 64.0
	local minTreeDist = 3.5 * bj_CELLWIDTH
	local minWispDist = 1.75 * bj_CELLWIDTH
	local nearestMine
	local nearMineLoc
	local wispLoc
	local heroLoc
	local peonX
	local peonY
	local tree

	if doPreload then
		Preloader("scripts\\NightElfMelee.pld")
	end

	nearestMine = MeleeFindNearestMine(startLoc, bj_MELEE_MINE_SEARCH_RADIUS)
	if nearestMine ~= nil then
		-- Spawn Tree of Life near the mine and have it entangle the mine.
		-- Project the Tree's coordinates from the gold mine, and then snap
		-- the X and Y values to within minTreeDist of the Gold Mine.
		nearMineLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 650, 0)
		nearMineLoc = MeleeGetLocWithinRect(nearMineLoc, GetRectFromCircleBJ(GetUnitLoc(nearestMine), minTreeDist))
		tree = CreateUnitAtLoc(whichPlayer, 1702129516, nearMineLoc, bj_UNIT_FACING)
		IssueTargetOrder(tree, "entangleinstant", nearestMine)

		-- Spawn Wisps at the start location.
		wispLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 320, 0)
		wispLoc = MeleeGetLocWithinRect(wispLoc, GetRectFromCircleBJ(GetUnitLoc(nearestMine), minWispDist))
		peonX = GetLocationX(wispLoc)
		peonY = GetLocationY(wispLoc)
		CreateUnit(whichPlayer, 1702327152, peonX + 0.0 * unitSpacing, peonY + 1.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1702327152, peonX + 1.0 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1702327152, peonX - 1.0 * unitSpacing, peonY + 0.15 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1702327152, peonX + 0.58 * unitSpacing, peonY - 1.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1702327152, peonX - 0.58 * unitSpacing, peonY - 1.0 * unitSpacing, bj_UNIT_FACING)

		-- Set random hero spawn point to be off to the side of the start location.
		heroLoc = MeleeGetProjectedLoc(GetUnitLoc(nearestMine), startLoc, 384, 45)
	else
		-- Spawn Tree of Life at the start location.
		CreateUnitAtLoc(whichPlayer, 1702129516, startLoc, bj_UNIT_FACING)

		-- Spawn Wisps directly south of the town hall.
		peonX = GetLocationX(startLoc)
		peonY = GetLocationY(startLoc) - 224.0
		CreateUnit(whichPlayer, 1702327152, peonX - 2.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1702327152, peonX - 1.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1702327152, peonX + 0.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1702327152, peonX + 1.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)
		CreateUnit(whichPlayer, 1702327152, peonX + 2.0 * unitSpacing, peonY + 0.0 * unitSpacing, bj_UNIT_FACING)

		-- Set random hero spawn point to be just south of the start location.
		heroLoc = Location(peonX, peonY - 2.0 * unitSpacing)
	end

	if doHeroes then
		-- If the "Random Hero" option is set, start the player with a random hero.
		-- Otherwise, give them a "free hero" token.
		if useRandomHero then
			MeleeRandomHeroLoc(whichPlayer, 1164207469, 1164666213, 1164799855, 1165451634, heroLoc)
		else
			SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_HERO_TOKENS, bj_MELEE_STARTING_HERO_TOKENS)
		end
	end

	if doCamera then
		-- Center the camera on the initial Wisps.
		SetCameraPositionForPlayer(whichPlayer, peonX, peonY)
		SetCameraQuickPositionForPlayer(whichPlayer, peonX, peonY)
	end
end

--===========================================================================
-- Starting Units for Players Whose Race is Unknown
--   - 12 Sheep, placed randomly around the start location
--
function MeleeStartingUnitsUnknownRace(whichPlayer, startLoc, doHeroes, doCamera, doPreload)
	local index

	if doPreload then
	end

	index = 0
	for _ in _loop_() do
		CreateUnit(whichPlayer, 1853057125, GetLocationX(startLoc) + GetRandomReal(-256, 256), GetLocationY(startLoc) + GetRandomReal(-256, 256), GetRandomReal(0, 360))
		index = index + 1
		if index == 12 then break end
	end

	if doHeroes then
		-- Give them a "free hero" token, out of pity.
		SetPlayerState(whichPlayer, PLAYER_STATE_RESOURCE_HERO_TOKENS, bj_MELEE_STARTING_HERO_TOKENS)
	end

	if doCamera then
		-- Center the camera on the initial sheep.
		SetCameraPositionLocForPlayer(whichPlayer, startLoc)
		SetCameraQuickPositionLocForPlayer(whichPlayer, startLoc)
	end
end

--===========================================================================
function MeleeStartingUnits()
	local index
	local indexPlayer
	local indexStartLoc
	local indexRace

	Preloader("scripts\\SharedMelee.pld")

	index = 0
	for _ in _loop_() do
		indexPlayer = Player(index)
		if GetPlayerSlotState(indexPlayer) == PLAYER_SLOT_STATE_PLAYING then
			indexStartLoc = GetStartLocationLoc(GetPlayerStartLocation(indexPlayer))
			indexRace = GetPlayerRace(indexPlayer)

			-- Create initial race-specific starting units
			if indexRace == RACE_HUMAN then
				MeleeStartingUnitsHuman(indexPlayer, indexStartLoc, true, true, true)
			elseif indexRace == RACE_ORC then
				MeleeStartingUnitsOrc(indexPlayer, indexStartLoc, true, true, true)
			elseif indexRace == RACE_UNDEAD then
				MeleeStartingUnitsUndead(indexPlayer, indexStartLoc, true, true, true)
			elseif indexRace == RACE_NIGHTELF then
				MeleeStartingUnitsNightElf(indexPlayer, indexStartLoc, true, true, true)
			else
				MeleeStartingUnitsUnknownRace(indexPlayer, indexStartLoc, true, true, true)
			end
		end

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end

end

--===========================================================================
function MeleeStartingUnitsForPlayer(whichRace, whichPlayer, loc, doHeroes)
	-- Create initial race-specific starting units
	if whichRace == RACE_HUMAN then
		MeleeStartingUnitsHuman(whichPlayer, loc, doHeroes, false, false)
	elseif whichRace == RACE_ORC then
		MeleeStartingUnitsOrc(whichPlayer, loc, doHeroes, false, false)
	elseif whichRace == RACE_UNDEAD then
		MeleeStartingUnitsUndead(whichPlayer, loc, doHeroes, false, false)
	elseif whichRace == RACE_NIGHTELF then
		MeleeStartingUnitsNightElf(whichPlayer, loc, doHeroes, false, false)
	else
	-- Unrecognized race - ignore the request.
	end
end



--***************************************************************************
--*
--*  Melee Template Starting AI Scripts
--*
--***************************************************************************

--===========================================================================
function PickMeleeAI(num, s1, s2, s3)
	local pick

	-- easy difficulty never uses any custom AI scripts
	-- that are designed to be a bit more challenging
	--
	if GetAIDifficulty(num) == AI_DIFFICULTY_NEWBIE then
		StartMeleeAI(num, s1)
		return
	end

	if s2 == nil then
		pick = 1
	elseif s3 == nil then
		pick = GetRandomInt(1, 2)
	else
		pick = GetRandomInt(1, 3)
	end

	if pick == 1 then
		StartMeleeAI(num, s1)
	elseif pick == 2 then
		StartMeleeAI(num, s2)
	else
		StartMeleeAI(num, s3)
	end
end

--===========================================================================
function MeleeStartingAI()
	local index
	local indexPlayer
	local indexRace

	index = 0
	for _ in _loop_() do
		indexPlayer = Player(index)
		if GetPlayerSlotState(indexPlayer) == PLAYER_SLOT_STATE_PLAYING then
			indexRace = GetPlayerRace(indexPlayer)
			if GetPlayerController(indexPlayer) == MAP_CONTROL_COMPUTER then
				-- Run a race-specific melee AI script.
				if indexRace == RACE_HUMAN then
					PickMeleeAI(indexPlayer, "human.ai", nil, nil)
				elseif indexRace == RACE_ORC then
					PickMeleeAI(indexPlayer, "orc.ai", nil, nil)
				elseif indexRace == RACE_UNDEAD then
					PickMeleeAI(indexPlayer, "undead.ai", nil, nil)
					RecycleGuardPosition(bj_ghoul[index])
				elseif indexRace == RACE_NIGHTELF then
					PickMeleeAI(indexPlayer, "elf.ai", nil, nil)
				else
				-- Unrecognized race.
				end
				ShareEverythingWithTeamAI(indexPlayer)
			end
		end

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end

function LockGuardPosition(targ)
	SetUnitCreepGuard(targ, true)
end


--***************************************************************************
--*
--*  Melee Template Victory / Defeat Conditions
--*
--***************************************************************************

--===========================================================================
function MeleePlayerIsOpponent(playerIndex, opponentIndex)
	local thePlayer = Player(playerIndex)
	local theOpponent = Player(opponentIndex)

	-- The player himself is not an opponent.
	if playerIndex == opponentIndex then
		return false
	end

	-- Unused player slots are not opponents.
	if GetPlayerSlotState(theOpponent) ~= PLAYER_SLOT_STATE_PLAYING then
		return false
	end

	-- Players who are already defeated are not opponents.
	if bj_meleeDefeated[opponentIndex] then
		return false
	end

	-- Allied players with allied victory set are not opponents.
	if GetPlayerAlliance(thePlayer, theOpponent, ALLIANCE_PASSIVE) then
		if GetPlayerAlliance(theOpponent, thePlayer, ALLIANCE_PASSIVE) then
			if GetPlayerState(thePlayer, PLAYER_STATE_ALLIED_VICTORY) == 1 then
				if GetPlayerState(theOpponent, PLAYER_STATE_ALLIED_VICTORY) == 1 then
					return false
				end
			end
		end
	end

	return true
end

--===========================================================================
-- Count buildings currently owned by all allies, including the player themself.
--
function MeleeGetAllyStructureCount(whichPlayer)
	local playerIndex
	local buildingCount
	local indexPlayer

	-- Count the number of buildings controlled by all not-yet-defeated co-allies.
	buildingCount = 0
	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)

		-- uncomment to cause defeat even if you have control of ally structures, but yours have been nixed
		--if (PlayersAreCoAllied(whichPlayer, indexPlayer) and not bj_meleeDefeated[playerIndex]) then
		if PlayersAreCoAllied(whichPlayer, indexPlayer) then
			buildingCount = buildingCount + GetPlayerStructureCount(indexPlayer, true)
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end

	return buildingCount
end

--===========================================================================
-- Count allies, excluding dead players and the player themself.
--
function MeleeGetAllyCount(whichPlayer)
	local playerIndex
	local playerCount
	local indexPlayer

	-- Count the number of not-yet-defeated co-allies.
	playerCount = 0
	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)
		if PlayersAreCoAllied(whichPlayer, indexPlayer) and not bj_meleeDefeated[playerIndex] and whichPlayer ~= indexPlayer then
			playerCount = playerCount + 1
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end

	return playerCount
end

--===========================================================================
-- Counts key structures owned by a player and his or her allies, including
-- structures currently upgrading or under construction.
--
-- Key structures: Town Hall, Great Hall, Tree of Life, Necropolis
--
function MeleeGetAllyKeyStructureCount(whichPlayer)
	local playerIndex
	local indexPlayer
	local keyStructs

	-- Count the number of buildings controlled by all not-yet-defeated co-allies.
	keyStructs = 0
	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)
		if PlayersAreCoAllied(whichPlayer, indexPlayer) then
			keyStructs = keyStructs + GetPlayerTypedUnitCount(indexPlayer, "townhall", true, true)
			keyStructs = keyStructs + GetPlayerTypedUnitCount(indexPlayer, "greathall", true, true)
			keyStructs = keyStructs + GetPlayerTypedUnitCount(indexPlayer, "treeoflife", true, true)
			keyStructs = keyStructs + GetPlayerTypedUnitCount(indexPlayer, "necropolis", true, true)
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end

	return keyStructs
end

--===========================================================================
-- Enum: Draw out a specific player.
--
function MeleeDoDrawEnum()
	local thePlayer = GetEnumPlayer()

	CachePlayerHeroData(thePlayer)
	RemovePlayerPreserveUnitsBJ(thePlayer, PLAYER_GAME_RESULT_TIE, false)
end

--===========================================================================
-- Enum: Victory out a specific player.
--
function MeleeDoVictoryEnum()
	local thePlayer = GetEnumPlayer()
	local playerIndex = GetPlayerId(thePlayer)

	if not bj_meleeVictoried[playerIndex] then
		bj_meleeVictoried[playerIndex] = true
		CachePlayerHeroData(thePlayer)
		RemovePlayerPreserveUnitsBJ(thePlayer, PLAYER_GAME_RESULT_VICTORY, false)
	end
end

--===========================================================================
-- Defeat out a specific player.
--
function MeleeDoDefeat(whichPlayer)
	bj_meleeDefeated[GetPlayerId(whichPlayer)] = true
	RemovePlayerPreserveUnitsBJ(whichPlayer, PLAYER_GAME_RESULT_DEFEAT, false)
end

--===========================================================================
-- Enum: Defeat out a specific player.
--
function MeleeDoDefeatEnum()
	local thePlayer = GetEnumPlayer()

	-- needs to happen before ownership change
	CachePlayerHeroData(thePlayer)
	MakeUnitsPassiveForTeam(thePlayer)
	MeleeDoDefeat(thePlayer)
end

--===========================================================================
-- A specific player left the game.
--
function MeleeDoLeave(whichPlayer)
	if GetIntegerGameState(GAME_STATE_DISCONNECTED) ~= 0 then
		GameOverDialogBJ(whichPlayer, true)
	else
		bj_meleeDefeated[GetPlayerId(whichPlayer)] = true
		RemovePlayerPreserveUnitsBJ(whichPlayer, PLAYER_GAME_RESULT_DEFEAT, true)
	end
end

--===========================================================================
-- Remove all observers
-- 
function MeleeRemoveObservers()
	local playerIndex
	local indexPlayer

	-- Give all observers the game over dialog
	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)

		if IsPlayerObserver(indexPlayer) then
			RemovePlayerPreserveUnitsBJ(indexPlayer, PLAYER_GAME_RESULT_NEUTRAL, false)
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Test all players to determine if a team has won.  For a team to win, all
-- remaining (read: undefeated) players need to be co-allied with all other
-- remaining players.  If even one player is not allied towards another,
-- everyone must be denied victory.
--
function MeleeCheckForVictors()
	local playerIndex
	local opponentIndex
	local opponentlessPlayers = CreateForce()
	local gameOver = false

	-- Check to see if any players have opponents remaining.
	playerIndex = 0
	for _ in _loop_() do
		if not bj_meleeDefeated[playerIndex] then
			-- Determine whether or not this player has any remaining opponents.
			opponentIndex = 0
			for _ in _loop_() do
				-- If anyone has an opponent, noone can be victorious yet.
				if MeleePlayerIsOpponent(playerIndex, opponentIndex) then
					return CreateForce()
				end

				opponentIndex = opponentIndex + 1
				if opponentIndex == bj_MAX_PLAYERS then break end
			end

			-- Keep track of each opponentless player so that we can give
			-- them a victory later.
			ForceAddPlayer(opponentlessPlayers, Player(playerIndex))
			gameOver = true
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end

	-- Set the game over global flag
	bj_meleeGameOver = gameOver

	return opponentlessPlayers
end

--===========================================================================
-- Test each player to determine if anyone has been defeated.
--
function MeleeCheckForLosersAndVictors()
	local playerIndex
	local indexPlayer
	local defeatedPlayers = CreateForce()
	local victoriousPlayers
	local gameOver = false

	-- If the game is already over, do nothing
	if bj_meleeGameOver then
		return
	end

	-- If the game was disconnected then it is over, in this case we
	-- don't want to report results for anyone as they will most likely
	-- conflict with the actual game results
	if GetIntegerGameState(GAME_STATE_DISCONNECTED) ~= 0 then
		bj_meleeGameOver = true
		return
	end

	-- Check each player to see if he or she has been defeated yet.
	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)

		if not bj_meleeDefeated[playerIndex] and not bj_meleeVictoried[playerIndex] then
			--call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, "Player"+I2S(playerIndex)+" has "+I2S(MeleeGetAllyStructureCount(indexPlayer))+" ally buildings.")
			if MeleeGetAllyStructureCount(indexPlayer) <= 0 then

				-- Keep track of each defeated player so that we can give
				-- them a defeat later.
				ForceAddPlayer(defeatedPlayers, Player(playerIndex))

				-- Set their defeated flag now so MeleeCheckForVictors
				-- can detect victors.
				bj_meleeDefeated[playerIndex] = true
			end
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end

	-- Now that the defeated flags are set, check if there are any victors
	victoriousPlayers = MeleeCheckForVictors()

	-- Defeat all defeated players
	ForForce(defeatedPlayers, MeleeDoDefeatEnum)

	-- Give victory to all victorious players
	ForForce(victoriousPlayers, MeleeDoVictoryEnum)

	-- If the game is over we should remove all observers
	if bj_meleeGameOver then
		MeleeRemoveObservers()
	end
end

--===========================================================================
-- Returns a race-specific "build X or be revealed" message.
--
function MeleeGetCrippledWarningMessage(whichPlayer)
	local r = GetPlayerRace(whichPlayer)

	if r == RACE_HUMAN then
		return GetLocalizedString("CRIPPLE_WARNING_HUMAN")
	elseif r == RACE_ORC then
		return GetLocalizedString("CRIPPLE_WARNING_ORC")
	elseif r == RACE_NIGHTELF then
		return GetLocalizedString("CRIPPLE_WARNING_NIGHTELF")
	elseif r == RACE_UNDEAD then
		return GetLocalizedString("CRIPPLE_WARNING_UNDEAD")
	else
		-- Unrecognized Race
		return ""
	end
end

--===========================================================================
-- Returns a race-specific "build X" label for cripple timers.
--
function MeleeGetCrippledTimerMessage(whichPlayer)
	local r = GetPlayerRace(whichPlayer)

	if r == RACE_HUMAN then
		return GetLocalizedString("CRIPPLE_TIMER_HUMAN")
	elseif r == RACE_ORC then
		return GetLocalizedString("CRIPPLE_TIMER_ORC")
	elseif r == RACE_NIGHTELF then
		return GetLocalizedString("CRIPPLE_TIMER_NIGHTELF")
	elseif r == RACE_UNDEAD then
		return GetLocalizedString("CRIPPLE_TIMER_UNDEAD")
	else
		-- Unrecognized Race
		return ""
	end
end

--===========================================================================
-- Returns a race-specific "build X" label for cripple timers.
--
function MeleeGetCrippledRevealedMessage(whichPlayer)
	return (GetLocalizedString("CRIPPLE_REVEALING_PREFIX") or "") .. (GetPlayerName(whichPlayer) or "") .. (GetLocalizedString("CRIPPLE_REVEALING_POSTFIX") or "")
end

--===========================================================================
function MeleeExposePlayer(whichPlayer, expose)
	local playerIndex
	local indexPlayer
	local toExposeTo = CreateForce()

	CripplePlayer(whichPlayer, toExposeTo, false)

	bj_playerIsExposed[GetPlayerId(whichPlayer)] = expose
	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)
		if not PlayersAreCoAllied(whichPlayer, indexPlayer) then
			ForceAddPlayer(toExposeTo, indexPlayer)
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end

	CripplePlayer(whichPlayer, toExposeTo, expose)
	DestroyForce(toExposeTo)
end

--===========================================================================
function MeleeExposeAllPlayers()
	local playerIndex
	local indexPlayer
	local playerIndex2
	local indexPlayer2
	local toExposeTo = CreateForce()

	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)

		ForceClear(toExposeTo)
		CripplePlayer(indexPlayer, toExposeTo, false)

		playerIndex2 = 0
		for _ in _loop_() do
			indexPlayer2 = Player(playerIndex2)

			if playerIndex ~= playerIndex2 then
				if not PlayersAreCoAllied(indexPlayer, indexPlayer2) then
					ForceAddPlayer(toExposeTo, indexPlayer2)
				end
			end

			playerIndex2 = playerIndex2 + 1
			if playerIndex2 == bj_MAX_PLAYERS then break end
		end

		CripplePlayer(indexPlayer, toExposeTo, true)

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end

	DestroyForce(toExposeTo)
end

--===========================================================================
function MeleeCrippledPlayerTimeout()
	local expiredTimer = GetExpiredTimer()
	local playerIndex
	local exposedPlayer

	-- Determine which player's timer expired.
	playerIndex = 0
	for _ in _loop_() do
		if bj_crippledTimer[playerIndex] == expiredTimer then
			if true then break end
		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
	if playerIndex == bj_MAX_PLAYERS then
		return
	end
	exposedPlayer = Player(playerIndex)

	if GetLocalPlayer() == exposedPlayer then
		-- Use only local code (no net traffic) within this block to avoid desyncs.

		-- Hide the timer window for this player.
		TimerDialogDisplay(bj_crippledTimerWindows[playerIndex], false)
	end

	-- Display a text message to all players, explaining the exposure.
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, bj_MELEE_CRIPPLE_MSG_DURATION, MeleeGetCrippledRevealedMessage(exposedPlayer))

	-- Expose the player.
	MeleeExposePlayer(exposedPlayer, true)
end

--===========================================================================
function MeleePlayerIsCrippled(whichPlayer)
	local allyStructures = MeleeGetAllyStructureCount(whichPlayer)
	local allyKeyStructures = MeleeGetAllyKeyStructureCount(whichPlayer)

	-- Dead teams are not considered to be crippled.
	return allyStructures > 0 and allyKeyStructures <= 0
end

--===========================================================================
-- Test each player to determine if anyone has become crippled.
--
function MeleeCheckForCrippledPlayers()
	local playerIndex
	local indexPlayer
	local crippledPlayers = CreateForce()
	local isNowCrippled
	local indexRace

	-- The "finish soon" exposure of all players overrides any "crippled" exposure
	if bj_finishSoonAllExposed then
		return
	end

	-- Check each player to see if he or she has been crippled or uncrippled.
	playerIndex = 0
	for _ in _loop_() do
		indexPlayer = Player(playerIndex)
		isNowCrippled = MeleePlayerIsCrippled(indexPlayer)

		if not bj_playerIsCrippled[playerIndex] and isNowCrippled then

			-- Player became crippled; start their cripple timer.
			bj_playerIsCrippled[playerIndex] = true
			TimerStart(bj_crippledTimer[playerIndex], bj_MELEE_CRIPPLE_TIMEOUT, false, MeleeCrippledPlayerTimeout)

			if GetLocalPlayer() == indexPlayer then
				-- Use only local code (no net traffic) within this block to avoid desyncs.

				-- Show the timer window.
				TimerDialogDisplay(bj_crippledTimerWindows[playerIndex], true)

				-- Display a warning message.
				DisplayTimedTextToPlayer(indexPlayer, 0, 0, bj_MELEE_CRIPPLE_MSG_DURATION, MeleeGetCrippledWarningMessage(indexPlayer))
			end

		elseif bj_playerIsCrippled[playerIndex] and not isNowCrippled then

			-- Player became uncrippled; stop their cripple timer.
			bj_playerIsCrippled[playerIndex] = false
			PauseTimer(bj_crippledTimer[playerIndex])

			if GetLocalPlayer() == indexPlayer then
				-- Use only local code (no net traffic) within this block to avoid desyncs.

				-- Hide the timer window for this player.
				TimerDialogDisplay(bj_crippledTimerWindows[playerIndex], false)

				-- Display a confirmation message if the player's team is still alive.
				if MeleeGetAllyStructureCount(indexPlayer) > 0 then
					if bj_playerIsExposed[playerIndex] then
						DisplayTimedTextToPlayer(indexPlayer, 0, 0, bj_MELEE_CRIPPLE_MSG_DURATION, GetLocalizedString("CRIPPLE_UNREVEALED"))
					else
						DisplayTimedTextToPlayer(indexPlayer, 0, 0, bj_MELEE_CRIPPLE_MSG_DURATION, GetLocalizedString("CRIPPLE_UNCRIPPLED"))
					end
				end
			end

			-- If the player granted shared vision, deny that vision now.
			MeleeExposePlayer(indexPlayer, false)

		end

		playerIndex = playerIndex + 1
		if playerIndex == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Determine if the lost unit should result in any defeats or victories.
--
function MeleeCheckLostUnit(lostUnit)
	local lostUnitOwner = GetOwningPlayer(lostUnit)

	-- We only need to check for mortality if this was the last building.
	if GetPlayerStructureCount(lostUnitOwner, true) <= 0 then
		MeleeCheckForLosersAndVictors()
	end

	-- Check if the lost unit has crippled or uncrippled the player.
	-- (A team with 0 units is dead, and thus considered uncrippled.)
	MeleeCheckForCrippledPlayers()
end

--===========================================================================
-- Determine if the gained unit should result in any defeats, victories,
-- or cripple-status changes.
--
function MeleeCheckAddedUnit(addedUnit)
	local addedUnitOwner = GetOwningPlayer(addedUnit)

	-- If the player was crippled, this unit may have uncrippled him/her.
	if bj_playerIsCrippled[GetPlayerId(addedUnitOwner)] then
		MeleeCheckForCrippledPlayers()
	end
end

--===========================================================================
function MeleeTriggerActionConstructCancel()
	MeleeCheckLostUnit(GetCancelledStructure())
end

--===========================================================================
function MeleeTriggerActionUnitDeath()
	if IsUnitType(GetDyingUnit(), UNIT_TYPE_STRUCTURE) then
		MeleeCheckLostUnit(GetDyingUnit())
	end
end

--===========================================================================
function MeleeTriggerActionUnitConstructionStart()
	MeleeCheckAddedUnit(GetConstructingStructure())
end

--===========================================================================
function MeleeTriggerActionPlayerDefeated()
	local thePlayer = GetTriggerPlayer()
	CachePlayerHeroData(thePlayer)

	if MeleeGetAllyCount(thePlayer) > 0 then
		-- If at least one ally is still alive and kicking, share units with
		-- them and proceed with death.
		ShareEverythingWithTeam(thePlayer)
		if not bj_meleeDefeated[GetPlayerId(thePlayer)] then
			MeleeDoDefeat(thePlayer)
		end
	else
		-- If no living allies remain, swap all units and buildings over to
		-- neutral_passive and proceed with death.
		MakeUnitsPassiveForTeam(thePlayer)
		if not bj_meleeDefeated[GetPlayerId(thePlayer)] then
			MeleeDoDefeat(thePlayer)
		end
	end
	MeleeCheckForLosersAndVictors()
end

--===========================================================================
function MeleeTriggerActionPlayerLeft()
	local thePlayer = GetTriggerPlayer()

	-- Just show game over for observers when they leave
	if IsPlayerObserver(thePlayer) then
		RemovePlayerPreserveUnitsBJ(thePlayer, PLAYER_GAME_RESULT_NEUTRAL, false)
		return
	end

	CachePlayerHeroData(thePlayer)

	-- This is the same as defeat except the player generates the message 
	-- "player left the game" as opposed to "player was defeated".

	if MeleeGetAllyCount(thePlayer) > 0 then
		-- If at least one ally is still alive and kicking, share units with
		-- them and proceed with death.
		ShareEverythingWithTeam(thePlayer)
		MeleeDoLeave(thePlayer)
	else
		-- If no living allies remain, swap all units and buildings over to
		-- neutral_passive and proceed with death.
		MakeUnitsPassiveForTeam(thePlayer)
		MeleeDoLeave(thePlayer)
	end
	MeleeCheckForLosersAndVictors()
end

--===========================================================================
function MeleeTriggerActionAllianceChange()
	MeleeCheckForLosersAndVictors()
	MeleeCheckForCrippledPlayers()
end

--===========================================================================
function MeleeTriggerTournamentFinishSoon()
	-- Note: We may get this trigger multiple times
	local playerIndex
	local indexPlayer
	local timeRemaining = GetTournamentFinishSoonTimeRemaining()

	if not bj_finishSoonAllExposed then
		bj_finishSoonAllExposed = true

		-- Reset all crippled players and their timers, and hide the local crippled timer dialog
		playerIndex = 0
		for _ in _loop_() do
			indexPlayer = Player(playerIndex)
			if bj_playerIsCrippled[playerIndex] then
				-- Uncripple the player
				bj_playerIsCrippled[playerIndex] = false
				PauseTimer(bj_crippledTimer[playerIndex])

				if GetLocalPlayer() == indexPlayer then
					-- Use only local code (no net traffic) within this block to avoid desyncs.

					-- Hide the timer window.
					TimerDialogDisplay(bj_crippledTimerWindows[playerIndex], false)
				end

			end
			playerIndex = playerIndex + 1
			if playerIndex == bj_MAX_PLAYERS then break end
		end

		-- Expose all players
		MeleeExposeAllPlayers()
	end

	-- Show the "finish soon" timer dialog and set the real time remaining
	TimerDialogDisplay(bj_finishSoonTimerDialog, true)
	TimerDialogSetRealTimeRemaining(bj_finishSoonTimerDialog, timeRemaining)
end


--===========================================================================
function MeleeWasUserPlayer(whichPlayer)
	local slotState

	if GetPlayerController(whichPlayer) ~= MAP_CONTROL_USER then
		return false
	end

	slotState = GetPlayerSlotState(whichPlayer)

	return slotState == PLAYER_SLOT_STATE_PLAYING or slotState == PLAYER_SLOT_STATE_LEFT
end

--===========================================================================
function MeleeTournamentFinishNowRuleA(multiplier)
	local playerScore = _array_(0)
	local teamScore = _array_(0)
	local teamForce = _array_()
	local teamCount
	local index
	local indexPlayer
	local index2
	local indexPlayer2
	local bestTeam
	local bestScore
	local draw

	-- Compute individual player scores
	index = 0
	for _ in _loop_() do
		indexPlayer = Player(index)
		if MeleeWasUserPlayer(indexPlayer) then
			playerScore[index] = GetTournamentScore(indexPlayer)
			if playerScore[index] <= 0 then
				playerScore[index] = 1
			end
		else
			playerScore[index] = 0
		end
		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end

	-- Compute team scores and team forces
	teamCount = 0
	index = 0
	for _ in _loop_() do
		if playerScore[index] ~= 0 then
			indexPlayer = Player(index)

			teamScore[teamCount] = 0
			teamForce[teamCount] = CreateForce()

			index2 = index
			for _ in _loop_() do
				if playerScore[index2] ~= 0 then
					indexPlayer2 = Player(index2)

					if PlayersAreCoAllied(indexPlayer, indexPlayer2) then
						teamScore[teamCount] = teamScore[teamCount] + playerScore[index2]
						ForceAddPlayer(teamForce[teamCount], indexPlayer2)
						playerScore[index2] = 0
					end
				end

				index2 = index2 + 1
				if index2 == bj_MAX_PLAYERS then break end
			end

			teamCount = teamCount + 1
		end

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end

	-- The game is now over
	bj_meleeGameOver = true

	-- There should always be at least one team, but continue to work if not
	if teamCount ~= 0 then

		-- Find best team score
		bestTeam = -1
		bestScore = -1
		index = 0
		for _ in _loop_() do
			if teamScore[index] > bestScore then
				bestTeam = index
				bestScore = teamScore[index]
			end

			index = index + 1
			if index == teamCount then break end
		end

		-- Check whether the best team's score is 'multiplier' times better than
		-- every other team. In the case of multiplier == 1 and exactly equal team
		-- scores, the first team (which was randomly chosen by the server) will win.
		draw = false
		index = 0
		for _ in _loop_() do
			if index ~= bestTeam then
				if bestScore < multiplier * teamScore[index] then
					draw = true
				end
			end

			index = index + 1
			if index == teamCount then break end
		end

		if draw then
			-- Give draw to all players on all teams
			index = 0
			for _ in _loop_() do
				ForForce(teamForce[index], MeleeDoDrawEnum)

				index = index + 1
				if index == teamCount then break end
			end
		else
			-- Give defeat to all players on teams other than the best team
			index = 0
			for _ in _loop_() do
				if index ~= bestTeam then
					ForForce(teamForce[index], MeleeDoDefeatEnum)
				end

				index = index + 1
				if index == teamCount then break end
			end

			-- Give victory to all players on the best team
			ForForce(teamForce[bestTeam], MeleeDoVictoryEnum)
		end
	end

end

--===========================================================================
function MeleeTriggerTournamentFinishNow()
	local rule = GetTournamentFinishNowRule()

	-- If the game is already over, do nothing
	if bj_meleeGameOver then
		return
	end

	if rule == 1 then
		-- Finals games
		MeleeTournamentFinishNowRuleA(1)
	else
		-- Preliminary games
		MeleeTournamentFinishNowRuleA(3)
	end

	-- Since the game is over we should remove all observers
	MeleeRemoveObservers()

end

--===========================================================================
function MeleeInitVictoryDefeat()
	local trig
	local index
	local indexPlayer

	-- Create a timer window for the "finish soon" timeout period, it has no timer
	-- because it is driven by real time (outside of the game state to avoid desyncs)
	bj_finishSoonTimerDialog = CreateTimerDialog(nil)

	-- Set a trigger to fire when we receive a "finish soon" game event
	trig = CreateTrigger()
	TriggerRegisterGameEvent(trig, EVENT_GAME_TOURNAMENT_FINISH_SOON)
	TriggerAddAction(trig, MeleeTriggerTournamentFinishSoon)

	-- Set a trigger to fire when we receive a "finish now" game event
	trig = CreateTrigger()
	TriggerRegisterGameEvent(trig, EVENT_GAME_TOURNAMENT_FINISH_NOW)
	TriggerAddAction(trig, MeleeTriggerTournamentFinishNow)

	-- Set up each player's mortality code.
	index = 0
	for _ in _loop_() do
		indexPlayer = Player(index)

		-- Make sure this player slot is playing.
		if GetPlayerSlotState(indexPlayer) == PLAYER_SLOT_STATE_PLAYING then
			bj_meleeDefeated[index] = false
			bj_meleeVictoried[index] = false

			-- Create a timer and timer window in case the player is crippled.
			bj_playerIsCrippled[index] = false
			bj_playerIsExposed[index] = false
			bj_crippledTimer[index] = CreateTimer()
			bj_crippledTimerWindows[index] = CreateTimerDialog(bj_crippledTimer[index])
			TimerDialogSetTitle(bj_crippledTimerWindows[index], MeleeGetCrippledTimerMessage(indexPlayer))

			-- Set a trigger to fire whenever a building is cancelled for this player.
			trig = CreateTrigger()
			TriggerRegisterPlayerUnitEvent(trig, indexPlayer, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL, nil)
			TriggerAddAction(trig, MeleeTriggerActionConstructCancel)

			-- Set a trigger to fire whenever a unit dies for this player.
			trig = CreateTrigger()
			TriggerRegisterPlayerUnitEvent(trig, indexPlayer, EVENT_PLAYER_UNIT_DEATH, nil)
			TriggerAddAction(trig, MeleeTriggerActionUnitDeath)

			-- Set a trigger to fire whenever a unit begins construction for this player
			trig = CreateTrigger()
			TriggerRegisterPlayerUnitEvent(trig, indexPlayer, EVENT_PLAYER_UNIT_CONSTRUCT_START, nil)
			TriggerAddAction(trig, MeleeTriggerActionUnitConstructionStart)

			-- Set a trigger to fire whenever this player defeats-out
			trig = CreateTrigger()
			TriggerRegisterPlayerEvent(trig, indexPlayer, EVENT_PLAYER_DEFEAT)
			TriggerAddAction(trig, MeleeTriggerActionPlayerDefeated)

			-- Set a trigger to fire whenever this player leaves
			trig = CreateTrigger()
			TriggerRegisterPlayerEvent(trig, indexPlayer, EVENT_PLAYER_LEAVE)
			TriggerAddAction(trig, MeleeTriggerActionPlayerLeft)

			-- Set a trigger to fire whenever this player changes his/her alliances.
			trig = CreateTrigger()
			TriggerRegisterPlayerAllianceChange(trig, indexPlayer, ALLIANCE_PASSIVE)
			TriggerRegisterPlayerStateEvent(trig, indexPlayer, PLAYER_STATE_ALLIED_VICTORY, EQUAL, 1)
			TriggerAddAction(trig, MeleeTriggerActionAllianceChange)
		else
			bj_meleeDefeated[index] = true
			bj_meleeVictoried[index] = false

			-- Handle leave events for observers
			if IsPlayerObserver(indexPlayer) then
				-- Set a trigger to fire whenever this player leaves
				trig = CreateTrigger()
				TriggerRegisterPlayerEvent(trig, indexPlayer, EVENT_PLAYER_LEAVE)
				TriggerAddAction(trig, MeleeTriggerActionPlayerLeft)
			end
		end

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end

	-- Test for victory / defeat at startup, in case the user has already won / lost.
	-- Allow for a short time to pass first, so that the map can finish loading.
	TimerStart(CreateTimer(), 2.0, false, MeleeTriggerActionAllianceChange)
end



--***************************************************************************
--*
--*  Player Slot Availability
--*
--***************************************************************************

--===========================================================================
function CheckInitPlayerSlotAvailability()
	local index

	if not bj_slotControlReady then
		index = 0
		for _ in _loop_() do
			bj_slotControlUsed[index] = false
			bj_slotControl[index] = MAP_CONTROL_USER
			index = index + 1
			if index == bj_MAX_PLAYERS then break end
		end
		bj_slotControlReady = true
	end
end

--===========================================================================
function SetPlayerSlotAvailable(whichPlayer, control)
	local playerIndex = GetPlayerId(whichPlayer)

	CheckInitPlayerSlotAvailability()
	bj_slotControlUsed[playerIndex] = true
	bj_slotControl[playerIndex] = control
end



--***************************************************************************
--*
--*  Generic Template Player-slot Initialization
--*
--***************************************************************************

--===========================================================================
function TeamInitPlayerSlots(teamCount)
	local index
	local indexPlayer
	local team

	SetTeams(teamCount)

	CheckInitPlayerSlotAvailability()
	index = 0
	team = 0
	for _ in _loop_() do
		if bj_slotControlUsed[index] then
			indexPlayer = Player(index)
			SetPlayerTeam(indexPlayer, team)
			team = team + 1
			if team >= teamCount then
				team = 0
			end
		end

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
function MeleeInitPlayerSlots()
	TeamInitPlayerSlots(bj_MAX_PLAYERS)
end

--===========================================================================
function FFAInitPlayerSlots()
	TeamInitPlayerSlots(bj_MAX_PLAYERS)
end

--===========================================================================
function OneOnOneInitPlayerSlots()
	-- Limit the game to 2 players.
	SetTeams(2)
	SetPlayers(2)
	TeamInitPlayerSlots(2)
end

--===========================================================================
function InitGenericPlayerSlots()
	local gType = GetGameTypeSelected()

	if gType == GAME_TYPE_MELEE then
		MeleeInitPlayerSlots()
	elseif gType == GAME_TYPE_FFA then
		FFAInitPlayerSlots()
	elseif gType == GAME_TYPE_USE_MAP_SETTINGS then
	-- Do nothing; the map-specific script handles this.
	elseif gType == GAME_TYPE_ONE_ON_ONE then
		OneOnOneInitPlayerSlots()
	elseif gType == GAME_TYPE_TWO_TEAM_PLAY then
		TeamInitPlayerSlots(2)
	elseif gType == GAME_TYPE_THREE_TEAM_PLAY then
		TeamInitPlayerSlots(3)
	elseif gType == GAME_TYPE_FOUR_TEAM_PLAY then
		TeamInitPlayerSlots(4)
	else
	-- Unrecognized Game Type
	end
end



--***************************************************************************
--*
--*  Blizzard.j Initialization
--*
--***************************************************************************

--===========================================================================
function SetDNCSoundsDawn()
	if bj_useDawnDuskSounds then
		StartSound(bj_dawnSound)
	end
end

--===========================================================================
function SetDNCSoundsDusk()
	if bj_useDawnDuskSounds then
		StartSound(bj_duskSound)
	end
end

--===========================================================================
function SetDNCSoundsDay()
	local ToD = GetTimeOfDay()

	if ToD >= bj_TOD_DAWN and ToD < bj_TOD_DUSK and not bj_dncIsDaytime then
		bj_dncIsDaytime = true

		-- change ambient sounds
		StopSound(bj_nightAmbientSound, false, true)
		StartSound(bj_dayAmbientSound)
	end
end

--===========================================================================
function SetDNCSoundsNight()
	local ToD = GetTimeOfDay()

	if (ToD < bj_TOD_DAWN or ToD >= bj_TOD_DUSK) and bj_dncIsDaytime then
		bj_dncIsDaytime = false

		-- change ambient sounds
		StopSound(bj_dayAmbientSound, false, true)
		StartSound(bj_nightAmbientSound)
	end
end

--===========================================================================
function InitDNCSounds()
	-- Create sounds to be played at dawn and dusk.
	bj_dawnSound = CreateSoundFromLabel("RoosterSound", false, false, false, 10000, 10000)
	bj_duskSound = CreateSoundFromLabel("WolfSound", false, false, false, 10000, 10000)

	-- Set up triggers to respond to dawn and dusk.
	bj_dncSoundsDawn = CreateTrigger()
	TriggerRegisterGameStateEvent(bj_dncSoundsDawn, GAME_STATE_TIME_OF_DAY, EQUAL, bj_TOD_DAWN)
	TriggerAddAction(bj_dncSoundsDawn, SetDNCSoundsDawn)

	bj_dncSoundsDusk = CreateTrigger()
	TriggerRegisterGameStateEvent(bj_dncSoundsDusk, GAME_STATE_TIME_OF_DAY, EQUAL, bj_TOD_DUSK)
	TriggerAddAction(bj_dncSoundsDusk, SetDNCSoundsDusk)

	-- Set up triggers to respond to changes from day to night or vice-versa.
	bj_dncSoundsDay = CreateTrigger()
	TriggerRegisterGameStateEvent(bj_dncSoundsDay, GAME_STATE_TIME_OF_DAY, GREATER_THAN_OR_EQUAL, bj_TOD_DAWN)
	TriggerRegisterGameStateEvent(bj_dncSoundsDay, GAME_STATE_TIME_OF_DAY, LESS_THAN, bj_TOD_DUSK)
	TriggerAddAction(bj_dncSoundsDay, SetDNCSoundsDay)

	bj_dncSoundsNight = CreateTrigger()
	TriggerRegisterGameStateEvent(bj_dncSoundsNight, GAME_STATE_TIME_OF_DAY, LESS_THAN, bj_TOD_DAWN)
	TriggerRegisterGameStateEvent(bj_dncSoundsNight, GAME_STATE_TIME_OF_DAY, GREATER_THAN_OR_EQUAL, bj_TOD_DUSK)
	TriggerAddAction(bj_dncSoundsNight, SetDNCSoundsNight)
end

--===========================================================================
function InitBlizzardGlobals()
	local index
	local userControlledPlayers
	local v

	-- Init filter function vars
	filterIssueHauntOrderAtLocBJ = Filter(IssueHauntOrderAtLocBJFilter)
	filterEnumDestructablesInCircleBJ = Filter(EnumDestructablesInCircleBJFilter)
	filterGetUnitsInRectOfPlayer = Filter(GetUnitsInRectOfPlayerFilter)
	filterGetUnitsOfTypeIdAll = Filter(GetUnitsOfTypeIdAllFilter)
	filterGetUnitsOfPlayerAndTypeId = Filter(GetUnitsOfPlayerAndTypeIdFilter)
	filterMeleeTrainedUnitIsHeroBJ = Filter(MeleeTrainedUnitIsHeroBJFilter)
	filterLivingPlayerUnitsOfTypeId = Filter(LivingPlayerUnitsOfTypeIdFilter)

	-- Init force presets
	index = 0
	for _ in _loop_() do
		if index == bj_MAX_PLAYER_SLOTS then break end
		bj_FORCE_PLAYER[index] = CreateForce()
		ForceAddPlayer(bj_FORCE_PLAYER[index], Player(index))
		index = index + 1
	end

	bj_FORCE_ALL_PLAYERS = CreateForce()
	ForceEnumPlayers(bj_FORCE_ALL_PLAYERS, nil)

	-- Init Cinematic Mode history
	bj_cineModePriorSpeed = GetGameSpeed()
	bj_cineModePriorFogSetting = IsFogEnabled()
	bj_cineModePriorMaskSetting = IsFogMaskEnabled()

	-- Init Trigger Queue
	index = 0
	for _ in _loop_() do
		if index >= bj_MAX_QUEUED_TRIGGERS then break end
		bj_queuedExecTriggers[index] = nil
		bj_queuedExecUseConds[index] = false
		index = index + 1
	end

	-- Init singleplayer check
	bj_isSinglePlayer = false
	userControlledPlayers = 0
	index = 0
	for _ in _loop_() do
		if index >= bj_MAX_PLAYERS then break end
		if GetPlayerController(Player(index)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(index)) == PLAYER_SLOT_STATE_PLAYING then
			userControlledPlayers = userControlledPlayers + 1
		end
		index = index + 1
	end
	bj_isSinglePlayer = userControlledPlayers == 1

	-- Init sounds
	--set bj_pingMinimapSound = CreateSoundFromLabel("AutoCastButtonClick", false, false, false, 10000, 10000)
	bj_rescueSound = CreateSoundFromLabel("Rescue", false, false, false, 10000, 10000)
	bj_questDiscoveredSound = CreateSoundFromLabel("QuestNew", false, false, false, 10000, 10000)
	bj_questUpdatedSound = CreateSoundFromLabel("QuestUpdate", false, false, false, 10000, 10000)
	bj_questCompletedSound = CreateSoundFromLabel("QuestCompleted", false, false, false, 10000, 10000)
	bj_questFailedSound = CreateSoundFromLabel("QuestFailed", false, false, false, 10000, 10000)
	bj_questHintSound = CreateSoundFromLabel("Hint", false, false, false, 10000, 10000)
	bj_questSecretSound = CreateSoundFromLabel("SecretFound", false, false, false, 10000, 10000)
	bj_questItemAcquiredSound = CreateSoundFromLabel("ItemReward", false, false, false, 10000, 10000)
	bj_questWarningSound = CreateSoundFromLabel("Warning", false, false, false, 10000, 10000)
	bj_victoryDialogSound = CreateSoundFromLabel("QuestCompleted", false, false, false, 10000, 10000)
	bj_defeatDialogSound = CreateSoundFromLabel("QuestFailed", false, false, false, 10000, 10000)

	-- Init corpse creation triggers.
	DelayedSuspendDecayCreate()

	-- Init version-specific data
	v = VersionGet()
	if v == VERSION_REIGN_OF_CHAOS then
		bj_MELEE_MAX_TWINKED_HEROES = bj_MELEE_MAX_TWINKED_HEROES_V0
	else
		bj_MELEE_MAX_TWINKED_HEROES = bj_MELEE_MAX_TWINKED_HEROES_V1
	end
end

--===========================================================================
function InitQueuedTriggers()
	bj_queuedExecTimeout = CreateTrigger()
	TriggerRegisterTimerExpireEvent(bj_queuedExecTimeout, bj_queuedExecTimeoutTimer)
	TriggerAddAction(bj_queuedExecTimeout, QueuedTriggerDoneBJ)
end

--===========================================================================
function InitMapRects()
	bj_mapInitialPlayableArea = Rect(GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT), GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM), GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT), GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP))
	bj_mapInitialCameraBounds = GetCurrentCameraBoundsMapRectBJ()
end

--===========================================================================
function InitSummonableCaps()
	local index

	index = 0
	for _ in _loop_() do
		-- upgraded units
		-- Note: Only do this if the corresponding upgrade is not yet researched
		-- Barrage - Siege Engines
		if not GetPlayerTechResearched(Player(index), 1382576756, true) then
			SetPlayerTechMaxAllowed(Player(index), 1752331380, 0)
		end

		-- Berserker Upgrade - Troll Berserkers
		if not GetPlayerTechResearched(Player(index), 1383031403, true) then
			SetPlayerTechMaxAllowed(Player(index), 1869898347, 0)
		end

		-- max skeletons per player
		SetPlayerTechMaxAllowed(Player(index), 1970498405, bj_MAX_SKELETONS)

		index = index + 1
		if index == bj_MAX_PLAYERS then break end
	end
end

--===========================================================================
-- Update the per-class stock limits.
--
function UpdateStockAvailability(whichItem)
	local iType = GetItemType(whichItem)
	local iLevel = GetItemLevel(whichItem)

	-- Update allowed type/level combinations.
	if iType == ITEM_TYPE_PERMANENT then
		bj_stockAllowedPermanent[iLevel] = true
	elseif iType == ITEM_TYPE_CHARGED then
		bj_stockAllowedCharged[iLevel] = true
	elseif iType == ITEM_TYPE_ARTIFACT then
		bj_stockAllowedArtifact[iLevel] = true
	else
	-- Not interested in this item type - ignore the item.
	end
end

--===========================================================================
-- Find a sellable item of the given type and level, and then add it.
--
function UpdateEachStockBuildingEnum()
	local iteration = 0
	local pickedItemId

	for _ in _loop_() do
		pickedItemId = ChooseRandomItemEx(bj_stockPickedItemType, bj_stockPickedItemLevel)
		if IsItemIdSellable(pickedItemId) then break end

		-- If we get hung up on an entire class/level combo of unsellable
		-- items, or a very unlucky series of random numbers, give up.
		iteration = iteration + 1
		if iteration > bj_STOCK_MAX_ITERATIONS then
			return
		end
	end
	AddItemToStock(GetEnumUnit(), pickedItemId, 1, 1)
end

--===========================================================================
function UpdateEachStockBuilding(iType, iLevel)
	local g

	bj_stockPickedItemType = iType
	bj_stockPickedItemLevel = iLevel

	g = CreateGroup()
	GroupEnumUnitsOfType(g, "marketplace", nil)
	ForGroup(g, UpdateEachStockBuildingEnum)
	DestroyGroup(g)
end

--===========================================================================
-- Update stock inventory.
--
function PerformStockUpdates()
	local pickedItemId
	local pickedItemType
	local pickedItemLevel = 0
	local allowedCombinations = 0
	local iLevel

	-- Give each type/level combination a chance of being picked.
	iLevel = 1
	for _ in _loop_() do
		if bj_stockAllowedPermanent[iLevel] then
			allowedCombinations = allowedCombinations + 1
			if GetRandomInt(1, allowedCombinations) == 1 then
				pickedItemType = ITEM_TYPE_PERMANENT
				pickedItemLevel = iLevel
			end
		end
		if bj_stockAllowedCharged[iLevel] then
			allowedCombinations = allowedCombinations + 1
			if GetRandomInt(1, allowedCombinations) == 1 then
				pickedItemType = ITEM_TYPE_CHARGED
				pickedItemLevel = iLevel
			end
		end
		if bj_stockAllowedArtifact[iLevel] then
			allowedCombinations = allowedCombinations + 1
			if GetRandomInt(1, allowedCombinations) == 1 then
				pickedItemType = ITEM_TYPE_ARTIFACT
				pickedItemLevel = iLevel
			end
		end

		iLevel = iLevel + 1
		if iLevel > bj_MAX_ITEM_LEVEL then break end
	end

	-- Make sure we found a valid item type to add.
	if allowedCombinations == 0 then
		return
	end

	UpdateEachStockBuilding(pickedItemType, pickedItemLevel)
end

--===========================================================================
-- Perform the first update, and then arrange future updates.
--
function StartStockUpdates()
	PerformStockUpdates()
	TimerStart(bj_stockUpdateTimer, bj_STOCK_RESTOCK_INTERVAL, true, PerformStockUpdates)
end

--===========================================================================
function RemovePurchasedItem()
	RemoveItemFromStock(GetSellingUnit(), GetItemTypeId(GetSoldItem()))
end

--===========================================================================
function InitNeutralBuildings()
	local iLevel

	-- Chart of allowed stock items.
	iLevel = 0
	for _ in _loop_() do
		bj_stockAllowedPermanent[iLevel] = false
		bj_stockAllowedCharged[iLevel] = false
		bj_stockAllowedArtifact[iLevel] = false
		iLevel = iLevel + 1
		if iLevel > bj_MAX_ITEM_LEVEL then break end
	end

	-- Limit stock inventory slots.
	SetAllItemTypeSlots(bj_MAX_STOCK_ITEM_SLOTS)
	SetAllUnitTypeSlots(bj_MAX_STOCK_UNIT_SLOTS)

	-- Arrange the first update.
	bj_stockUpdateTimer = CreateTimer()
	TimerStart(bj_stockUpdateTimer, bj_STOCK_RESTOCK_INITIAL_DELAY, false, StartStockUpdates)

	-- Set up a trigger to fire whenever an item is sold.
	bj_stockItemPurchased = CreateTrigger()
	TriggerRegisterPlayerUnitEvent(bj_stockItemPurchased, Player(PLAYER_NEUTRAL_PASSIVE), EVENT_PLAYER_UNIT_SELL_ITEM, nil)
	TriggerAddAction(bj_stockItemPurchased, RemovePurchasedItem)
end

--===========================================================================
function MarkGameStarted()
	bj_gameStarted = true
	DestroyTimer(bj_gameStartedTimer)
end

--===========================================================================
function DetectGameStarted()
	bj_gameStartedTimer = CreateTimer()
	TimerStart(bj_gameStartedTimer, bj_GAME_STARTED_THRESHOLD, false, MarkGameStarted)
end

--===========================================================================
function InitBlizzard()
	-- Set up the Neutral Victim player slot, to torture the abandoned units
	-- of defeated players.  Since some triggers expect this player slot to
	-- exist, this is performed for all maps.
	ConfigureNeutralVictim()

	InitBlizzardGlobals()
	InitQueuedTriggers()
	InitRescuableBehaviorBJ()
	InitDNCSounds()
	InitMapRects()
	InitSummonableCaps()
	InitNeutralBuildings()
	DetectGameStarted()
end



--***************************************************************************
--*
--*  Random distribution
--*
--*  Used to select a random object from a given distribution of chances
--*
--*  - RandomDistReset clears the distribution list
--*
--*  - RandomDistAddItem adds a new object to the distribution list
--*    with a given identifier and an integer chance to be chosen
--*
--*  - RandomDistChoose will use the current distribution list to choose
--*    one of the objects randomly based on the chance distribution
--*  
--*  Note that the chances are effectively normalized by their sum,
--*  so only the relative values of each chance are important
--*
--***************************************************************************

--===========================================================================
function RandomDistReset()
	bj_randDistCount = 0
end

--===========================================================================
function RandomDistAddItem(inID, inChance)
	bj_randDistID[bj_randDistCount] = inID
	bj_randDistChance[bj_randDistCount] = inChance
	bj_randDistCount = bj_randDistCount + 1
end

--===========================================================================
function RandomDistChoose()
	local sum = 0
	local chance = 0
	local index
	local foundID = -1
	local done

	-- No items?
	if bj_randDistCount == 0 then
		return -1
	end

	-- Find sum of all chances
	index = 0
	for _ in _loop_() do
		sum = sum + bj_randDistChance[index]

		index = index + 1
		if index == bj_randDistCount then break end
	end

	-- Choose random number within the total range
	chance = GetRandomInt(1, sum)

	-- Find ID which corresponds to this chance
	index = 0
	sum = 0
	done = false
	for _ in _loop_() do
		sum = sum + bj_randDistChance[index]

		if chance <= sum then
			foundID = bj_randDistID[index]
			done = true
		end

		index = index + 1
		if index == bj_randDistCount then
			done = true
		end

		if done == true then break end
	end

	return foundID
end



--***************************************************************************
--*
--*  Drop item
--*
--*  Makes the given unit drop the given item
--*
--*  Note: This could potentially cause problems if the unit is standing
--*        right on the edge of an unpathable area and happens to drop the
--*        item into the unpathable area where nobody can get it...
--*
--***************************************************************************

function UnitDropItem(inUnit, inItemID)
	local x
	local y
	local radius = 32
	local unitX
	local unitY
	local droppedItem

	if inItemID == -1 then
		return nil
	end

	unitX = GetUnitX(inUnit)
	unitY = GetUnitY(inUnit)

	x = GetRandomReal(unitX - radius, unitX + radius)
	y = GetRandomReal(unitY - radius, unitY + radius)

	droppedItem = CreateItem(inItemID, x, y)

	SetItemDropID(droppedItem, GetUnitTypeId(inUnit))
	UpdateStockAvailability(droppedItem)

	return droppedItem
end

--===========================================================================
function WidgetDropItem(inWidget, inItemID)
	local x
	local y
	local radius = 32
	local widgetX
	local widgetY

	if inItemID == -1 then
		return nil
	end

	widgetX = GetWidgetX(inWidget)
	widgetY = GetWidgetY(inWidget)

	x = GetRandomReal(widgetX - radius, widgetX + radius)
	y = GetRandomReal(widgetY - radius, widgetY + radius)

	return CreateItem(inItemID, x, y)
end
