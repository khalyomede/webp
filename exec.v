module webp

import os

pub fn exec(options Options) ? {
	cmd := webp.command(options) ?
	result := os.execute(cmd)

	if result.exit_code != 0 {
		return error(result.output)
	}
}
