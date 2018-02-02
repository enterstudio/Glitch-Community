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

#### On Your Side

1. You remix this site, play with it, and show us what you made!  Tweeting [@Glitch](https://twitter.com/glitch) or posting to [our forum](https://support.glitch.com/) are good ways to get our attention.
2. We say something like "We like what you got, good job!"
3. Your changes (or something inspired by your changes) are prepared and make their way to our live production site.

_behind the scenes_ we'll make use of GitHub's Pull Request workflow to incorporate changes.  If you're a part of that community, then feel free to submit pull requests directly-- if you're not,  don't worry about it and just focus on building and sharing your ideas.

#### On Our Side

Sometimes we'll have another feature or design underway that'll be in conflict with the direction that you took the site.  It's all good, let's keep it fun and keep it focused on the ideas and improvements.

This site is open source. All interactions between this site and Glitch-the-application are using public API endpoints-- there aren't any special prevlidges or secret endpoints going on.

This site is also young and hungry.  We don't have a public "bug list" and a lot of processes that are best to formalize have yet to be. And this site believes in a Glitchy future-- it is built, maintained, and deployed entirely within Glitch itself.  We're living the Glitchy future of web development, and it's a blast.

Accessible technologies are important to allowing people to contribute.  As we internally work on the code, we'll move incrementally towards ever-stronger documentation for the special pieces of this site and "boring"(easy to learn, perfectly fine) solutions for the standard components.


Contribution Workflow
----------------------

First, remix from [https://glitch.com/~community](https://glitch.com/~community) into, e.g., "my-remix"

Next, make your changes.  When you've got something you like, share it with us (see above), and you're all set.

***That's all you need to do,*** _but if you really want to be hands on with git pull requests, then read on._

#### Pull Request Workflow

Ok cool, these next steps are what we'd do internally and you're welcome to follow them as well if you choose.  Beyond this point, there be dragons.

1. On your local machine, clone our git repository from Github: 

    ```
    git clone https://github.com/FogCreek/Glitch-Community
    ```

2. Add your remix as remote source in that repository (remember to swap 'my-remix' with your actual remix name)
    ```
    cd Glitch-Community
    git remote add my-remix https://api.glitch.com/my-remix/git
    ```
 
3. Make a new branch ("my-branch" here, but it's best if you name this branch something that indicates its purpose, e.g. "fix-avatars", etc.) based on your remix:
    ```
    git fetch my-remix master:my-branch
    git checkout my-branch
    ```

4. Almost done!  This next step will submit your pull request to us in GitHub!
    ```
    git push origin my-branch
    ```
    _(Don't have permission to push? You'll need to first [Fork](https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/) our [repository](https://github.com/FogCreek/Glitch-Community) and then [create a pull request from the fork](https://help.github.com/articles/creating-a-pull-request-from-a-fork/) instead.)_

5. Now that we can see the full diff in the pull request, there are probably some changes that pop out as things worth fixing before merging it with the main project.  No problem, iterate!  Observe the diff, go back into you Glitch project, and make your changes.  To update the pull request, go back to your local console and run:
   ```
   git checkout my-branch  # Make sure we're on the right branch
   git pull my-remix master
   git push origin my-branch
   ```

#### Deployment

Only employees of Fog Creek will be able to do this step, and here it is!  This generally happens immediately after we merge in any pull request.

First, let's make sure any changes made direct to Community are merged and happy.  This is a Glitch site, after all-- we're not forcing the PR workflow, especially for small changes.

1. In your local git repo, checkout `origin/master`, then pull from `https://api.glitch.com/community/git` and, if there were any changes, merge them and push them back to `origin/master`.  If there were big changes, you'll want to test this merge by performing step #2 on a remix of community first before changing the live site.

    Ok, now the GitHub repository is updated and stable. 
  
2. Inside of https://glitch.com/~community, open up the console.
    ```
    git log -1 # Gets a stable changeset handy in case we need to revert
    git pull
    ```
    
3. You're deployed!  View the site and the logs, make sure it's building and looks basically alive.

    3.1 caveat for if you just broke the internet...  no worries, you've got git on your side: `git checkout <commit-hash-from-above>` and you're back to where you were before the pull.  Now go get help because something went wrong with step 1, and you need to figure it out and fix it. Once more into the breach!

#### Or just doing it live…

 *Can I just edit community directly, since it’s Glitch we’re dealing with here?*
  
Sure, go for it.  Viva la quick ways to make small changes. All standard caveats and cautions apply.
