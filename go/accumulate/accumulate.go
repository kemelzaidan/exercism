package accumulate

const testVersion = 1

// Accumulate a collection to given function
func Accumulate(a []string, f func(string) string) []string {
	var result []string
	for _, value := range a {
		result = append(result, f(value))
	}
	return result
}
