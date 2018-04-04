package reverse

// String reverses a string
func String(word string) string {
	var runes []rune
	wordArray := []rune(word)
	for i := len(wordArray) - 1; i >= 0; i-- {
		runes = append(runes, wordArray[i])
	}
	return string(runes)
}
