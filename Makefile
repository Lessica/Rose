export ARCHS = arm64 arm64e
export TARGET = iphone:clang:16.5:14.0

export BUILD_ROOT := $(shell git rev-parse --show-toplevel)

export ADDITIONAL_CFLAGS
ADDITIONAL_CFLAGS += -include $(BUILD_ROOT)/MyRoot.h

export ADDITIONAL_LDFLAGS
ADDITIONAL_LDFLAGS += -lroot
ifeq ($(THEOS_PACKAGE_SCHEME),roothide)
ADDITIONAL_LDFLAGS += -lroothide
endif

INSTALL_TARGET_PROCESSES = SpringBoard
SUBPROJECTS = libRose Tweak Prefs Applications

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk