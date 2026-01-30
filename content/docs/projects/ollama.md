---
created: 2026-01-28
updated: 2026-01-28
tags: ["ollama", "self-hosting", "open-source", "projects", "open-webui", "ai", "llm"]
status: published
---

# Local AI with Ollama and Open WebUI

Running AI models locally instead of sending every query to OpenAI or Anthropic was the goal. [Ollama](https://ollama.ai/) makes it possible to run large language models on your own hardware, and [Open WebUI](https://openwebui.com/) provides a ChatGPT-like interface for interacting with them.

This setup means I can experiment with AI without worrying about API costs, rate limits, or sending sensitive data to third parties. The models run entirely on my server, using the GPU for acceleration.

## How It Works

Ollama is the engine that runs the models. It handles downloading models, loading them into memory, and serving them through an API. Models are stored locally and can be swapped out easily—if I want to try a different model, I just pull it down and switch.

Open WebUI sits on top of Ollama and provides the chat interface. It looks and feels like ChatGPT but connects to my local Ollama instance instead of a cloud service. It supports multiple conversations, model switching, and even has features like document upload and web search integration.

Both run as Docker containers on my home server. Ollama gets access to the GPU for hardware acceleration, which is essential for running larger models at reasonable speeds. Without GPU acceleration, inference would be painfully slow.

## Working with Kiro

Setting up Ollama was straightforward—it's designed to be simple. The challenge was getting GPU acceleration working properly. AMD GPUs use ROCm instead of CUDA, which means different drivers and configuration. Kiro helped me figure out the right Docker setup to pass the GPU through to the container and verify that Ollama was actually using it.

We tested with different models to see what the hardware could handle. Smaller models like Llama 3.2 run fast, while larger models are slower but more capable. Finding the right balance between model size and performance took some experimentation.

Open WebUI was easier—it's just a web interface that connects to Ollama's API. The configuration is minimal, mostly just pointing it at the Ollama endpoint and setting up user accounts. We added it to the same Docker network as Ollama so they could communicate directly.

The interesting part was integrating it with other services. Open WebUI can connect to external APIs, which means it could potentially control Home Assistant or query other services on my network. That's still experimental, but the foundation is there.

## What I Learned

Local AI is viable for many use cases. In some cases, my 14b or 27b model caught errors my API models made. Not the case often though, but I suspect the routing of these companies route smaller tasks to smaller models, understandably, but my 27b model performs 27b output every time.

The learning from LLMs in general... is far beyond my normal weight class. It's led to a lot of understanding of my professional workflow and tools, though. Understanding how they work, I have a deeper grasp of it than a lot of my non-tech peers. So, the endeavor is professional as much as it is enthustiastic.

## Why It Matters

I have many thoughts about local LLM inferencing. Largest thoughts leading me to building a datacenter in my home and running 1T models locally. Smallest thoughts being... well, pushed aside and dismissed.