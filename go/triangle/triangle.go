package triangle

import "math"

const testVersion = 3

// KindFromSides says which type is a triangle
// by its sides
func KindFromSides(a, b, c float64) Kind {

	for _, n := range []float64{a, b, c} {
		if math.IsInf(n, 0) || math.IsNaN(n) || n <= 0 {
			return NaT
		}
	}

	if a+b >= c && a+c >= b && b+c >= a {
		if a == b && a == c {
			return Equ
		}
		if a == b || a == c || b == c {
			return Iso
		}
		return Sca
	}
	return NaT
}

// Notice KindFromSides() returns this type. Pick a suitable data type.
type Kind int

// Pick values for the following identifiers used by the test program.
const (
	NaT = iota // not a triangle
	Equ        // equilateral
	Iso        // isosceles
	Sca        // scalene
)

// Organize your code for readability.
