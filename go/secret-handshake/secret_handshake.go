package secret

import "strconv"

const testVersion = 2

func Handshake(dec uint) []string {
	var result []string

	m := map[string]string{
		"1":    "wink",
		"10":   "double blink",
		"100":  "close your eyes",
		"1000": "jump",
	}
	n := int64(dec)
	bin := strconv.FormatInt(n, 2)
	result = append(result, m[bin])
	return result
}
