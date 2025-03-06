# frozen_string_literal: true

# Packs/Unpacks a String to and from an Integer
module ShortStringPacker
  ## Packs a short string into a Integer
  # Arguments:
  #   str - String object
  # Returns: a Integer object
  OFFSET = 'a'.ord - 1
  BASE = 27
  def self.pack(str)
    str.chars.each_with_index.reduce(0) do |packed, (char, index)|
      packed + (char.ord - OFFSET) * (BASE**index)
    end
  end

  ## Unpacks a Integer from pack() method into a short string
  # Arguments:
  #   packed - a Integer object
  # Returns: a String object
  def self.unpack(packed)
    return '' if packed.zero?

    char = ((packed % BASE) + OFFSET).chr
    char + unpack(packed / BASE)
  end
end
