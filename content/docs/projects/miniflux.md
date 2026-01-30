---
created: 2026-01-28
updated: 2026-01-28
tags: ["rss", "self-hosting", "open-source", "projects"]
status: published
---

# Miniflux RSS

I'm really not a fan of news and social feeds. I've gone on and off of RSS since 2010ish, trying different readers and whatnot, but always ending up at a different feed.

[Miniflux](https://miniflux.app/) is nice, it does everything any RSS reader does, but gives a lot more flexibility because it's its own backend. The global feed is manageable and the categories are clean.

Flexibility comes in writing feed-specific rules. 

```
rewrite("^https:\/\/(x\.com|twitter\.com)\/(.*)$"|"https://xcancel.com/$2"),rewrite("^https:\/\/(www\.)?reddit\.com\/(.*)$"|"https://redlib.catsarch.com/$2")
```

These rules let you use nitter, xcancel, or whatever else to get around things. Reddit doesn't like VPNs and as much as I try to abstain from Reddit, the millions of users can't help but post answers to my problems only on this one reddit thread.

## RSS Feeds I follow:

- Amazon Company News - https://www.aboutamazon.com/rss/feed.rss?category=company-news
- Amazon Retail - https://www.aboutamazon.com/rss/feed.rss?category=retail
- Android - https://blog.google/products-and-platforms/platforms/android/rss/
- Marginal Revolution - https://feeds.feedblitz.com/marginalrevolution
- Hackaday - https://hackaday.com/blog/feed/
- Hacker News Front Page - https://hnrss.org/frontpage
- Hacker News Newest - https://hnrss.org/newest
