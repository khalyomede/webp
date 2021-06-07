module webp

/*
see: https://developers.google.com/speed/webp/docs/cwebp
*/
pub struct Options {
	input string [required]
	output string [required]
	lossless bool
	near_lossless int = -999

	// -q
	quality int = -999

	// -z
	compression_mode int = -999

	// -alpha_q
	alpha_quality int = -999
	preset Preset = Preset.@none

	//-m
	compression_method int = -999

	resize Resize = Resize{}

	crop Crop = Crop{
		x_position: 0,
		y_position: 0,
		width: 0,
		height: 0
	}

	// -mt
	multi_threading bool

	low_memory bool

	size int = -999

	psnr f64 = -999

	pass int = -999

	// -af
	auto_filter bool

	jpeg_like bool

	// -f
	deblocking_filter_strength int = -999

	sharpness int = -999

	// -nostrong
	nostrong bool

	sharp_yuv bool

	spatial_noise_shaping int = -999

	segments int = -999

	partition_limit int = -999

	pre_processing int = -999

	alpha_filter AlphaFilter = AlphaFilter.fast

	alpha_method int = -999

	exact bool

	blend_alpha int = -999

	noalpha bool

	hint Hint = Hint.@none

	metadata Metadata = Metadata.@none

	noasm bool
}
