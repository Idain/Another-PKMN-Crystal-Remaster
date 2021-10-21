INCLUDE "constants.asm"


SECTION "Egg Moves", ROMX

; All instances of Charm, Steel Wing, Sweet Scent, and Lovely Kiss were
; removed from egg move lists in Crystal.
; Sweet Scent and Steel Wing were redundant since they're TMs, and
; Charm and Lovely Kiss were unobtainable.

; Staryu's egg moves were removed in Crystal, because Staryu is genderless
; and can only breed with Ditto.

INCLUDE "data/pokemon/egg_move_pointers.asm"

BulbasaurEggMoves:
	db LIGHT_SCREEN
	db SKULL_BASH
	db SAFEGUARD
	db PETAL_DANCE
	db CURSE
	db AMNESIA
	db GIGA_DRAIN
	db TOXIC
	db -1 ; end

CharmanderEggMoves:
	db BELLY_DRUM
	db ANCIENTPOWER
	db ROCK_SLIDE
	db BITE
	db OUTRAGE
	db BEAT_UP
	db WING_ATTACK
	db COUNTER
	db CRUNCH
	db -1 ; end

SquirtleEggMoves:
	db MIRROR_COAT
	db HAZE
	db MIST
	db CONFUSION
	db FORESIGHT
	db FLAIL
	db -1 ; end

PidgeyEggMoves:
	db PURSUIT
	db FAINT_ATTACK
	db FORESIGHT
	db STEEL_WING
	db -1 ; end

RattataEggMoves:
	db SCREECH
	db FLAME_WHEEL
	db FURY_SWIPES
	db BITE
	db REVERSAL
	db -1 ; end

SpearowEggMoves:
	db FAINT_ATTACK
	db SCARY_FACE
	db QUICK_ATTACK
	db TRI_ATTACK
	db WHIRLWIND
	db SKY_ATTACK
	db STEEL_WING
	db -1 ; end

EkansEggMoves:
	db PURSUIT
	db SLAM
	db SPITE
	db BEAT_UP
	db CRUNCH
	db IRON_TAIL
	db DISABLE
	db SCARY_FACE
	db -1 ; end

SandshrewEggMoves:
	db FLAIL
	db ENDURE
	db MUD_SLAP
	db RAPID_SPIN
	db METAL_CLAW
	db -1 ; end

NidoranFEggMoves:
	db SUPERSONIC
	db DISABLE
	db TAKE_DOWN
	db FOCUS_ENERGY
	db CHARM
	db COUNTER
	db BEAT_UP
	db IRON_TAIL
	db ENDURE
	db PURSUIT
	db -1 ; end

NidoranMEggMoves:
	db SUPERSONIC
	db DISABLE
	db TAKE_DOWN
	db CONFUSION
	db AMNESIA
	db COUNTER
	db BEAT_UP
	db IRON_TAIL
	db ENDURE
	db -1 ; end

VulpixEggMoves:
	db FAINT_ATTACK
	db HYPNOSIS
	db FLAIL
	db SPITE
	db DISABLE
	db PSYCH_UP
	db -1 ; end

ZubatEggMoves:
	db QUICK_ATTACK
	db PURSUIT
	db FAINT_ATTACK
	db GUST
	db WHIRLWIND
	db CURSE
	db HYPNOSIS
	db GIGA_DRAIN
	db STEEL_WING
	db WING_ATTACK
	db -1 ; end

OddishEggMoves:
	db LEECH_SEED
	db SWORDS_DANCE
	db RAZOR_LEAF
	db FLAIL
	db SYNTHESIS
	db -1 ; end

ParasEggMoves:
	db SCREECH
	db COUNTER
	db PSYBEAM
	db LIGHT_SCREEN
	db PURSUIT
	db SWEET_SCENT
	db METAL_CLAW
	db AGILITY
	db ENDURE
	db LEECH_SEED
	db -1 ; end

VenonatEggMoves:
	db AGILITY
	db BATON_PASS
	db SCREECH
	db GIGA_DRAIN
	db -1 ; end

DiglettEggMoves:
	db FAINT_ATTACK
	db SCREECH
	db ANCIENTPOWER
	db PURSUIT
	db BEAT_UP
	db ENDURE
	db HEADBUTT
	db REVERSAL
	db -1 ; end

MeowthEggMoves:
	db SPITE
	db CHARM
	db HYPNOSIS
	db AMNESIA
	db TAIL_WHIP
	db IRON_TAIL
	db FLAIL
	db -1 ; end

