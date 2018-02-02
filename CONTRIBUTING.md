Contributing
------------

Hey, welcome!  This document should give you all the steps you need to make contributions to the Glitch community site. This guide applies to full time makers of Glitch as well as all members of our Glitch community.

Please note we have a [code of conduct](https://glitch.com/edit/#!/community?path=CODE_OF_CONDUCT.md), please follow it in all your interactions with the project and the denizens thereof.

Philosophy
----------

This site is open source. All interactions between this site and Glitch-the-application are using public API endpoints-- there aren't any special prevlidges or secret endpoints going on.

This site is also young and hungry.  We don't have a public "bug list" and a lot of processes that are best to formalize have yet to be. And this site believes in a Glitchy future-- it is built, maintained, and deployed entirely within Glitch itself.




Contribution workflow
----------------------



[Todo:  We can alleviate the users from having to do branching work in Setup by creating a branch out of my-remix/master in step 3 of ‘submit a pull request’.  This’d also let us adopt a public workflow of “Hey, just remix the site and make changes.”, and then a Glitch team member can do the ‘PR’ steps as needed.]

Setup:
Remix from /community/ into, e.g., my-remix
On the console in your new remix, make a new branch
`git checkout -b my-branch`
Work on community.

Later, to submit a pull request:
On your local machine, have a git repo tracking https://github.com/FogCreek/Glitch-Community
Add your remix as a remote source:
`git remote add my-remix https://api.glitch.com/my-remix/git`
Fetch your branch
`git checkout --track my-remix/my-branch
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
