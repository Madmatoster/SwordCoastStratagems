///////////////////////////////////////////////////////////////////////
// Ascension : PLAYER1
///////////////////////////////////////////////////////////////////////
// (1) adds a "we're not in the final fight" state trigger to just about
//      every state here
// (2) changes the slayer ability so that you get the new slayer powers
// (3) adds states 55--57 (final battle options)
///////////////////////////////////////////////////////////////////////

REPLACE PLAYER1 

IF ~Global("Slayer10","GLOBAL",1)
!Global("FinalFight","AR6200",4)
!Global("MelStillImmortal","AR6200",2)~ THEN BEGIN 27 // from:
  SAY #55324 
  IF ~~ THEN REPLY #55326 DO ~SetGlobal("Slayer10","GLOBAL",0)~ EXIT
  IF ~XPLT(Player1,2000001)~ THEN REPLY #61320 DO ~IncrementGlobal("SlayerDeath","GLOBAL",1)
SetGlobal("Slayer10","GLOBAL",2)
SetGlobalTimer("TheSlayerTimer","GLOBAL",60)
ReputationInc(-1)
ApplySpell(Player1,SLAYER_CHANGE_TWO)~ EXIT
  IF ~XPLT(Player1,4000001)
XPGT(Player1,2000000)~ THEN REPLY #61320 DO ~IncrementGlobal("SlayerDeath","GLOBAL",1)
SetGlobal("Slayer10","GLOBAL",2)
SetGlobalTimer("TheSlayerTimer","GLOBAL",60)
ReputationInc(-1)
ApplySpellRES("slayer2",Player1)~ JOURNAL @314 /* ~Slayer Ability Changed

It appears my ability to control the transformation to the slayer has increased.  The slayer form itself is stronger, deadlier...and I am able to maintain it for longer.  The chances of going berserk while in the form have also decreased.  ~ #77386 */ EXIT
  IF ~XPGT(Player1,4000000)~ THEN REPLY #61320 DO ~IncrementGlobal("SlayerDeath","GLOBAL",1)
SetGlobal("Slayer10","GLOBAL",2)
SetGlobalTimer("TheSlayerTimer","GLOBAL",60)
ReputationInc(-2)
ApplySpellRES("slayer3",Player1)~ JOURNAL @315 /* ~Slayer Ability Changed Again

My control over the slayer transformation continues to increase.  The slayer has become incredibly immune to harm and most magics, and it appears it is now immune to most diseases, poisons as well as any slow or hasting effects.  Even the slayer's claws now sometimes rip through magical effects and defenses.  ~ #77388 */ EXIT
  IF ~XPGT(Player1,6000000)~ THEN REPLY @317 /* ~I choose to turn into the ravager.~ #77389 */ DO ~IncrementGlobal("SlayerDeath","GLOBAL",1)
SetGlobal("Slayer10","GLOBAL",2)
SetGlobalTimer("TheSlayerTimer","GLOBAL",60)
ReputationInc(-3)
ApplySpellRES("slayer4",Player1)~ JOURNAL @316 /* ~The Ravager Form

I am not sure if this is a good thing or not...but my ability to control my transformation has progressed to the point where I can now become the ravager...optionally.  Although incredibly powerful...the ravager receives half damage from most attacks, is immune to any kind of immobilization or buffeting attack...the ravager is difficult for me to control and may be a danger to those nearby.  ~ #77390 */ EXIT
END

END /* end of: REPLACE PLAYER1 */

