# Website

Design specs for the website.

## Base parameters

| Name                |      Pixels |            rem |
|---------------------|------------:|---------------:|
| Base viewport width | **1280 px** |              — |
| Base font size      |   **16 px** |          1 rem |
| Layout row height   |       23 px | **1.4375 rem** |

## Type system

Parameters:

| Name       | Value |
|------------|-------|
| Type scale | 1.25  |

> TODO: for now, the same type scale is used for all screen sizes. A:dapt this if necessary.

Text styles:

| Name          | Type scale exponent |    rem | Pixels | Font       | Weight        | Capitalisation | Underline | Line height |
|---------------|--------------------:|-------:|-------:|------------|---------------|---------------:|----------:|-------------|
| Header Huge   |                   6 | 3.8147 |  61.04 | Montserrat | 700 (Bold)    |       All Caps |    0.3 em | —           |
| Header Large  |                   3 | 1.9531 |  31.25 | Montserrat | 700 (Bold)    |       All Caps |   0.25 em | —           |
| Header Normal |                   1 |   1.25 |     20 | Poppins    | 700 (Bold)    |         Normal |   0.25 em | —           |
| Header Small  |                  -1 |    0.8 |   12.8 | Poppins    | 700 (Bold)    |         Normal |   0.25 em | —           |
| Text Normal   |                   0 |      1 |     16 | Poppins    | 400 (Regular) |         Normal |         — | 1.4375 rem  |
| Text Small    |                  -1 |    0.8 |   12.8 | Poppins    | 400 (Regular) |         Normal |         — | —           |

### Usage

#### Header Huge

- Decorative section headers

#### Header Large

- Section headers

#### Header Normal

- Headers in service and team member boxes

#### Header Small

- Headers in footer

#### Text Normal

- Running text
- Buttons
- Normal copy-top-clipboard bars
- Navigation links

#### Text Small

- Text in footer
- Small copy-to-clipboard bars

#### Label Small

- Buttons (small)
- Navigation in header
- Role in member boxes
- Footer

#### Label Tiny

- Clipboard bars (small)

#### Header Primary Huge

- Header for sections with photo background

#### Header Primary Large

- Header for normal sections

#### Header Primary Normal

- Header in service boxes

#### Header Secondary Normal

- Name in member boxes

#### Header Secondary Small

- Headers in footer

## Elements

### Buttons

| Type                     | Height             | Width              |
|--------------------------|-------------------:|-------------------:|
| Normal                   | 2.875 rem (46 px)  | 9 rem (144 px)     |
| Copy-To-Clipboard Normal | 2.875 rem (46 px)  | 18 rem (288 px)    |
| Copy-To-Clipboard Small  | 1.4375 rem (23 px) | 15 rem (240 px)    |
| Social Icon              | 1.4375 rem (23 px) | 1.4375 rem (23 px) |

## Colours

| Name   |                          Preview                         | Value     |
|--------|:--------------------------------------------------------:|-----------|
| White  | ![](https://via.placeholder.com/15/EBEBEB/000000?text=+) | `#EBEBEB` |
| Grey   | ![](https://via.placeholder.com/15/242424/000000?text=+) | `#242424` |
| Black  | ![](https://via.placeholder.com/15/000000/000000?text=+) | `#000000` |
| Accent | ![](https://via.placeholder.com/15/FED91F/000000?text=+) | `#FED91F` |

**TODO:** hover colour for filled buttons (e.g. darker shade of accent).

### Usage

#### White

- Text on black, grey or photo (as appropriate) background
- Monochrome icons on black or grey background
- Background of filled clipboard bars

#### Black

- Text on white, accent, or photo (as appropriate) background
- Monochrome icons on white or accent background
- Website background

#### Grey

- Service boxes background
- Member boxes background
- Footer

#### Accent

- Underlines
- Decorations
- Background and borders of filled buttons
- Border of unfilled buttons
