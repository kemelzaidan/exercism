package leap

const testVersion = 3

var answer bool

// IsLeapYear calculates if a given year is leap.
func IsLeapYear(year int) bool {
	if year%4 == 0 && year%100 != 0 {
		return true
	}
	if year%4 == 0 && year%400 == 0 {
		return true
	} else {
		return false
	}
}
