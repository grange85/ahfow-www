function handler(event) {
    var request = event.request;
    var uri = request.uri;
    var redirect = 0;
    var newuri = 0;

	// manage redirects
    var redirects = [
        ['my-record-collection-116-dean-britta','https://www.fullofwishes.co.uk/2024/03/07/my-record-collection-116-luna-tell-me-do-you-miss-me-dvd-region-2-3-4-5/'],
        ['happy-61st-birthday-jonathan-richman','https://www.fullofwishes.co.uk/2015/05/16/happy-birthday-to-jonathan-richman/'],
		['dean-wareham-2025-04-03-hangar-34-liverpool-uk','https://www.fullofwishes.co.uk/database/dean-and-britta/shows/dean-wareham-2025-04-03-rough-trade-liverpool-uk/']
    ];

    while (redirect < redirects.length) {
    if (uri.includes(redirects[redirect][0])) {
            newuri = redirects[redirect][1];
            request = {
                statusCode: 301,
                statusDescription: 'Found',
                headers:
                    { "location": { "value": newuri } }
                }
            return request;
            }
        redirect ++;
    }	


    // redirect shows from old urls
	if (/\/database\/([^\/]*)\/shows\/[0-9]{4}\/(.{10})-(luna|damon-naomi|dean-britta)-(.*)$/.test(uri)) {
		newuri = uri.replace(/\/database\/([^\/]*)\/shows\/[0-9]{4}\/(.{10})-(luna|damon-naomi|dean-britta)-(.*)$/, '/database/$1/shows/$1-$2-$4');
		 request = {
                statusCode: 301,
                statusDescription: 'Found',
                headers:
                    { "location": { "value": "https://www.fullofwishes.co.uk"+newuri } }
                }
            return request;
	}



    // Check whether the URI is missing a file name.
    if (uri.endsWith('/') && !uri.includes('feed')) {
        request.uri += 'index.html';
    }
    // Check whether the URI is missing a file extension.
    else if (!uri.includes('.') && !uri.includes('feed')) {
        request.uri += '/index.html';
    }
    else if(uri.startsWith('/feed/')) {
        request.uri = '/feed';
    }
    return request;
}

