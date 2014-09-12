eval "$(basher init-bundle -)"

source "$(basher runtime-path basherpm/bats-assertions)"

export PG_TEST_DIR="${BATS_TMPDIR}/pg"
export PG_CWD="${PG_TEST_DIR}/cwd"

export PATH="${BATS_TEST_DIRNAME}/../libexec:$PATH"

mkdir -p "${PG_CWD}"

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
