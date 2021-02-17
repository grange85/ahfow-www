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
		<div class="col-lg-6">
			<div class="card h-100">
				<div class="card-header">
					<a href="/database/{{artist.slug}}/">
					<img class="media-object img-rounded  img-fluid" src="{{artist.image}}" alt="{{artist.name}} thumbnail" />
					</a>
					<h3><a href="/database/{{artist.slug}}">{{artist.name}}</a></h3>
				</div>
				<div class="card-body">
					<div class="list-group">
						{% if artist.slug == "dean-and-britta" or artist.slug == "dean-wareham" or artist.slug == "britta-phillips" %} 
						<a href="/database/dean-and-britta/{{artist.slug}}-releases/" class="list-group-item list-group-item-action">{{artist.name}} discography</a>
						{% else %}
						<a href="/database/{{artist.slug}}/releases/" class="list-group-item list-group-item-action">{{artist.name}} discography</a>
						{% endif %}
						<a href="/database/{% if artist.shows %}{{artist.shows}}{% else %}{{artist.slug}}{% endif %}/shows/" class="list-group-item list-group-item-action">{{artist.name}} shows</a>
					</div>
				</div>
			</div>
		</div>
		{% if status == 'b' %}
			</div><div class="row">
		{% endif %}
	{% endif %}
{% endfor %}
	<div class="col">
		<div class="card">
			<div class="card-header">
				<img class="media-object img-rounded  img-fluid" src="https://media.fullofwishes.co.uk/00-misc/ahfow-web/ahfow-site-image-1280x720.jpg" alt="Site image - A Head Full of Wishes" />
				<h3>Lists</h3>
			</div>
			<div class="card-body">
				<div class="list-group">
					<h4>Tracks</h4>
					<a class="list-group-item list-group-item-action" href="/database/tracks/">A-Z of tracks</a>
					<a class="list-group-item list-group-item-action" href="/database/tracks/covers/">A-Z of cover versions</a>
					<a class="list-group-item list-group-item-action" href="/database/tracks/chords/">A-Z of chords</a>
					<a class="list-group-item list-group-item-action" href="/database/tracks/videos/">A-Z of tracks with promo videos</a>
					<h4>Releases</h4>
					<a class="list-group-item list-group-item-action" href="/database/releases/available-on-bandcamp.html">Releases available on bandcamp</a>
					<h4>Downloads</h4>
					<a class="list-group-item list-group-item-action" href="/database/shows/show-downloads.html">Shows available to download</a>
			</div>
		</div>
	</div>
</div>
