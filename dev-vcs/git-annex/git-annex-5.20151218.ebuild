# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.5.9999

CABAL_FEATURES="bin"
inherit haskell-cabal

DESCRIPTION="manage files with git, without checking their contents into git"
HOMEPAGE="http://git-annex.branchable.com/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"
RESTRICT="test"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux"
IUSE="+assistant concurrentoutput cryptonite +database +dbus +desktopnotify +dns doc ekg +feed +inotify +network-uri +pairing +quvi +s3 +tahoe +tdfa +torrentparser +webapp +webapp-secure +webdav +xmpp"
IUSE="${IUSE} +glacier"

RDEPEND="dev-haskell/async:=
	dev-haskell/bloomfilter:=
	dev-haskell/case-insensitive:=
	dev-haskell/data-default:=
	dev-haskell/dlist:=
	dev-haskell/edit-distance:=
	>=dev-haskell/exceptions-0.6:=
	dev-haskell/hslogger:=
	dev-haskell/http-client:=
	dev-haskell/http-conduit:=
	dev-haskell/http-types:=
	dev-haskell/ifelse:=
	dev-haskell/json:=
	dev-haskell/missingh:=
	dev-haskell/monad-control:=
	dev-haskell/monad-logger:=
	>=dev-haskell/mtl-2:=
	dev-haskell/old-locale:=
	>=dev-haskell/optparse-applicative-0.11:=
	>=dev-haskell/quickcheck-2.1:2=
	dev-haskell/random:=
	dev-haskell/resourcet:=
	dev-haskell/safesemaphore:=
	dev-haskell/sandi:=
	>=dev-haskell/stm-2.3:=
	dev-haskell/text:=
	dev-haskell/transformers:=
	dev-haskell/unix-compat:=
	dev-haskell/utf8-string:=
	dev-haskell/uuid:=
	>=dev-lang/ghc-7.6.1:=
	assistant? ( inotify? ( dev-haskell/hinotify:= ) )
	concurrentoutput? ( >=dev-haskell/concurrent-output-1.6:= )
	cryptonite? ( dev-haskell/cryptonite:= )
	!cryptonite? ( >=dev-haskell/cryptohash-0.11.0:= )
	database? ( dev-haskell/esqueleto:=
			dev-haskell/persistent:=
			dev-haskell/persistent-sqlite:=
			dev-haskell/persistent-template:= )
	dbus? ( >=dev-haskell/dbus-0.10.7:=
		desktopnotify? ( >=dev-haskell/fdo-notify-0.3:= ) )
	dns? ( dev-haskell/dns:= )
	ekg? ( dev-haskell/ekg:= )
	feed? ( >=dev-haskell/feed-0.3.4:= )
	network-uri? ( >=dev-haskell/network-2.6:=
			>=dev-haskell/network-uri-2.6:= )
	!network-uri? ( >=dev-haskell/network-2.0:= <dev-haskell/network-2.6:= )
	pairing? ( dev-haskell/network-info:=
			dev-haskell/network-multicast:= )
	quvi? ( dev-haskell/aeson:= )
	s3? ( >=dev-haskell/aws-0.9.2:=
		dev-haskell/conduit:=
		dev-haskell/conduit-extra:= )
	tahoe? ( dev-haskell/aeson:= )
	tdfa? ( dev-haskell/regex-tdfa:= )
	!tdfa? ( dev-haskell/regex-compat:= )
	torrentparser? ( >=dev-haskell/torrent-10000.0.0:= )
	webapp? ( dev-haskell/aeson:=
			dev-haskell/blaze-builder:=
			dev-haskell/clientsession:=
			dev-haskell/crypto-api:=
			>=dev-haskell/path-pieces-0.1.4:=
			>=dev-haskell/shakespeare-2.0.0:=
			dev-haskell/wai:=
			dev-haskell/wai-extra:=
			>=dev-haskell/warp-3.0.0.5:=
			>=dev-haskell/yesod-1.2.6:=
			>=dev-haskell/yesod-core-1.2.19:=
			>=dev-haskell/yesod-default-1.2.0:=
			>=dev-haskell/yesod-form-1.3.15:=
			>=dev-haskell/yesod-static-1.2.4:=
			webapp-secure? ( dev-haskell/byteable:=
					dev-haskell/securemem:=
					>=dev-haskell/warp-tls-1.4:= )
			!webapp-secure? ( dev-haskell/warp-tls:= ) )
	webdav? ( >=dev-haskell/dav-1.0:= )
	xmpp? ( >=dev-haskell/gnutls-0.1.4:=
		dev-haskell/network-protocol-xmpp:=
		dev-haskell/xml-types:= )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
"

src_prepare() {
	epatch "${FILESDIR}/${PV}/0001-glacier-cli-name.patch"
	epatch "${FILESDIR}/${PV}/0002-glacier-vault-name.patch"
	epatch "${FILESDIR}/${PV}/0003-glacier-vault-no-create.patch"
	epatch "${FILESDIR}/${PV}/0004-rsync-dir-name.patch"
	epatch "${FILESDIR}/${PV}/0005-s3-bucket-name.patch"

	# does not respect staging dir
	epatch "${FILESDIR}"/${PN}-5.20150731-no-strange-installs.patch
}

src_configure() {
	haskell-cabal_src_configure \
		--flag=-android \
		--flag=-androidsplice \
		$(cabal_flag assistant assistant) \
		$(cabal_flag database database) \
		$(cabal_flag cryptonite Cryptonite) \
		$(cabal_flag concurrentoutput ConcurrentOutput) \
		$(cabal_flag dbus dbus) \
		$(cabal_flag desktopnotify desktopnotify) \
		$(cabal_flag dns dns) \
		$(cabal_flag ekg ekg) \
		$(cabal_flag feed feed) \
		$(cabal_flag inotify inotify) \
		$(cabal_flag network-uri network-uri) \
		$(cabal_flag pairing pairing) \
		--flag=-production \
		$(cabal_flag quvi quvi) \
		$(cabal_flag s3 s3) \
		$(cabal_flag tahoe tahoe) \
		$(cabal_flag tdfa tdfa) \
		--flag=-testsuite \
		$(cabal_flag torrentparser torrentparser) \
		$(cabal_flag webapp webapp) \
		$(cabal_flag webapp-secure webapp-secure) \
		$(cabal_flag webdav webdav) \
		$(cabal_flag xmpp xmpp)
}

src_compile() {
	haskell-cabal_src_compile
	use doc && emake docs
}

src_test() {
	if use webapp; then
		export GIT_CONFIG=${T}/temp-git-config
		git config user.email "git@src_test"
		git config user.name "Mr. ${P} The Test"

		emake test
	fi
}

src_install() {
	haskell-cabal_src_install
	dosym git-annex /usr/bin/git-annex-shell # standard make install does more, than needed

	# install-mans wants ikiwiki. It returns 0 and builds the man pages without ikiwiki.
	emake install-mans DESTDIR="${D}" PREFIX="${EPREFIX}/usr"
	use doc && emake install-docs DESTDIR="${D}" PREFIX="${EPREFIX}/usr"
	mv "${ED}"/usr/share/doc/{${PN},${PF}}
	dodoc CHANGELOG README
	if use webapp ; then
		doicon "${FILESDIR}"/${PN}.xpm
		make_desktop_entry "${PN} webapp" "git-annex" ${PN}.xpm "Office"
	fi
}
