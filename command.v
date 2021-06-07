module webp

pub fn command(options Options) ?string {
	mut command_parts := [
		"cwebp"
	]

	// lossless
	if options.lossless {
		command_parts << "-lossless"
	}

	// near_lossless
	if options.near_lossless != -999 {
		if options.near_lossless < 0 || options.near_lossless > 100 {
			return error("webp: Option near_lossless must be between 0 and 100.")
		}

		command_parts << "-near_lossless"
		command_parts << options.near_lossless.str()
	}

	// q
	if options.quality != -999 {
		if options.quality < 0 || options.quality > 100 {
			return error("webp: Option quality must be between 0 and 100.")
		}

		command_parts << "-q"
		command_parts << options.quality.str()
	}

	// -z
	if options.compression_mode != -999 {
		if options.compression_mode < 0 || options.compression_mode > 9 {
			return error("webp: Option compression_mode must be between 0 and 9.")
		}

		command_parts << "-z"
		command_parts << options.compression_mode.str()
	}

	// -alpha_q
	if options.alpha_quality != -999 {
		if options.alpha_quality < 0 || options.alpha_quality > 100 {
			return error("webp: Option alpha_quality must be between 0 and 100.")
		}

		command_parts << "-alpha_q"
		command_parts << options.alpha_quality.str()
	}

	// -preset
	if options.preset != Preset.@none {
		preset := match options.preset {
			.@none {
				""
			}

			._default {
				"default"
			}

			.photo {
				"photo"
			}

			.picture {
				"picture"
			}

			.drawing {
				"drawing"
			}

			.icon {
				"icon"
			}

			.text {
				"text"
			}
		}

		command_parts << "-preset"
		command_parts << preset
	}

	// -m
	if options.compression_method != -999 {
		if options.compression_method < 0 || options.compression_method > 6 {
			return error("webp: Option compression_method must be between 0 and 6.")
		}

		command_parts << "-m"
		command_parts << options.compression_method.str()
	}

	// -resize
	if !(options.resize.width == 0 && options.resize.height == 0) {
		if options.resize.width < 0 {
			return error("webp: Option resize.width must be above 0.")
		}

		if options.resize.height < 0 {
			return error("webp: Option resize.height must be above 0.")
		}

		command_parts << "-resize"
		command_parts << options.resize.width.str()
		command_parts << options.resize.height.str()
	}

	// -crop
	if !(options.crop.x_position == 0 && options.crop.y_position == 0 && options.crop.width == 0 && options.crop.height == 0) {
		if options.crop.width < 0 {
			return error("webp: Option crop.width must be above 0.")
		}

		if options.crop.height < 0 {
			return error("webp: Option crop.height must be above 0.")
		}

		command_parts << "-crop"
		command_parts << options.crop.x_position.str()
		command_parts << options.crop.y_position.str()
		command_parts << options.crop.width.str()
		command_parts << options.crop.height.str()
	}

	// -mt
	if options.multi_threading {
		command_parts << "-mt"
	}

	// -low_memory
	if options.low_memory {
		command_parts << "-low_memory"
	}

	// -size
	if options.size != -999 {
		if options.size <= 0 {
			return error("webp: Option size must be above 0.")
		}

		command_parts << "-size"
		command_parts << options.size.str()
	}

	// -psnr
	if options.psnr != -999 {
		command_parts << "-psnr"
		command_parts << options.psnr.str()
	}

	// -pass
	if options.pass != -999 {
		if options.pass < 1 || options.pass > 10 {
			return error("webp: Option pass must be between 1 and 10.")
		}

		command_parts << "-pass"
		command_parts << options.pass.str()
	}

	// -af
	if options.auto_filter {
		command_parts << "-af"
	}

	// -jpeg_like
	if options.jpeg_like {
		command_parts << "-jpeg_like"
	}

	// -f
	if options.deblocking_filter_strength != -999 {
		if options.deblocking_filter_strength < 0 || options.deblocking_filter_strength > 100 {
			return error("webp: Option deblocking_filter_strength must be between 0 and 100.")
		}

		command_parts << "-f"
		command_parts << options.deblocking_filter_strength.str()
	}

	// -sharpness
	if options.sharpness != -999 {
		if options.sharpness < 0 || options.sharpness > 7 {
			return error("webp: Option sharpness must be between 0 and 7.")
		}

		command_parts << "-sharpness"
		command_parts << options.sharpness.str()
	}

	// -nostrong
	if options.nostrong {
		command_parts << "-nostrong"
	}

	// -sharp_yuv
	if options.sharp_yuv {
		command_parts << "-sharp_yuv"
	}

	// -sns
	if options.spatial_noise_shaping != -999 {
		if options.spatial_noise_shaping < 0 || options.spatial_noise_shaping > 100 {
			return error("webp: Option spatial_noise_shaping must be between 0 and 100.")
		}

		command_parts << "-sns"
		command_parts << options.spatial_noise_shaping.str()
	}

	// -segments
	if options.segments != -999 {
		if options.segments < 1 || options.segments > 4 {
			return error("webp: Option segments must be between 1 and 4.")
		}

		command_parts << "-segments"
		command_parts << options.segments.str()
	}

	// -partition_limit
	if options.partition_limit != -999 {
		if options.partition_limit < 0 || options.partition_limit > 100 {
			return error("webp: Option partition_limit must be between 0 and 100.")
		}

		command_parts << "-partition_limit"
		command_parts << options.partition_limit.str()
	}

	// -partition_limit
	if options.pre_processing != -999 {
		if options.pre_processing < 1 {
			return error("webp: Option pre_processing must be above 0.")
		}

		command_parts << "-pre"
		command_parts << options.pre_processing.str()
	}

	// -alpha_filter
	if options.alpha_filter != AlphaFilter.fast {
		command_parts << "-alpha_filter"
		command_parts << match options.alpha_filter {
			.@none {
				"none"
			}

			.fast {
				"fast"
			}

			.best {
				"best"
			}
		}
	}

	// -alpha_method
	if options.alpha_method != -999 {
		if options.alpha_method < 0 || options.alpha_method > 1 {
			return error("webp: Option alpha_method must be between 0 and 1.")
		}

		command_parts << "-alpha_method"
		command_parts << options.alpha_method.str()
	}

	// -exact
	if options.exact {
		command_parts << "-exact"
	}

	// -blend_alpha
	if options.blend_alpha != -999 {
		if options.blend_alpha < 0 || options.blend_alpha > 255 {
			return error("webp: Option blend_alpha must be between 0 and 255.")
		}

		command_parts << "-blend_alpha"
		command_parts << options.blend_alpha.str()
	}

	// -noalpha
	if options.noalpha {
		command_parts << "-noalpha"
	}

	// -hint
	if options.hint != Hint.@none {
		command_parts << "-hint"
		command_parts << match options.hint {
			.@none {
				""
			}

			.photo {
				"photo"
			}

			.picture {
				"picture"
			}

			.graph {
				"graph"
			}
		}
	}

	// -metadata
	if options.metadata != Metadata.@none {
		command_parts << "-metadata"
		command_parts << match options.metadata {
			.all {
				"all"
			}

			.@none {
				"none"
			}

			.exif {
				"exif"
			}

			.icc {
				"icc"
			}

			.xmp {
				"xmp"
			}
		}
	}

	// -noasm
	if options.noasm {
		command_parts << "-noasm"
	}

	command_parts << "-o"
	command_parts << options.output
	command_parts << options.input

	return command_parts.join(" ")
}
