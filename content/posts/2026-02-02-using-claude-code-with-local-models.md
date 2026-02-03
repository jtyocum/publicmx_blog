---
title: "Using Claude Code With Local Models"
date: 2026-02-02T20:14:31-08:00
draft: false
---

While [Claude Code](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code) is designed to be used with [Anthropic's](https://www.anthropic.com/) service. You can in fact use it with third-party services, and even local models. To get started using it with a local model, you'll need a few things (I'm assuming you're using a Linux systems):

- [Docker](https://www.docker.com/)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/index.html) (If using some other GPU, you'll need to adapte the Docker compose file)
- VS Code with Claude Code extension
- And, of course, a local model

Personally, I like to use Docker to containerize my models. Using a container, you can easily try out different runtimes, proxies, etc. For this, I'm using Docker to run gpt-oss-120b under [llama.cpp](https://github.com/ggml-org/llama.cpp). In order to adapt the API of llama.cpp to what Claude Code expects, we're using [LiteLLM](https://docs.litellm.ai/docs/).

<!-- markdownlint-disable-file MD029 -->
<!-- markdownlint-disable-file MD031 -->
<!-- markdownlint-disable-file MD032 -->
1. Create a directory to store your Docker compose file, LiteLLM config, etc.
```bash
mkdir local-claude-code
```
2. Create the LiteLLM config, call it `litellm_config.yaml`
```yaml
model_list:
  - model_name: "anthropic/*"
    litellm_params:
      model: "openai/gpt-oss-120b-mxfp4-00001-of-00003.gguf"
      api_base: "http://llamacpp:8080/v1"
      api_key: "llamacpp"
      max_tokens: 32768
      temperature: 1.0
      top_k: 0
      top_p: 1.0
      min_p: 0.01
```
3. Create your Docker compose file. You'll need to adjust the parameters to fit your computer's capabilities. Name the file `docker-compose.yaml`
```yaml
services:
  llamacpp:
    image: ghcr.io/ggml-org/llama.cpp:full-cuda
    container_name: llamacpp
    command:
      - '--server'
    environment:
      - LLAMA_ARG_HOST=0.0.0.0
      - LLAMA_ARG_MODEL=/models/gpt-oss-120b-mxfp4-00001-of-00003.gguf
      - LLAMA_ARG_N_CPU_MOE=32
      - LLAMA_ARG_CTX_SIZE=32768
      - LLAMA_ARG_JINJA=1
    ports:
      - "8080:8080"
    volumes:
      - /opt/models:/models
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: all
              capabilities: [gpu]
  litellm:
    image: docker.litellm.ai/berriai/litellm:main-latest
    container_name: litellm
    command:
      - '--config=/app/config.yaml'
    ports:
      - "4000:4000"
    volumes:
      - ./litellm_config.yaml:/app/config.yaml
```
4. To make it easy to change model settings in Claude Code, I like to user a script to set the environment variables, and start it up. Name it what you want, I use `code.sh`
```bash
#!/usr/bin/bash

export ANTHROPIC_BASE_URL="http://127.0.0.1:4000"
export ANTHROPIC_AUTH_TOKEN="llamacpp"

code
```
5. Once everything is setup, you can use `docker compose up -d` to start the containers. Once everything is running, use `code.sh` to launch VS Code.
