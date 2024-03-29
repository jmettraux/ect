
# ect

[![tests](https://github.com/jmettraux/ect/workflows/test/badge.svg)](https://github.com/jmettraux/ect/actions)
[![Gem Version](https://badge.fury.io/rb/ect.svg)](http://badge.fury.io/rb/ect)

Ruby methods ending in `ect`.

The subject of last part of a [lightning talk](https://speakerdeck.com/jmettraux/ruby-methods-in-ect-hiroshima-dot-rb-number-058) for [Hiroshima.rb #058](https://hiroshimarb.connpass.com/event/65459/).

I like to chain methods ending in `ect`. I wanted to have more of them.

Mostly a joke.


## Object

### Object#inflect

> inflect |ɪnˈflɛkt|
>
> ORIGIN late Middle English (in sense 3): from Latin inflectere, from in- ‘into’ + flectere ‘to bend’.

An alias to `#tap`. Passes the instance to the block, returns the instance.

```ruby
%w[ fox lion crow donkey wolf ]
  .inflect { |a| a << 'mole' }
  .collect(&:capitalize)
    #
    # => [ 'Fox', 'Lion', 'Crow', 'Donkey', 'Wolf', 'Mole' ]
```

### Object#deflect

> deflect |dɪˈflɛkt|
>
> ORIGIN mid 16th cent.: from Latin deflectere, from de- ‘away from’ + flectere ‘to bend’.

A very simple `yield(self)` (in Ruby 2.5.x it could thus become an alias to `#yield_self`).

Passes the instance to the block, returns the result of the block. Change of direction.

```ruby
a1 = %w[ bat donkey horse ]
a2 = %w[ cat rat dog mole ]

[ a1, a2 ]
  .deflect { |a, b| a.include?('mole') ? a : b }
  .collect(&:capitalize)
    #
    # => [ "Cat", "Rat", "Dog", "Mole" ]
```

```ruby
def lookup_user(id_or_name)

  DB[:users]
    .select(:id, :name)
    .deflect { |x|
      id_or_name.is_a?(Integer) ? x.where(id: id) : x.where(name: name) }
    .first
end
```

## Enumerable

### Enumerable#bisect

> bisect |bʌɪˈsɛkt|
>
> ORIGIN mid 17th cent.: from bi-‘two’ + Latin sect- (from secare ‘to cut’).

An alias to `#partition`. Returns two arrays (the true array and the false array).

```ruby
%w[ fox lion crow donkey wolf ]
  .bisect { |a| a.length > 3 }
    #
    # => [ %w[ lion crow donkey wolf ],
    #      %w[ fox ] ]
```

### Enumerable#dissect

> dissect |dʌɪˈsɛkt, dɪ-|
>
> ORIGIN late 16th cent.: from Latin dissect- ‘cut up’, from the verb dissecare, from dis- ‘apart’ + secare ‘to cut’.

"Cuts" the incoming Enumerable instance in multiple arrays.

```ruby
a0, a1, a2 = (1..14).dissect { |i| i % 3 }

p a0  # => [ 3, 6, 9, 12 ]
p a1  # => [ 1, 4, 7, 10, 13 ]
p a2  # => [ 2, 5, 8, 11, 14 ]
```

A sparse answer is possible:
```ruby
a0, a1, a2 = (1..14)
  .dissect { |i|
    case m = i % 3
    when 0, 2 then m
    else 0
    end }

p a0  # => [ 1, 3, 4, 6, 7, 9, 10, 12, 13 ]
p a1  # => nil
p a2  # => [ 2, 5, 8, 11, 14 ]
```

### Enumerable#elect

> elect |əˈlekt|
>
> ORIGIN late Middle English: from Latin elect- ‘picked out’, from the verb eligere, from e- (variant of ex-) ‘out’ + legere ‘to pick’.

Like a `find`, but yields the result of the block instead of the matching element.

```ruby
a = [ { a: 1 }, { b: 2 }, { c: 3 } ]

a.elect { |e| e[:b] }  # => 2
a.elect { |e| e[:z] }  # => nil
```


## LICENSE

MIT, see [LICENSE.txt](LICENSE.txt)

