	org 32768
__START_PROGRAM:
	di
	push ix
	push iy
	exx
	push hl
	exx
	ld hl, 0
	add hl, sp
	ld (__CALL_BACK__), hl
	ei
	jp __MAIN_PROGRAM__
ZXBASIC_USER_DATA:
	; Defines USER DATA Length in bytes
ZXBASIC_USER_DATA_LEN EQU ZXBASIC_USER_DATA_END - ZXBASIC_USER_DATA
	.__LABEL__.ZXBASIC_USER_DATA_LEN EQU ZXBASIC_USER_DATA_LEN
	.__LABEL__.ZXBASIC_USER_DATA EQU ZXBASIC_USER_DATA
_a:
	DEFW __LABEL0
_a.__DATA__.__PTR__:
	DEFW _a.__DATA__
_a.__DATA__:
	DEFB 00h
	DEFB 00h
	DEFB 00h
	DEFB 00h
	DEFB 00h
	DEFB 00h
	DEFB 00h
	DEFB 00h
	DEFB 00h
	DEFB 00h
	DEFB 00h
	DEFB 00h
__LABEL0:
	DEFW 0001h
	DEFW 0004h
	DEFB 01h
_b:
	DEFW __LABEL1
_b.__DATA__.__PTR__:
	DEFW _b.__DATA__
_b.__DATA__:
	DEFB 0A0h
	DEFB 0A1h
	DEFB 0A2h
	DEFB 0A3h
	DEFB 0B0h
	DEFB 0B1h
	DEFB 0B2h
	DEFB 0B3h
	DEFB 0C0h
	DEFB 0C1h
	DEFB 0C2h
	DEFB 0C3h
__LABEL1:
	DEFW 0001h
	DEFW 0004h
	DEFB 01h
ZXBASIC_USER_DATA_END:
__MAIN_PROGRAM__:
	ld hl, 12
	ld b, h
	ld c, l
	ld hl, _b.__DATA__
	ld de, _a.__DATA__
	ldir
	ld hl, 0
	ld b, h
	ld c, l
__END_PROGRAM:
	di
	ld hl, (__CALL_BACK__)
	ld sp, hl
	exx
	pop hl
	exx
	pop iy
	pop ix
	ei
	ret
__CALL_BACK__:
	DEFW 0
	END
