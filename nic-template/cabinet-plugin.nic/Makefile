TARGET=iphone:clang:8.4
ARCHS = armv7 armv7s arm64

include @@THEOS@@/makefiles/common.mk

BUNDLE_NAME = @@PROJECTNAME@@
@@PROJECTNAME@@_FILES = @@PROJECTNAME@@.mm
@@PROJECTNAME@@_INSTALL_PATH = /Library/Cabinet/Plugins/

include $(THEOS_MAKE_PATH)/bundle.mk

@@KILL_RULE@@
