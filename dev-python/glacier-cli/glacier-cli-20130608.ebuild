
EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit git-2

DESCRIPTION="Command-line interface to Amazon Glacier"
HOMEPAGE="https://github.com/basak/glacier-cli"
SRC_URI=""
EGIT_REPO_URI="https://github.com/basak/glacier-cli.git"
EGIT_COMMIT="b68835c105d3b3405d3282d235253a1d055acb4b"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="dev-python/boto
         dev-python/iso8601
		 dev-python/sqlalchemy
"

src_install ()
{
	exeinto /usr/bin
	newexe glacier.py glacier-cli
}

