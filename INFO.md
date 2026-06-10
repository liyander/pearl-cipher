# Pearl Cipher

## Challenge Info

| Field | Details |
|-------|---------|
| **Name** | Pearl Cipher |
| **Category** | Cryptography |
| **Difficulty** | Easy |
| **Points** | 150 |
| **Flag Format** | `blackperl{...}` |
| **Access** | Web browser (ttyd terminal) |
| **Technologies** | Base64, ROT13, ttyd |

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

1. Read `output.json` to find the encoded flag.
2. Reverse the order: decode Base64 first, then ROT13.
3. Use `base64 -d` for Base64 and `tr 'a-zA-Z' 'n-za-mN-ZA-M'` for ROT13.

## Tools Included in Terminal

- `base64` - Decode Base64 data
- `tr` - Apply ROT13 transformation
- `python3` - Optional for scripting
- `cat`, `grep`, `cut` - Text processing

## Access Method

This challenge uses **ttyd** (web-based terminal) so players can access it through a browser:

1. Open the challenge URL in a web browser
2. A terminal interface appears
3. Login with credentials: `ctfuser` / `ctfuser`
4. Solve the challenge using included tools

## Setup

### Local (Docker)
```bash
docker build -t pearl-cipher .
docker run -d -p 10000:10000 --name pearl-cipher pearl-cipher
```

Visit http://localhost:10000

### Render Deployment
1. Push to GitHub
2. Create Web Service on Render
3. Set Root Directory: `challenges/pearl-cipher`
4. Set Runtime: `Docker`
5. Add env var: `PORT=10000`
6. Deploy

Players access via the Render URL in their browser.

## Files Provided

- Web-based terminal access
- Credentials: `ctfuser` / `ctfuser`
- `output.json` in home directory
- Hint file at `/home/ctfuser/hint.txt`
