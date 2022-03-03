function cleanup {
    find ~/Code -type d -name node_modules -prune -exec trash '{}' +
    find ~/Code -type d -name Pods -prune -exec trash '{}' +
    find ~/Code -type f -name '*.hprof' -prune -exec trash '{}' +

    find ~/Downloads -mtime +14 -maxdepth 1 -exec trash '{}' +
}
