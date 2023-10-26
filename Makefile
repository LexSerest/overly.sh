VERSION = 6.50
PN = overly

PREFIX ?= /usr
INITDIR_SYSTEMD = /usr/lib/systemd/user
BINDIR = $(PREFIX)/bin
SHAREDIR = $(PREFIX)/share/overly

RM = rm
SED = sed
INSTALL = install -p
INSTALL_PROGRAM = $(INSTALL) -m755
INSTALL_SCRIPT = $(INSTALL) -m755
INSTALL_DATA = $(INSTALL) -m644
INSTALL_DIR = $(INSTALL) -d
RSYNC = rsync -a
Q = @

install-bin: common/$(PN)
	$(Q)echo -e '\033[1;32mInstalling main script...\033[0m'
	$(INSTALL_DIR) "$(DESTDIR)$(BINDIR)"
	$(INSTALL_PROGRAM) common/$(PN) "$(DESTDIR)$(BINDIR)/$(PN)"
	$(INSTALL_DIR) "$(DESTDIR)$(SHAREDIR)"
	$(INSTALL_DATA) common/config.conf "$(DESTDIR)$(SHAREDIR)/config.conf"

install-systemd:
	$(Q)echo -e '\033[1;32mInstalling systemd files...\033[0m'
	$(INSTALL_DIR) "$(DESTDIR)$(INITDIR_SYSTEMD)"
	$(INSTALL_DATA) init/overly.service "$(DESTDIR)$(INITDIR_SYSTEMD)/overly.service"
	$(INSTALL_DATA) init/overly-sync.service "$(DESTDIR)$(INITDIR_SYSTEMD)/overly-sync.service"
	$(INSTALL_DATA) init/overly.timer "$(DESTDIR)$(INITDIR_SYSTEMD)/overly.timer"

install: install-bin install-systemd

uninstall-bin:
	$(RM) "$(DESTDIR)$(BINDIR)/$(PN)"
	$(RM) "$(DESTDIR)$(SHAREDIR)/config.conf"
	rmdir "$(DESTDIR)$(SHAREDIR)"

uninstall-systemd:
	$(RM) "$(DESTDIR)$(INITDIR_SYSTEMD)/overly.service"
	$(RM) "$(DESTDIR)$(INITDIR_SYSTEMD)/overly-sync.service"
	$(RM) "$(DESTDIR)$(INITDIR_SYSTEMD)/overly.timer"

uninstall: uninstall-bin uninstall-systemd

clean:
	$(RM) -f common/$(PN)

.PHONY: install-bin install-systemd install uninstall-bin uninstall-systemd uninstall clean