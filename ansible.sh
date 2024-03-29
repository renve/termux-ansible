#!/data/data/com.termux/files/usr/bin/bash


yes | pkg upgrade && \
yes | pkg install \
    python \
    python-dev \
    libffi \
    #libffi-dev \
    openssl \
    #openssl-dev \
    libsodium \
    clang \
    cmake \
    make \
    libcrypt 

# ran the install command after above script and it worked i did
# not comment out the libffi-dev and openssl-dev until after I ran
# pkg install clang make libffi libcrypt openssl
# Install the latest Python package manager.
# The version of pip that comes with Python may be outdated.
pip install --upgrade pip
pip list --outdated --format=freeze | \
    grep -v '^\-e' | \
    cut -d = -f 1 | \
    xargs -n1 pip install -U && \
# The pynacl dependency originally did not install because
# it gave problems building dependencies'
pip install --upgrade pynacl
pip install --upgrade ansible

