; Pokémon swarms in grass

SwarmGrassWildMons:

; Dunsparce swarm
	map_id DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	;  %, species,    min, max
	db 30, GEODUDE,		 3,  3
	db 30, DUNSPARCE,	 2,  4
	db 20, ZUBAT,		 2,  2
	db 10, GEODUDE,		 2,  3
	db  5, DUNSPARCE,	 2,  4
	db  4, DUNSPARCE,	 2,  4
	db  1, DUNSPARCE,	 2,  4

	; day
	;  %, species,    min, max
	db 30, GEODUDE,		 3,  3
	db 30, DUNSPARCE,	 2,  4
	db 20, ZUBAT,		 2,  2
	db 10, GEODUDE,		 2,  3
	db  5, DUNSPARCE,	 2,  4
	db  4, DUNSPARCE,	 2,  4
	db  1, DUNSPARCE,	 2,  4

	; nite
	;  %, species,    min, max
	db 30, GEODUDE,		 3,  3
	db 30, DUNSPARCE,	 2,  4
	db 20, ZUBAT,		 2,  2
	db 10, GEODUDE,		 2,  3
	db  5, DUNSPARCE,	 2,  4
	db  4, DUNSPARCE,	 2,  4
	db  1, DUNSPARCE,	 2,  4

; Yanma swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	;  %, species,    min, max
	db 30, NIDORAN_M,	12, 12
	db 30, NIDORAN_F,	12, 12
	db 20, YANMA,		12, 14
	db 10, YANMA,		12, 14
	db  5, PIDGEY,		14, 14
	db  4, DITTO,		10, 10
	db  1, DITTO,		10, 10

	; day
	;  %, species,    min, max
	db 30, NIDORAN_M,	12, 12
	db 30, NIDORAN_F,	12, 12
	db 20, YANMA,		12, 14
	db 10, YANMA,		12, 14
	db  5, PIDGEY,		14, 14
	db  4, DITTO,		10, 10
	db  1, DITTO,		10, 10

	; nite
	;  %, species,    min, max
	db 30, NIDORAN_M,	12, 12
	db 30, NIDORAN_F,	12, 12
	db 20, YANMA,		12, 14
	db 10, YANMA,		12, 14
	db  5, PIDGEY,		14, 14
	db  4, DITTO,		10, 10
	db  1, DITTO,		10, 10

	db -1 ; end
