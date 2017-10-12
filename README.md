
# ect

[![Gem Version](https://badge.fury.io/rb/et-orbi.svg)](http://badge.fury.io/rb/ect)

Ruby methods ending in `ect`.

The subject of last part of a [lightning talk](https://speakerdeck.com/jmettraux/ruby-methods-in-ect-hiroshima-dot-rb-number-058) for [Hiroshima.rb #058](https://hiroshimarb.connpass.com/event/65459/).

I like to chain methods ending in `ect`. I wanted to have more of them.

## Object

### `Object#inflect`

> inflect |ɪnˈflɛkt|
>
> ORIGIN late Middle English (in sense 3): from Latin inflectere, from in- ‘into’ + flectere ‘to bend’.

An alias to `#tap`. Passes the instance to the block, returns the instance.

```ruby
%w[ fox lion crow donkey wolf ]
  .inflect { |a| a << 'mole' }
  .collect(&:capitalize)
```

### `Object#deflect`

> deflect |dɪˈflɛkt|
>
> ORIGIN mid 16th cent.: from Latin deflectere, from de- ‘away from’ + flectere ‘to bend’.

A very simple `yield(self)` (in Ruby 2.5.x it could thus become an alias to `#yiel_self`).

Passes the instance to the block, returns the result of the block. Change of direction.

```ruby
[ animals_list_1, animals_list_2 ]
  .deflect { |a, b| a.include?('mole') ? a : b }
  .collect(&:capitalize)
```

## Enumerable

### `Enumerable#bisect`
### `Enumerable#dissect`


## LICENSE

MIT, see [LICENSE.txt](LICENSE.txt)

