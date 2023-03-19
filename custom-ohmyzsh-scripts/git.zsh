# Rename branches
function git-rename-branch()
{
    git branch -m $1 $2
    git push origin :$1
    git push --set-upstream origin $2
}

alias glfh="git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10"
alias git-count-lines="git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr"
