# Use an official PyTorch image as a parent image
#FROM nvcr.io/nvidia/pytorch:24.03-py3

FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-devel

RUN apt update && apt install --no-install-recommends -y git libsndfile1

#too old
#FROM nvcr.io/nvidia/pytorch:23.08-py3
ENV TORCH_CUDA_ARCH_LIST="8.6+PTX"

# Set the working directory in the container
WORKDIR /usr/src/app

# Install any needed packages specified in requirements.txt
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Run jupyter notebook when the container launches
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]
