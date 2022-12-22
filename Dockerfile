FROM nvidia/cuda:11.0.3-devel-ubuntu20.04

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    wget \
    python3 \
    python3-pip \
 && rm -rf /var/lib/apt/lists/*

USER root

# Install additional libraries
RUN pip install jupyter jupyterlab
RUN pip install cupy
RUN pip install tqdm==4.63 matplotlib numpy pandas ripser

# Create a working directory
RUN mkdir /app
WORKDIR /app

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
EXPOSE 8888
