curl https://api.lambdalabs.com/v1/chat/completions \
-X POST \
-H "Content-Type: application/json" \
-H 'Authorization: Bearer secret_llama_2602624277894bb1a2b2072c34d0a6c7.9Gmvk9VdfYYih0TkUJy8R0YeS76ZAYPu' \
-d '{
    "model": "hermes-3-llama-3.1-405b-fp8",
    "messages": [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Hello! Can you tell me a funny joke?"}
    ],
    "temperature": 0.7,
    "max_tokens": 50
}'
