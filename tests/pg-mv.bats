#!/usr/bin/env bats

load test_helper

@test "without enough arguments, prints usage" {
  run pg-mv
  assert_failure "Usage: pg mv <source> <target>"
}

@test "moves source to target" {
  createdb test1
  run pg-mv test1 target
  assert_success
  assert_db_doesnt_exist test1
  assert_db_exists target
}

@test "target has same content as source" {
  createdb test1
  psql test1 -c "create table data(id int, name varchar(10))"
  psql test1 -c "insert into data(id, name) values(1, 'dresden')"

  run pg-mv test1 target
  assert [ "$(psql target -t -c "select * from data")" = "  1 | dresden" ]
}
