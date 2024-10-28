##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = ccf13b156f86b351f871e7d3d39f5c7fbde8cf11
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-DL821at.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Define the build commands to cross-compile the aesdsocket app
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# Install the aesdsocket executable to /usr/bin on the target
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Install aesdsocket binary
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/

	# Install the startup script to /etc/init.d with S99 to ensure it runs on startup
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket

    # Other necessary installs
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin

    # Install additional files (e.g., finder-app files) to /usr/bin
	#$(INSTALL) -m 0755 $(@D)/finder-app/* $(TARGET_DIR)/usr/bin/
endef

# Tell Buildroot to use this package as a generic package
$(eval $(generic-package))
