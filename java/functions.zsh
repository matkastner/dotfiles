function set_java_version {
  [ -s ".java-version" ] && { java -version }
}
