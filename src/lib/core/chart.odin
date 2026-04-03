package moifu

Chart_Set :: struct {
	title:        string,
	music_author: string,
	chart_author: string,

	sheets: [dynamic]Chart_Sheet,
}

Chart_Sheet :: struct {
	title:        string,
	music_author: string,
	chart_author: string,

	tag:   Tag,
	level: Level,

	timing_context: Timing_Context,
	note_events:    [dynamic]Note_Spawn,
}

Level :: struct {
	label: string,
	value: int, // Fixed-point number 0.0 ~ 15.0
}

Tag :: union {
	string,
	Difficulty,
}

Difficulty :: enum {
	// Maimai difficulties
	EASY      = 1,
	BASIC     = 2,
	ADVANCED  = 3,
	EXPERT    = 4,
	MASTER    = 5,
	RE_MASTER = 6,
	UTAGE     = 9,

	// Chunithm equivalent (for the sake of Kanji color code)
	ULTIMA    = RE_MASTER,
}
