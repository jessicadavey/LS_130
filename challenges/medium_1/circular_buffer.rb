class CircularBuffer
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  def initialize(length)
    @buffer = []
    @max_length = length
  end

  def read
    raise BufferEmptyException if buffer_empty?
    @buffer.shift
  end

  def write(value)
    raise BufferFullException if buffer_full?
    @buffer << value unless value.nil?
  end

  def write!(value)
    return if value.nil?
    if buffer_full?
      @buffer.shift
      @buffer << value
    else
      write(value)
    end
  end

  def clear
    @buffer = []
  end

  private

  def buffer_full?
    @buffer.size >= @max_length
  end

  def buffer_empty?
    @buffer.empty?
  end
end
