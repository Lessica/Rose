BUNDLE_NAME := RosePrefs
RosePrefs_FILES += $(wildcard *.m)
RosePrefs_CFLAGS += -fobjc-arc -Iinclude -DTHEOS_LEAN_AND_MEAN
RosePrefs_LDFLAGS += -L$(THEOS_OBJ_DIR)
RosePrefs_FRAMEWORKS += UIKit
RosePrefs_LIBRARIES += Rose
RosePrefs_PRIVATE_FRAMEWORKS += Preferences
RosePrefs_EXTRA_FRAMEWORKS += Cephei CepheiPrefs
RosePrefs_INSTALL_PATH += /Library/PreferenceBundles

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/RosePreferences.plist$(ECHO_END)
