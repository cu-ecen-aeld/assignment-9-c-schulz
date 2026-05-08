
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# assignment 4) & 5) & 8) reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 'd014c8844b9c62fadc27268908f08942345444c1'
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-c-schulz.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# assignment 8) build the aesd-char-driver components for the kernel module
AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver

# assignment 4) & 5) build aesdsocket and finder-app
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# assignment 4) add your writer, finder and finder-test utilities/scripts to the installation steps below
# assignment 5) install your aesdsocket executable and your aesdsocket-start-stop script
# assignment 8) install aesdchar load and unload scripts
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin

	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh                   $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh              $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/writer                      $(TARGET_DIR)/usr/bin/

	$(INSTALL) -m 0755 $(@D)/server/aesdsocket                      $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop           $(TARGET_DIR)/etc/init.d/S99aesdsocket

    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load         $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload       $(TARGET_DIR)/usr/bin/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
