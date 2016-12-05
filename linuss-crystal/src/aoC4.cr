class AoC4
  property name : String
  property checksum
  property sector : Int32

  def self.process_file(name)
    rooms = File.read(name).lines.map { |l| new l}
    rooms.select(&.valid?).map(&.sector).sum
  end

  def initialize(full_name)
    parts = full_name.match(/(.*)-(\d+)\[(.*)\]/).not_nil!
    @name = parts[1].as(String).delete('-')
    @sector = parts[2].to_i
    @checksum = parts[3].as(String)
  end

  def valid?
    checksum == generate_checksum
  end

  def generate_checksum
    order[0, 5].map(&.char).join
  end

  def counts
    name.chars.group_by(&.itself).map do |char, list|
      Pair.new(list.size, char)
    end
  end

  def order
    counts.sort
  end

  struct Pair
    include Comparable(self)

    property count : Int32
    property char : Char

    def initialize(@count, @char)
    end

    def <=>(other)
      if count == other.count
        char <=> other.char
      else
        other.count <=> count
      end
    end
  end
end
