package diffsquares

const testVersion = 1

func SquareOfSums(number int) int {
	var sum int
	for i := 1; i <= number; i++ {
		sum += i
	}
	return sum * sum
}

func SumOfSquares(number int) int {
	var sum int
	for i := 1; i <= number; i++ {
		sum += i * i
	}
	return sum
}

func Difference(n int) int {
	return SquareOfSums(n) - SumOfSquares(n)
}
