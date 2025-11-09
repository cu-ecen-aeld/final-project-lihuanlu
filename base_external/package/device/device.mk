##############################################################
#
# DEVICE
#
##############################################################

DEVICE_VERSION = e9c1d0f6277076a48466847b2ba6d356340a72a9
DEVICE_SITE = git@github.com:lihuanlu/final-project-devices-lihuanlu.git
DEVICE_SITE_METHOD = git
DEVICE_GIT_SUBMODULES = YES
DEVICE_MODULE_SUBDIRS = button
# lcd sensor

# Build
define DEVICE_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/button $(LINUX_MAKE_FLAGS) modules
endef

# Install 
define DEVICE_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0755 $(@D)/button/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
endef

$(eval $(kernel-module))
$(eval $(generic-package))
