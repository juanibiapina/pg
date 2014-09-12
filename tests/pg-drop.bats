#!/usr/bin/env bats

load test_helper

@test "without arguments, prints usage" {
  run pg-drop
  assert_failure "Usage: pg drop <database>"
}

@test "drops a database" {
  createdb test2
  run pg-drop test2
  assert_success
  assert_db_doesnt_exist test2
}

@test "doesn't fail if db does not exist" {
  run pg-drop whatever
  assert_success
}
