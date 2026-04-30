
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# assignment 7) reference your assignment 7 git contents
LDD_VERSION = 'da1d3850f69ee2d56121b530b694d03385cc2426'
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-c-schulz.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

# assignment 7) build the misc-modules and scull components
LDD_MODULE_SUBDIRS = misc-modules scull

# assignment 7) install the misc-modules and scull components into the root filesystem
define LDD_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/misc-modules/module_load 	$(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/scull/scull_load 			$(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/scull/scull_unload 		$(TARGET_DIR)/usr/bin/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
