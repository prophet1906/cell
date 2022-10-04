---
layout: post
title:  "Github Contribution Workflow"
tags: vcs
---
This note covers the workflow I use to contribute to open-source projects. I am using `github.com` for simplicity, but basic concepts are the same for all git-based VCS.

## Finding Interesting Projects
When starting your open source contribution journey, the first step is to find a project that interests you. Many sites index good issues for beginners. I am listing down a few sites which I felt comfortable using when getting started.
- [Good First Issues](https://goodfirstissues.com/index.html)
- [Up For Grabs (up-for-grabs.net)](https://up-for-grabs.net/#/)

## Forking Repository
Once, you have figured out which project you want to contribute to, you can create a fork. A fork in github is an exact copy of some existing repository but under your username or org. You have full access to the forked repository, consider it your copy of code. You are going to add stuff here.
![Fork Repo]({{ site.baseurl }}/assets/images/gh-workflow/fork.excalidraw.png)

## Developing in Forked Repository
Before you can start contributing to any project, you need to first clone the forked repository in your development machine. Cloning will bring a copy of your forked repository to your local system. Once you have cloned the forked repository, you can start doing changes.  In the figure below, we start by creating `file1` in step 3 and committing them to the local branch `feature-branch`. After committing targeted changes in the local branch, you can push this local branch to a remote forked repository. After reviewing code changes, you can either merge these changes to the `main` branch or create a pull request against the `upstream` source project. The following figure shows the workflow used to do changes in a forked repo.
![Develop in Fork]({{ site.baseurl }}/assets/images/gh-workflow/develop-in-fork.excalidraw.png)

### Staging changes
Any file changes(including creation & deletion) stay in the working area by default. Git also provides us with a preparation area called staging. Whatever is present in staging gets saved permanently to `.git` when we commit. The following figure shows how the file changes move when using git commands.
![Staging Process]({{ site.baseurl }}/assets/images/gh-workflow/staging-process.excalidraw.png)

## Pull Requests
Pull requests are not part of git, but rather part of git-based websites. Pull requests provide easy to use interface to review changes done by contributors and approve, request changes or merge them in your repo. A pull request has 2 parts to it, `base(target)` refers to the place where you want to contribute, and `compare(source)` refers to the place from where the changes should be picked for contribution. Both `base` and `compare` can refer to different repo and branch. The following figure shows how pull requests help maintainers merge changes to their repositories.
![Pull Request]({{ site.baseurl }}/assets/images/gh-workflow/pull-request.excalidraw.png)

## Sync Fork Repository
Usually, any open source project has a very high commit frequency, as there are so many contributors who keep on adding stuff on the go. This also means, your fork is going to go out-of-sync/outdated very frequently. Thus, we need to keep `main` from our fork repository in sync with `main` from the source project. This can be done using the concept of upstream. Your local git repository has a table of remote URLs, this can be viewed using `git remote -v`. You can configure your local repository to have an `upstream` remote URL referring to the source project repo. You always pull changes from `upstream: main` and push them to `origin: main`.
![Sync Fork]({{ site.baseurl }}/assets/images/gh-workflow/sync-fork.excalidraw.png)

## Important Tips
- Avoid changes to `main` branches, if you commit something in main and it diverges from `upstream: main`, it will become very difficult to reconcile changes
- Always create a new branch from `main` when working on a new feature
- A fork can be created under any `user` or `org`, you can have a fork under org to share across the team
- As long as your `.git` folder is intact, you can recover any changes you lose from the working directory
- Pull requests are not essential, but help the maintainer when reviewing changes

## Conclusion
This note only covers the bare minimum required to start contributing to git projects. Additional reading is recommended to understand git fundamentals.

## Cheatsheet
[Free Git Book (goalkicker.com)](https://books.goalkicker.com/GitBook/)