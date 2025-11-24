##############################################################
#
# DEVICE
#
##############################################################

DEVICE_VERSION = 15bdb540d1995f7ea7d4068d9f5ca72bbc299a8b
DEVICE_SITE = git@github.com:lihuanlu/final-project-devices-lihuanlu.git
DEVICE_SITE_METHOD = git
DEVICE_GIT_SUBMODULES = YES
DEVICE_MODULE_SUBDIRS = button sensor lcd

# Build
define DEVICE_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/button $(LINUX_MAKE_FLAGS) modules
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/sensor $(LINUX_MAKE_FLAGS) modules
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/lcd $(LINUX_MAKE_FLAGS) modules
endef

# Install 
define DEVICE_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/button/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/sensor/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/lcd/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
endef

$(eval $(kernel-module))
$(eval $(generic-package))
