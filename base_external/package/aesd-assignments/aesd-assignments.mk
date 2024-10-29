##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = 48635402cd5638c5374f410da35da328b40673f0
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-DL821at.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Define the server directory where the aesdsocket Makefile is located
AESDSOCKET_SERVER_DIR := /home/dleevm/assignment-1-tale1433/server

# Cross-compile aesdsocket from the server subdirectory
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) -C $(AESDSOCKET_SERVER_DIR)
endef

# Install the aesdsocket binary and the start-stop script
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Install the compiled aesdsocket binary to /usr/bin on the target
	$(INSTALL) -D -m 755 $(AESDSOCKET_SERVER_DIR)/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket

	# Install the aesdsocket-start-stop script to /etc/init.d/S99aesdsocket on the target
	$(INSTALL) -D -m 755 $(AESDSOCKET_SERVER_DIR)/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
