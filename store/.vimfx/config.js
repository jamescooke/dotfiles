let options = {
    "prevent_autofocus": true,
    "blacklist": [
        "https://tweetdeck.twitter.com/*",
        "https://www.fastmail.com/calendar/*",
        "https://www.fastmail.com/contacts/*",
        "https://www.fastmail.com/mail/*",
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
