
EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit git-2

DESCRIPTION="A git remote helper for GPG-encrypted remotes"
HOMEPAGE="https://github.com/joeyh/git-remote-gcrypt"
SRC_URI=""
EGIT_REPO_URI="https://github.com/joeyh/git-remote-gcrypt.git"
EGIT_COMMIT="5dcc77f507d497fe4023e94a47b6a7a1f1146bce"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

src_install ()
{
	exeinto /usr/bin
	newexe git-remote-gcrypt git-remote-gcrypt
}

