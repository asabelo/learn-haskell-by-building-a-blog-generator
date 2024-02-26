# Changelog for `blog-generator`

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to the
[Haskell Package Versioning Policy](https://pvp.haskell.org/).

## Unreleased - 2024-02-23

### Added

- Create *default Haskell template* project

### Changed

- Remove license
- Update readme and project info

## Unreleased - 2024-02-24

### Added

- Html and Html.Internal modules for printing *very* simple HTML

## Unreleased

### Added

- 'Convert' module to transform Markup.Structure into Html.Structure

### Changed

- Generalize Html.h1_ to Html.h_, which takes the heading level as a parameter
- Html.Structure gets a Monoid instance
