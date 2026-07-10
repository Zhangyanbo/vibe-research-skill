# data/ — the user does not read this

Home for datasets, model weights, checkpoints, caches, and other large artifacts.

- **No limits on count or structure**: store things however is convenient; thousands of files are fine. Do not reorganize this directory for "tidiness". Tidiness rules exist so the user can scan what they read, and the user never reads this.
- Large files are not git-tracked.
- **Ask before touching anything hard to recover**: deleting or overwriting a file that takes a long run to regenerate requires the user's confirmation first. Files that regenerate quickly can be overwritten freely.
- Data behind formal figures: small files (CSV, configs) are committed alongside the figures; large checkpoints that cannot go into git are never overwritten. GPU training is not bit-level reproducible; once overwritten, it is gone for good.
