eval "$(basher init-bundle -)"

source "$(basher runtime-path basherpm/bats-assertions)"

export PG_TEST_DIR="${BATS_TMPDIR}/pg"
export PG_CWD="${PG_TEST_DIR}/cwd"

export PATH="${BATS_TEST_DIRNAME}/../libexec:$PATH"

mkdir -p "${PG_CWD}"

setup() {
  cd "${PG_CWD}"
}

teardown() {
  rm -rf "$PG_TEST_DIR"
}

load lib/assertions
