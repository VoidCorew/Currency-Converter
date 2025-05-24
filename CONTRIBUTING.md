# Contribution Guide

## Getting Started
1. **Fork** this repository
2. **Clone** your forked repository
```bash
git clone https://github.com/your-nickname/my-repo.git
cd my-repo
```
3. Add my reposotory as upstream
```bash
git remote add upstream https://github.com/my-nickname/my-repo.git
```
4. Get a list of current branches and look to your current branch
```bash
git branch
```
5. If your branch is main, type
```bash
git checkout develop
```
6. Sync with latest changes
```bash
git fetch upstream
git checkout develop
git pull upstream develop
```
## Create new branch 
```bash
git checkout -b feature/your-branch-name
```
## or for bug fixes
```bash
git checkout -b fix/issue-description
```
## Next steps
7. After adding changes
```bash
git add .
git commit -m "your commit"
git push origin feature/your-branch-name
```
7. Choose your branch on GitHub
8. Press New Pull Request
9. Choose:
  - base repository: my-nickname/my-repo
  - base branch: develop
  - head repository: your-nickname/my-repo
  - compare branch: feature/your-branch-name