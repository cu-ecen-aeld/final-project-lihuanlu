##############################################################
#
# TMPCONTROL
#
##############################################################

TMPCONTROL_VERSION = b752ff199a5f46d3a9c6cef789c5cdf7f8b11fed
TMPCONTROL_SITE = git@github.com:lihuanlu/final-project-devices-lihuanlu.git
TMPCONTROL_SITE_METHOD = git
TMPCONTROL_GIT_SUBMODULES = YES

# Build the tmpcontrol main program
define TMPCONTROL_BUILD_CMDS
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/tmpcontrol all
endef

# Install scripts, binary
define TMPCONTROL_INSTALL_TARGET_CMDS
        # Binaries and scripts
        $(INSTALL) -m 0755 $(@D)/tmpcontrol/tmpcontrol $(TARGET_DIR)/usr/bin/

endef

$(eval $(generic-package))

