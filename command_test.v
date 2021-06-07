module test

import webp { Options, Preset, AlphaFilter, Hint, Metadata }

fn test_command_generate_basic_command() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp"
	}) or {
		err
	}

	assert cmd == "cwebp -o misc/fruits.webp misc/fruits.png"
}

// lossless
fn test_command_generate_lossless_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		lossless: true
	}) or {
		err
	}

	assert cmd == "cwebp -lossless -o misc/fruits.webp misc/fruits.png"
}

// near_lossless
fn test_command_generate_near_lossles_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		near_lossless: 60,
	}) or {
		err
	}

	assert cmd == "cwebp -near_lossless 60 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_near_lossless_option_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		near_lossless: -12,
	}) or {
		err
	}

	assert cmd == "webp: Option near_lossless must be between 0 and 100."
}

fn test_command_returns_error_if_near_lossless_above_hundred() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		near_lossless: 112,
	}) or {
		err
	}

	assert cmd == "webp: Option near_lossless must be between 0 and 100."
}

// q
fn test_command_generate_quality_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		quality: 60,
	}) or {
		err
	}

	assert cmd == "cwebp -q 60 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_quality_option_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		quality: -12,
	}) or {
		err
	}

	assert cmd == "webp: Option quality must be between 0 and 100."
}

fn test_command_returns_error_if_quality_above_hundred() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		quality: 112,
	}) or {
		err
	}

	assert cmd == "webp: Option quality must be between 0 and 100."
}

// -z
fn test_command_generate_compression_mode_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		compression_mode: 6,
	}) or {
		err
	}

	assert cmd == "cwebp -z 6 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_compression_mode_option_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		compression_mode: -12,
	}) or {
		err
	}

	assert cmd == "webp: Option compression_mode must be between 0 and 9."
}

fn test_command_returns_error_if_compression_mode_above_hundred() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		compression_mode: 112,
	}) or {
		err
	}

	assert cmd == "webp: Option compression_mode must be between 0 and 9."
}

// -alpha_q
fn test_command_generate_alpha_quality_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		alpha_quality: 60,
	}) or {
		err
	}

	assert cmd == "cwebp -alpha_q 60 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_alpha_quality_option_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		alpha_quality: -12,
	}) or {
		err
	}

	assert cmd == "webp: Option alpha_quality must be between 0 and 100."
}

fn test_command_returns_error_if_alpha_quality_above_hundred() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		alpha_quality: 112,
	}) or {
		err
	}

	assert cmd == "webp: Option alpha_quality must be between 0 and 100."
}

// preset
fn test_command_generate_default_preset_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		preset: Preset._default,
	}) or {
		err
	}

	assert cmd == "cwebp -preset default -o misc/fruits.webp misc/fruits.png"
}

fn test_command_generate_photo_preset_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		preset: Preset.photo,
	}) or {
		err
	}

	assert cmd == "cwebp -preset photo -o misc/fruits.webp misc/fruits.png"
}

fn test_command_generate_picture_preset_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		preset: Preset.picture,
	}) or {
		err
	}

	assert cmd == "cwebp -preset picture -o misc/fruits.webp misc/fruits.png"
}

fn test_command_generate_drawing_preset_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		preset: Preset.drawing,
	}) or {
		err
	}

	assert cmd == "cwebp -preset drawing -o misc/fruits.webp misc/fruits.png"
}

fn test_command_generate_icon_preset_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		preset: Preset.icon,
	}) or {
		err
	}

	assert cmd == "cwebp -preset icon -o misc/fruits.webp misc/fruits.png"
}

fn test_command_generate_text_preset_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		preset: Preset.text,
	}) or {
		err
	}

	assert cmd == "cwebp -preset text -o misc/fruits.webp misc/fruits.png"
}

// -m
fn test_command_generate_compression_method_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		compression_method: 4,
	}) or {
		err
	}

	assert cmd == "cwebp -m 4 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_compression_method_option_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		compression_method: -12,
	}) or {
		err
	}

	assert cmd == "webp: Option compression_method must be between 0 and 6."
}

fn test_command_returns_error_if_compression_method_above_hundred() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		compression_method: 112,
	}) or {
		err
	}

	assert cmd == "webp: Option compression_method must be between 0 and 6."
}

