# FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04
FROM nvidia/cuda:10.2-cudnn8-runtime-ubuntu18.04
ARG CONDA_VER=Miniconda3-py37_4.8.2-Linux-x86_64.sh
ARG PATH="/root/miniconda3/bin:${PATH}"
ENV PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get update -y &&\
    apt-get upgrade -y &&\
    apt-get install wget -y &&\
    apt-get install git -y &&\
    apt-get install gcc -y &&\
    rm -rf /var/lib/apt/lists/* &&\
    wget https://repo.anaconda.com/miniconda/${CONDA_VER} &&\
    bash ${CONDA_VER} -b &&\
    rm -f ${CONDA_VER}

RUN pip list &&\
    conda update --all &&\
    conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch &&\
    pip install tensorflow-gpu==1.15 &&\
    # pip install git+https://github.com/aliutkus/torchsearchsorted.git &&\
    pip list
    