---
title: "CyberDeck Tech"
date: 2026-01-27T21:00:00-06:00
draft: false
tags: ["cyberdeck", "digital sovereignty", "self-hosting", "open-source", "AI", "mobile computing", "projects"]
link: "https://cyberdecktech.com"
image: "/images/cyberdecktech_preview.jpg"
description: "A platform exploring cyberdecks, digital sovereignty, and mobile computing liberation."
---

## CyberDeck Tech

[CyberDeck Tech](https://cyberdecktech.com) is a project dedicated to exploring the philosophy of cyberdecks and digital sovereignty. It serves as a curated digital garden for ideas around privacy-first mobile computing and local AI inference.

### Technologies Used

*   Jekyll
*   ReactJS
*   Vibe coded with Amazon Kiro

## Site Creation

The central concept of the site are obsidian notes I made about the Steam Deck and cyberdecks as a whole- the ecosystem of a touch screen device that is not vendor locked to a mobile operating system, with a novel form factor that has potential for more utility.

I handed my notes over to Amazon Kiro and it generated several files to design the architecture of the website, and then let it loose with react and jekyll to build the site. The humble beginnings visually look very similar to how it remains. The largest amount of edits and rebuilds were for the Map of Content navigation for the "connected concepts" navigation, the hover elements, and the tile cards to look like terminal UIs.

It probably took 20 solid iterations of rebuilding the site, of reworking major portions of it, then a lot of random tweaking for small edits, but over the course of a week it was done without me actually writing any of the code. The most technical extent I went to was pulling up the developer console on a browser to copy and paste error codes into Kiro for Kiro to diagnose the problems and create a solution.

## Site Result

Aside from some JS bugs, the site seems to load pretty well. It's chunked in blocks that dynamically load so the whole website doesn't have to load at once and it can be served faster. Should probably run a benchmark to see if it's fast, but it's fast and responsive so I haven't really touched it since.

It was made to be an ongoing post and publication, but it's a pretty niche project that I work on and I'm happy having it as a more static content site for the project than anything. It's less so the project, and really more the core concept of why advocating for cyberdecks is pro sovereignty and releases us from vendor lock.

## Future State

I don't know. I like the concept of cyberdecks. I continue to make changes to my Steam Deck in line with the philosophy, I just don't update the site. The workflow is kind of convoluted, and I should migrate it to my current workflow on code-server and goose cli, once I migrate it into the same workflow I use for cravey.dev I will likely compartmentalize publications better and be able to update it more easily.