// -resize
fn test_command_returns_resize_with_width_only() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		resize: {
			width: 680,
		}
	}) or {
		err
	}

	assert cmd == "cwebp -resize 680 0 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_resize_with_height_only() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		resize: {
			height: 680,
		}
	}) or {
		err
	}

	assert cmd == "cwebp -resize 0 680 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_resize_with_width_and_height() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		resize: {
			width: 1920,
			height: 1080
		}
	}) or {
		err
	}

	assert cmd == "cwebp -resize 1920 1080 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_width_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		resize: {
			width: -12,
		}
	}) or {
		err
	}

	assert cmd == "webp: Option resize.width must be above 0."
}

fn test_command_returns_error_if_height_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		resize: {
			height: -12,
		}
	}) or {
		err
	}

	assert cmd == "webp: Option resize.height must be above 0."
}

// -crop
fn test_command_returns_crop() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		crop: {
			x_position: 0,
			y_position: 100
			width: 600,
			height: 800
		}
	}) or {
		err
	}

	assert cmd == "cwebp -crop 0 100 600 800 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_crop_width_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		crop: {
			x_position: 0,
			y_position: 100
			width: -600,
			height: 800
		}
	}) or {
		err
	}

	assert cmd == "webp: Option crop.width must be above 0."
}

fn test_command_returns_error_if_crop_height_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		crop: {
			x_position: 0,
			y_position: 100
			width: 600,
			height: -800
		}
	}) or {
		err
	}

	assert cmd == "webp: Option crop.height must be above 0."
}

// -mt
fn test_command_returns_multi_threading() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		multi_threading: true
	}) or {
		err
	}

	assert cmd == "cwebp -mt -o misc/fruits.webp misc/fruits.png"
}

// -low_memory
fn test_command_returns_low_memory() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		low_memory: true
	}) or {
		err
	}

	assert cmd == "cwebp -low_memory -o misc/fruits.webp misc/fruits.png"
}

// -size
fn test_command_returns_size() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		size: 24000
	}) or {
		err
	}

	assert cmd == "cwebp -size 24000 -o misc/fruits.webp misc/fruits.png"
}


fn test_command_returns_error_if_size_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		size: -24000
	}) or {
		err
	}

	assert cmd == "webp: Option size must be above 0."
}

// -pnsr
fn test_command_returns_psnr() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		psnr: 68
	}) or {
		err
	}

	assert cmd == "cwebp -psnr 68. -o misc/fruits.webp misc/fruits.png"
}

// -pass
fn test_command_returns_pass() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		pass: 6
	}) or {
		err
	}

	assert cmd == "cwebp -pass 6 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_pass_below_one() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		pass: -1
	}) or {
		err
	}

	assert cmd == "webp: Option pass must be between 1 and 10."
}

fn test_command_returns_error_if_pass_above_ten() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		pass: 11
	}) or {
		err
	}

	assert cmd == "webp: Option pass must be between 1 and 10."
}

// -af
fn test_command_returns_auto_filter() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		auto_filter: true
	}) or {
		err
	}

	assert cmd == "cwebp -af -o misc/fruits.webp misc/fruits.png"
}

// -jpeg_like
fn test_command_returns_jpeg_like() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		jpeg_like: true
	}) or {
		err
	}

	assert cmd == "cwebp -jpeg_like -o misc/fruits.webp misc/fruits.png"
}

// -f
fn test_command_returns_deblocking_filter_strength() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		deblocking_filter_strength: 20
	}) or {
		err
	}

	assert cmd == "cwebp -f 20 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_deblocking_filter_strength_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		deblocking_filter_strength: -20
	}) or {
		err
	}

	assert cmd == "webp: Option deblocking_filter_strength must be between 0 and 100."
}

fn test_command_returns_error_if_deblocking_filter_strength_above_hundred() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		deblocking_filter_strength: 120
	}) or {
		err
	}

	assert cmd == "webp: Option deblocking_filter_strength must be between 0 and 100."
}

// -sharpness
fn test_command_returns_sharpness() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		sharpness: 5
	}) or {
		err
	}

	assert cmd == "cwebp -sharpness 5 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_sharpness_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		sharpness: -20
	}) or {
		err
	}

	assert cmd == "webp: Option sharpness must be between 0 and 7."
}

fn test_command_returns_error_if_sharpness_above_hundred() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		sharpness: 120
	}) or {
		err
	}

	assert cmd == "webp: Option sharpness must be between 0 and 7."
}

// -nostrong
fn test_command_returns_nostrong() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		nostrong: true
	}) or {
		err
	}

	assert cmd == "cwebp -nostrong -o misc/fruits.webp misc/fruits.png"
}

// -sharp_yuv
fn test_command_returns_sharp_yuv() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		sharp_yuv: true
	}) or {
		err
	}

	assert cmd == "cwebp -sharp_yuv -o misc/fruits.webp misc/fruits.png"
}

