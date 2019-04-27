TARGET = iphone:clang
ARCHS = arm64

SDKVERSION = 10.3
SYSROOT = $(THEOS)/sdks/iPhoneOS10.3.sdk
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CabinetPluginFlipSwitches
CabinetPluginFlipSwitches_FILES = CabinetPluginFlipSwitches.mm
CabinetPluginFlipSwitches_INSTALL_PATH = /Library/Cabinet/Plugins/
CabinetPluginFlipSwitches_LIBRARIES = flipswitch
CabinetPluginFlipSwitches_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
