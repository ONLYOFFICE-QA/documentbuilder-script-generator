# Change log

## master (unreleased)

### New Features

* Use `markdownlint` for checking md files in CI
* Add check for 100% test coverage in CI
* Add `rubocop` check in CI
* Add support of `rubocop-performance`, `rubocop-rake`, `rubocop-rspec`
* Add `yard` check that 100% code is documented in CI
* Add `dependabot` config
* Enable `branch` coverage in `simplecov` config (and check in CI)
* Add `ruby-3.0` to CI
* Add `ruby-3.1` in CI
* Add `ruby-3.2` in CI
* Add `yamllint` check in CI
* Add `dependabot` check for `GitHub Actions`

### Fixes

* Fix `markdownlint` failure because of old `nodejs` in CI

### Changes

* Use GitHub Actions instead of TravisCI
* Remove usage of `codecov`
* Add missing documentation
* Remove `ruby-2.5` from CI since it's EOLed
* Remove `codeclimate` support since we don't use it any more
* Check `dependabot` at 8:00 Moscow time daily
* Fix `rubocop-1.28.1` code issues
* Drop `ruby-2.7` support, since it's EOLed
