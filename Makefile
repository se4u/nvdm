#!/usr/bin/env make -f
SHELL := /bin/bash
# Three things to add.
# 1. Multi gpu training
# 2. Persisting/reusing models
# 3. Tensorboard
test:
	TF_CPP_MIN_LOG_LEVEL=2 CUDA_VISIBLE_DEVICES=`free-gpu` python nvdm.py --test True

run:
	TF_CPP_MIN_LOG_LEVEL=2 CUDA_VISIBLE_DEVICES=`free-gpu` python nvdm.py --data_dir data/20news/
