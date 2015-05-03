#!/usr/bin/env bats

load test_helper

@test "without args shows help for root command" {
  run pg-help

  assert_success
  assert_line "Usage: pg <command> [<args>]"
}

@test "invalid command" {
  run pg-help hello
  assert_failure "pg: no such command 'hello'"
}

@test "shows help for a specific command" {
  cat > "${PG_TMP_BIN}/pg-hello" <<SH
#!shebang
# Usage: pg hello <world>
# Summary: Says "hello" to you
# This command is useful for saying hello.
echo hello
SH

  run pg-help hello

  assert_success
  assert_output <<SH
Usage: pg hello <world>

This command is useful for saying hello.
SH
}
