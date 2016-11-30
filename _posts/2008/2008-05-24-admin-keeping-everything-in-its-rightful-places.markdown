---
layout: post
status: publish
published: true
title: 'Admin: Keeping everything in its rightful places...'
author:
  display_name: Andy
  login: admin
  email: andy@fullofwishes.co.uk
  url: http://www.grange85.co.uk
author_login: admin
author_email: andy@fullofwishes.co.uk
author_url: http://www.grange85.co.uk
date: '2008-05-24 22:33:35 +0100'
date_gmt: '2008-05-24 22:33:35 +0100'
categories:
- editorial
- admin
tags: []
---
<div class="imagebox-a"><img src="http://www.fullofwishes.co.uk/wp/wp-content/uploads/2008/05/backstage_kyoto-300x225.jpg" alt="" title="Backstage, Kyoto" width="300" height="225" class="alignnone size-medium wp-image-686" /><br/>Wake me up when he's finished...<br/>picture from <a href="http://www.fuzzywuzzy.com">fuzzywuzzy.com</a></div>
<p>This is a really long and tedious post about managing links and tagging and it exists only as a reference and because I think really ought to document this sort of thing so that my grandchildren will be able to see just how truly, truly sad their granddad was . Unless the very un-rock'n'roll subject of managing information is your thing I suggest you should probably not read on...</p>
<p><a id="more"></a><a id="more-685"></a>
<p>Over the years one of the things I've failed to get under control is keeping track of what's on the Internet that could be of interest to visitors to A Head Full of Wishes. In the past I've tried to build a links system into the database (that got too unwieldy too quickly) and tried to use the <a href="http://en.wikipedia.org/wiki/Open_Directory_Project">Open Directory Project</a> (which was (rightfully) too restrictive in what I could add). About three years ago I started using the social bookmarking site <a href="http://del.icio.us">delicious</a> to try and keep track of things but my efforts where ill-conceived and half-hearted. Things have got better in the last couple of years but I would tag things and the last few would show up on the AHFoW home page but once they drifted off the bottom they were pretty much lost.</p>
<p>A year or so back I pinched <a href="http://www.last.fm">last.fm</a>'s tactic of enabling users to tag photos on <a href="http://flickr.com">Flickr</a> so that the photos of a specific event could be pulled into that events page on last.fm. So AHFoW users (actually mostly me) could tag their Flickr photos of a <a href="http://flickr.com/photos/grange85/tags/ahfow%3Ashowid%3D855/">Dean & Britta</a> or <a href="http://flickr.com/photos/grange85/tags/ahfow%3Ashowid%3D901/">Damon & Naomi</a> gig and have them show up on this website. In order to do this each gig was given an event ID (actually it already had one in the database) and a tag was constructed using the namespace:precdicate=value syntax that <a href="http://www.flickr.com/groups/api/discuss/72157594497877875/">Flickr calls a "machine tag"</a> and has been used to geotag photos and is what last.fm uses for its system.</p>
<p>It occurred to me recently that a similar system could be used in delicious to keep track of other relevant things on the Internet, not just photos but plog posts, reviews, interviews and videos - in fact anything relevant with a URL could be tagged and traceable. Each event already had a suitable tag (from the Flickr system) but I decided to extend this to include every artist, track and album.</p>
<p>So now a video on <a href="http://www.youtube.com/watch?v=Z6o2mc-xKa8">YouTube of Galaxie 500 playing Tugboat at the Commonwealth School in Boston</a> would live in three places on A Head Full of Wishes...</p>
<ul>
<li><a href="http://del.icio.us/tag/ahfow:artistid%3D1">A list of Galaxie 500 bookmarks</a>.</li>
<li><a href="http://del.icio.us/tag/ahfow:trackid%3D9">A list of Tugboat bookmarks</a> which could also include blog posts about the song, other videos, YouTube users cover versions etc.</li>
<li><a href="http://del.icio.us/tag/ahfow:showid%3D992">A list of bookmarks specific to that event</a> which could collect links to vidoes, music, reviews, photos of the gig.</li>
</ul>
<p>And added to that there are all the "proper" tags that I and any other delicious user can add to an item. Everything has a place and most things have more than one place - this is an attempt to embrace what David Weinberger’s <a href="http://www.everythingismiscellaneous.com">Everything Is Miscellaneous</a> calls <span class="removed_link" title="http://www.everythingismiscellaneous.com/wp-content/samples/eim-sample-chapter1.html">the third order of order</span>.</p>
<p>Another potential benefit of the system is that I could make use of A Head Full of Wishes visitors to help me keep track of what's out there - anyone can add the Tugboat tag to a relevant website and AHFoW will find it. Unfortunately the nature of the tags makes them not very intuitive - it's not easy to remember that the tag for Tugboat is <em>ahfow:trackid=9</em> so I suspect that not too many visitors are likely to be helping out.</p>
<p>The three (other) down-sides to the system (that I'm aware of) are...</p>
<ul>
<li>Firstly one that has plagued any similar system in the past that of broken links - websites change or vanish and along with them goes the content either gone forever or lost. Sadly I think that there's no way around this and making use of social bookmarking site means that even vigilance on my part wouldn't necessarily be able to keep the tags clean of broken links.</li>
<li>Secondly, the system is open to abuse, anyone can use the tags and if anyone can tag a site how long before the spammers are able to exploit that...how long before the first links to porn and drugs sites appear?</li>
<li>Thirdly, while I may have invented the ahfow namespace, I don't own it and there's nothing to stop "A Haven for Our Walruses" or some other similarly named entity from using the ahfow namespace. Admittedly that's not very likely but it is a risk.</li>
</ul>
<p>So there it is, if you've made it this far then congratulations and I'd appreciate any comment or input on this - it might seem like a small thing because ultimately all it really does is collect links and links is what the WWW has always been about anyway, but hopefully it will begin to organise all the really interesting Galaxie 500 related content out there.</p>
<p>The next task is to get my head round the <span class="removed_link" title="http://musicontology.com/">Music Ontology</span> so that all this lovely and useful (and unique) data I have can find a place in the wider world of <a href="http://linkeddata.org/">linked data</a> and I can start making better use of all the lovely and useful (and unique) data that's already out there...when that happens A Head Full of Wishes won't seem so small anymore.</p>
