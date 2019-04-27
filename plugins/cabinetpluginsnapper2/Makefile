TARGET = iphone:clang
ARCHS = arm64

SDKVERSION = 10.3
SYSROOT = $(THEOS)/sdks/iPhoneOS10.3.sdk
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = CabinetPluginSnapper2
CabinetPluginSnapper2_FILES = CabinetPluginSnapper2.mm
CabinetPluginSnapper2_INSTALL_PATH = /Library/Cabinet/Plugins/
CabinetPluginSnapper2_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
