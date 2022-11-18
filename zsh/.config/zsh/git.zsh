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

pr_checkout() {
  local jq_template pr_number

  jq_template='"'\
'#\(.number) - \(.title)'\
'\t'\
'Author: \(.user.login)\n'\
'Created: \(.created_at)\n'\
'Updated: \(.updated_at)\n\n'\
'\(.body)'\
'"'

  if [[ ! -z "${1}" ]]
  then
    pr_number=${1}
  else
    pr_number=$(
      gh api 'repos/:owner/:repo/pulls' |
      jq ".[] | $jq_template" |
      sed -e 's/"\(.*\)"/\1/' -e 's/\\t/\t/' |
      fzf \
        --with-nth=1 \
        --delimiter='\t' \
        --preview='echo -e {2}' \
        --preview-window=top:wrap |
      sed -e 's/ .*//' -e 's/^.//'
    )
  fi

  if [ -n "$pr_number" ]; then
    gh pr checkout $pr_number
  fi
}
