// Package twofer Interpolates the string
// "One for X, one for me." where "X" is a given name.
package twofer

// ShareWith returns the string
// If no argument is given, "you" is used
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return "One for " + name + ", one for me."
}
