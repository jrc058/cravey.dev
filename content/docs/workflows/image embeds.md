---
title: "Embed images into cravey.dev"
date: 2026-01-29T21:00:00-06:00
draft: false
tags: ["cheat sheet", "site meta"]
description: "John's cheat sheet for embedding images in Hugo for quick reference."
---

# Reference workflow

*   **Where to put the image:** You create a folder for your content page and place the image *directly inside that folder* with the markdown file. For this to work, your markdown file must be named `index.md`.

    Let's use your `cyberdecktech` page as an example. The structure would look like this:

    ```
    content/
    └── docs/
        └── portfolio/
            └── cyberdecktech/   <-- This is the "Page Bundle"
                ├── index.md     <-- Your content for the page
                └── my-deck.png  <-- The image lives right next to the content!
    ```
