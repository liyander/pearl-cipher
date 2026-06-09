# Pearl Cipher

## Challenge Info

| Field | Details |
|-------|---------|
| **Name** | Pearl Cipher |
| **Category** | Cryptography |
| **Difficulty** | Easy |
| **Points** | 150 |
| **Flag Format** | `blackperl{...}` |
| **Access** | `output.json` |
| **Technologies** | Base64, ROT13 |

## Description

The flag is encoded with two layers: ROT13 then Base64. Decode both to reveal the flag.

## Objective

Decode a Base64 string, then apply ROT13 to get the flag.

## What You Will Learn

- Base64 decoding
- ROT13 cipher (a simple letter substitution)
- How to chain multiple decoding steps

## Skills Required

- Basic command line
- Understanding of Base64 and ROT13

## Hints

1. The file tells you it's ROT13 then Base64.
2. Reverse the order: decode Base64 first, then ROT13.
3. Use `base64 -d` for Base64 and `tr 'a-zA-Z' 'n-za-mN-ZA-M'` for ROT13.

## Tools Required

- `base64` command
- `tr` command or online ROT13 decoder

## Setup

```bash
python3 cipher.py > output.json
```

Distribute `output.json` to players.

## Files Provided

- `output.json` — contains the double-encoded flag
