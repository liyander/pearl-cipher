# Challenge 3: Pearl Cipher (Easy)

**Category:** Cryptography  
**Difficulty:** Easy  
**Points:** 150  
**Flag:** `blackperl{r0t13_4nd_b4s364_d0ubl3_tr0ubl3}`

## Description

The flag is encoded with ROT13, then Base64. Decode both layers to get the flag.

## Walkthrough

### Step 1: Read the File

Open `output.json`:
```json
{
  "challenge": "The flag has been encoded with ROT13, then Base64. Reverse both to get the flag.",
  "encoded_flag": "YmxhY2twZXJse3IwdDEzXzRuZF9iNHMzNjRfZDB1YmwzX3RyMHVibDN9",
  "hint": "Step 1: Decode Base64. Step 2: Apply ROT13 to the result."
}
```

### Step 2: Decode Base64

```bash
echo "YmxhY2twZXJse3IwdDEzXzRuZF9iNHMzNjRfZDB1YmwzX3RyMHVibDN9" | base64 -d
```

Output:
```
oynpxcreyl{e0g13_4aq_o4s364_q0hoy3_ge0hoy3}
```

### Step 3: Apply ROT13

```bash
echo "oyxnpxceryl{e0g13_4aq_o4s364_q0hoy3_ge0hoy3}" | tr 'a-zA-Z' 'n-za-mN-ZA-M'
```

Or use an online ROT13 decoder.

Output:
```
blackperl{r0t13_4nd_b4s364_d0ubl3_tr0ubl3}
```

### One-liner

```bash
echo "YmxhY2twZXJse3IwdDEzXzRuZF9iNHMzNjRfZDB1YmwzX3RyMHVibDN9" | base64 -d | tr 'a-zA-Z' 'n-za-mN-ZA-M'
```

## Running

```bash
docker build -t pearl-cipher .
docker run --rm pearl-cipher
```
