![logo](doc/logo.gif)

# Lua FAForever version
![Build Status](https://github.com/FAForever/lua-lang/actions/workflows/test.yml/badge.svg?branch=lua-5.0)
[![license](https://img.shields.io/badge/license-MIT-blue)](COPYRIGHT)

This is a modified version of Lua which imitates the changes made by Gas Powered
Games (GPG) for the game Supreme Commander Forged Alliance (SCFA).

The most notable changes are:
- Addition of a `continue` statement
- Bash style single line `#` comments

See [HISTORY](HISTORY) for a full list of changes.

## Versioning
Version numbers do not follow regular semantic versioning. Instead they use the
Lua version that the modifications are based on followed by a release number.
For example `5.0-1` would be release number 1 for changes based on Lua 5.0.

## Objective
The purpose of this project is to provide SCFA modders with a version of Lua
that has the same syntax and behavior as the GPG version integrated into SCFA.
In particular it should help in testing SCFA mods without running the game
itself, such as in Continuous Integration (CI) pipelines. However, this repo is
only for changes to the Lua language itself, and not SCFA engine functionality.

A mock engine will be implemented in a separate project. <link here>

## Installation
See [INSTALL](INSTALL).

## License
FAF Lua is distributed under the MIT license. See [COPYRIGHT](COPYRIGHT).
