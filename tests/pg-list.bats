load test_helper

@test "lists databases" {
  run pg-list
  assert_success
  [ "$output" = "$(psql -l)" ]
}

@test "lists only db names" {
  run pg-list --short
  assert_success "postgres
template0
template1"
}
