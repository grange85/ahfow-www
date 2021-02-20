---
layout: page-database
title : Releases, shows and tracks
position: database-1
---
<div class="row">
{% for artistslugs in site.data.artists %}
	{% assign artist = artistslugs[0] %}
	{% assign artist = site.data.artists[artist] %}
	{% if artist.slug == "galaxie-500" or artist.slug == "luna" or artist.slug == "damon-and-naomi" or artist.slug == "dean-and-britta" %}
	<div class="col-sm-12">
		<div class="card mb-3">
			<img class="card-img-top" src="{{artist.image}}" alt="{{artist.name}} thumbnail" />
			<div class="card-header">
				<a href="/database/{{artist.slug}}/">
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
	{% endif %}
{% endfor %}
	<div class="col-sm-12">
		<div class="card mb-3">
			<img class="card-img-top" src="https://media.fullofwishes.co.uk/00-misc/ahfow-web/ahfow-site-image-1280x720.jpg" alt="Site image - A Head Full of Wishes" />
			<div class="card-header">
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
</div>
