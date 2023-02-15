- data and methods within a class are classed 'members' of that class.

- "Any class you define should has a `to_s` instance method to return a string representation of the object" - says they.
- Methods are public by default with the exception of `initialize`.

An alternative way to make methods private:

```ruby
   def getWidth
      @width
   end
   def getHeight
      @height
   end

   private :getWidth, :getHeight
```

- `#allocate` method for creating class objects without running a constructor method.
- `Square::INITIAL_MARKER` - 'name space resolution' is the double colon ... operator?