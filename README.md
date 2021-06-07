# webp

Use [cwebp](https://developers.google.com/speed/webp/docs/cwebp) using functions for V.

## Summary

- [About](#about)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Examples](#examples)
- [Available options](#available-options)
- [Test](#test)

## About

I created this library to convert my images into smaller webp version, to save my end-user bandwidth when their browser supports this format.

For the record, this library is shipped with a test image, at _misc/fruits.png_. Converting it without any options led to a file size reduction of 81% (from 462 KB to 25 KB)

## Features

- Supports all the cwebp options
- Use the cwebp executable

## Requirements

- cwebp executable on your machine (the required packages are - often called - **libwebp** and **libwebp-tools** on Linux based OS)

## Installation

```v
v install khalyomede.webp
```

## Examples

- [1. JPG to WebP conversion](#1-jpg-to-web-p-conversion)
- [2. Get the command output](#2-get-the-command-output)
- [3. Get the version of the executable](#3-get-the-version-of-the-executable)

### 1. JPG to WebP conversion

In this example, we will convert a .jpg file to .webp.

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
  }) or {
    panic(err)
  }
}
```

### 2. Get the command output

In this example, we will not execute the command but rather get its output. Useful if you want to debug it.

```v
import khalyomede.webp { Options }

fn main() {
  cmd := webp.command(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
  })

  assert cmd == "cwebp -o fruits.webp fruits.jpg"
}
```

### 3. Get the version of the executable

In this example, we will get the version of the `cwebp` executable.

```v
import khalyomede.webp

fn main() {
  version := webp.version()

  assert version == "1.1.0"
}
```

## Available options

- [-lossless](#lossless)
- [-near_lossless](#near_lossless)
- [-q](#q)
- [-z](#z)
- [-alpha_q](#alpha_q)
- [-preset](#preset)
- [-m](#m)
- [-resize](#resize)
- [-crop](#crop)
- [-mt](#mt)
- [-low_memory](#low_memory)
- [-size](#size)
- [-psnr](#psnr)
- [-pass](#pass)
- [-af](#af)
- [-jpeg_like](#jpeg_like)
- [-f](#f)
- [-sharpness](#sharpness)
- [-nostrong](#nostrong)
- [-sharp_yuv](#sharp_yuv)
- [-sns](#sns)
- [-segments](#segments)
- [-partition_limit](#partition_limit)
- [-pre](#pre)
- [-alpha_filter](#alpha_filter)
- [-alpha_method](#alpha_method)
- [-exact](#exact)
- [-blend_alpha](#blend_alpha)
- [-noalpha](#noalpha)
- [-hint](#hint)
- [-metadata](#metadata)
- [-noasm](#noasm)

### lossless

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    lossless: true,
  }) or {
    panic(err)
  }
}
```

### -near_lossless

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    near_lossless: 60,
  }) or {
    panic(err)
  }
}
```

### -q

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    quality: 75,
  }) or {
    panic(err)
  }
}
```

### -z

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    compression_mode: 6,
  }) or {
    panic(err)
  }
}
```

### -alpha_q

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    alpha_quality: 80,
  }) or {
    panic(err)
  }
}
```

### -preset

```v
import khalyomede.webp { Options, Preset }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    preset: Preset.photo,
  }) or {
    panic(err)
  }
}
```

### -m

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    compression_method: 4,
  }) or {
    panic(err)
  }
}
```

### -resize

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    resize: {
      width: 600,
      height: 800
    },
  }) or {
    panic(err)
  }
}
```

### -crop

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    crop: {
      x_position: 0,
      y_position: 100,
      width: 600,
      height: 800
    },
  }) or {
    panic(err)
  }
}
```

### -mt

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    multi_threading: true,
  }) or {
    panic(err)
  }
}
```

### -low_memory

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    low_memory: true,
  }) or {
    panic(err)
  }
}
```

### -size

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    size: 24000,
  }) or {
    panic(err)
  }
}
```

### -psnr

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    psnr: 11,
  }) or {
    panic(err)
  }
}
```

### -pass

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    pass: 6,
  }) or {
    panic(err)
  }
}
```

### -af

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    auto_filter: true,
  }) or {
    panic(err)
  }
}
```

### -jpeg_like

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    jpeg_like: true,
  }) or {
    panic(err)
  }
}
```

### -f

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    deblocking_filter_strength: 20,
  }) or {
    panic(err)
  }
}
```

### -sharpness

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    sharpness: 4,
  }) or {
    panic(err)
  }
}
```

### -nostrong

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    nostrong: true,
  }) or {
    panic(err)
  }
}
```

### -sharp_yuv

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    sharp_yuv: true,
  }) or {
    panic(err)
  }
}
```

### -sns

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    spatial_noise_shaping: 50,
  }) or {
    panic(err)
  }
}
```

### -segments

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    segments: 3,
  }) or {
    panic(err)
  }
}
```

### -partition_limit

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    partition_limit: 50,
  }) or {
    panic(err)
  }
}
```

### -pre

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    pre_processing: 2,
  }) or {
    panic(err)
  }
}
```

### -alpha_filter

```v
import khalyomede.webp { Options, AlphaFilter }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    alpha_filter: AlphaFilter.best,
  }) or {
    panic(err)
  }
}
```

### -alpha_method

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    alpha_method: 0,
  }) or {
    panic(err)
  }
}
```

### -exact

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    exact: true,
  }) or {
    panic(err)
  }
}
```

### -blend_alpha

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    blend_alpha: 40,
  }) or {
    panic(err)
  }
}
```

### -noalpha

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    noalpha: true,
  }) or {
    panic(err)
  }
}
```

### -hint

```v
import khalyomede.webp { Options, Hint }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    hint: Hint.picture,
  }) or {
    panic(err)
  }
}
```

### -metadata

```v
import khalyomede.webp { Options, Metadata }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    metadata: Metadata.exif,
  }) or {
    panic(err)
  }
}
```

### -noasm

```v
import khalyomede.webp { Options }

fn main() {
  webp.exec(Options{
    input: "fruits.jpg",
    output: "fruits.webp",
    noasm: true,
  }) or {
    panic(err)
  }
}
```

## Test

```bash
v test .
```
