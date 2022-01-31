function cleanup_dependencies {
    find ~/Code -type d -name node_modules -prune -exec rm -rf '{}' +
    find ~/Code -type d -name Pods -prune -exec rm -rf '{}' +
    find ~/Code -type f -name '*.hprof' -prune -exec rm '{}' +

    find ~/Downloads -mtime +14 -exec rm -rf '{}' +
}
