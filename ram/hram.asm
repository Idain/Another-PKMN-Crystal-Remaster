SECTION "HRAM", HRAM

hROMBankBackup:: db
hBuffer::
hFarByte::
hTempBank:: db
hSRAMBank:: db

hRTCDayHi::   db
hRTCDayLo::   db
hRTCHours::   db
hRTCMinutes:: db
hRTCSeconds:: db

	ds 2

hHours:: db
	ds 1
hMinutes:: db
	ds 1
hSeconds:: db

hLZAddress:: dw

hVBlankCounter:: db

	ds 1

hROMBank:: db
hVBlank:: db
hMapEntryMethod:: db

hMenuReturn:: db
	ds 1

hJoypadReleased:: db
hJoypadPressed::  db
hJoypadDown::     db
hJoypadSum::      db
hJoyReleased::    db
hJoyPressed::     db
hJoyDown::        db
hJoyLast::        db

hInMenu:: db

	ds 1

hPrinter:: db
hGraphicStartTile:: db
hMoveMon:: db

UNION
hMapObjectIndex:: db
hObjectStructIndex:: db
NEXTU
hConnectionStripLength:: db
hConnectedMapWidth:: db
ENDU

hEnemyMonSpeed:: dw

UNION
; math-related values

UNION
; inputs to Multiply
	ds 1
hMultiplicand:: ds 3
hMultiplier::   db
NEXTU
; result of Multiply
hProduct::      ds 4
NEXTU
; inputs to Divide
hDividend::     ds 4
hDivisor::      db
NEXTU
; results of Divide
hQuotient::     ds 4
hRemainder::    db
ENDU

hMathBuffer:: ds 5

NEXTU
; PrintNum scratch space
hPrintNumBuffer:: ds 10

NEXTU
; Mystery Gift
hMGExchangedByte:: db
hMGExchangedWord:: dw
hMGNumBits:: db
hMGChecksum:: dw
	ds 2
hMGRole:: db
hMGStatusFlags:: db
ENDU

UNION
hUsedSpriteIndex:: db
hUsedSpriteTile::  db
NEXTU
hCurSpriteXCoord::   db
hCurSpriteYCoord::   db
hCurSpriteXPixel::   db
hCurSpriteYPixel::   db
hCurSpriteTile::     db
hCurSpriteOAMFlags:: db
ENDU

UNION
hMoneyTemp:: ds 3
NEXTU
hTmpd:: db
hTmpe:: db
	ds 1
NEXTU
hMGJoypadPressed::  db
hMGJoypadReleased:: db
hMGPrevTIMA::       db
ENDU

hLCDCPointer::     db
hLYOverrideStart:: db
hLYOverrideEnd::   db
hLYOverrideStackCopyAmount:: db

hMobileReceive::             db
hSerialReceivedNewData::     db
hSerialConnectionStatus::    db
hSerialIgnoringInitialData:: db
hSerialSend::                db
hSerialReceive::             db

hSCX::           db
hSCY::           db
hWX::            db
hWY::            db
hTilesPerCycle:: db
hBGMapMode::     db
hBGMapHalf::     db
hBGMapAddress::  dw

hOAMUpdate:: db

hSPBuffer::  dw

hBGMapUpdate::    db
hBGMapTileCount:: db

hMapAnims::      db
hTileAnimFrame:: db

hLastTalked:: db

hRandomAdd:: db
hRandomSub:: db

	ds 1

hBattleTurn::
; Which trainer's turn is it? 0: player, 1: opponent trainer
	db

hCGBPalUpdate:: db
hCGB::          db
hSGB::          db

hDMATransfer:: db
hMobile:: db
hSystemBooted:: db

if DEF(_DEBUG)
hDebugRoomMenuPage::
endc
	ds 1

hRequested2bppSize:: db
hRequested1bppSize:: db
hRequestedVTileSource:: dw
hRequestedVTileDest::   dw

hPredefID:: db
hPredefHL:: dw
hPredefAddress:: dw
hFarCallSavedA:: db

	ds 7
