# git-tips
Speed up your git with these tips and tricks.
Go directly to [example script and alias](https://github.com/idanbak/git-tips/blob/master/.profile)

## __Content:__
* [Aliases](#aliases)
* [Terminal](#terminal)
* [Everyday Git in twenty commands or so](#everyday-git-in-twenty-commands-or-so)
* [Show helpful guides that come with Git](#show-helpful-guides-that-come-with-git)
* [Git clone](#git-clone)
* [What did I just commit?](#what-did-i-just-commit)
* [Quickly switch to the previous branch](#quickly-switch-to-the-previous-branch)
* [Styled Git Status](#styled-git-status)
* [Visualize the version tree](#visualize-the-version-tree)
* [Group commits by authors and title](#group-commits-by-authors-and-title)
* [List all branches](#list-all-branches)
* [Git Diff](#git-diff)
* [What changed since two weeks?](#what-changed-since-two-weeks)
* [Push a new local branch](#push-a-new-local-branch)
* [Stashes](#stashes)
* [References](#references)
---

## Aliases
Aliases are helpers that let you define your own git calls. For example, you could set `git st` to run `git status` (see *(1)*) or you could configure to even more shorter `gst` (see *(2)*).

### (1) .gitconfig
To add an alias, either navigate to `~/.gitconfig` and fill it out in the following format:

```sh
[alias]
  st = status
  co = checkout
  p = push
```

...or type in the command-line:

```sh
git config --global alias.st 'status'
```

### (2) Bash .profile
If you want even shorter aliases, you can configure them in your preferred shell configuration file. For example if you are using Git bash, this can be achieved by edit (or, create a new one if not exist) the `.profile` file in your user home  `(C:\Users\<your_username>\.profile)` and paste this, then restart you GitBash.

```sh
alias gst="git status"
```

Have a look at [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git) to get an inspirational list of many aliases.

---

## Terminal
Integrate **Git Bash** in Visual Studio Code Terminal by adding below setting (later this setting also useful when adding command/git alias):

```json
{
    "terminal.integrated.shell.windows": "C:\\Program Files\\Git\\bin\\bash.exe",
    "terminal.integrated.shellArgs.windows": [
        "-l"
      ]
}
```

Open your terminal using shortcut `Ctrl` + ` ` `

---


## Everyday Git in twenty commands or so
```sh
git help everyday
```

## Show helpful guides that come with Git
```sh
git help -g
```

## Git clone
Clone repository and directly cd into it.

First, we need to create simple script:

```sh
gclone() {
  git clone "$1" && cd "$(basename $1 .git)"
}
```
then make alias for it:

```sh
alias gcd=gclone
```


## What did I just commit?
Let's say that you just blindly committed changes with `git commit` and you're not sure what the actual content of the commit you just made was. You can show the latest commit on your current HEAD with:

```sh
git show

# or
git log -p -1
```

## Quickly switch to the previous branch
To move to the previous branch in Git:

```sh
$ git checkout -
# Switched to branch 'master'

$ git checkout -
# Switched to branch 'other_branch'

$ git checkout -
# Switched to branch 'master'
```

__Alternatives:__
```sh
git checkout @{-1}
```

## Styled Git Status
Show the index (changed files).

```sh
git status

# or simplify the output
git status -sb
```

## Visualize the version tree
Running:

```sh
git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all

# or use this alternative
gitk --all --branches
```

## Group commits by authors and title
```sh
git shortlog
```

## List all branches
List all branches and their upstreams, as well as last commit on branch

```sh
git branch -vv
```

## Git Diff
Show changes between commits, commit and working tree, etc

```sh
# List all the conflicted files
git diff --name-only --diff-filter=U

# Unstaged changes since last commit
git diff

# Show both staged and unstaged changes
git diff HEAD

# Changes staged for commit
git diff --cached
git diff --staged
```

## What changed since two weeks?
```sh
git log --no-merges --raw --since='2 weeks ago'

# or use this alternative
git whatchanged --since='2 weeks ago'
```

## Push a new local branch
```sh
git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
```

## Stashes
Stash all the good changes and reapply good changes.

```sh
$ git stash #Saving current state of tracked files
$ git stash -a  #Saving current state of all files (ignored, untracked, and tracked)
$ git stash pop #Apply last stashed state and delete it from stashed list
$ git stash list #Show list of all saved stashes
$ git stash clear #Delete all stored stashes
```

## References

This doco inspired by my awesome former colleague [Tobias Büschel - Git Speed](https://github.com/tobiasbueschel/git-speed). Also see [Git-tips](https://github.com/git-tips/tips) for another tips.