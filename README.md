# stream-timer
CLI Timer for Stream (Text) Widget that can read from file

# Requirements

- [ruby](https://www.ruby-lang.org/en/)

# Setup

```
$ git clone https://github.com/jimmynguyc/stream-timer
$ cd stream-timer

$ gem install activesupport
$ chmod +x timer
```

Setup text widget to monitor & read from `stream-timer.txt`

# Usage

Count up timer

```
$ ./timer
```

Countdown timer
```
$ ./timer 55 minutes
$ ./timer 1 hour
```
