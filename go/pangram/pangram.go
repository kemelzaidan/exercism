package pangram

import "strings"

const testVersion = 2

// IsPangram finds if a given string
// uses all letters in the alphabet
func IsPangram(s string) bool {
	upper := strings.ToUpper(s)
	for i := 'A'; i <= 'Z'; i++ {
		if strings.Index(upper, string(i)) < 0 {
			return false
		}
	}
	return true
}
