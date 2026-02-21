# velox: clients/local.mk

dir := clients

$(dir)_TARGETS := $(dir)/status_bar
$(dir)_PACKAGES := pixman-1 wld wayland-client

$(dir)/status_bar.o: $(call client_protocol,velox swc)

$(dir)/status_bar: $(dir)/status_bar.o $(call protocol,velox swc)
	$(link) $(clients_PACKAGE_LIBS) -lrt

install-clients: $($(dir)_TARGETS) | $(DESTDIR)$(BINDIR)
	install -m 755 $^ $(DESTDIR)$(BINDIR)

include common.mk

