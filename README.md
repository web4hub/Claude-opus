# Claude Opus — Web4Hub

A small, reproducible repository for the Claude Opus dataset/model resources used by Web4Hub.

## Rebuild summary

The source repository contained a scraped Hugging Face bucket page, the same page saved again under an extensionless filename, and a one-line model downloader. This rebuild replaces the scraped pages with a purpose-built landing page, hardens the downloader, and documents provenance and usage.

## Dataset

The referenced bucket describes 8,706 synthetic instruction-tuning examples across 28 categories and approximately 17M estimated tokens.

| Split | Examples | Purpose |
| --- | ---: | --- |
| `full_train.jsonl` | 8,706 | Complete dataset |
| `instruct_train.jsonl` | 7,217 | Instruction-focused examples |
| `roleplay_train.jsonl` | 1,489 | Creative/roleplay examples |
| `code_train.jsonl` | 1,840 | Coding and mathematics |

Large dataset artifacts are not vendored in this Git repository.

## Installer

`install.sh` downloads the configured Kaggle model archive to `~/.cache/claude-opus/downloads/model.tar.gz`.

Optional environment variables:

- `CLAUDE_OPUS_HOME` — destination root.
- `CLAUDE_OPUS_URL` — alternate download URL.
- `CLAUDE_OPUS_SHA256` — expected SHA-256 checksum.

Example:

```bash
CLAUDE_OPUS_SHA256="<expected-sha256>" ./install.sh
```

## Provenance

The upstream documentation says the reasoning fields are synthetic generated training artifacts. They must not be represented as access to private model chain-of-thought.

## License

No repository-specific license was present in the source repository. Verify upstream model and dataset terms before redistribution or commercial use.
