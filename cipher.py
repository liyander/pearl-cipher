import base64
import json

FLAG = "blackperl{r0t13_4nd_b4s364_d0ubl3_tr0ubl3}"

rot13_flag = ''.join(
    chr((ord(c) - 97 + 13) % 26 + 97) if c.islower() else
    chr((ord(c) - 65 + 13) % 26 + 65) if c.isupper() else c
    for c in FLAG
)

encoded_flag = base64.b64encode(rot13_flag.encode()).decode()

output = {
    "challenge": "The flag has been encoded with ROT13, then Base64. Reverse both to get the flag.",
    "encoded_flag": encoded_flag,
    "hint": "Step 1: Decode Base64. Step 2: Apply ROT13 to the result."
}

print(json.dumps(output, indent=2))
