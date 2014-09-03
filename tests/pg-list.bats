#!/usr/bin/env bats

load test_helper

@test "lists databases" {
  run pg-list
  assert_success "psql
postgres
-Atq
-c
select d.datname from pg_catalog.pg_database d where d.datname <> 'template0';"
}
