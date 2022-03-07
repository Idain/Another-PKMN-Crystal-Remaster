    db MISMAGIUS ; 252

    db  60,  60,  60, 105, 105, 105
    evs  0,   0,   0,   0,   1,   1
    ;   hp  atk  def  spd  sat  sdf

    db GHOST, GHOST ; type
    db 45 ; catch rate
    db 187 ; base exp
    db NO_ITEM, SPELL_TAG ; items
    db GENDER_F50 ; gender ratio
    db 25 ; step cycles to hatch
    INCBIN "gfx/pokemon/mismagius/front.dimensions"
    db GROWTH_FAST ; growth rate
    dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

    ; tm/hm learnset
    tmhm HEADBUTT, CURSE, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, SNORE, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, THUNDER, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, DREAM_EATER, REST, ATTRACT, THIEF, NIGHTMARE, THUNDER_WAVE, SUBSTITUTE, FLASH, THUNDERBOLT
    ; end
