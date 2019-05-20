set -gx fish_user_abbreviations $fish_user_abbreviations "ga git add" "gaa git add --all" "gapa git add --patch" "gau git add --update" "gb git branch" "gba git branch -a" "gbd git branch -d" "gbl git blame -b -w" "gbnm git branch --no-merged" "gbr git branch --remote" "gbs git bisect" "gbsb git bisect bad" "gbsg git bisect good" "gbsr git bisect reset" "gbss git bisect start" "gc git commit -v" "gc! git commit -v --amend" "gcn! git commit -v --no-edit --amend" "gca git commit -v -a" "gca! git commit -v -a --amend" "gcan! git commit -v -a --no-edit --amend" "gcans! git commit -v -a -s --no-edit --amend" "gcam git commit -a -m" "gcsm git commit -s -m" "gcb git checkout -b" "gcf git config --list" "gcl git clone --recursive" "gclean git clean -fd" "gpristine git reset --hard && git clean -dfx" "gcm git checkout master" "gcd git checkout develop" "gcmsg git commit -m" "gco git checkout" "gcount git shortlog -sn" "gcp git cherry-pick" "gcpa git cherry-pick --abort" "gcpc git cherry-pick --continue" "gcs git commit -S" "gd git diff" "gdca git diff --cached" "gdct git describe --tags `git rev-list --tags --max-count=1`" "gdt git diff-tree --no-commit-id --name-only -r" "gdw git diff --word-diff" "gf git fetch" "gfa git fetch --all --prune" "gfo git fetch origin" "gg git gui citool" "gga git gui citool --amend" "ggpur ggu" "ggpull git pull origin (_git_branch_name_or_revision)" "ggpush git push origin (_git_branch_name_or_revision)" "ggsup git branch --set-upstream-to=origin/(_git_branch_name_or_revision)" "gpsup git push --set-upstream origin (_git_branch_name_or_revision)" "ghh git help" "gignore git update-index --assume-unchanged" "gignored git ls-files -v | grep "^[[:lower:]]"" "git-svn-dcommit-push git svn dcommit && git push github master:svntrunk" "gk \gitk --all --branches" "gke \gitk --all (git log -g --pretty=%h)" "gl git pull" "glg git log --stat" "glgp git log --stat -p" "glgg git log --graph" "glgga git log --graph --decorate --all" "glgm git log --graph --max-count=10" "glo git log --oneline --decorate" "glol git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" "glola git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all" "glog git log --oneline --decorate --graph" "gloga git log --oneline --decorate --graph --all" "gm git merge" "gmom git merge origin/master" "gmt git mergetool --no-prompt" "gmtvim git mergetool --no-prompt --tool=vimdiff" "gmum git merge upstream/master" "gp git push" "gpd git push --dry-run" "gpoat git push origin --all && git push origin --tags" "gpu git push upstream" "gpv git push -v" "gr git remote" "gra git remote add" "grb git rebase" "grba git rebase --abort" "grbc git rebase --continue" "grbi git rebase -i" "grbm git rebase master" "grbs git rebase --skip" "grh git reset HEAD" "grhh git reset --hard HEAD" "grmv git remote rename" "grrm git remote remove" "grset git remote set-url" "grt cd (git rev-parse --show-toplevel || echo ".")" "gru git reset --" "grup git remote update" "grv git remote -v" "gsb git status -sb" "gsd git svn dcommit" "gsi git submodule init" "gsps git show --pretty=short --show-signature" "gsr git svn rebase" "gss git status -s" "gst git status" "gsta git stash save" "gstaa git stash apply" "gstc git stash clear" "gstd git stash drop" "gstl git stash list" "gstp git stash pop" "gsts git stash show --text" "gsu git submodule update" "gts git tag -s" "gtv git tag | sort -V" "gunignore git update-index --no-assume-unchanged" "gunwip git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1" "gup git pull --rebase" "gupv git pull --rebase -v" "glum git pull upstream master" "gwch git whatchanged -p --abbrev-commit --pretty=medium" "gbm git branch -m" "gcaa git commit -v -a --amend" "ggpush git push --set-upstream origin HEAD" "grhh1 git reset --hard HEAD~1"
