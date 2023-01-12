LIBRARY_NAME := libRose
libRose_USE_MODULES := 0
libRose_FILES += $(wildcard *.m)
libRose_CFLAGS += -Ipublic -Ioverlayheaders -I. -fobjc-arc -DTHEOS_LEAN_AND_MEAN
libRose_FRAMEWORKS += UIKit AudioToolbox

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/library.mk

stage::
	mkdir -p $(THEOS_STAGING_DIR)/usr/include/libRose
	$(ECHO_NOTHING)rsync -a ./public/* $(THEOS_STAGING_DIR)/usr/include/Rose $(FW_RSYNC_EXCLUDES)$(ECHO_END)
	mkdir -p $(THEOS)/include/Rose
	cp -r ./public/* $(THEOS)/include/Rose
	cp $(THEOS_STAGING_DIR)/usr/lib/libRose.dylib $(THEOS)/lib/libRose.dylib