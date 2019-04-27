TARGET = iphone:clang
ARCHS = armv7 armv7s arm64

SDKVERSION = 10.3
SYSROOT = $(THEOS)/sdks/iPhoneOS10.3.sdk
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CabinetPluginAppList
CabinetPluginAppList_FILES = CabinetPluginAppList.mm
CabinetPluginAppList_INSTALL_PATH = /Library/Cabinet/Plugins/
CabinetPluginAppList_LIBRARIES = applist
CabinetPluginAppList_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
