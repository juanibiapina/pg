assert_db_exists() {
  db="$1"
  if ! pg-list --short | grep -w "$db"; then
    flunk "Database $db doesn't exist"
  fi
}

assert_db_doesnt_exist() {
  db="$1"
  if pg-list --short | grep -w "$db"; then
    flunk "Database $db exists"
  fi
}
