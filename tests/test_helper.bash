source "$(basher package-path basherpm/bats-assertions)/lib/assertions.bash"

export PG_TEST_DIR="${BATS_TMPDIR}/pg"
export PG_CWD="${PG_TEST_DIR}/cwd"
export PG_TMP_BIN="${PG_TEST_DIR}/bin"

export PATH="${BATS_TEST_DIRNAME}/../libexec:$PATH"
export PATH="${PG_TMP_BIN}:$PATH"

mkdir -p "${PG_CWD}"
mkdir -p "${PG_TMP_BIN}"

setup() {
  cd "${PG_CWD}"
  while read -r db; do
    if [[ ! "$db" == template* ]]; then
      if [[ ! "$db" == postgres* ]]; then
        dropdb "$db"
      fi
    fi
  done < <(pg-list --short)
}

teardown() {
  rm -rf "$PG_TEST_DIR"
}

load lib/assertions
