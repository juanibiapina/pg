#!/usr/bin/env bats

load test_helper

@test "creates a database" {
  run pg-create test1
  assert_success
  assert_db_exists test1

  dropdb test1
}
