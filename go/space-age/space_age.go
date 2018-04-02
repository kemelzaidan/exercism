package space

const earthYears = 31557600

// Planet describes planet name
type Planet string

var planetYear = map[Planet]float64{
	"Earth":   1,
	"Mercury": 0.2408467,
	"Venus":   0.61519726,
	"Mars":    1.8808158,
	"Jupiter": 11.862615,
	"Saturn":  29.447498,
	"Uranus":  84.016846,
	"Neptune": 164.79132,
}

// Age receives seconds and a planet and returns the age on that planet
func Age(second float64, planetName Planet) float64 {

	result := second / (earthYears * planetYear[planetName])
	return result
}
