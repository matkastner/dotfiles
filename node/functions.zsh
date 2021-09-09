function set_node_version {
  [ -s ".nvmrc" ] && { nvm use --silent || nvm install; echo "Node.js $(node --version)"; }
}
