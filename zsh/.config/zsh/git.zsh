alias gfc='git branch | fzf | xargs git checkout'

sync_branches() {
  git remote prune origin
  for merged_branch in $(git for-each-ref --format '%(refname:short)' --merged HEAD refs/heads/)
  do
    git branch -d ${merged_branch}
  done
}

del_branches() {
  local branches_to_delete
  branches_to_delete=($(git for-each-ref --format '%(refname:short)' --merged HEAD refs/heads/ | fzf --multi))

  if [ -n "$branches_to_delete" ]; then
    git branch -D $branches_to_delete
  fi
}
