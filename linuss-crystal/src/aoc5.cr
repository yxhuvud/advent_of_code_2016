require "crypto/md5"
require "big_int"

class AoC5
  property input : String

  def initialize(@input)
  end

  def hash(idx)
    Crypto::MD5.hex_digest(input + idx.to_s)
  end

  def char(hsh)
    if hsh[0..4] == "00000"
      hsh[5]
    end
  end

  def find_password
    pw = ""
    UInt32::MAX.times do |i|
      char = char(hash(i))
      if char
        pw += char
      end
      break if pw.size == 8
    end
    pw
  end

  def char_with_pos(hsh)
    if hsh[0..4] == "00000"
      pos = hsh[5].to_i(16)
      if (0..7).includes?(pos)
        return {pos, hsh[6]}
      end
    end
    {nil, nil}
  end

  def find_improved_password
    # urgh, fixme before merging
    pw = [' '] * 8
    size = 0
    UInt32::MAX.times do |idx|
      pos, char = char_with_pos(hash(idx))
      if pos && char
        if pw[pos] == ' '
          pw[pos] = char
          size += 1
        end
      end
      break if size == 8
    end
    pw.join
  end
end
