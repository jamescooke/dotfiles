let options = {
    "prevent_autofocus": true,
    "blacklist": [
        "https://tweetdeck.com/*",
        "https://www.fastmail.com/calendar/*",
        "https://www.fastmail.com/mail/*",
    ].join(' '),
    "config_file_directory": "~/.vimfx/"
}

Object.entries(options).forEach(([option, value]) => vimfx.set(option, value))
