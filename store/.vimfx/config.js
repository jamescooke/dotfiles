let options = {
    "prevent_autofocus": true,
    "blacklist": [
        "https://tweetdeck.twitter.com/*",
        "https://www.fastmail.com/calendar/*",
        "https://www.fastmail.com/contacts/*",
        "https://www.fastmail.com/mail/*",
        "https://docs.google.com/*",  // Does not play well with GDocs
        "*.mp3",    // Use Firefox's shortcuts for playing media files
    ].join(' '),
    "config_file_directory": "~/.vimfx/",

    'mode.caret.exit': '<c-[>',
    'mode.find.exit': '<c-[>',
    'mode.hints.exit': '<force><c-[>',
    'mode.ignore.exit': '<c-[>',
    'mode.marks.exit': '<c-[>',
    'mode.normal.esc': '<force><c-[>'
}

Object.entries(options).forEach(([option, value]) => vimfx.set(option, value))
