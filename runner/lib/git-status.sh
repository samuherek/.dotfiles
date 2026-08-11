#!/bin/sh

git_current_branch() {
    git -C "$DOTFILES_ROOT" branch --show-current
}

git_upstream_branch() {
    git -C "$DOTFILES_ROOT" rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true
}

git_worktree_dirty() {
    if [ -n "$(git -C "$DOTFILES_ROOT" status --porcelain)" ]; then
        printf 'yes\n'
    else
        printf 'no\n'
    fi
}

git_ahead_behind() {
    upstream_branch="$1"

    if [ -z "$upstream_branch" ]; then
        printf '0 0\n'
        return 0
    fi

    git -C "$DOTFILES_ROOT" rev-list --left-right --count HEAD..."$upstream_branch"
}

git_sync_status() {
    upstream_branch="$1"

    if [ -z "$upstream_branch" ]; then
        printf 'no-upstream\n'
        return 0
    fi

    set -- $(git_ahead_behind "$upstream_branch")
    ahead_count="$1"
    behind_count="$2"

    if [ "$ahead_count" -eq 0 ] && [ "$behind_count" -eq 0 ]; then
        printf 'up-to-date\n'
    elif [ "$ahead_count" -eq 0 ] && [ "$behind_count" -gt 0 ]; then
        printf 'behind %s\n' "$behind_count"
    elif [ "$ahead_count" -gt 0 ] && [ "$behind_count" -eq 0 ]; then
        printf 'ahead %s\n' "$ahead_count"
    else
        printf 'diverged %s %s\n' "$ahead_count" "$behind_count"
    fi
}

print_git_status() {
    branch_name="$(git_current_branch)"
    upstream_branch="$(git_upstream_branch)"
    sync_status="$(git_sync_status "$upstream_branch")"
    dirty_status="$(git_worktree_dirty)"

    printf 'Repo branch: %s\n' "$branch_name"
    printf 'Repo upstream: %s\n' "${upstream_branch:-none}"
    printf 'Repo sync: %s\n' "$sync_status"
    printf 'Repo dirty: %s\n' "$dirty_status"
}

sync_repo() {
    dirty_status="$(git_worktree_dirty)"

    if [ "$dirty_status" = "yes" ]; then
        fail "dotfiles repo has uncommitted changes"
    fi

    git -C "$DOTFILES_ROOT" fetch origin

    upstream_branch="$(git_upstream_branch)"

    if [ -z "$upstream_branch" ]; then
        fail "current branch has no upstream"
    fi

    sync_status="$(git_sync_status "$upstream_branch")"

    case "$sync_status" in
        up-to-date)
            printf 'Dotfiles repo already up to date.\n'
            ;;
        behind*)
            git -C "$DOTFILES_ROOT" pull --ff-only
            ;;
        ahead*)
            fail "dotfiles repo is ahead of upstream; not pulling"
            ;;
        diverged*)
            fail "dotfiles repo has diverged from upstream; not pulling"
            ;;
        no-upstream)
            fail "current branch has no upstream"
            ;;
        *)
            fail "unknown repo sync state: $sync_status"
            ;;
    esac
}
