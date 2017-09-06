#!/usr/bin/env make -f
SHELL := /bin/bash
# Three things to add.
# 1. Multi gpu training
# 2. Persisting/reusing models
# 3. Tensorboard
FREE_GPU=$(shell free-gpu)

activate:
	echo source ~/tensorflow/bin/activate

# DATA_DIR := data/20news/
DATA_DIR := data/rcv1-v2
CHECKPOINT_DIR := checkpoint_$(notdir $(DATA_DIR))
VOCAB_SIZE := $(shell wc -l $(DATA_DIR)/vocab.new | cut -d' ' -f 1)
echo_%:
	echo $($*)
test:
	TF_CPP_MIN_LOG_LEVEL=2 CUDA_VISIBLE_DEVICES=$(FREE_GPU) python nvdm.py --test True --data_dir $(DATA_DIR) --checkpoint_dir $(CHECKPOINT_DIR) --vocab_size $(VOCAB_SIZE)

run:	
	TF_CPP_MIN_LOG_LEVEL=2 CUDA_VISIBLE_DEVICES=$(FREE_GPU) python nvdm.py --data_dir $(DATA_DIR) --checkpoint_dir $(CHECKPOINT_DIR) --vocab_size $(VOCAB_SIZE)
