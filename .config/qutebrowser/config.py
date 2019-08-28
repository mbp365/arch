# Allow websites to read canvas elements. Note this is needed for some
# websites to work properly.
# Type: Bool
c.content.canvas_reading = False

# Number of URLs to show in the web history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.web_history.max_items = 0

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'https://www.startpage.com/'

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`

# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something # else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://www.startpage.com/do/search?q={}',
                        'google': 'google.com/search?q={}',
                        'googleimg': 'google.com/images?q={}'}

c.url.start_pages = "about:blank"

# Downloads

c.downloads.remove_finished = 0
c.downloads.location.prompt = False
c.downloads.location.directory = "~/downloads"

config.bind(',m', 'hint links spawn magnet2torrent -m "{hint-url}" -o .config/rtorrent/watch/load/')
config.bind(',M', 'hint -r links spawn magnet2torrent -m "{hint-url}" -o .config/rtorrent/watch/load/')
config.bind(',f', 'hint -r links tab-bg')

# Bindings for normal mode
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

# Copying
config.bind('yf', 'hint links yank-primary')
config.bind('yy', 'yank -s')

c.scrolling.bar = "never"

config.source('qutewal.py')
