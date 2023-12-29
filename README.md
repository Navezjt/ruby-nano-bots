# Nano Bots 💎 🤖

A Ruby implementation of the [Nano Bots](https://github.com/icebaker/nano-bots) specification with support for [OpenAI ChatGPT](https://openai.com/chatgpt), [Mistral AI](https://mistral.ai), [Cohere Command](https://cohere.com), and [Google Gemini](https://deepmind.google/technologies/gemini).

![Ruby Nano Bots](https://raw.githubusercontent.com/icebaker/assets/main/nano-bots/ruby-nano-bots-canvas.png)

https://user-images.githubusercontent.com/113217272/238141567-c58a240c-7b67-4b3b-864a-0f49bbf6e22f.mp4

- [Setup](#setup)
    - [Cohere Command](#cohere-command)
    - [Google Gemini](#google-gemini)
    - [Mistral AI](#mistral-ai)
    - [OpenAI ChatGPT](#openai-chatgpt)
- [Usage](#usage)
    - [Command Line](#command-line)
    - [Library](#library)
- [Cartridges](#cartridges)
    - [Cohere Command](#cohere-command-1)
    - [Google Gemini](#google-gemini-1)
    - [Mistral AI](#mistral-ai-1)
    - [OpenAI ChatGPT](#openai-chatgpt-1)
    - [Tools (Functions)](#tools-functions)
        - [Experimental Clojure Support](#experimental-clojure-support)
    - [Marketplace](#marketplace)
- [Docker](#docker)
    - [Cohere Command](#cohere-command-2)
    - [Google Gemini](#google-gemini-2)
    - [Mistral AI](#mistral-ai-2)
    - [OpenAI ChatGPT](#openai-chatgpt-2)
- [Security and Privacy](#security-and-privacy)
    - [Cryptography](#cryptography)
    - [End-user IDs](#end-user-ids)
    - [Decrypting](#decrypting)
- [Providers](#providers)
- [Debugging](#debugging)
- [Development](#development)
    - [Publish to RubyGems](#publish-to-rubygems)

## Setup

For a system usage:

```sh
gem install nano-bots -v 2.4.0
```

To use it in a project, add it to your `Gemfile`:

```ruby
gem 'nano-bots', '~> 2.4.0'
```

```sh
bundle install
```

For credentials and configurations, relevant environment variables can be set in your `.bashrc`, `.zshrc`, or equivalent files, as well as in your Docker Container or System Environment. Example:

```sh
export NANO_BOTS_ENCRYPTION_PASSWORD=UNSAFE
export NANO_BOTS_END_USER=your-user

# export NANO_BOTS_STATE_DIRECTORY=/home/user/.local/state/nano-bots
# export NANO_BOTS_CARTRIDGES_DIRECTORY=/home/user/.local/share/nano-bots/cartridges
```

Alternatively, if your current directory has a `.env` file with the environment variables, they will be automatically loaded:

```sh
NANO_BOTS_ENCRYPTION_PASSWORD=UNSAFE
NANO_BOTS_END_USER=your-user

# NANO_BOTS_STATE_DIRECTORY=/home/user/.local/state/nano-bots
# NANO_BOTS_CARTRIDGES_DIRECTORY=/home/user/.local/share/nano-bots/cartridges
```

### Cohere Command

You can obtain your credentials on the [Cohere Platform](https://dashboard.cohere.com).

```sh
export COHERE_API_ADDRESS=https://api.cohere.ai
export COHERE_API_KEY=your-api-key
```

Alternatively, if your current directory has a `.env` file with the environment variables, they will be automatically loaded:

```sh
COHERE_API_ADDRESS=https://api.cohere.ai
COHERE_API_KEY=your-api-key
```

### Mistral AI

You can obtain your credentials on the [Mistral Platform](https://console.mistral.ai).

```sh
export MISTRAL_API_ADDRESS=https://api.mistral.ai
export MISTRAL_API_KEY=your-api-key
```

Alternatively, if your current directory has a `.env` file with the environment variables, they will be automatically loaded:

```sh
MISTRAL_API_ADDRESS=https://api.mistral.ai
MISTRAL_API_KEY=your-api-key
```

### OpenAI ChatGPT

You can obtain your credentials on the [OpenAI Platform](https://platform.openai.com).

```sh
export OPENAI_API_ADDRESS=https://api.openai.com
export OPENAI_API_KEY=your-access-token
```

Alternatively, if your current directory has a `.env` file with the environment variables, they will be automatically loaded:

```sh
OPENAI_API_ADDRESS=https://api.openai.com
OPENAI_API_KEY=your-access-token
```

### Google Gemini

Click [here](https://github.com/gbaptista/gemini-ai#credentials) to learn how to obtain your credentials.

#### Option 1: API Key (Generative Language API)

```sh
export GOOGLE_API_KEY=your-api-key

export NANO_BOTS_ENCRYPTION_PASSWORD=UNSAFE
export NANO_BOTS_END_USER=your-user

# export NANO_BOTS_STATE_DIRECTORY=/home/user/.local/state/nano-bots
# export NANO_BOTS_CARTRIDGES_DIRECTORY=/home/user/.local/share/nano-bots/cartridges
```

Alternatively, if your current directory has a `.env` file with the environment variables, they will be automatically loaded:

```sh
GOOGLE_API_KEY=your-api-key

NANO_BOTS_ENCRYPTION_PASSWORD=UNSAFE
NANO_BOTS_END_USER=your-user

# NANO_BOTS_STATE_DIRECTORY=/home/user/.local/state/nano-bots
# NANO_BOTS_CARTRIDGES_DIRECTORY=/home/user/.local/share/nano-bots/cartridges
```

#### Option 2: Service Account Credentials File (Vertex AI API)

```sh
export GOOGLE_CREDENTIALS_FILE_PATH=google-credentials.json
export GOOGLE_REGION=us-east4

export NANO_BOTS_ENCRYPTION_PASSWORD=UNSAFE
export NANO_BOTS_END_USER=your-user

# export NANO_BOTS_STATE_DIRECTORY=/home/user/.local/state/nano-bots
# export NANO_BOTS_CARTRIDGES_DIRECTORY=/home/user/.local/share/nano-bots/cartridges
```

Alternatively, if your current directory has a `.env` file with the environment variables, they will be automatically loaded:

```sh
GOOGLE_CREDENTIALS_FILE_PATH=google-credentials.json
GOOGLE_REGION=us-east4

NANO_BOTS_ENCRYPTION_PASSWORD=UNSAFE
NANO_BOTS_END_USER=your-user

# NANO_BOTS_STATE_DIRECTORY=/home/user/.local/state/nano-bots
# NANO_BOTS_CARTRIDGES_DIRECTORY=/home/user/.local/share/nano-bots/cartridges
```

#### Option 3: Application Default Credentials (Vertex AI API)

```sh
export GOOGLE_REGION=us-east4

export NANO_BOTS_ENCRYPTION_PASSWORD=UNSAFE
export NANO_BOTS_END_USER=your-user

# export NANO_BOTS_STATE_DIRECTORY=/home/user/.local/state/nano-bots
# export NANO_BOTS_CARTRIDGES_DIRECTORY=/home/user/.local/share/nano-bots/cartridges
```

Alternatively, if your current directory has a `.env` file with the environment variables, they will be automatically loaded:

```sh
GOOGLE_REGION=us-east4

NANO_BOTS_ENCRYPTION_PASSWORD=UNSAFE
NANO_BOTS_END_USER=your-user

# NANO_BOTS_STATE_DIRECTORY=/home/user/.local/state/nano-bots
# NANO_BOTS_CARTRIDGES_DIRECTORY=/home/user/.local/share/nano-bots/cartridges
```

#### Custom Project ID

If you need to manually set a Google Project ID:

```sh
export GOOGLE_PROJECT_ID=your-project-id
```

Alternatively, if your current directory has a `.env` file with the environment variables, they will be automatically loaded:

```sh
GOOGLE_PROJECT_ID=your-project-id
```

## Usage

### Command Line

After installing the gem, the `nb` binary command will be available for your project or system.

Examples of usage:

```bash
nb - - eval "hello"
# => Hello! How may I assist you today?

nb to-en-us-translator.yml - eval "Salut, comment ça va?"
# => Hello, how are you doing?

nb midjourney.yml - eval "happy cyberpunk robot"
# => A cheerful and fun-loving robot is dancing wildly amidst a
#    futuristic and lively cityscape. Holographic advertisements
#    and vibrant neon colors can be seen in the background.

nb lisp.yml - eval "(+ 1 2)"
# => 3

cat article.txt |
  nb to-en-us-translator.yml - eval |
  nb summarizer.yml - eval
# -> LLM stands for Large Language Model, which refers to an
#    artificial intelligence algorithm capable of processing
#    and understanding vast amounts of natural language data,
#    allowing it to generate human-like responses and perform
#    a range of language-related tasks.
```

```bash
nb - - repl

nb assistant.yml - repl
```

```text
🤖> Hi, how are you doing?

As an AI language model, I do not experience emotions but I am functioning
well. How can I assist you?

🤖> |
```

You can exit the REPL by typing `exit`.

All of the commands above are stateless. If you want to preserve the history of your interactions, replace the `-` with a state key:

```bash
nb assistant.yml your-user eval "Salut, comment ça va?"
nb assistant.yml your-user repl

nb assistant.yml 6ea6c43c42a1c076b1e3c36fa349ac2c eval "Salut, comment ça va?"
nb assistant.yml 6ea6c43c42a1c076b1e3c36fa349ac2c repl
```

You can use a simple key, such as your username, or a randomly generated one:

```ruby
require 'securerandom'

SecureRandom.hex # => 6ea6c43c42a1c076b1e3c36fa349ac2c
```

### Debugging

```sh
nb - - cartridge
nb cartridge.yml - cartridge

nb - STATE-KEY state
nb cartridge.yml STATE-KEY state
```

### Library

To use it as a library:

```ruby
require 'nano-bots/cli' # Equivalent to the `nb` command.
```

```ruby
require 'nano-bots'

NanoBot.cli # Equivalent to the `nb` command.

NanoBot.repl(cartridge: 'cartridge.yml') # Starts a new REPL.

bot = NanoBot.new(cartridge: 'cartridge.yml')

bot = NanoBot.new(
  cartridge: YAML.safe_load(File.read('cartridge.yml'), permitted_classes: [Symbol])
)

bot = NanoBot.new(
  cartridge: { ... } # Parsed Cartridge Hash
)

bot.eval('Hello')

bot.eval('Hello', as: 'eval')
bot.eval('Hello', as: 'repl')

# When stream is enabled and available:
bot.eval('Hi!') do |content, fragment, finished, meta|
  print fragment unless fragment.nil?
end

bot.repl # Starts a new REPL.

NanoBot.repl(cartridge: 'cartridge.yml', state: '6ea6c43c42a1c076b1e3c36fa349ac2c')

bot = NanoBot.new(cartridge: 'cartridge.yml', state: '6ea6c43c42a1c076b1e3c36fa349ac2c')

bot.prompt # => "🤖\u001b[34m> \u001b[0m"

bot.boot

bot.boot(as: 'eval')
bot.boot(as: 'repl')

bot.boot do |content, fragment, finished, meta|
  print fragment unless fragment.nil?
end
```

## Cartridges

Check the Nano Bots specification to learn more about [how to build cartridges](https://spec.nbots.io/#/README?id=cartridges).

Try the [Nano Bots Clinic (Live Editor)](https://clinic.nbots.io) to learn about creating Cartridges.

Here's what a Nano Bot Cartridge looks like:

### Cohere Command

Read the [full specification](https://spec.nbots.io/#/README?id=cohere-command) for Cohere Command.

```yaml
---
meta:
  symbol: 🤖
  name: Nano Bot Name
  author: Your Name
  version: 1.0.0
  license: CC0-1.0
  description: A helpful assistant.

behaviors:
  interaction:
    directive: You are a helpful assistant.

provider:
  id: cohere
  credentials:
    api-key: ENV/COHERE_API_KEY
  settings:
    model: command
```

### Mistral AI

Read the [full specification](https://spec.nbots.io/#/README?id=mistral-ai) for Mistral AI.

```yaml
---
meta:
  symbol: 🤖
  name: Nano Bot Name
  author: Your Name
  version: 1.0.0
  license: CC0-1.0
  description: A helpful assistant.

behaviors:
  interaction:
    directive: You are a helpful assistant.

provider:
  id: mistral
  credentials:
    api-key: ENV/MISTRAL_API_KEY
  settings:
    model: mistral-medium
```

### OpenAI ChatGPT

Read the [full specification](https://spec.nbots.io/#/README?id=openai-chatgpt) for OpenAI ChatGPT.

```yaml
---
meta:
  symbol: 🤖
  name: Nano Bot Name
  author: Your Name
  version: 1.0.0
  license: CC0-1.0
  description: A helpful assistant.

behaviors:
  interaction:
    directive: You are a helpful assistant.

provider:
  id: openai
  credentials:
    address: ENV/OPENAI_API_ADDRESS
    access-token: ENV/OPENAI_API_KEY
  settings:
    user: ENV/NANO_BOTS_END_USER
    model: gpt-4-1106-preview
```

### Google Gemini

Read the [full specification](https://spec.nbots.io/#/README?id=google-gemini) for Google Gemini.

#### Option 1: API Key (Generative Language API)

```yaml
---
meta:
  symbol: 🤖
  name: Nano Bot Name
  author: Your Name
  version: 1.0.0
  license: CC0-1.0
  description: A helpful assistant.

behaviors:
  interaction:
    directive: You are a helpful assistant.

provider:
  id: google
  credentials:
    service: generative-language-api
    api-key: ENV/GOOGLE_API_KEY
  options:
    model: gemini-pro
```

#### Option 2: Service Account Credentials File (Vertex AI API)

```yaml
---
meta:
  symbol: 🤖
  name: Nano Bot Name
  author: Your Name
  version: 1.0.0
  license: CC0-1.0
  description: A helpful assistant.

behaviors:
  interaction:
    directive: You are a helpful assistant.

provider:
  id: google
  credentials:
    service: vertex-ai-api
    file-path: ENV/GOOGLE_CREDENTIALS_FILE_PATH
    region: ENV/GOOGLE_REGION
  options:
    model: gemini-pro
```

#### Option 3: Application Default Credentials (Vertex AI API)

```yaml
---
meta:
  symbol: 🤖
  name: Nano Bot Name
  author: Your Name
  version: 1.0.0
  license: CC0-1.0
  description: A helpful assistant.

behaviors:
  interaction:
    directive: You are a helpful assistant.

provider:
  id: google
  credentials:
    service: vertex-ai-api
    region: ENV/GOOGLE_REGION
  options:
    model: gemini-pro
```

#### Custom Project ID

If you need to manually set a Google Project ID:

```yaml
---
provider:
  id: google
  credentials:
    project-id: ENV/GOOGLE_PROJECT_ID
```

### Tools (Functions)

Nano Bots can also be powered by _Tools_ (Functions):

```yaml
---
tools:
  - name: random-number
    description: Generates a random number between 1 and 100.
    fennel: |
      (math.random 1 100)
```

```
🤖> please generate a random number

random-number {} [yN] y

random-number {}
59

The randomly generated number is 59.

🤖> |
```
To successfully use Tools (Functions), you need to specify a provider and a model that supports them. As of the writing of this README, the provider that supports them is [OpenAI](https://platform.openai.com/docs/models), with models `gpt-3.5-turbo-1106` and `gpt-4-1106-preview`, and [Google](https://cloud.google.com/vertex-ai/docs/generative-ai/multimodal/function-calling#supported_models), with the `vertex-ai-api` service and the model `gemini-pro`. Mistral AI does not support tools.

Check the [Nano Bots specification](https://spec.nbots.io/#/README?id=tools-functions-2) to learn more about Tools (Functions).

#### Experimental Clojure Support

We are exploring the use of [Clojure](https://clojure.org) through [Babashka](https://babashka.org), powered by [GraalVM](https://www.graalvm.org).

The experimental support for Clojure would be similar to Lua and Fennel, using the `clojure:` key:

```yaml
---
clojure: |
  (-> (java.time.ZonedDateTime/now)
      (.format (java.time.format.DateTimeFormatter/ofPattern "yyyy-MM-dd HH:mm"))
      (clojure.string/trimr))
```

Unlike Lua and Fennel, Clojure support is not _embedded_ in this implementation. It relies on having the Babashka binary (`bb`) available in your environment where the Nano Bot is running.

Here's [how to install Babashka](https://github.com/babashka/babashka#quickstart):

```sh
curl -s https://raw.githubusercontent.com/babashka/babashka/master/install | sudo bash
```

This is a quick check to ensure that it is available and working:
```sh
bb -e '{:hello "world"}'
# => {:hello "world"}
```

We don't have sandbox support for Clojure; this means that you need to disable it to be able to run Clojure code, which you do at your own risk:

```yaml
---
safety:
  functions:
    sandboxed: false
```

### Marketplace

You can explore the Nano Bots [Marketplace](https://nbots.io) to discover new Cartridges that can help you.

## Docker

Clone the repository and copy the Docker Compose template:

```
git clone https://github.com/icebaker/ruby-nano-bots.git
cd ruby-nano-bots
cp docker-compose.example.yml docker-compose.yml
```

Set your provider credentials and choose your desired directory for the cartridges files:

### Cohere Command

```yaml
---
services:
  nano-bots:
    image: ruby:3.2.2-slim-bookworm
    command: sh -c "apt-get update && apt-get install -y --no-install-recommends build-essential libffi-dev libsodium-dev lua5.4-dev curl && curl -s https://raw.githubusercontent.com/babashka/babashka/master/install | bash && gem install nano-bots -v 2.4.0 && bash"
    environment:
      COHERE_API_ADDRESS: https://api.cohere.ai
      COHERE_API_KEY: your-api-key
      NANO_BOTS_ENCRYPTION_PASSWORD: UNSAFE
      NANO_BOTS_END_USER: your-user
    volumes:
      - ./your-cartridges:/root/.local/share/nano-bots/cartridges
      - ./your-state-path:/root/.local/state/nano-bots
```

### Mistral AI

```yaml
---
services:
  nano-bots:
    image: ruby:3.2.2-slim-bookworm
    command: sh -c "apt-get update && apt-get install -y --no-install-recommends build-essential libffi-dev libsodium-dev lua5.4-dev curl && curl -s https://raw.githubusercontent.com/babashka/babashka/master/install | bash && gem install nano-bots -v 2.4.0 && bash"
    environment:
      MISTRAL_API_ADDRESS: https://api.mistral.ai
      MISTRAL_API_KEY: your-api-key
      NANO_BOTS_ENCRYPTION_PASSWORD: UNSAFE
      NANO_BOTS_END_USER: your-user
    volumes:
      - ./your-cartridges:/root/.local/share/nano-bots/cartridges
      - ./your-state-path:/root/.local/state/nano-bots
```

### OpenAI ChatGPT

```yaml
---
services:
  nano-bots:
    image: ruby:3.2.2-slim-bookworm
    command: sh -c "apt-get update && apt-get install -y --no-install-recommends build-essential libffi-dev libsodium-dev lua5.4-dev curl && curl -s https://raw.githubusercontent.com/babashka/babashka/master/install | bash && gem install nano-bots -v 2.4.0 && bash"
    environment:
      OPENAI_API_ADDRESS: https://api.openai.com
      OPENAI_API_KEY: your-access-token
      NANO_BOTS_ENCRYPTION_PASSWORD: UNSAFE
      NANO_BOTS_END_USER: your-user
    volumes:
      - ./your-cartridges:/root/.local/share/nano-bots/cartridges
      - ./your-state-path:/root/.local/state/nano-bots
```

### Google Gemini

#### Option 1: API Key (Generative Language API)

```yaml
---
services:
  nano-bots:
    image: ruby:3.2.2-slim-bookworm
    command: sh -c "apt-get update && apt-get install -y --no-install-recommends build-essential libffi-dev libsodium-dev lua5.4-dev curl && curl -s https://raw.githubusercontent.com/babashka/babashka/master/install | bash && gem install nano-bots -v 2.4.0 && bash"
    environment:
      GOOGLE_API_KEY: your-api-key
      NANO_BOTS_ENCRYPTION_PASSWORD: UNSAFE
      NANO_BOTS_END_USER: your-user
    volumes:
      - ./your-cartridges:/root/.local/share/nano-bots/cartridges
      - ./your-state-path:/root/.local/state/nano-bots
```

#### Option 2: Service Account Credentials File (Vertex AI API)

```yaml
---
services:
  nano-bots:
    image: ruby:3.2.2-slim-bookworm
    command: sh -c "apt-get update && apt-get install -y --no-install-recommends build-essential libffi-dev libsodium-dev lua5.4-dev curl && curl -s https://raw.githubusercontent.com/babashka/babashka/master/install | bash && gem install nano-bots -v 2.4.0 && bash"
    environment:
      GOOGLE_CREDENTIALS_FILE_PATH: /root/.config/google-credentials.json
      GOOGLE_REGION: us-east4
      NANO_BOTS_ENCRYPTION_PASSWORD: UNSAFE
      NANO_BOTS_END_USER: your-user
    volumes:
      - ./google-credentials.json:/root/.config/google-credentials.json
      - ./your-cartridges:/root/.local/share/nano-bots/cartridges
      - ./your-state-path:/root/.local/state/nano-bots
```

#### Option 3: Application Default Credentials (Vertex AI API)

```yaml
---
services:
  nano-bots:
    image: ruby:3.2.2-slim-bookworm
    command: sh -c "apt-get update && apt-get install -y --no-install-recommends build-essential libffi-dev libsodium-dev lua5.4-dev curl && curl -s https://raw.githubusercontent.com/babashka/babashka/master/install | bash && gem install nano-bots -v 2.4.0 && bash"
    environment:
      GOOGLE_REGION: us-east4
      NANO_BOTS_ENCRYPTION_PASSWORD: UNSAFE
      NANO_BOTS_END_USER: your-user
    volumes:
      - ./your-cartridges:/root/.local/share/nano-bots/cartridges
      - ./your-state-path:/root/.local/state/nano-bots
```

#### Custom Project ID
If you need to manually set a Google Project ID:

```yaml
environment:
  GOOGLE_PROJECT_ID=your-project-id
```

### Container

Enter the container:
```sh
docker compose run nano-bots
```

Start playing:
```sh
nb - - eval "hello"
nb - - repl

nb assistant.yml - eval "hello"
nb assistant.yml - repl
```

You can exit the REPL by typing `exit`.

## Security and Privacy

Each provider will have its own security and privacy policies (e.g. [OpenAI Policy](https://openai.com/policies/api-data-usage-policies)), so you must consult them to understand their implications.

### Cryptography

By default, all states stored in your local disk are encrypted.

To ensure that the encryption is secure, you need to define a password through the `NANO_BOTS_ENCRYPTION_PASSWORD` environment variable. Otherwise, although the content will be encrypted, anyone would be able to decrypt it without a password.

It's important to note that the content shared with providers, despite being transmitted over secure connections (e.g., [HTTPS](https://en.wikipedia.org/wiki/HTTPS)), will be readable by the provider. This is because providers need to operate on the data, which would not be possible if the content was encrypted beyond HTTPS. So, the data stored locally on your system is encrypted, which does not mean that what you share with providers will not be readable by them.

To ensure that your encryption and password are configured properly, you can run the following command:
```sh
nb security
```

Which should return:
```text
✅ Encryption is enabled and properly working.
     This means that your data is stored in an encrypted format on your disk.

✅ A password is being used for the encrypted content.
     This means that only those who possess the password can decrypt your data.
```

Alternatively, you can check it at runtime with:
```ruby
require 'nano-bots'

NanoBot.security.check
# => { encryption: true, password: true }
```

### End-user IDs

A common strategy for deploying Nano Bots to multiple users through APIs or automations is to assign a unique [end-user ID](https://platform.openai.com/docs/guides/safety-best-practices/end-user-ids) for each user. This can be useful if any of your users violate the provider's policy due to abusive behavior. By providing the end-user ID, you can unravel that even though the activity originated from your API Key, the actions taken were not your own.

You can define custom end-user identifiers in the following way:

```ruby
NanoBot.new(environment: { NANO_BOTS_END_USER: 'custom-user-a' })
NanoBot.new(environment: { NANO_BOTS_END_USER: 'custom-user-b' })
```

Consider that you have the following end-user identifier in your environment:
```sh
NANO_BOTS_END_USER=your-name
```

Or a configuration in your Cartridge:
```yml
---
provider:
  id: openai
  settings:
    user: your-name
```

The requests will be performed as follows:

```ruby
NanoBot.new(cartridge: '-')
# { user: 'your-name' }

NanoBot.new(cartridge: '-', environment: { NANO_BOTS_END_USER: 'custom-user-a' })
# { user: 'custom-user-a' }

NanoBot.new(cartridge: '-', environment: { NANO_BOTS_END_USER: 'custom-user-b' })
# { user: 'custom-user-b' }
```

Actually, to enhance privacy, neither your user nor your users' identifiers will be shared in this way. Instead, they will be encrypted before being shared with the provider:

```ruby
'your-name'
# _O7OjYUESagb46YSeUeSfSMzoO1Yg0BZqpsAkPg4j62SeNYlgwq3kn51Ob2wmIehoA==

'custom-user-a'
# _O7OjYUESagb46YSeUeSfSMzoO1Yg0BZJgIXHCBHyADW-rn4IQr-s2RvP7vym8u5tnzYMIs=

'custom-user-b'
# _O7OjYUESagb46YSeUeSfSMzoO1Yg0BZkjUwCcsh9sVppKvYMhd2qGRvP7vym8u5tnzYMIg=
```

In this manner, you possess identifiers if required, however, their actual content can only be decrypted by you via your secure password (`NANO_BOTS_ENCRYPTION_PASSWORD`).

### Decrypting

To decrypt your encrypted data, once you have properly configured your password, you can simply run:

```ruby
require 'nano-bots'

NanoBot.security.decrypt('_O7OjYUESagb46YSeUeSfSMzoO1Yg0BZqpsAkPg4j62SeNYlgwq3kn51Ob2wmIehoA==')
# your-name

NanoBot.security.decrypt('_O7OjYUESagb46YSeUeSfSMzoO1Yg0BZJgIXHCBHyADW-rn4IQr-s2RvP7vym8u5tnzYMIs=')
# custom-user-a

NanoBot.security.decrypt('_O7OjYUESagb46YSeUeSfSMzoO1Yg0BZkjUwCcsh9sVppKvYMhd2qGRvP7vym8u5tnzYMIg=')
# custom-user-b
```

If you lose your password, you lose your data. It is not possible to recover it at all. For real.

## Providers

Currently supported providers:

- [ ] [01.AI Yi](https://01.ai)
- [ ] [Anthropic Claude](https://www.anthropic.com)
- [x] [Cohere Command](https://docs.cohere.com/reference/about)
- [x] [Google Gemini](https://cloud.google.com/vertex-ai/docs/generative-ai/model-reference/gemini)
- [ ] [LMSYS Org FastChat Vicuna](https://github.com/lm-sys/FastChat)
- [ ] [Meta Llama](https://ai.meta.com/llama/)
- [x] [Mistral AI](https://docs.mistral.ai/api/)
- [x] [Open AI ChatGPT](https://platform.openai.com/docs/api-reference)
- [ ] [WizardLM](https://wizardlm.github.io)

Some providers offer APIs that are compatible with, for example, OpenAI, such as [FastChat](https://github.com/lm-sys/FastChat#openai-compatible-restful-apis--sdk). Therefore, it is highly probable that they will work just fine.

## Development

```bash
bundle
rubocop -A
rspec

bundle exec ruby spec/tasks/run-all-models.rb
```

### Publish to RubyGems

```bash
gem build nano-bots.gemspec

gem signin

gem push nano-bots-2.4.0.gem
```
