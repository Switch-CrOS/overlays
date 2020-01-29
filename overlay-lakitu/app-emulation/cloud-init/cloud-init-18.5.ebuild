# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_6 )

inherit distutils-r1 eutils systemd

DESCRIPTION="Cloud instance initialisation magic"
HOMEPAGE="https://launchpad.net/cloud-init"
SRC_URI="https://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="test +gcpnet"
RESTRICT="!test? ( test )"

CDEPEND="
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/oauthlib[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	>=dev-python/configobj-5.0.2[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/jsonpatch[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		${CDEPEND}
		>=dev-python/httpretty-0.7.1[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/unittest2[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/contextlib2[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	${CDEPEND}
	sys-apps/iproute2
	virtual/logger
"

PATCHES=(
	# Fix Gentoo support
	# https://code.launchpad.net/~gilles-dartiguelongue/cloud-init/+git/cloud-init/+merge/358777
	"${FILESDIR}"/${PN}-18.4-fix-packages-module.patch
	"${FILESDIR}"/${PN}-18.4-gentoo-support-upstream-templates.patch
	"${FILESDIR}"/18.4-fix-filename-for-storing-locale.patch
	"${FILESDIR}"/18.4-fix-update_package_sources-function.patch
	"${FILESDIR}"/18.4-add-support-for-package_upgrade.patch
	# From master
	"${FILESDIR}"/${PV}-fix-invalid-string-format.patch
	"${FILESDIR}"/${PV}-add-ovf-com-vmware-guestinfo.patch
	# For lakitu
	"${FILESDIR}"/${PV}-remove-sshd-dependency.patch
	"${FILESDIR}"/${PV}-add-retries-gce-metadata-server.patch
	"${FILESDIR}"/${PV}-stable-uid.patch
	"${FILESDIR}"/${PV}-fix-cross-compile.patch
)

src_prepare() {
	# Fix location of documentation installation
	sed -i "s:USR + '/share/doc/cloud-init:USR + '/share/doc/${PF}:" setup.py || die
	distutils-r1_src_prepare
}

python_test() {
	# Do not use Makefile target as it does not setup environment correclty
	esetup.py nosetests -v --where cloudinit --where tests/unittests || die
}

python_install() {
	distutils-r1_python_install --init-system=systemd
}

lakitu_python_install_all() {
	# Overwrite the default cloud.cfg with our customized version.
	insinto /etc/cloud
	doins "${FILESDIR}"/cloud.cfg

	exeinto /usr/share/cloud
	doexe "${FILESDIR}"/rerun-cloudinit.sh

	systemd_dounit "${FILESDIR}"/var-lib-cloud.mount

	systemd_enable_service local-fs.target var-lib-cloud.mount
	systemd_enable_service multi-user.target cloud-config.service
	systemd_enable_service multi-user.target cloud-final.service
	systemd_enable_service multi-user.target cloud-init-local.service
	systemd_enable_service multi-user.target cloud-init.service
}

python_install_all() {
	keepdir /etc/cloud

	distutils-r1_python_install_all

	# lakitu: Comment out this because sysvinit scripts are not installed.
	## installs as non-executable
	#chmod +x "${D}"/etc/init.d/*

	lakitu_python_install_all
}

pkg_postinst() {
	sed -i -r 's/^(UID_MIN\s+)1000/\15000/' "${ROOT}"/etc/login.defs
	elog "cloud-init-local needs to be run in the boot runlevel because it"
	elog "modifies services in the default runlevel.  When a runlevel is started"
	elog "it is cached, so modifications that happen to the current runlevel"
	elog "while you are in it are not acted upon."
}
