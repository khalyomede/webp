module test

import webp
import semver

fn test_version_returns_semver() {
	version := webp.version() or {
		panic(err)
	}

	assert semver.is_valid(version)
}
