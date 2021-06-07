module webp

import os

pub fn version() ?string {
	result := os.execute("cwebp -version")

	if result.exit_code != 0 {
		return error(result.output)
	}

	return result.output.replace("\n", "")
}
