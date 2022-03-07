    db HONCHKROW ; 253

    db 100, 125,  52,  71, 105,  52
    evs  0,   2,   0,   0,   0,   0
    ;   hp  atk  def  spd  sat  sdf

    db DARK, FLYING ; type
    db 30 ; catch rate
    db 187 ; base exp
    db NO_ITEM, NO_ITEM ; items
    db GENDER_F50 ; gender ratio
    db 20 ; step cycles to hatch
    INCBIN "gfx/pokemon/honchkrow/front.dimensions"
    db GROWTH_MEDIUM_SLOW ; growth rate
    dn EGG_FLYING, EGG_FLYING ; egg groups

    ; tm/hm learnset
    tmhm CURSE, TOXIC, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, SNORE, ICY_WIND, PROTECT, ENDURE, FRUSTRATION, RETURN, SHADOW_BALL, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DREAM_EATER, DETECT, REST, ATTRACT, THIEF, STEEL_WING, NIGHTMARE, THUNDER_WAVE, SUBSTITUTE, FLY
    ; end
