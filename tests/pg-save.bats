#!/usr/bin/env bats

load test_helper

@test "without arguments prints usage" {
  run pg-save
  assert_failure
  assert_line "Usage: pg save <db_name>"
}

@test "drops all connections from the database" {
  run pg-save db_name
  assert_success
  assert_line "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid <> pg_backend_pid() AND datname='db_name';"
}

@test "runs a command to copy the database" {
  run pg-save db_name
  assert_success
  assert_line "CREATE DATABASE snapshot WITH TEMPLATE db_name;"
}

@test "full psql command" {
  run pg-save db_name
  assert_success "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid <> pg_backend_pid() AND datname='db_name';
CREATE DATABASE snapshot WITH TEMPLATE db_name;"
}
