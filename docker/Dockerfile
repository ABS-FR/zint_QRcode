FROM ubuntu:22.04

# Éviter les prompts interactifs
ENV DEBIAN_FRONTEND=noninteractive

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    cmake \
    make \
    build-essential \
    libpng-dev \
    zlib1g-dev \
    git \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Créer le répertoire de travail
WORKDIR /app

# Copier le code source zint
COPY ../ /app/

# Créer le répertoire de build et compiler
RUN mkdir build && \
    cd build && \
    cmake .. \
        -DZINT_USE_QT=OFF \
        -DZINT_USE_PNG=ON \
        -DZINT_FRONTEND=ON \
        -DZINT_SHARED=ON \
        -DZINT_STATIC=OFF && \
    make -j$(nproc) && \
    make install && \
    ldconfig

# Créer un répertoire pour les QR codes générés
RUN mkdir -p /qrcodes

# Point d'entrée par défaut
WORKDIR /qrcodes
CMD ["zint", "--help"]
