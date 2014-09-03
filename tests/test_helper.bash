eval "$(basher init-bundle -)"

source "$(basher runtime-path basherpm/bats-assertions)"

export PG_SNAPSHOT_TEST_DIR="${BATS_TMPDIR}/pg_snapshot"
export PG_SNAPSHOT_CWD="${PG_SNAPSHOT_TEST_DIR}/cwd"

export PATH="${BATS_TEST_DIRNAME}/../libexec:$PATH"
export PATH="$BATS_TEST_DIRNAME/path:$PATH"

mkdir -p "${PG_SNAPSHOT_CWD}"

setup() {
  cd "${PG_SNAPSHOT_CWD}"
}

teardown() {
  rm -rf "$PG_SNAPSHOT_TEST_DIR"
}
