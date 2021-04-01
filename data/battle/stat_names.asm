StatNames:
; entries correspond to stat ids
	list_start StatNames
	li "ATTACK"
	li "DEFENSE"
	li "SPEED"
	li "SP.ATK"
	li "SP.DEF"
	li "ACCURACY"
	li "EVASION"
	li "STATS" ; used for BattleCommand_Curse and BattleCommand_Growth
	assert_list_length NUM_LEVEL_STATS
