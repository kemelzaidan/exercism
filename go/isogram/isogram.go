package isogram

import (
	"strings"
	"unicode"
)

// IsIsogram tells you whether passed word is an Isogram or not.
func IsIsogram(word string) bool {
	upperCase := strings.ToUpper(word)
	m := make(map[rune]bool)
	for _, letter := range upperCase {
		if unicode.IsLetter(letter) {
			if m[letter] == true {
				return false
			}
			m[letter] = true
		}
	}

	return true
}