PsyduckEggMoves:
	db HYPNOSIS
	db PSYBEAM
	db FORESIGHT
	db LIGHT_SCREEN
	db FUTURE_SIGHT
	db CROSS_CHOP
	db CONFUSE_RAY
	db ENCORE
	db -1 ; end

MankeyEggMoves:
	db FORESIGHT
	db MEDITATE
	db REVERSAL
	db BEAT_UP
	db ENCORE
	db -1 ; end

GrowlitheEggMoves:
	db BODY_SLAM
	db SAFEGUARD
	db CRUNCH
	db THRASH
	db FIRE_SPIN
	db IRON_TAIL
	db MORNING_SUN
	db DOUBLE_KICK
	db DOUBLE_EDGE
	db -1 ; end

PoliwagEggMoves:
	db MIST
	db BUBBLEBEAM
	db HAZE
	db MIND_READER
	db ENCORE
	db ENDURE
	db -1 ; end

AbraEggMoves:
	db LIGHT_SCREEN
	db ENCORE
	db BARRIER
	db FIRE_PUNCH
	db ICE_PUNCH
	db THUNDERPUNCH
	db CONFUSION
	db -1 ; end

MachopEggMoves:
	db MEDITATE
	db ROLLING_KICK
	db ENCORE
	db COUNTER
	db FIRE_PUNCH
	db ICE_PUNCH
	db THUNDERPUNCH
	db -1 ; end

BellsproutEggMoves:
	db ENCORE
	db SYNTHESIS
	db LEECH_LIFE
	db GIGA_DRAIN
	db -1 ; end

TentacoolEggMoves:
	db AURORA_BEAM
	db MIRROR_COAT
	db RAPID_SPIN
	db HAZE
	db CONFUSE_RAY
	db BUBBLE
	db -1 ; end

GeodudeEggMoves:
	db MEGA_PUNCH
	db CURSE
	db ENDURE
	db FLAIL
	db -1 ; end

PonytaEggMoves:
	db FLAME_WHEEL
	db THRASH
	db DOUBLE_KICK
	db HYPNOSIS
	db CHARM
	db MORNING_SUN
	db DOUBLE_EDGE
	db HORN_DRILL
	db LOW_KICK
	db -1 ; end

SlowpokeEggMoves:
	db BELLY_DRUM
	db FUTURE_SIGHT
	db STOMP
	db SLEEP_TALK
	db SNORE
	db -1 ; end

FarfetchDEggMoves:
	db FORESIGHT
	db MIRROR_MOVE
	db GUST
	db QUICK_ATTACK
	db FLAIL
	db MUD_SLAP
	db STEEL_WING
	db SKY_ATTACK
	db -1 ; end

DoduoEggMoves:
	db QUICK_ATTACK
	db SUPERSONIC
	db HAZE
	db FAINT_ATTACK
	db FLAIL
	db MIRROR_MOVE
	db -1 ; end

SeelEggMoves:
	db LICK
	db PERISH_SONG
	db DISABLE
	db SLAM
	db ENCORE
	db HORN_DRILL
	db IRON_TAIL
	db -1 ; end

GrimerEggMoves:
	db HAZE
	db MEAN_LOOK
	db LICK
	db CURSE
	db -1 ; end

ShellderEggMoves:
	db BUBBLEBEAM
	db TAKE_DOWN
	db BARRIER
	db RAPID_SPIN
	db SCREECH
	db -1 ; end

GastlyEggMoves:
	db PSYWAVE
	db PERISH_SONG
	db HAZE
	db DISABLE
	db TOXIC
	db -1 ; end

OnixEggMoves:
	db ROCK_SLIDE
	db FLAIL
	db EXPLOSION
	db DEFENSE_CURL
	db ROLLOUT
	db -1 ; end

DrowzeeEggMoves:
	db LIGHT_SCREEN
	db BARRIER
	db FIRE_PUNCH
	db ICE_PUNCH
	db THUNDERPUNCH
	db -1 ; end

KrabbyEggMoves:
	db DIG
	db HAZE
	db AMNESIA
	db FLAIL
	db SLAM
	db ANCIENTPOWER
	db SLASH
	db ENDURE
	db -1 ; end

ExeggcuteEggMoves:
	db SYNTHESIS
	db MOONLIGHT
	db REFLECT
	db GIGA_DRAIN
	db ANCIENTPOWER
	db POISONPOWDER
	db SLEEP_POWDER
	db STUN_SPORE
	db -1 ; end

