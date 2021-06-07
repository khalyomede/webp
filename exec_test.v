module test

import webp { Options }
import os

fn delete_file(path string) ? {
	if os.exists(path) {
		if !os.is_file(path) {
			return error("$path is not a file.")
		}

		os.rm(path) ?
	}
}

fn test_exec_generate_image() {
	output_path := "misc/fruits.webp"
	input_path := "misc/fruits.png"

	delete_file(output_path) or {
		panic(err)
	}

	webp.exec(Options{
		input: input_path,
		output: output_path
	}) or {
		panic(err)
	}

	assert os.exists(output_path) && os.is_file(output_path) && os.file_size(output_path) < os.file_size(input_path)
}
