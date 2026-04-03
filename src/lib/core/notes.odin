package moifu

Position_Ring :: enum u8 {
	A1 = 0x01, A2, A3, A4, A5, A6, A7, A8,
}

Position_Zone :: enum u8 {
	A1 = 0x11, A2, A3, A4, A5, A6, A7, A8,
	B1 = 0x21, B2, B3, B4, B5, B6, B7, B8,
	C1 = 0x31, C2,                         CX = 0x3F,
	D1 = 0x41, D2, D3, D4, D5, D6, D7, D8,
	E1 = 0x51, E2, E3, E4, E5, E6, E7, E8,
}

Any_Note :: union {
	Tap_Note,
	Tap_Hold_Note,
	Tap_Star_Note,
	Touch_Note,
	Touch_Hold_Note,
	Slide_Path,
}

Note_Spawn :: struct {
	tick: Tick_Moment,
	note: Any_Note,
}

Tap_Note :: struct {
	position:  Position_Ring,
	modifiers: Tap_Modifiers,
}

Tap_Modifier :: enum {
	DUMMY,
	HIDDEN,
	BREAK,
	EX,
}
Tap_Modifiers :: distinct bit_set[Tap_Modifier; u8]

Tap_Hold_Note :: struct {
	position:  Position_Ring,
	duration:  Tick_Length,
	modifiers: Tap_Modifiers,
}

Tap_Star_Note :: struct {
	position:  Position_Ring,
	rotation:  Tick_Length,
	modifiers: Tap_Star_Modifiers,
}

Tap_Star_Modifier :: enum {
	DUMMY,
	HIDDEN,
	BREAK,
	EX,
	COMPOUND,
}
Tap_Star_Modifiers :: distinct bit_set[Tap_Star_Modifier; u8]

Touch_Note :: struct {
	position:  Position_Zone,
	modifiers: Touch_Modifiers,
}

Touch_Modifier :: enum {
	DUMMY,
	HIDDEN,
	BIG,
	FIREWORK,
}
Touch_Modifiers :: distinct bit_set[Touch_Modifier; u8]

Touch_Hold_Note :: struct {
	position:  Position_Zone,
	duration:  Tick_Length,
	modifiers: Touch_Modifiers,
}

Slide_Path :: struct {
	position_from:  Position_Ring,
	position_move:  Position_Ring,
	shape:          Slide_Shape,
	delay_duration: Tick_Length,
	trace_duration: Tick_Length,
	modifiers:      Slide_Modifiers,
}

Slide_Shape :: enum {
	STRAIGHT,
	CIRCULAR_ARC_ACW,
	CIRCULAR_ARC_CKW,
	CENTER_BEND,
	INNER_LOOP_ACW,
	INNER_LOOP_CKW,
	OUTER_LOOP_ACW,
	OUTER_LOOP_CKW,
	ZIG_ZAG_ACW,
	ZIG_ZAG_CKW,
	REFLECT_ACW,
	REFLECT_CKW,
	FAN,
}

Slide_Modifier :: enum {
	DUMMY,
	HIDDEN,
	BREAK,
}
Slide_Modifiers :: distinct bit_set[Slide_Modifier; u8]