CuboneEggMoves:
	db CURSE
	db DOUBLE_KICK
	db LEER
	db ANCIENTPOWER
	db BELLY_DRUM
	db SCREECH
	db SKULL_BASH
	db PERISH_SONG
	db -1 ; end

LickitungEggMoves:
	db AMNESIA
	db BELLY_DRUM
	db MAGNITUDE
	db BODY_SLAM
	db CURSE
	db SLEEP_TALK
	db SNORE
	db SUBSTITUTE
	db THRASH
	db -1 ; end

KoffingEggMoves:
	db SCREECH
	db PSYWAVE
	db PSYBEAM
	db DESTINY_BOND
	db PAIN_SPLIT
	db CURSE
	db SPITE
	db -1 ; end

RhyhornEggMoves:
	db CRUNCH
	db REVERSAL
	db ROCK_SLIDE
	db MAGNITUDE
	db CURSE
	db SKULL_BASH
	db -1 ; end

ChanseyEggMoves:
	db PRESENT
	db METRONOME
	db HEAL_BELL
	db -1 ; end

TangelaEggMoves:
	db FLAIL
	db CONFUSION
	db MEGA_DRAIN
	db GIGA_DRAIN
	db REFLECT
	db AMNESIA
	db LEECH_SEED
	db -1 ; end

KangaskhanEggMoves:
	db STOMP
	db FOCUS_ENERGY
	db DISABLE
	db COUNTER
	db DOUBLE_EDGE
	db -1 ; end

HorseaEggMoves:
	db FLAIL
	db AURORA_BEAM
	db OCTAZOOKA
	db DISABLE
	db SPLASH
	db DRAGON_RAGE
	db OUTRAGE
	db -1 ; end

GoldeenEggMoves:
	db PSYBEAM
	db HAZE
	db HYDRO_PUMP
	db -1 ; end

MrMimeEggMoves:
	db FUTURE_SIGHT
	db HYPNOSIS
	db MIMIC
	db CONFUSE_RAY
	db -1 ; end

ScytherEggMoves:
	db COUNTER
	db BATON_PASS
	db RAZOR_WIND
	db REVERSAL
	db ENDURE
	db STEEL_WING
	db -1 ; end

PinsirEggMoves:
	db FURY_ATTACK
	db FLAIL
	db FAINT_ATTACK
	db FALSE_SWIPE
	db QUICK_ATTACK
	db THRASH
	db -1 ; end

LaprasEggMoves:
	db FORESIGHT
	db ANCIENTPOWER
	db CURSE
	db HORN_DRILL
	db SLEEP_TALK
	db SUBSTITUTE
	db FUTURE_SIGHT
	db -1 ; end

EeveeEggMoves:
	db FLAIL
	db CHARM
	db ENDURE
	db DOUBLE_KICK
	db MUD_SLAP
	db -1 ; end

OmanyteEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db SLAM
	db SUPERSONIC
	db HAZE
	db SPIKES
	db WHIRLPOOL
	db BITE
	db -1 ; end

KabutoEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db RAPID_SPIN
	db FLAIL
	db CONFUSE_RAY
	db ICY_WIND
	db SCREECH
	db TAKE_DOWN
	db -1 ; end

AerodactylEggMoves:
	db CURSE
	db STEEL_WING
	db WHIRLWIND
	db PURSUIT
	db FORESIGHT
	db -1 ; end

SnorlaxEggMoves:
	db DOUBLE_EDGE
	db COUNTER
	db FISSURE
	db CURSE
	db LICK
	db -1 ; end

DratiniEggMoves:
	db MIST
	db HAZE
	db SUPERSONIC
	db EXTREMESPEED
	db DRAGONBREATH
	db IRON_TAIL
	db -1 ; end

ChikoritaEggMoves:
	db BODY_SLAM
	db VINE_WHIP
	db LEECH_SEED
	db ANCIENTPOWER
	db FLAIL
	db -1 ; end

CyndaquilEggMoves:
	db DOUBLE_EDGE
	db DOUBLE_KICK
	db FURY_SWIPES
	db QUICK_ATTACK
	db REVERSAL
	db THRASH
	db FORESIGHT
	db -1 ; end

TotodileEggMoves:
	db CRUNCH
	db THRASH
	db HYDRO_PUMP
	db ANCIENTPOWER
	db -1 ; end

SentretEggMoves:
	db IRON_TAIL
	db CHARM
	db DOUBLE_EDGE
	db PURSUIT
	db SLASH
	db FOCUS_ENERGY
	db REVERSAL
	db -1 ; end

