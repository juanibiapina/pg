#!/usr/bin/env bats

load test_helper

@test "without arguments prints usage" {
  run pg-kill-connections
  assert_failure
  assert_line "Usage: pg kill-connections <db_name>"
}

@test "drops all connections from the database" {
  run pg-kill-connections db_name
  assert_success
  assert_line "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid <> pg_backend_pid() AND datname='db_name';"
}