// -sns
fn test_command_returns_spatial_noise_shaping() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		spatial_noise_shaping: 20
	}) or {
		err
	}

	assert cmd == "cwebp -sns 20 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_spatial_noise_shaping_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		spatial_noise_shaping: -20
	}) or {
		err
	}

	assert cmd == "webp: Option spatial_noise_shaping must be between 0 and 100."
}

fn test_command_returns_error_if_spatial_noise_shaping_above_hundred() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		spatial_noise_shaping: 120
	}) or {
		err
	}

	assert cmd == "webp: Option spatial_noise_shaping must be between 0 and 100."
}

// -segments
fn test_command_returns_segments() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		segments: 3
	}) or {
		err
	}

	assert cmd == "cwebp -segments 3 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_segments_below_one() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		segments: -20
	}) or {
		err
	}

	assert cmd == "webp: Option segments must be between 1 and 4."
}

fn test_command_returns_error_if_segments_above_four() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		segments: 120
	}) or {
		err
	}

	assert cmd == "webp: Option segments must be between 1 and 4."
}

// -partition_limit
fn test_command_returns_partition_limit() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		partition_limit: 20
	}) or {
		err
	}

	assert cmd == "cwebp -partition_limit 20 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_partition_limit_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		partition_limit: -20
	}) or {
		err
	}

	assert cmd == "webp: Option partition_limit must be between 0 and 100."
}

fn test_command_returns_error_if_partition_limit_above_hundred() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		partition_limit: 120
	}) or {
		err
	}

	assert cmd == "webp: Option partition_limit must be between 0 and 100."
}

// -pre_processing
fn test_command_returns_pre_processing() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		pre_processing: 2
	}) or {
		err
	}

	assert cmd == "cwebp -pre 2 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_pre_processing_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		pre_processing: -20
	}) or {
		err
	}

	assert cmd == "webp: Option pre_processing must be above 0."
}

// -alpha_filter
fn test_command_returns_alpha_filter() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		alpha_filter: AlphaFilter.best
	}) or {
		err
	}

	assert cmd == "cwebp -alpha_filter best -o misc/fruits.webp misc/fruits.png"
}

// -alpha_method
fn test_command_generate_alpha_method_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		alpha_method: 1,
	}) or {
		err
	}

	assert cmd == "cwebp -alpha_method 1 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_alpha_method_option_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		alpha_method: -12,
	}) or {
		err
	}

	assert cmd == "webp: Option alpha_method must be between 0 and 1."
}

fn test_command_returns_error_if_alpha_method_above_hundred() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		alpha_method: 112,
	}) or {
		err
	}

	assert cmd == "webp: Option alpha_method must be between 0 and 1."
}

// -exact
fn test_command_generate_exact_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		exact: true,
	}) or {
		err
	}

	assert cmd == "cwebp -exact -o misc/fruits.webp misc/fruits.png"
}

// -blend_alpha
fn test_command_generate_blend_alpha_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		blend_alpha: 1,
	}) or {
		err
	}

	assert cmd == "cwebp -blend_alpha 1 -o misc/fruits.webp misc/fruits.png"
}

fn test_command_returns_error_if_blend_alpha_option_below_zero() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		blend_alpha: -12,
	}) or {
		err
	}

	assert cmd == "webp: Option blend_alpha must be between 0 and 255."
}

fn test_command_returns_error_if_blend_alpha_above_hundred() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		blend_alpha: 300,
	}) or {
		err
	}

	assert cmd == "webp: Option blend_alpha must be between 0 and 255."
}

// noalpha
fn test_command_generate_noalpha_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		noalpha: true,
	}) or {
		err
	}

	assert cmd == "cwebp -noalpha -o misc/fruits.webp misc/fruits.png"
}

// -hint
fn test_command_generate_hint_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		hint: Hint.photo,
	}) or {
		err
	}

	assert cmd == "cwebp -hint photo -o misc/fruits.webp misc/fruits.png"
}

// -metadata
fn test_command_generate_metadata_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		metadata: Metadata.exif,
	}) or {
		err
	}

	assert cmd == "cwebp -metadata exif -o misc/fruits.webp misc/fruits.png"
}

// -noasm
fn test_command_generate_noasm_option() {
	cmd := webp.command(Options{
		input: "misc/fruits.png",
		output: "misc/fruits.webp",
		noasm: true,
	}) or {
		err
	}

	assert cmd == "cwebp -noasm -o misc/fruits.webp misc/fruits.png"
}
