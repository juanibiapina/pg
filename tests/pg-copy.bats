#!/usr/bin/env bats

load test_helper

@test "without enough arguments, prints usage" {
  run pg-copy
  assert_failure "Usage: pg copy <origin> <target>"
}

@test "copies origin to target" {
  createdb test1
  run pg-copy test1 target
  assert_success
  assert_db_exists test1
  assert_db_exists target
}

@test "target has same content as origin" {
  createdb test1
  psql test1 -c "create table data(id int, name varchar(10))"
  psql test1 -c "insert into data(id, name) values(1, 'dresden')"

  run pg-copy test1 target
  assert [ "$(psql target -t -c "select * from data")" = "  1 | dresden" ]
}