HoothootEggMoves:
	db MIRROR_MOVE
	db SUPERSONIC
	db FAINT_ATTACK
	db WING_ATTACK
	db WHIRLWIND
	db SKY_ATTACK
	db AGILITY
	db MEAN_LOOK
	db NIGHT_SHADE
	db -1 ; end

LedybaEggMoves:
	db PSYBEAM
	db BIDE
	db COUNTER
	db ENCORE
	db ENDURE
	db SCREECH
	db -1 ; end

SpinarakEggMoves:
	db PSYBEAM
	db DISABLE
	db SONICBOOM
	db BATON_PASS
	db PURSUIT
	db MEGAHORN
	db TWINEEDLE
	db -1 ; end

ChinchouEggMoves:
	db FLAIL
	db SUPERSONIC
	db SCREECH
	db PSYBEAM
	db AGILITY
	db -1 ; end

PichuEggMoves:
	db REVERSAL
	db PRESENT
	db ENCORE
	db DOUBLESLAP
	db FLAIL
	db ENDURE
	db THUNDERPUNCH
	db -1 ; end

CleffaEggMoves:
	db PRESENT
	db METRONOME
	db AMNESIA
	db BELLY_DRUM
	db SPLASH
	db MIMIC
	db -1 ; end

IgglybuffEggMoves:
	db PERISH_SONG
	db PRESENT
	db FAINT_ATTACK
	db SLEEP_TALK
	db -1 ; end

TogepiEggMoves:
	db PRESENT
	db MIRROR_MOVE
	db PECK
	db FORESIGHT
	db FUTURE_SIGHT
	db -1 ; end

NatuEggMoves:
	db HAZE
	db DRILL_PECK
	db QUICK_ATTACK
	db FAINT_ATTACK
	db STEEL_WING
	db -1 ; end

MareepEggMoves:
	db TAKE_DOWN
	db BODY_SLAM
	db SCREECH
	db REFLECT
	db AGILITY
	db SAND_ATTACK
	db -1 ; end

MarillEggMoves:
	db PRESENT
	db AMNESIA
	db FUTURE_SIGHT
	db BELLY_DRUM
	db PERISH_SONG
	db SUPERSONIC
	db BODY_SLAM
	db ENCORE
	db SING
	db SLAM
	db -1 ; end

SudowoodoEggMoves:
	db SELFDESTRUCT
	db DEFENSE_CURL
	db ROLLOUT
	db CURSE
	db HARDEN
	db -1 ; end

HoppipEggMoves:
	db CONFUSION
	db ENCORE
	db DOUBLE_EDGE
	db AMNESIA
	db -1 ; end

AipomEggMoves:
	db SCREECH
	db PURSUIT
	db AGILITY
	db SPITE
	db SLAM
	db DOUBLESLAP
	db BEAT_UP
	db -1 ; end

YanmaEggMoves:
	db WHIRLWIND
	db REVERSAL
	db LEECH_LIFE
	db DOUBLE_EDGE
	db FAINT_ATTACK
	db PURSUIT
	db -1 ; end

WooperEggMoves:
	db BODY_SLAM
	db ANCIENTPOWER
	db CURSE
	db DOUBLE_KICK
	db ENCORE
	db RECOVER
	db -1 ; end

MurkrowEggMoves:
	db WHIRLWIND
	db DRILL_PECK
	db MIRROR_MOVE
	db WING_ATTACK
	db SKY_ATTACK
	db CONFUSE_RAY
	db FAINT_ATTACK
	db SCREECH
	db -1 ; end

MisdreavusEggMoves:
	db SCREECH
	db DESTINY_BOND
	db CURSE
	db SPITE
	db -1 ; end

GirafarigEggMoves:
	db TAKE_DOWN
	db AMNESIA
	db FORESIGHT
	db FUTURE_SIGHT
	db BEAT_UP
	db DOUBLE_KICK
	db MEAN_LOOK
	db -1 ; end

PinecoEggMoves:
	db PIN_MISSILE
	db ENDURE
	db SWIFT
	db COUNTER
	db DOUBLE_EDGE
	db -1 ; end

DunsparceEggMoves:
	db ANCIENTPOWER
	db BITE
	db SNORE
	db AGILITY
	db HEADBUTT
	db -1 ; end

GligarEggMoves:
	db METAL_CLAW
	db WING_ATTACK
	db RAZOR_WIND
	db COUNTER
	db AGILITY
	db BATON_PASS
	db DOUBLE_EDGE
	db -1 ; end

