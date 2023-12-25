.set sp, 1

.extern continueFromFlagObjCheck
.extern returnFromFlagObjCheck

.global fix38WithJumpCoin

.text

fix38WithJumpCoin:
	# hacky fix because I can't figure out how to do it the right way
	
	# check actor type for EN_COIN_JUMP
	lhz r0, 8(r3)
	cmplwi r0, 403
	beq isExemptedActor
	# and EN_COIN
	cmplwi r0, 401
	beq isExemptedActor
	# and EN_HATENA_BALLOON
	cmplwi r0, 221
	beq isExemptedActor
	
	# it wasn't that, so just return 0
	li r3, 0
	b returnFromFlagObjCheck

.global fixLightmapsForDolphin # fuck you it goes here now
fixLightmapsForDolphin:
	li r4, 5
    stb r4, 0xc(r3)
    li r4, 1
    stb r4, 0xd(r3)
    li r4, 0
    blr

isExemptedActor:
	b continueFromFlagObjCheck

.global PreventW5Vine
PreventW5Vine:
	li r3, 1
	blr