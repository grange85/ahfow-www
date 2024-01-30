customElements.whenDefined('hyvor-talk-comments').then(() => {
    const comments = document.createElement("hyvor-talk-comments");
    comments.settings = {
    top_widget: 'none', // 'reactions' | 'ratings' | 'none'
    editor: {
        emoji: false,
        images: false,
        gifs: false,
        embeds: false, // link embedding
        mentions: true,
        code_blocks: true,
        blockquotes: true,
        inline_styles: true, // bold, italic, inline code, strike, spoiler
        links: true,
    },
	}
    // then append
    document.getElementById("wrap").appendChild(comments);
});
