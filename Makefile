VERSION = 3.2

SCRIPTS     = scripts/{netcfg,wifi-menu} scripts/netcfg-{daemon,menu,wpa_actiond{,-action}}
HOOKS       = src/hooks/{fancy,initscripts}
CONNECTIONS = src/connections/{bond,bridge,ethernet,openvpn,ppp,pppoe,tunnel,tuntap,vlan,wireless}
NETWORK     = src/{network,rfkill,8021x,globals}
CONTRIB     = contrib/{*.hook,pm-utils.handler}
EXAMPLES    = doc/examples/{bonding,ethernet-{dhcp,static,iproute},ppp,pppoe,wireless-{open,wep,wpa{,-static,-configsection,-config}}} \
              doc/examples/{tunnel-he-ipv6,vlan-{dhcp,static},bridge,openvpn,tuntap,wireless-{open,wep{,-string-key},wpa-config}}
RCD         = rc.d/net-{profiles,rename,auto-{wired,wireless}}



.PHONY: all doc
all: doc

doc:
	$(MAKE) -C $@



.PHONY: install install-doc install-conf install-lib install-hook install-script install-daemon
install: install-doc install-conf install-lib install-hook install-script install-daemon

install-doc: doc
	install -d     -- "$(DESTDIR)/usr/share/man"/{man5,man8}
	install -m644  doc/*.5                -- "$(DESTDIR)/usr/share/man/man5/"
	install -m644  doc/*.8                -- "$(DESTDIR)/usr/share/man/man8/"
	install -d     -- "$(DESTDIR)/usr/share/doc/netcfg/contrib"
	install -m644  $(CONTRIB)             -- "$(DESTDIR)/usr/share/doc/netcfg/contrib/"

install-conf:
	install -d     -- "$(DESTDIR)/etc/network.d"/{examples,interfaces}
	install -Dm644 config/netcfg          -- "$(DESTDIR)/etc/conf.d/netcfg"
	install -m644  config/iftab           -- "$(DESTDIR)/etc/iftab"
	install -m644  $(EXAMPLES)            -- "$(DESTDIR)/etc/network.d/examples/"

install-lib:
	install -d     -- "$(DESTDIR)/usr/lib/network"/{connections,hooks}
	install -m644  $(NETWORK)             -- "$(DESTDIR)/usr/lib/network/"
	install -m755  $(CONNECTIONS)         -- "$(DESTDIR)/usr/lib/network/connections/"

install-hook:
	install -m755  $(HOOKS)               -- "$(DESTDIR)/usr/lib/network/hooks/"

install-script:
	install -d                            -- "$(DESTDIR)/usr/bin"
	install -m755  $(SCRIPTS)             -- "$(DESTDIR)/usr/bin/"
	install -Dm755 scripts/ifplugd.action -- "$(DESTDIR)/etc/ifplugd/netcfg.action"
	install -Dm755 scripts/pm-utils       -- "$(DESTDIR)/usr/lib/pm-utils/sleep.d/50netcfg"

install-daemon:
	install -Dm755 rc.d/net-set-variable  -- "$(DESTDIR)/etc/rc.d/functions.d/net-set-variable"
	install -m755  $(RCD)                 -- "$(DESTDIR)/etc/rc.d/"
	install -d                            -- "$(DESTDIR)/usr/lib/systemd/system"
	install -m644  systemd/*.service      -- "$(DESTDIR)/usr/lib/systemd/system/"



.PHONY: clean
clean:
	$(MAKE) -C docs clean

