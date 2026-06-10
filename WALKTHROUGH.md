# Challenge 3: Pearl Cipher (Easy)

**Category:** Cryptography  
**Difficulty:** Easy  
**Points:** 150  
**Flag:** `blackperl{r0t13_4nd_b4s364_d0ubl3_tr0ubl3}`

## Description

The flag is encoded with ROT13, then Base64. Decode both layers to get the flag.

## Access

**Web Terminal:** Open the deployed URL in your browser (e.g., `https://pearl-cipher.onrender.com`)

A web-based terminal will appear. Login with:
- **Username:** `ctfuser`
- **Password:** `ctfuser`

## Walkthrough

### Step 1: Login

Open the web terminal URL in your browser and login as `ctfuser`.

### Step 2: Read the Hint

```bash
cat hint.txt
```

### Step 3: Read the Encoded Flag

```bash
cat output.json
```

Find the `encoded_flag` value.

### Step 4: Decode Base64

```bash
echo "YmxhY2twZXJse3IwdDEzXzRuZF9iNHMzNjRfZDB1YmwzX3RyMHVibDN9" | base64 -d
```

Output:
```
oynpxcreyl{e0g13_4aq_o4s364_q0hoy3_ge0hoy3}
```

### Step 5: Apply ROT13

```bash
echo "oynpxcreyl{e0g13_4aq_o4s364_q0hoy3_ge0hoy3}" | tr 'a-zA-Z' 'n-za-mN-ZA-M'
```

Output:
```
blackperl{r0t13_4nd_b4s364_d0ubl3_tr0ubl3}
```

### One-liner

```bash
cat output.json | grep encoded_flag | cut -d'"' -f4 | base64 -d | tr 'a-zA-Z' 'n-za-mN-ZA-M'
```

## Running Locally

```bash
docker build -t pearl-cipher .
docker run -d -p 10000:10000 --name pearl-cipher pearl-cipher
```

Visit http://localhost:10000 in your browser.

## Deploying to Render

1. Push to GitHub
2. Create new Web Service on Render
3. Configure:
   - **Root Directory:** `challenges/pearl-cipher`
   - **Runtime:** `Docker`
   - **Environment Variable:** `PORT=10000`
4. Deploy

Players access the challenge via the Render URL in their browser.
