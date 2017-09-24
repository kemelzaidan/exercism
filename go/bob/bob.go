// Package bob does stuff.
package bob

import "strings"

const testVersion = 3

// Hey attempts to pass a Turing test
func Hey(s string) (out string) {
	s = strings.TrimSpace(s)
	if s == "" {
		return "Fine. Be that way!"
	}
	if strings.ToUpper(s) == s && strings.ToLower(s) != s {
		return "Whoa, chill out!"
	}
	if strings.HasSuffix(s, "?") {
		return "Sure."
	}

	return "Whatever."
}
