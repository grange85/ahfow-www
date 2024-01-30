customElements.whenDefined('hyvor-talk-comments').then(() => {
    const comments = document.createElement("hyvor-talk-comments");
    comments.settings = {
    top_widget: 'none', // 'reactions' | 'ratings' | 'none'
	}
    // then append
    document.getElementById("wrap").appendChild(comments);
});