SnubbullEggMoves:
	db DOUBLE_EDGE
	db MIMIC
	db SNORE
	db METRONOME
	db FAINT_ATTACK
	db PRESENT
	db CRUNCH
	db -1 ; end

QwilfishEggMoves:
	db FLAIL
	db HAZE
	db BUBBLEBEAM
	db SUPERSONIC
	db -1 ; end

ShuckleEggMoves:
	db SWEET_SCENT
	db -1 ; end

HeracrossEggMoves:
	db HARDEN
	db BIDE
	db FLAIL
	db SEISMIC_TOSS
	db FALSE_SWIPE
	db DOUBLE_EDGE
	db PURSUIT
	db MEGAHORN
	db -1 ; end

SneaselEggMoves:
	db SPITE
	db FORESIGHT
	db BITE
	db ICE_PUNCH
	db PURSUIT
	db -1 ; end

TeddiursaEggMoves:
	db CRUNCH
	db TAKE_DOWN
	db SEISMIC_TOSS
	db METAL_CLAW
	db PLAY_ROUGH
	db CROSS_CHOP
	db DOUBLE_EDGE
	db -1 ; end

SlugmaEggMoves:
	db ACID_ARMOR
	db CURSE
	db SMOKESCREEN
	db -1 ; end

SwinubEggMoves:
	db TAKE_DOWN
	db BITE
	db BODY_SLAM
	db ANCIENTPOWER
	db DOUBLE_EDGE
	db FISSURE
	db -1 ; end

CorsolaEggMoves:
	db SCREECH
	db MIST
	db AMNESIA
	db BARRIER
	db CONFUSE_RAY
	db CURSE
	db -1 ; end

RemoraidEggMoves:
	db AURORA_BEAM
	db OCTAZOOKA
	db SUPERSONIC
	db HAZE
	db SCREECH
	db FLAIL
	db -1 ; end

DelibirdEggMoves:
	db AURORA_BEAM
	db QUICK_ATTACK
	db FUTURE_SIGHT
	db RAPID_SPIN
	db DESTINY_BOND
	db ICE_PUNCH
	db ICY_WIND
	db -1 ; end

MantineEggMoves:
	db AMNESIA
	db TWISTER
	db HYDRO_PUMP
	db HAZE
	db SLAM
	db MIRROR_COAT
	db CONFUSE_RAY
	db -1 ; end

SkarmoryEggMoves:
	db DRILL_PECK
	db PURSUIT
	db WHIRLWIND
	db SKY_ATTACK
	db CURSE
	db ENDURE
	db -1 ; end

HoundourEggMoves:
	db FIRE_SPIN
	db RAGE
	db PURSUIT
	db COUNTER
	db SPITE
	db REVERSAL
	db BEAT_UP
	db DESTINY_BOND
	db -1 ; end

PhanpyEggMoves:
	db FOCUS_ENERGY
	db BODY_SLAM
	db ANCIENTPOWER
	db PLAY_ROUGH
	db FISSURE
	db MUD_SLAP
	db SNORE
	db -1 ; end

StantlerEggMoves:
	db SPITE
	db DISABLE
	db BITE
	db DOUBLE_KICK
	db MEGAHORN
	db RAGE
	db THRASH
	db -1 ; end

TyrogueEggMoves:
	db RAPID_SPIN
	db HI_JUMP_KICK
	db MACH_PUNCH
	db MIND_READER
	db COUNTER
	db PURSUIT
	db ENDURE
	db -1 ; end

SmoochumEggMoves:
	db MEDITATE
	db ICE_PUNCH
	db -1 ; end

ElekidEggMoves:
	db KARATE_CHOP
	db BARRIER
	db ROLLING_KICK
	db MEDITATE
	db CROSS_CHOP
	db DYNAMICPUNCH
	db FIRE_PUNCH
	db ICE_PUNCH
	db -1 ; end

MagbyEggMoves:
	db KARATE_CHOP
	db MEGA_PUNCH
	db BARRIER
	db SCREECH
	db CROSS_CHOP
	db DYNAMICPUNCH
	db THUNDERPUNCH
	db MACH_PUNCH
	db FOCUS_ENERGY
	db IRON_TAIL
	db -1 ; end

MiltankEggMoves:
	db PRESENT
	db REVERSAL
	db SEISMIC_TOSS
	db ENDURE
	db DOUBLE_EDGE
	db -1 ; end

LarvitarEggMoves:
	db STOMP
	db OUTRAGE
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db CURSE
	db -1 ; end

NoEggMoves:
	db -1 ; end
