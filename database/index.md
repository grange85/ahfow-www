---
layout: page-database
title : Releases, shows and tracks
position: home
---
<div class="row">
{% for artistslugs in site.data.artists %}
	{% capture status %}{% cycle section_name: 'a', 'b' %}{% endcapture %}
	{% assign artist = artistslugs[0] %}
	{% assign artist = site.data.artists[artist] %}
	{% if artist.slug == "galaxie-500" or artist.slug == "luna" or artist.slug == "damon-and-naomi" or artist.slug == "dean-and-britta" %}
		<div class="col-sm-6 col-md-6">
			<div class="thumbnail">
				<a href="/database/{{artist.slug}}/">
				<img class="media-object img-rounded  img-responsive" src="{{artist.image}}" alt="{{artist.name}} thumbnail" />
				</a>
				<div class="caption">
					<h3><a href="/database/{{artist.slug}}">{{artist.name}}</a></h3>
					<ul>
						{% if artist.slug == "dean-and-britta" or artist.slug == "dean-wareham" or artist.slug == "britta-phillips" %} 
						<li><a href="/database/dean-and-britta/{{artist.slug}}-releases/">{{artist.name}} discography</a></li>
						{% else %}
						<li><a href="/database/{{artist.slug}}/releases/">{{artist.name}} discography</a></li>
						{% endif %}
						<li><a href="/database/{% if artist.shows %}{{artist.shows}}{% else %}{{artist.slug}}{% endif %}/shows/">{{artist.name}} shows</a></li>
					</ul>
				</div>
			</div>
		</div>
		{% if status == 'b' %}
			</div><div class="row">
		{% endif %}
	{% endif %}
{% endfor %}
	<div class="col-sm-6 col-md-6">
		<div class="thumbnail">
			<img class="media-object img-rounded  img-responsive" src="https://media.fullofwishes.co.uk/00-misc/ahfow-web/ahfow-site-image-1280x720.jpg" alt="Site image - A Head Full of Wishes" />
			<div class="caption">
				<h3>Lists</h3>
				<h4>Tracks</h4>
				<ul>
				<li><a href="/database/tracks/">A-Z of tracks</a></li>
				<li><a href="/database/tracks/covers/">A-Z of cover versions</a></li>
				<li><a href="/database/tracks/chords/">A-Z of chords</a></li>
				<li><a href="/database/tracks/videos/">A-Z of tracks with promo videos</a></li>
				</ul>
				<h4>Releases</h4>
				<ul>
				<li><a href="/database/releases/available-on-bandcamp.html">Releases available on bandcamp</a></li>
				</ul>
				<h4>Downloads</h4>
				<ul>
				<li><a href="/database/shows/show-downloads.html">Shows available to download</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
