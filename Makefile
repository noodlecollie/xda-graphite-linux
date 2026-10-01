# SPDX-License-Identifier: GPL-2.0
# This is taken from the buildroot manual example: "9.1.2. Custom top Makefile"

# Avoid surprises by disabling default rules
MAKEFLAGS += --no-builtin-rules
.SUFFIXES:

THIS_EXTERNAL_PATH := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

# Put downloads in this directory instead of in the Buildroot directory
ifeq ($(BR2_DL_DIR),)
BR2_DL_DIR = $(THIS_EXTERNAL_PATH)/dl
endif

OUTPUT_BASEDIR = $(THIS_EXTERNAL_PATH)/output
OUTPUT_DIR = $(OUTPUT_BASEDIR)/$(patsubst %_defconfig,%,$@)

# Shorthand for calling make with the main makefile taken from the buildroot dir,
# and the BR2 external tree set to the repo root.
MAKE_BUILDROOT = $(MAKE) -C $(THIS_EXTERNAL_PATH)/buildroot BR2_EXTERNAL=$(THIS_EXTERNAL_PATH)

# This command takes a defconfig file and creates an output directory for it.
# This runs for any argument that matches a config file in the config directory.
# $@ here is the name of the config file.
# The sed call replaces the BR2_DL_DIR in the config file so that it is shared
# at the top level among all targets.
%: $(THIS_EXTERNAL_PATH)/configs/%
	$(MAKE_BUILDROOT) O=$(OUTPUT_DIR) $@
	sed -i /^BR2_DL_DIR=.*/s%%BR2_DL_DIR=$(BR2_DL_DIR)% $(OUTPUT_DIR)/.config

# TODO: Need a command to just run $(MAKE_BUILDROOT) O=$(OUTPUT_DIR)
# to perform the main build.
# However, how do you know what the output dir is if you've not specified the target?
