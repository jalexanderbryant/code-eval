class LongestLines
  def self.add_in_order(string, array)
    modded_array = array
    i = modded_array.size - 2
    while i >= 0 && modded_array[i].size < string.size
      modded_array[i+1] = modded_array[i]
      i -= 1
    end
    modded_array[i] = string

    return modded_array
  end

  def self.get_n_longest_lines(file)
    lines = file.gets.chomp.to_i
    n_longest_lines = Array.new

    file.each_with_index do | line, i|
      # Skip first line
      next if i == 1
      # Trim line
      line = line.chomp
      
      n_longest_lines.push(line)
      n_longest_lines.sort_by!{ |s| -s.length }
      if n_longest_lines.size > lines
        n_longest_lines.pop
      end

    end
    
    return n_longest_lines
  end

  

  def main
    file = File.open(Argv[0], 'r')
    lines = get_n_longest_lines( file )
    puts lines


  end
end