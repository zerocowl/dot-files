# Rename branches
function git-rename-branch()
{
    git branch -m $1 $2
    git push origin :$1
    git push --set-upstream origin $2
}
