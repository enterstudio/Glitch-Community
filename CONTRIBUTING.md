Contributing
------------

Hey, welcome!  This document should give you all the steps you need to make contributions to the Glitch community site. This guide applies to full time makers of Glitch as well as all members of our Glitch community.

Please note we have a [code of conduct](https://glitch.com/edit/#!/community?path=CODE_OF_CONDUCT.md), please follow it in all your interactions with the project and the denizens thereof.

Contribution Mission
--------------------
Anyone in our community can feel welcome and supported in submitting improvements, fixes, and ideas to this Glitch community site.


Philosophy and Ideals
---------------------

Our ideal contribution flow works like this:

### On Your side

1. You remix this site, play with it, and show us what you made!  Tweeting [@Glitch](https://twitter.com/glitch) or posting to [our form](https://support.glitch.com/) are good ways to get our attention.
2. We say something like "We like what you got, good job!"
3. Your changes (or something inspired by your changes) are live on our production site.

_behind the scenes_ we'll make use of GitHub's Pull Request workflow to incorporate changes.  If you're a part of that community, then feel free to submit pull requests directly-- if you're not,  don't worry about it and just focus on building and sharing your ideas.

### On our side

Sometimes we'll have another feature or design underway that'll be in conflict with the direction that you took the site.  It's all good, let's keep it fun and keep it focused on the ideas and improvements.

This site is open source. All interactions between this site and Glitch-the-application are using public API endpoints-- there aren't any special prevlidges or secret endpoints going on.

This site is also young and hungry.  We don't have a public "bug list" and a lot of processes that are best to formalize have yet to be. And this site believes in a Glitchy future-- it is built, maintained, and deployed entirely within Glitch itself.  We're living the Glitchy future of web development, and it's a blast.

Accessible technologies are important to allowing people to contribute.  As we internally work on the code, we'll move incrementally towards ever-stronger documentation for the special pieces of this site and "boring"(easy to learn, perfectly fine) solutions for the standard components.


Contribution workflow
----------------------

It starts with a remix!

First, remix from https://glitch.com/~community into, e.g., "my-remix.glitch.me"

Next, make your changes.  When you've got something you like, share it with us (see above), and you're all set.

99% of people can stop right here.

_But let's just say that I really want to be more hands-on with my sharing_

Ok cool, these next steps are what we'd do internally and you're welcome to follow them as well.  Beware, Thar be Git Dragons beyond this point.

1. On your local machine, clone our git repository from Github:
 `git clone https://github.com/FogCreek/Glitch-Community`

2. Add you remix as remote source in that repository (remember to swap 'my-remix' with your actual remix name)
 `cd Glitch-Community`
 `git remote add my-remix https://api.glitch.com/my-remix/git`
 
3. Make a new branch ("my-branch" here, but it's best if you name this branch something that indicates its purpose, e.g. "fix-avatars", etc.) based on your remix:
 `git fetch my-remix master:my-branch`
 `git checkout my-branch`

4. Almost done!  This next step will submit your pull request to us in GitHub!
 `git push origin my-branch`
 
( Don't have permission to push? You'll need to first [Fork](https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/) our [repository](https://github.com/FogCreek/Glitch-Community) and then [create a pull request from the fork](https://help.github.com/articles/creating-a-pull-request-from-a-fork/) instead.

5. Now that we can see the full diff in the pull request, there are probably some changes that pop out as things worth fixing before merging it with the main project.  No problem, iterate!  Observe the diff, go back into you Glitch project, and make your changes.  To update the pull request, go back to your local console and run:
`git checkout my-branch`
`git pull my-remix master`
`git push origin my-remix`

Push your branch to Glitch-Community
`git push origin my-branch`
(Not a Fog Creek employee? First Fork Glitch-Community, then push to your fork.)
Within the GitHub UI, submit your pull request.

To iterate on your pull request:
Inside your remix, make sure you’re still on my-branch, and do your work. `git commit` as much as you like, or wait for autocommit to come along.
Locally, with my-branch checked out, `git pull`
Locally, `git push origin my-branch` to add your changes to the PR

To deploy the site:
On the community site, first to a Github Export to FogCreek/glitch-community-backup
On the console in /Community/, `git pull`. https://github.com/FogCreek/Glitch-Community
Smoke test;  if anything is funky then maybe `git checkout <commit-from-before-the-merge>` to keep the site happy, then remix and sort things out there or import from FogCreek/glitch-community-backup

Or just doing it live…
    Q: Can I just edit community directly, since it’s Glitch we’re dealing with here?
    A: Sure, go for it.  Viva la quick ways to make small changes.
