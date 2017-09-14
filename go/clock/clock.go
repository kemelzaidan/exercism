package clock

import (
	"fmt"
)

const testVersion = 4

// Clock has hours and minutes
type Clock struct {
	Hour, Minute int
}

// New creates a new Clock
func New(hour, minute int) Clock {
	h, m := calculate(hour, minute)
	return Clock{Hour: h, Minute: m}
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.Hour, c.Minute)
}

// Add sums minutes to a given Clock
func (c Clock) Add(minutes int) Clock {
	h, m := calculate(c.Hour, c.Minute+minutes)
	return Clock{Hour: h, Minute: m}
}

func calculate(hour, minute int) (h int, m int) {
	minute += hour * 60
	h, m = minute/60, minute%60
	if m < 0 {
		m += 60
		h--
	}
	h = h % 24
	if h < 0 {
		h += 24
	}
	return h, m
}
