path "secret/foo" {
  policy = "read"
}

path "database/creds/readonly" {
  policy = "read"
}

path "consul/creds/readonly" {
	policy = "read"
}