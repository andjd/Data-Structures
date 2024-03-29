class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    @store[i]
  end

  def []=(i, val)
    @store[i] = val
    rescue #overflow error
      resize!
    retry
    @count += 1
  end

  def capacity
    @store.length
  end

  def include?(val)
  end

  def push(val)
    self[count] = val
    @count += 1
    val
  end

  def unshift(val)
  end

  def pop
    return nil if count == 0
    val = self[count - 1]
    self[count - 1] = nil
    @count -= 1
    val
  end

  def shift
  end

  def first
  end

  def last
  end

  def each
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    old_store = @store
    @store = StaticArray.new(capacity * 2)
    old_count = count
    @count = 0
    i = 0
    while i < old_count
      self[i] = old_store[i]

      i += 1
    end
    p @count
  end
end
