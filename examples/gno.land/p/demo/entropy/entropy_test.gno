package entropy

import (
	"strconv"
	"testing"
)

func TestInstance(t *testing.T) {
	instance := New()
	if instance == nil {
		t.Errorf("instance should not be nil")
	}
}

func TestInstanceValue(t *testing.T) {
	baseEntropy := New()
	baseResult := computeValue(t, baseEntropy)

	sameHeightEntropy := New()
	sameHeightResult := computeValue(t, sameHeightEntropy)

	if baseResult != sameHeightResult {
		t.Errorf("should have the same result: new=%s, base=%s", sameHeightResult, baseResult)
	}

	testing.SkipHeights(1)
	differentHeightEntropy := New()
	differentHeightResult := computeValue(t, differentHeightEntropy)

	if baseResult == differentHeightResult {
		t.Errorf("should have different result: new=%s, base=%s", differentHeightResult, baseResult)
	}
}

func TestInstanceValue64(t *testing.T) {
	baseEntropy := New()
	baseResult := computeValue64(t, baseEntropy)

	sameHeightEntropy := New()
	sameHeightResult := computeValue64(t, sameHeightEntropy)

	if baseResult != sameHeightResult {
		t.Errorf("should have the same result: new=%s, base=%s", sameHeightResult, baseResult)
	}

	testing.SkipHeights(1)
	differentHeightEntropy := New()
	differentHeightResult := computeValue64(t, differentHeightEntropy)

	if baseResult == differentHeightResult {
		t.Errorf("should have different result: new=%s, base=%s", differentHeightResult, baseResult)
	}
}

func computeValue(t *testing.T, r *Instance) string {
	t.Helper()

	out := ""
	for i := 0; i < 10; i++ {
		val := int(r.Value())
		out += strconv.Itoa(val) + " "
	}

	return out
}

func computeValue64(t *testing.T, r *Instance) string {
	t.Helper()

	out := ""
	for i := 0; i < 10; i++ {
		val := int(r.Value64())
		out += strconv.Itoa(val) + " "
	}

	return out
}
