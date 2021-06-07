import semver

fn main() {
	version := "1.1.0"
	is_valid := semver.is_valid(version)

	if is_valid {
		println("$version is valid")
	} else {
		println("$version is not valid")
	}
}
