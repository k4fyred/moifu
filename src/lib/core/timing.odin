package moifu

Tick_Moment :: distinct i64
Tick_Length :: enum i64 {
	INSTANT = 0,
	FOREVER = max(i64),
}

Resolution :: struct {
	ticks_per_quarter: int,
}

Meter :: struct {
	beats_per_measure: int,
	beat_unit:         int,
}

Meter_Change :: struct {
	tick:  Tick_Moment,
	meter: Meter,
}

Tempo :: struct {
	beats_per_minute: f64,
}

Tempo_Change :: struct {
	tick:  Tick_Moment,
	tempo: Tempo,
}

Timing_Context :: struct {
	resolution: Resolution,
	meter_map:  [dynamic]Meter_Change,
	tempo_map:  [dynamic]Tempo_Change,
}
