package hamming

import "errors"

const testVersion = 6

// Distance calculates the difference between two
// DNA streams passed as arguments
func Distance(a, b string) (int, error) {
	var acc int
	if len(a) != len(b) {
		return -1, errors.New("both strings should have the same size")
	}

	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			acc++
		}
	}
	return acc, nil
}
