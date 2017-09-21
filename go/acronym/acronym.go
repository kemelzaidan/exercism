package acronym

import "strings"

const testVersion = 3

// Abbreviate creates acronyms from strings
func Abbreviate(s string) string {
	upper := strings.ToUpper(s)
	upper = strings.Replace(upper, "-", " ", -1)
	words := strings.Fields(upper)
	var acronym string

	for _, v := range words {
		acronym += string(v[0])
	}
	return acronym
}
