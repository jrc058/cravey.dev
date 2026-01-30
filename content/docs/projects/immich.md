---
created: 2026-01-28
updated: 2026-01-28
tags: ["immich", "self-hosting", "open-source", "projects"]
status: published
---

# Immich Photo Management

Google Photos is convenient until you realize they have every photo you've ever taken. I wanted that convenience without giving up my privacy, so I deployed [Immich](https://immich.app/)—a self-hosted photo management system that looks and feels like Google Photos but runs local.

The interface is nearly identical to commercial photo services. Upload photos, automatic organization, facial recognition, albums, sharing—all the features you'd expect. The difference is that everything stays on my hardware, and I control who has access.

## How It Works

Immich runs as a set of Docker containers on my home server. There's the main server, a PostgreSQL database for metadata, a machine learning container for facial recognition and object detection, and a Redis cache for performance. It's more complex than some of my other services, but the architecture makes sense once you understand what each piece does.

The mobile app connects to my server and automatically backs up photos in the background. I can browse my entire library from my phone, create albums, and share links to specific collections. When I take photos at a family event, I create a shared album and send a link—anyone with that link can view and download the original images with no compression. Anyone in my family knows how much I hate compression over texting. Pictures should never be sent over text.

Storage lives on my server's data drive, with the actual photo files separate from the database. This makes backups straightforward and means I can move the photos to different storage if needed without rebuilding the database.

## Working with Kiro

Setting up Immich was more involved than simpler services like Navidrome. The multi-container architecture meant coordinating several services and making sure they could all talk to each other. Kiro helped me understand the Docker Compose configuration and how the containers network together.

We hit a snag with the admin interface freezing the browser. Turns out it was a bug in the version I was running—the backend was fine, but the frontend JavaScript had an issue. Kiro helped me troubleshoot by checking logs and testing different scenarios until we figured out it was a known bug fixed in a newer version. Updating solved it.

Password resets were another learning experience. When I locked myself out of an account (guilty), we had to go directly into the PostgreSQL database to reset the password. Kiro walked me through generating a bcrypt hash and updating the database safely, which taught me more about how authentication works under the hood.

## What I Learned

Facial recognition on your own hardware is surprisingly good. Immich's machine learning container can identify people in photos and group them automatically. It's not perfect, but it's good enough to be useful, and it all happens locally without sending photos to some cloud service.

The mobile app is solid. Background uploads work reliably, and the interface is responsive. It feels like using a commercial app, which is rare for self-hosted software.

Sharing is well-designed. You can create a link to an album that expires after a certain time or number of views. People can view and download photos without needing an account. It's exactly what I need for sharing event photos with family. I have not set up users outside of me and my wife, but I have been trying to persuade my family to migrate to my server for all their photos, too. If I win that battle, I will create users and manage permissions a bit better than I am now, but I would be happy to take all their data off of Apple and Google servers. I need more comfortable redundancy, though.

Database management matters. When things go wrong, knowing how to access the PostgreSQL database directly is valuable. It's not something you do often, but when you need it, you really need it.

## Why It Matters

This project is about taking back control of personal data. Every photo I take doesn't need to be analyzed by Google's AI or used to train their models. The photos are mine, stored on my hardware, accessible only to people I choose.

It's also about long-term ownership. Cloud services change terms, raise prices, or shut down. With Immich, I own the infrastructure. If the project disappeared tomorrow, I'd still have all my photos and could migrate to something else.

The system has become essential for family events. Instead of texting compressed photos or using some sketchy file-sharing service, I create an Immich album and share a link. Everyone gets the full-resolution originals, and I can see who's accessed the album.
