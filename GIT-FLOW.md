git-flow cheatsheet
===================


## 1. To-Do on first use
### Clone repo off Github and initialize thru git-flow
    $> git clone git@github.com:refinery29/devops-plankton.git
    $> git flow init  (Accept all defaults)
    



## 2. To-Do as code is being developed
### a. Start new feature
    $> git flow feature start **MYFEATURE**

### b. Complete feature
    $> git add --all
    $> git commit -a -m "new commit message"
    $> git flow feature finish **MYFEATURE**




## 3. To-Do when working with others
### a. Publish feature
    $> git flow feature publish **MYFEATURE**

### b. Get a published feature
    $> git flow feature pull origin **NEWFEATURE**

### c. Track a feature
    $> git flow feature track **NEWFEATURE**





## 4. To-Do when ready to push to Production
### a. Start a release
    $> git flow release start **vXX.XX.XX**

    [Do all last minute changes on the code...]

### b. Finish a release
    $> git flow release finish **vXX.XX.XX**
    $> git push --tags

### c. Sync-up with github
    $> git push origin develop
    $> git push origin master



## 5. To-Do when pushing a last-minute hotfix
### a. Start a hotfix
    $> git flow hotfix start **vXX.XX.XXa**

    [Do all last minute changes on the code...]

### b. Finish a hotfix
    $> git flow hotfix finish **vXX.XX.XXa**
    $> git push --tags
    $> git push origin develop
    $> git push origin master