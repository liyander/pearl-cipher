FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    ttyd \
    python3 \
    coreutils \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash ctfuser && \
    echo "ctfuser:ctfuser" | chpasswd

WORKDIR /home/ctfuser

COPY cipher.py .

RUN python3 cipher.py > output.json && \
    chown ctfuser:ctfuser output.json && \
    rm cipher.py

RUN echo '#!/bin/bash' > /home/ctfuser/hint.txt && \
    echo 'Welcome to the Pearl Cipher challenge!' >> /home/ctfuser/hint.txt && \
    echo '' >> /home/ctfuser/hint.txt && \
    echo 'The flag is encoded with ROT13, then Base64.' >> /home/ctfuser/hint.txt && \
    echo '' >> /home/ctfuser/hint.txt && \
    echo 'Try these commands:' >> /home/ctfuser/hint.txt && \
    echo '  cat output.json                    - Read the file' >> /home/ctfuser/hint.txt && \
    echo '  echo "<base64>" | base64 -d        - Decode Base64' >> /home/ctfuser/hint.txt && \
    echo '  echo "<text>" | tr "a-zA-Z" "n-za-mN-ZA-M"  - Apply ROT13' >> /home/ctfuser/hint.txt && \
    echo '' >> /home/ctfuser/hint.txt && \
    echo 'One-liner:' >> /home/ctfuser/hint.txt && \
    echo '  cat output.json | grep encoded_flag | cut -d"\"" -f4 | base64 -d | tr "a-zA-Z" "n-za-mN-ZA-M"' >> /home/ctfuser/hint.txt && \
    chmod 444 /home/ctfuser/hint.txt && \
    chown ctfuser:ctfuser /home/ctfuser/hint.txt

RUN echo '#!/bin/bash' > /entrypoint.sh && \
    echo 'export HISTSIZE=0' >> /entrypoint.sh && \
    echo 'export HISTFILESIZE=0' >> /entrypoint.sh && \
    echo 'unset HISTFILE' >> /entrypoint.sh && \
    echo 'exec ttyd -p 10000 -W login -f ctfuser' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

EXPOSE 10000

CMD ["/entrypoint.sh"]
