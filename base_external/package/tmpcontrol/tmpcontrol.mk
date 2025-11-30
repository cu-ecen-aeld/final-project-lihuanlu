##############################################################
#
# TMPCONTROL
#
##############################################################

TMPCONTROL_VERSION = f8e864de7c7d0003dc7590a12263fe11655bf98f
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
        $(INSTALL) -m 0755 $(@D)/tmpcontrol/tmpcontrol-start-stop $(TARGET_DIR)/etc/init.d/S99tmpcontrol
endef

$(eval $(generic-package))

