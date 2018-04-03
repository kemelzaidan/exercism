package isogram

import "strings"

// IsIsogram finds out if a word is a isogram
func IsIsogram(word string) bool {
	var count = make(map[rune]int)

	// creates a count map with the count of letters in a word
	for _, letter := range strings.ToLower(word) {
		_, ok := count[letter]
		if ok {
			count[letter]++
		} else {
			if letter != '-' && letter != ' ' {
				count[letter] = 1
			}
		}
	}

	result := 0

	for _, value := range count {
		if value > result {
			result = value
		}
	}

	if result > 1 {
		return false
	} else {
		return true
	}
}
